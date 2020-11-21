#! /usr/bin/env bb
(require '[clj-yaml.core :as yaml]
         '[clojure.string :as str]
         '[clojure.java.shell :refer [sh]]
         '[clojure.tools.cli :refer [parse-opts]])


(def cli-options
  ;; An option with a required argument
  [["-p" "--port PORT" "Port number"]
   ["-h" "--help"]])

(:options (parse-opts *command-line-args* cli-options))
