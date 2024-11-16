---
title: Title Heading
tags:
  - tag1
  - tag-dash-2
  - tag_3
  - tag/4
bibliography: zk.bib
date: "2023-09-25 08:39"
id: 20230925-0839
status: Reviewed
type: note
---

<!-- markdownlint-disable MD025 -->

# Heading L1 Chapter

<!-- markdownlint-enable MD025 -->

- [github universal ctags issues 3020](https://github.com/universal-ctags/ctags/issues/3020#issuecomment-839284103)
- [github universal ctags ctags blob parsers markdown h](https://github.com/universal-ctags/ctags/blob/8904e850e9623abcff91ee057b64ab72cd3f8e6f/parsers/markdown.h)
- [github universal ctags ctags blob parsers markdown c](https://github.com/universal-ctags/ctags/blob/8904e850e9623abcff91ee057b64ab72cd3f8e6f/parsers/markdown.c)

## Heading L2 Section

:inlinetag1:

:inlinetag-tag.2:inlinetag_3:

:inlinetag-tag/4:inlinetag5:

 #inlinetag6 #inlinetag7

[pcre current doc html pcre2syntax](https://www.pcre.org/current/doc/html/pcre2syntax.html)

### Heading L3

- `doctag` regex incorrectly includes the `YAML` key following 'tag:',
  'bibliography:' in this case. #inlinetag8
- Vimwiki inline tags should be at least 2 characters to avoid matching:
  - [SharePoint URL containing :f:](https://somewhere.sharepoint.com/:f:/r/sites/some_site/Shared%20Documents/some_doc?csf=1&web=1&e=8QtXVg)
  - [Windows Drive Letter in URL](file:S:/some_folder/some_file.docx)

#### Heading L4

##### Heading L5

```bash
ctags --list-kinds-full=Markdown
ctags --list-kinds-full=FrontMatter
ctags --list-kinds-full=notes
```

###### Heading L6

| LETTER | NAME          | DESCRIPTION         |
| ------ | ------------- | ------------------- |
| t      | title         | titles              |
| c      | chapter       | chapters            |
| s      | section       | sections            |
| S      | subsection    | subsections         |
| t      | subsubsection | sub-subsections     |
| T      | l4subsection  | level 4 subsections |
| u      | l5subsection  | level 5 subsections |
| d      | doctag        | YAML tags           |
| e      | tag           | Inline tags         |
