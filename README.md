# Blog

A static blog. Posts are Markdown files with YAML front matter; `bin/build`
renders them to plain HTML in `public/`. No database, no server process.

## Layout

- `content/posts/` — published posts (tracked). Filename: `YYYY-MM-DD-slug.md`.
- `content/drafts/` — work in progress (gitignored — this repo is public).
- `content/ideas/backlog.md` — raw idea capture (gitignored).
- `style/STYLE.md` — voice/tone guide used by the writing skills.
- `lib/post.rb`, `templates/*.erb`, `bin/build` — the generator itself.

## Writing pipeline

Claude Code skills under `.claude/skills/` cover the pipeline end to end:
`idea` -> `outline` -> `draft` -> `review` -> `publish` -> `promote`.

## Build

```
bundle install
bin/build
```

Output goes to `public/` (gitignored, regenerated every build).
