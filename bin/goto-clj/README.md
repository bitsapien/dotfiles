# goto 🚀

This tool uses a basic `yaml` file and helps you navigate. Check this file for [examples](https://github.com/bitsapien/dotfiles/blob/master/bin/goto-clj/locations.example.yml).

### Usage
```bash
$ goto regex
```

### How to install?
1. Download this specific directory and do the following:
    ```bash
    mv locations.example.yml locations.yml
1. Add your shortcut and locations in `locations.yml`
1. Set the environment variable `GOTO_DATA_PATH` to wherever you downloaded this directory.
1. Add this directory to your `PATH` environment variable too.
1. This also comes with bash completion just run the file


### TODO
1. Add documentation on how to generate bash completion
1. Expose the configuration file to select programs apart from `open` (which is only relevant in a Macintosh)
