# Mobile Homepage

Simple static page to list "bookmarks".

Keeps a count of what you've clicked on, resetting daily.
Counts are stored in the browser.

## Usage

Start from `data.json.example`

```sh
$ nvm use
$ npm i
$ cp data.json.example data.json
$ ./build.sh
$ # open index.html
```

Override the domain used for the icon by setting the property `"logo"` in a link.
