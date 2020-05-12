# Releasing ws

Don't manually change the version number or CHANGELOG, as they are updated
by maintainers using the tools below when a release is prepared.

## tl;dr

```console
make changever
make release
make changelog
```

## Pre-commit

Git pre-commit are integrated and permit adding source code checks, such
as lint tools, fixes end of files and trailing whitespace. No special
accommodation must be applied other than what the commit process triggers
to ensure code cleanliness.

## Changelog

The git-chglog generator automatically generates the CHANGELOG. The changelog
tool organizes commits by release; thus a release must have been prepared
before changelog can generate its applicable section. The latest commits
simply appear in a pre-release section.

The changelog is generated after tagging occurs.

## Version String

The `ws` script contains a string constant of the version tag. This constant
must be updated prior to release tagging.

## Required Tools

To contribute, please install and use the following tools:

- [git-chglog][git-chglog] - CHANGELOG generator implemented in Go
- [pre-commit][pre-commit] - Git hook scripts useful for identifying simple issues before submission to code review
- [semtag][semtag] - Semantic tagging script for Git

  [pre-commit]: https://pre-commit.com/
  [git-chglog]: https://github.com/git-chglog/git-chglog
  [semtag]: https://github.com/pnikosis/semtag
