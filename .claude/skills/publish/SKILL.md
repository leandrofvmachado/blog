---
name: publish
description: Publish a finished draft from content/drafts/ to content/posts/, commit it, and push to the remote. Use when the user wants to publish, ship, or finalize a draft — e.g. "publish this draft", "ship the X post", "/publish <file>". Final stage of the idea -> outline -> draft -> review -> publish pipeline. Pushing makes the post live, so all validation happens before the commit.
---

# Publish

Move a finished draft from `content/drafts/` (gitignored, untracked) into `content/posts/`
(tracked, public), commit it, and push to the remote. This is the last stage of the
pipeline, after "review".

The push is what makes the post publicly live, and it can't be quietly undone — so every
validation step below happens **before** the commit, not after. Once you reach step 5,
the content has already been checked.

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

## 5. Commit

Stage the new post file (already done above) and commit:

```
git commit -m "Publish: <title>"
```

Use the real, human-readable `title` from the front matter in the message, not the slug.

## 6. Push

Push the commit so the post goes live:

```
git push
```

Before pushing, check `git status --short` and `git log origin/<branch>..HEAD`. Push only
the publish commit. If there are **other unpushed commits** or unrelated staged changes
riding along, stop and tell the user what else would go out — let them decide before you
push.

If the branch has no upstream, use `git push -u origin <branch>`.

**Only ever a plain `git push`.** Never `git push --force`, `--force-with-lease`, or
anything else that rewrites remote history — if a push is rejected because the remote has
moved ahead, report the rejection and stop. Fixing a diverged branch is the user's call,
not something to resolve mid-publish.

## 7. Report back

Tell the user:

- The file's new path under `content/posts/`.
- That the commit was pushed, and to which branch — the post is now live.
- Anything filled in on their behalf (`date`, `slug`, `tags`, `summary`) so they can
  correct it while it's fresh.

If the push failed, say so plainly and state that the commit exists locally but the post
is **not** live yet.

## Out of scope

- Do not touch `content/ideas/backlog.md`.
- Do not touch any other file under `content/drafts/` besides the one being published.
- Do not edit `style/STYLE.md`.
- Do not run any review/editing pass on the prose itself — that's the "review" skill's
  job, and should already have happened before this stage.
