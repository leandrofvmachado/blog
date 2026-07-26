---
name: draft
description: Expand a heading-skeleton outline in content/drafts/ into full prose in the author's voice. Use when the user asks to "draft", "write up", "flesh out", or "expand" a post that already has an outline or partial draft under content/drafts/. This is the third stage of the pipeline (outline -> draft -> review/publish); it never moves files to content/posts/ and never touches git.
---

# Draft

Expand a heading-skeleton outline (produced by the "outline" skill) into full prose,
in place, inside `content/drafts/`. This is the middle stage of the pipeline:
outline -> **draft** -> review/publish.

## Scope

- Only ever read and write the single target file inside `content/drafts/`.
- Never create, move, rename, or delete files.
- Never touch `content/posts/` — moving a finished piece there is the "publish"
  skill's job.
- Never run any `git` command. `content/drafts/` is gitignored; do not add,
  commit, or otherwise pull draft content into git history.

## Steps

1. **Identify the target file.** The user should point at a path under
   `content/drafts/`. If they gave a bare slug or title instead of a path, look
   for a matching file in `content/drafts/` before asking for clarification.
   If no path is given and there's exactly one file in `content/drafts/`
   (besides `.keep`), confirm that's the one they mean.

2. **Read the file and preserve its front matter exactly.** The YAML block at
   the top (`title`, `date`, `slug`, `tags`, `summary`) must come out byte-for-byte
   identical to how it went in. Do not invent a new title, slug, or date, and
   do not "improve" the summary unless the user explicitly asks for that. If a
   front matter field looks obviously wrong or is missing, flag it to the user
   rather than silently fixing it.

3. **Check `style/STYLE.md` before writing a single sentence of prose.**
   - If it doesn't exist, or exists but is still mostly placeholder/template
     text (headings with no real content under them, TODOs, "TBD", boilerplate
     questions rather than settled answers) — tell the user explicitly, in your
     reply, that STYLE.md isn't filled in yet and is worth completing. Then
     proceed using a reasonably neutral, clear technical-blog voice: plain
     sentences, concrete examples, minimal hedging, no forced enthusiasm.
   - If it has real filled-in guidance, follow it: match the tone, sentence
     length habits, formatting conventions (how code/links/lists are used),
     and any listed words-to-avoid or preferred phrasing.

4. **Expand each `##` section in place.** For every section, turn its bullet
   notes into full prose paragraphs that cover the same points and in the same
   order the bullets implied. Rules while doing this:
   - Do not drop a bullet's point silently — if a bullet is too thin or vague
     to expand responsibly, write the closest reasonable interpretation and
     leave a `<!-- TODO: ... -->` marker on the point that needs a second look,
     rather than inventing specifics (numbers, dates, product names, quotes)
     that weren't in the notes.
   - Keep the existing `##` headings as the section structure unless a
     heading is clearly just a placeholder label meant to be replaced by real
     prose — in that case fold it into the paragraph instead of keeping a
     redundant heading.
   - Write in first person, matching the voice of any existing prose already
     in the file (e.g. an intro paragraph left over from outlining).
   - Keep code examples, if the outline calls for one, realistic and runnable
     where feasible; if you're not confident a snippet is correct, still write
     it but mark it with `<!-- TODO: verify this code example -->`.
   - Keep factual claims (benchmarks, version numbers, historical details,
     "X is the first/only/fastest...") tagged with `<!-- TODO: confirm/source
     this claim -->` unless they were already stated as fact in the outline's
     notes or are common knowledge.

5. **Write the result back to the same file** (same path, same front matter).
   Do not create a new file, a `.draft` copy, or a numbered variant.

6. **Report back concisely**: which sections were expanded, how many
   `<!-- TODO -->` markers were left and what each is about, and — if it
   applies — the explicit reminder that `style/STYLE.md` still needs real
   content so future drafts can use the author's actual voice instead of a
   neutral default.

## Non-goals

- No moving files between `content/drafts/` and `content/posts/`.
- No git operations of any kind.
- No fabricating facts, sources, quotes, or code correctness — use TODO
  markers instead.
- No rewriting front matter fields beyond what's explicitly asked.
