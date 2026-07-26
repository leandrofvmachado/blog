---
name: publish
description: Publish a finished draft from content/drafts/ to content/posts/ and commit it locally. Use when the user wants to publish, ship, or finalize a draft — e.g. "publish this draft", "ship the X post", "/publish <file>". Final stage of the idea -> outline -> draft -> review -> publish pipeline. Never pushes to the remote; the commit stays local until the user pushes themselves.
---

# Publish

Move a finished draft from `content/drafts/` (gitignored, untracked) into `content/posts/`
(tracked, public) and create a local git commit. This is the last stage of the pipeline,
after "review". Getting this wrong means unfinished or unintended writing entering the
public git history, so validate before moving anything.

## 1. Identify the draft

The user should name a file under `content/drafts/`. If they only give a slug or a rough
title, find the matching file in `content/drafts/`. If nothing matches, or more than one
file could match, stop and ask which file they mean — do not guess.

Read the full file before doing anything else.

## 2. Validate front matter

Parse the YAML front matter block at the top of the file and check each field:

- **`title`** — must be present and non-empty. If it's missing, stop and ask the user for
  the title. Do not invent or guess a title.
- **`date`** — if missing, blank, or still `TBD`, fill it in with today's date
  (`YYYY-MM-DD`). If it already holds a real date, leave it alone.
- **`slug`** — if missing or blank, derive it from the title: lowercase, spaces/punctuation
  replaced with hyphens, no leading/trailing hyphens (e.g. "Why Rust Lifetimes Click" ->
  `why-rust-lifetimes-click`). If a slug is already present, leave it alone.
- `tags` and `summary` are not blockers — note if they're missing but don't stop the
  pipeline for them.

Write any filled-in fields back into the file's front matter before moving on.

## 3. Flag unfinished content

Before moving the file, scan the body for signs it isn't actually finished:

- HTML comments like `<!-- TODO -->`, `<!-- FIXME -->`, or similar inline notes-to-self.
- Leftover outline-style bullet lists standing in for prose (fragments/notes rather than
  full sentences — the kind of thing the "outline" skill produces, not the "draft" skill).
- Placeholder section headings that were never renamed (e.g. generic "Section Heading").

If you find any of these, list what you found and **ask the user to explicitly confirm**
they want to publish anyway (a plain "yes" or equivalent). Do not proceed on an ambiguous
answer, and do not proceed silently just because the rest of the post reads fine. If the
user confirms, continue. If they decline, stop here and leave the draft untouched.

## 4. Move the file

Destination path: `content/posts/<date>-<slug>.md`, using the (possibly just-filled-in)
`date` and `slug` from the front matter.

Since `content/drafts/` is gitignored, the source file is untracked — a plain `git mv`
will fail on it. Use:

```
mv content/drafts/<original-file> content/posts/<date>-<slug>.md
git add content/posts/<date>-<slug>.md
```

(If the draft filename happens to already be tracked for some odd reason, use `git mv`
instead and skip the manual `mv`/`git add`/`git rm` dance.)

Double-check the destination filename matches the `YYYY-MM-DD-slug.md` pattern used by
everything else in `content/posts/` before moving on.

## 5. Commit locally

Stage the new post file (already done above) and commit:

```
git commit -m "Publish: <title>"
```

Use the real, human-readable `title` from the front matter in the message, not the slug.

## 6. Report back — and the safety rule

Tell the user:

- The file's new path under `content/posts/`.
- That a commit was created **locally only**.
- That this skill never runs `git push` — pushing is their call, and they need to push
  themselves (e.g. `git push`) whenever they're ready for the post to go live on the
  remote.

**Never run `git push`, `git push --force`, or anything that sends this commit to a
remote, under any circumstance, even if the user seems to expect it as part of
"publishing."** If the user wants it pushed too, tell them to run the push themselves or
ask again explicitly in a separate step — this skill's responsibility ends at the local
commit.

## Out of scope

- Do not touch `content/ideas/backlog.md`.
- Do not touch any other file under `content/drafts/` besides the one being published.
- Do not edit `style/STYLE.md`.
- Do not run any review/editing pass on the prose itself — that's the "review" skill's
  job, and should already have happened before this stage.
