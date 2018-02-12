# ws

Workspace management tool, NVM/RVM style.

# What's ws

WS is the acronym for Workspace. It manages development workspace environments and enables switching between them.

## Installing ws

### Ubuntu / Mac

```bash
curl -sSL https://github.com/continuul/ws/releases/download/v1.0/web.install.bash | bash
```

## Basic ws usage

Basic ws usage scenarios include installing and switching between different workspaces.

Command line help does exist, if you have questions about other options.

### Creating a workspace

To create a workspace you have to call `ws WORKSPACE_NAME OPTIONS` 

### Listing workspaces

To list your workspaces you have to call `ws ls`

### Switching between workspaces

To switch between workspaces you should call

`ws use WORKSPACE_NAME`

### Removing workspaces

To remove a workspaces you should call

`ws rm WORKSPACE_NAME`

n.b. this is a destructive call and removes all files associated to the workspace

### File an issue

If the documentation is not clear, an error message is not clear or you are stuck with the problem,
please do file a bug.

When in doubt as to whether your issue might relate to another, simply file a new bug, and
we will mark it as duplicate if it needs to be.  It's always better to file a new ticket and
let us sort it out than to accidentally add noise to another ticket.

For filing issues, we have prepared a template for you to use. Please try to fill all sections as best as you can.
Always make sure to split up each command and its output into its own fenced code block. 
If the output is long, please put it in a separate [gist](https://gist.github.com). 
Otherwise it's hard for us to process all the information and respond quickly.

Note that if there is a lot of `debug` or `trace` output you can redirect it to a file with the `>` 
character like `ws [command] > output.txt`.

## Contributing

You are very warmly welcome to help. Please send us pull requests for fixes you have. 

## License

Copyright (C) Continuul LLC (2016-2018), Robert Buck (2016-2018) 

Licensed under the [Apache License](LICENSE), Version 2.0