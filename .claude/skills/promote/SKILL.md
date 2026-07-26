---
name: promote
description: Draft promotional social media snippets (X/Twitter and LinkedIn) for a post that has already been published to content/posts/. Use when the user wants to promote, share, or write social copy for an existing published post — e.g. "promote the hello-world post", "write some tweets for this", "draft a LinkedIn post for X". This is an optional final stage that runs AFTER the "publish" skill; it never touches drafts, never publishes anything, and never posts to any platform.
---

# Promote

Draft short promotional copy for a post that is already published under `content/posts/`.
This is the last, optional stage of the pipeline (idea -> outline -> draft -> publish ->
**promote**). It only reads an already-published post and prints copy back in the
conversation — it does not create files, does not touch git, and does not post anywhere.

## What this skill does NOT do

- It does not publish or edit the post itself.
- It does not create any new files (no files under `content/`, no scratch files).
- It does not post to X, LinkedIn, or any other platform automatically.
- It does not touch git in any way.

If the user asks for any of the above, tell them that's outside this skill and stop.

## 1. Find the post

The user will point at a post by slug, filename, or path. Resolve it to a file under
`content/posts/` (pattern `YYYY-MM-DD-slug.md`):

- If they give an exact path, use it.
- If they give a slug or partial name, search `content/posts/` for a matching filename
  (matching on the `slug` part after the date prefix, or the `slug` front matter field).
- If nothing matches, or more than one file plausibly matches, list the candidates (or say
  nothing was found) and ask the user to clarify rather than guessing.
- If the user doesn't name a post at all, ask which post to promote — don't assume "the
  latest one" silently.

## 2. Read the post

Read the full file and pull out:

- `title`, `summary`, and `tags` from the front matter.
- The body content — enough of it to understand the actual argument/hook of the post, not
  just the summary. Skim the whole thing if it's short; for longer posts, focus on the
  opening and the core takeaway.

## 3. Check the style guide

Read `style/STYLE.md`. If it has real, substantive voice guidance filled in (not just an
empty scaffold with placeholder headings), follow it for tone and word choice. If it's
empty or just scaffolding, default to a clear, direct, non-hype technical tone — no
forced enthusiasm, no emoji-stuffing, no "game-changing"/"mind-blowing" style hype words.

## 4. Draft two snippets

Produce exactly two snippets, output directly in the chat response (plain text, not a
file):

1. **X/Twitter-style post**
   - Short: one or two sentences.
   - Hook-first — lead with the most interesting/counterintuitive/useful part of the
     post, not a generic "I wrote a new post about...".
   - Written to make someone stop scrolling and click through.
   - Fine to include the post's core tension or a specific detail rather than staying
     abstract.
   - You may suggest 1-3 relevant hashtags derived from the post's tags, but don't
     over-tag.

2. **LinkedIn-style post**
   - Slightly longer than the X post — a short paragraph or two.
   - A bit more context: why this matters, what problem it addresses, or what prompted
     it, before getting to what the post covers.
   - Still concise — this is not the blog post rehashed, it's a teaser with some
     substance. Avoid corporate-hype phrasing.

Neither snippet should just restate the front matter `summary` verbatim — write them as
distinct, standalone copy informed by the actual post content.

Do not include a link/URL placeholder unless the user asks for one — just note in your
reply that they'll need to add the link when posting, if relevant.

## 5. Output and stop

Print both snippets clearly labeled (e.g. "X/Twitter:" and "LinkedIn:") so the user can
copy-paste them manually. Then stop — do not save them anywhere.

If the user separately asks to save the snippets somewhere, ask where they'd like them
saved rather than assuming a location or convention, since there isn't an established one
for promotional copy yet.
