# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

A static blog (see `README.md` for the technical layout). Posts are Markdown
files with YAML front matter, rendered to plain HTML by `bin/build`. No
database, no CMS.

## Writing pipeline — use it, don't bypass it

Post work goes through the skills under `.claude/skills/`, in order:

`idea` -> `outline` -> `draft` -> `review` -> `publish` -> `promote`

- `idea` — capture a raw idea into `content/ideas/backlog.md` (gitignored).
- `outline` — turn one idea into a heading skeleton in `content/drafts/`.
- `draft` — expand that skeleton into full prose, in the author's voice.
- `review` — a critical read-through pass before publishing; proposes edits,
  never applies them silently.
- `publish` — moves a finished draft from `content/drafts/` into
  `content/posts/` and creates a local commit (never pushes).
- `promote` — optional; drafts X/LinkedIn copy for an already-published post.

Prefer these skills over editing `content/drafts/` or `content/posts/` ad hoc
— they encode the validation, front-matter, and git-safety rules for each
stage (e.g. `publish` refuses to move a file with leftover `TODO` markers
without explicit confirmation).

## Content types

- **meta** — posts about the blog itself (e.g. `hello-world`).
- **series / tv reviews** — posts about a TV series the author watched.
  Convention: tag with `[series, tv, review]` (or similar; adjust to the
  specific show/genre), keep the body spoiler-free by default, and if a
  spoiler section is needed, mark it clearly with its own heading (e.g. `##
  Spoilers ahead`) so readers can stop before it.

## Key files

- `style/STYLE.md` — voice/tone guide the `draft` and `review` skills read.
  It currently starts as a scaffold with placeholder defaults; fill it in
  with real preferences and an example passage as more posts get written, so
  future drafts actually match the author's voice instead of a neutral
  default.
- `content/posts/` — published, tracked, public.
- `content/drafts/` and `content/ideas/` — gitignored; safe for
  work-in-progress since this repo is public.

## Git

- `content/drafts/` and `content/ideas/backlog.md` are gitignored on
  purpose — never suggest committing them.
- Only the `publish` skill commits post content, and only locally; pushing
  to the remote is always a separate, explicit step the user takes
  themselves.
