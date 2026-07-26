---
name: outline
description: Turn one raw blog idea into a structured skeleton draft before any prose is written. Use when the user wants to outline, structure, or scaffold a post — from an entry in content/ideas/backlog.md or from an idea described ad hoc. Second stage of the idea -> outline -> draft pipeline; never writes full prose paragraphs.
---

# Outline

Turn a single raw idea into a structured skeleton file under `content/drafts/`. This
runs after the "idea" skill (which captures raw ideas into `content/ideas/backlog.md`)
and before the "draft" skill (which writes the actual prose). This skill's job stops
at structure — headings and bullet notes, never full paragraphs.

## 1. Get the idea

Figure out which idea is being outlined:

- If the user names or describes an idea directly, use that.
- If the user says something like "outline the next one" / "pick something from the
  backlog" / doesn't specify, read `content/ideas/backlog.md` and either use the
  entry the user points at, or ask which one if it's ambiguous. If the backlog is
  empty or missing, tell the user and stop — there's nothing to outline.

## 2. Check the angle and audience

If it's not already obvious from the idea text what the specific angle is (the take,
not just the topic) or who it's for, ask the user **one or two short questions** before
building anything. Don't interrogate — if the idea already reads like "why X is
actually Y, aimed at Z", just proceed. Examples of when to ask:

- The idea is a bare topic with no angle ("write about Rust lifetimes") — ask what
  the specific take or hook is.
- It's unclear whether this is for beginners, peers, or a general audience.

Skip asking if the idea (or the user's ad hoc description) already answers this.

## 3. Derive slug, title, and file path

- Derive a short, URL-safe `slug` from the working title (lowercase, hyphenated, no
  dates in the slug itself).
- The output file is `content/drafts/<slug>.md` — no date prefix, unlike published
  posts in `content/posts/` (which use `YYYY-MM-DD-slug.md`). Drafts don't have a
  fixed publish date yet.
- If a file with that slug already exists in `content/drafts/`, ask the user before
  overwriting it, or pick a distinguishing suffix.

## 4. Write the draft skeleton

Create `content/drafts/<slug>.md` with this shape:

```markdown
---
title: "Working Title Here"
date: TBD
slug: your-slug-here
tags: [tag1, tag2]
summary: "Draft summary: one or two sentences on what this post will argue or cover."
---

## Hook / Opening
- note on how this should grab the reader
- note on the specific angle to lead with

## Section Heading (rename to fit the actual content)
- point this section needs to make
- example, data, or anecdote to potentially use

## Section Heading
- ...

## Counterpoints / Caveats
- objections or edge cases worth addressing

## Closing / Takeaway
- what the reader should walk away with
```

Notes on filling this in:
- `date: TBD` — the publish date isn't fixed at outline stage, leave it as `TBD`.
- Reference `style/STYLE.md` if it's useful for tone/structure conventions, but don't
  wait on it or treat it as required reading.
- Tags: 2-4 reasonable guesses based on the topic; the user can adjust later.
- Section headings should be renamed to reflect the actual idea (e.g. "Why the
  conventional wisdom is wrong", "What changed my mind") — don't leave generic
  placeholders like "Section Heading" in the final file.
- Bullets under each heading are **notes to self about what that section should
  cover**, not prose. No full sentences of finished writing, no topic sentences
  meant for the final post. If you catch yourself writing something that reads like
  it belongs in the published post, cut it back to a fragment/note.
- Number of sections should fit the idea — don't pad to a fixed count.

## 5. Mark the backlog entry as promoted (if applicable)

Only if the idea came from `content/ideas/backlog.md`: edit that file and append
`(→ outlined: content/drafts/<slug>.md)` to the end of the corresponding line/entry,
so it's clear it's been promoted and won't get outlined again. Don't touch other
entries. If the idea was described ad hoc (not from the backlog), skip this step —
there's nothing to mark.

## 6. Confirm

Tell the user the draft skeleton was created at `content/drafts/<slug>.md`, briefly
list the section headings you used, and note this is structure only — the "draft"
skill is what fills in actual prose next.
