Micro fzy Plugin
================

This plugin adds support for [fzy](https://github.com/jhawthorn/fzy) fuzzy searching to  [micro](https://github.com/zyedidia/micro)

## Installation

Install [fzy](https://github.com/jhawthorn/fzy) if it is not already installed. See the [fzy installation documentation](https://github.com/jhawthorn/fzy#installation)

### From GitHub
`git clone git@github.com:chrishalebarnes/micro-fzy-plugin.git ~/.config/micro/plugins/fzy`

### From Micro
`Ctrl-e` to launch command mode
`> plugin install fzy`

Restart micro if it is already running.

## Keybinding

To bind `fzy` to `CtrlP` for example, open up `~/.config/micro/bindings.json` and add this:
Find all files:
```
"CtrlP": "fzy.find"
```
Find all files tracked by [git](https://git-scm.com/) (through `git ls-files`)
```
"CtrlP": "fzy.findGitTrackedFiles"
```

### License and Copyright

MIT license: see [LICENSE](https://github.com/chrishalebarnes/micro-fzy-plugin/blob/master/LICENSE)
