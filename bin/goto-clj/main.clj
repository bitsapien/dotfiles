#! /usr/bin/env bb
(ns goto)
(require '[clj-yaml.core :as yaml]
         '[clojure.string :as str]
         '[clojure.java.shell :refer [sh]]
         '[clojure.tools.cli :refer [parse-opts]])

;; CLI stuff
(def cli-options
  ;; An option with a required argument
  [["-s" "--silent" "Silent"]
   ["-h" "--help"]])

;; lib

(defn file-read
  [path]
  (slurp path))

(defn get-locations
  [file]
  (yaml/parse-string (file-read file)))

(defn get-location
  [locationMap identifier searchTerm]
  (clojure.string/replace (get locationMap (read-string (concat ":" identifier))) #"SEARCH" searchTerm))

(defn get-location-type
  [location]
  (cond (str/starts-with? location "https://") :url
        (str/starts-with? location "http://") :url
        (and (str/starts-with? location "file://") (str/ends-with? location "/")) :folder
        (and (str/starts-with? location "file://") (not (str/ends-with? location "/"))) :file))

(defn cleanup-location
  [location location-type]
  (if (or (= location-type :file) (= location-type :folder)) (str/replace location #"file://" "") location))

;; config
(def locations-file "locations.yml")
(def location-type-assoc {:url "open", :file "cat", :folder "echo"})

;; This is where the magic happens
(defn run
  [locations-file location-type-assoc args]
  ;; Read and categorise the location requested
  (def location (get-location (get-locations locations-file) (first *command-line-args*) (second *command-line-args*)))
  (def location-type (get-location-type location))
  (def cleansed-location (cleanup-location location location-type))
  (def location-type-program (get location-type-assoc location-type))
  ;; Create command
  (def command (str/join " " [location-type-program cleansed-location]))
  ;; Run it!
  (print (str "Running: " command))
  (print "\n--------------------------------------------------------------------------------\n")
  (def std (apply sh (str/split command #" ")))
  (print (get std :out)))


(-main *command-line-args*)

;; Watch me program !
(comment
  (file-read "locations.yml")
  (yaml/parse-string (file-read "locations.yml"))
  (locations "locations.yml")
  (get (locations "locations.yml") :github)
  (symbol "github")
  (get-location (locations "locations.yml") "github")
  (sh "open" "https://wikipedia.org")
  (clojure.string/replace "abcff" #"f" "yy")
  (get-location-type "something")
  (str/starts-with? "https://wikipedia.org" "https://")
  (if (str/starts-with? "https://wikipedia.org" "https://") :url)
  (if (str/starts-with? "https://wikipedia.org" "file://") :url)
  (get-location-type "https://wikipedia.org")
  (get-location-type "http://wikipedia.org")
  (get-location-type "file://Users/rahulc/dotfiles/")
  (and (str/starts-with? "file://Users/rahulc/dotfiles/" "file://") (not (str/ends-with? "file://Users/rahulc/dotfiles/" "/")))
  (and (str/starts-with? "file://Users/rahulc/dotfiles/" "file://") (str/ends-with? "file://Users/rahulc/dotfiles/" "/"))
  (get-location-type "file://Users/rahulc/dotfiles/README.md")
  (get location-type-assoc :url)
  (get location-type-assoc :file)
  (get location-type-assoc :folder)
  (cleanup-location "file://Users/rahulc/dotfiles/" :file)
  (cleanup-location "https://wikipedia.org" :url))

(:options (parse-opts *command-line-args* cli-options))

;; TODOs
;; 1. Bash completion
;;  a. Bash completion
;; 2. Read Bash History and suggest
;; 3. Read browser history and suggest
;; 4. Add new link easily
;; 5. Support file, folder, url ✅
;; 6. Support silent mode, so stdout may be piped

