# BMLT Release Notes Tool
This shell script automates the process of setting release notes through travis for new tagged versions.
It uses the `TRAVIS_TAG` environment variable to search the file for the release notes that belong to that tag.
It will grab all the lines between the tag and the specified delimiter. Yap uses `### 1.0.0 (DATE)` which is pretty standard.
WordPress just uses `= 1.0.0 =`.

## Usage
`./release-notes.sh <RELEASE NOTES FILE> <HEADER DELIMITER>`

## What it does
- Reads a file and looks for changelog for version.
- Exports to a file named changelog.txt that can be specified in travis.

## Examples

I have included two different formats of release notes files to test with WordPress (readme.txt) and 
yap (RELEASENOTES.md).

Usage with yaps RELEASENOTES.md

```bash
./release-notes.sh RELEASENOTES.md "###"
```

Usage with a WordPress readme.txt

```bash
./release-notes.sh readme.txt "="
```

## Using with travis

This requires using `deployment v2` which is currently in `v2.0.0.pre.beta.1` and will ultimately replace the current deployment provider. 
Docs for DPL v2 GitHub Release Provider can be found here [https://docs.travis-ci.com/user/deployment-v2/providers/releases/](https://docs.travis-ci.com/user/deployment-v2/providers/releases/).
Check each provider in `dplv2` docs as their are some syntax changes and deprecations. Mainly `skip_cleanup` is now set by default so is [not needed](https://blog.travis-ci.com/2019-08-27-deployment-tooling-dpl-v2-preview-release).

To use `dplv2` you must set `edge: true` to each provider. Ex.

```yaml
deploy:
    - provider: releases
      edge: true
```

you can specify the release notes file by adding the following.


```yaml
release_notes_file: "changelog.txt"
```

```yaml
    before_deploy:
    - curl -LO https://raw.githubusercontent.com/bmlt-enabled/release-notes-tool/master/release-notes.sh
    - chmod +x deploy-wordpress.sh
    - ./release-notes.sh readme.txt "="
    deploy:
    - provider: releases
      edge: true
      release_notes_file: "changelog.txt"
      token:
        secure: YTYjNNSVlw5LV8J3RXKQPRX3HuzXOsdrJf+ScD7Q0SZvbFbIuqerKZn/5AFfKHvfhryQ6a5PUbO6qnbvie3TA+oXltoRxsZ80sDDvrbqmhWVfyd5cLJ/yLUNNrKLj2/j7LZX6ZmgohCdxFo+51mOyy9PFR7kzJ2hwWvFZvi0r3rvE/r8WKqoTax3GcoEmxCZn77N+klhonYajrqktbJk8mkhuufPEyNs6aX9VvbVDy+faTYzFjIXN1+PxDtXCdj2SZ4hWo9BEM904WaVMhO6glZCeerXzYGuYXmkgLDXMFDiJMDuim9xWUVAjXWhie+tMfM8OO9JvbKfIJZUC+q+vX4q3AuEr7eQj0RfuN56TVZ0JOLIFCKl6cx8rwXyDzPG8lC+tLHRNigwuvpTs6R1XdQkJ8RHGRn0TdCSwCKW3FVHo+4KID+J5xioy2zaV2iAcACUYJNq1Bau/0yYFRJWkIEWj8dmCHDh5F4FZF3Mr+mJDFW8haKL/bgxwiQhc2a0YLN71G7Dfi1SBIxXhdWGqrKqdKxGylQhk9XC5CQcBPOi/HwFfULfKetRxnh3l7ngPJRbX8CEKAylXxn5fPNiRysbS5BoFiQevv5mFyh2c95FX8eHXUMHtQHmKoa9f8mZU5bHHQ1x5GO9T8z4mCkyItA2CIe2jVl8/Hd41TbZEBE=
      file: "$DIST_DIR_GITHUB/$GITHUB_RELEASE_FILENAME"
      name: "$TRAVIS_TAG"
      on:
        tags: true
```
