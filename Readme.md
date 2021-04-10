# click_tinkering

This repo is for making a cursory weekend-warrior attempt at an interactive CLI for a certain project whose actual IP is proprietary and lives elsewhere.  The idea started with Python's `click` library, but things built into `bash` draw more appeal for this specific application.  To run the menu with dummy options, simply invoke
```
/bin/bash menu.sh
```

<!--  TODO: ADD DESIGN_ID TO INPUT -->
## General Strategy
The basic idea is to have the menu in a [Tmux](https://github.com/tmux/tmux/wiki) session as the main pane.  This allows keeping the menu in place with options exercised in a separate pane rather than taking up the entire terminal window, and if the user's connection drops for some reason, operations under way will continue.  For example, if you choose option `2`, you will see a new pane with a dummy file opened in Vim, and that will point to something useful in the actual implementation.  Similarly, for option `3`, a dummy pane says that jobs are being launched.  Ultimately, this option will launch the jobs, then it will wait to exit until all jobs are dead before the pane dies and returns the cursor to the main menu in pane zero.

## Questions for a User
1. Is it helpful to have things pop up in separate panes than the menu?
1. Is it better for the second pane to show up to the right or down below?