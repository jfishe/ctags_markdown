# ctags_markdown

[Universal Ctags][Universal Ctags] parser for Markdown tags in various formats.

Commas are not allowed because they separate array elememts.
`[a-zA-Z0-9]` may start a tag.
`[-._]` are also allowed after the first character.
VimWiki syntax tags start with letters.

```markdown
---
tags: [a, b, 123, a-._]
---
```

```markdown
---
tags:
  - a
  - b
  - 1-._
  - a-._
---
```

```markdown
 #abc #123
```

```markdown
:abc:a123-._:
```

- Start from [Michał Góral's Ctags For Markdown Notes](https://goral.net.pl/post/ctags-for-notes/).
- Extend the default Markdown `langdef` with `notes`.
- Enable `guest` parser to tag `YAML` titles.
- Notes parser allows:
  - Tags with hyphen, period and underscore, after first letter.
  - Hashtag and Vimwiki colon-separated inline-tags.
- Ignore single character Vimwiki colon-separated tags to prevent tagging URL
  fragments and Windows drive letters.
- Enable `UTF8` input and output encoding.

```bash
ctags --list-kinds-full=Markdown
ctags --list-kinds-full=FrontMatter
ctags --list-kinds-full=notes
```

| LETTER | NAME          | ENABLED | REFONLY | NROLES | MASTER | DESCRIPTION |
|--------|---------------|---------|---------|--------|--------|-------------|
| S      | subsection    | yes     | no      | 0      | NONE   | level 2     |
|        |               |         |         |        |        | sections    |
| T      | l4subsection  | yes     | no      | 0      | NONE   | level 4     |
|        |               |         |         |        |        | sections    |
| c      | chapter       | yes     | no      | 0      | NONE   | chapters    |
| n      | footnote      | yes     | no      | 0      | NONE   | footnotes   |
| s      | section       | yes     | no      | 0      | NONE   | sections    |
| t      | subsubsection | yes     | no      | 0      | NONE   | level 3     |
|        |               |         |         |        |        | sections    |
| u      | l5subsection  | yes     | no      | 0      | NONE   | level 5     |
|        |               |         |         |        |        | sections    |
| t      | title         | yes     | no      | 0      | NONE   | titles      |
| d      | doctag        | yes     | no      | 0      | NONE   | doctags     |
| e      | tag           | yes     | no      | 0      | NONE   | tags        |

Titles is not available in earlier versions of [Universal Ctags][Universal Ctags].

## Universal ctags configuration

```text
ctags.d
├── A.ctags
└── markdown.ctags
```

## A.ctags

- `--recurse=yes`
- `--tag-relative=always`
- Exclude `ctags` default files and folders.

## markdown.ctags

- Enable `FrontMatter` by adding `guest` and `subparser` extras.
- Add language field because Markdown and `FrontMatter` re-use LETTER "t".
- Concatenate the line number and pattern with a semicolon in between, similar
  to [Vimwiki Tags](https://github.com/vimwiki/vimwiki).

```bash
ctags --list-subparsers=Markdown
```

| NAME  | BASEPARSER | DIRECTIONS           |
|-------|------------|----------------------|
| notes | Markdown   | base => sub {shared} |

```bash
ctags --list-fields
```

| LETTER | NAME     | ENABLED | LANGUAGE | JSTYPE | FIXED | OP | DESCRIPTION    |
|--------|----------|---------|----------|--------|-------|----|----------------|
| l      | language | yes     | NONE     | s--    | no    | -- | Language of    |
|        |          |         |          |        |       |    | input file     |
|        |          |         |          |        |       |    | containing tag |

```bash
ctags --list-extras
```

| LETTER | NAME      | ENABLED | LANGUAGE | FIXED | DESCRIPTION            |
|--------|-----------|---------|----------|-------|------------------------|
| g      | guest     | yes     | NONE     | no    | Include tags generated |
|        |           |         |          |       | by guest parsers       |
| s      | subparser | yes     | NONE     | no    | Include tags generated |
|        |           |         |          |       | by subparsers          |

## Installation

- Download archive, `release.tar.gz` or `release.zip`, from
  [GitHub Releases](https://github.com/jfishe/ctags_markdown/releases).
- Extract the contents of the archive folder `ctags.d` to one of the locations
  expected by [Universal Ctags][Universal Ctags], e.g., `~/.ctags.d` or
  `<project root>/.ctags.d`.

[Universal Ctags]: https://ctags.io/
