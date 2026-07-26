---
name: idea
description: Capture a raw blog-post idea with minimal friction. Use this when the user wants to jot down a fleeting idea, a topic they might want to write about someday, or says things like "idea:", "note this for later", "add to the backlog", or "/idea ...". This is the very first stage of the writing pipeline — before any outline or prose exists. Do not use for outlining or drafting; those are separate skills.
---

# Idea

Capture a raw blog-post idea into the running backlog with as little friction as possible. This is
the entry point of the writing pipeline — the goal is speed, not polish.

## What this skill does NOT do

- It does not write an outline.
- It does not write any prose or draft content.
- It does not create files under `content/drafts/` or `content/posts/`.

Its only output is one new entry appended to `content/ideas/backlog.md`. If the user asks for an
outline or draft, tell them to use the appropriate later-stage skill instead, and stop here.

## Steps

1. **Read the input.** The idea may come as an argument to this skill or as whatever the user just
   said in chat. Treat that text as the raw material for the idea.

2. **Ask at most one clarifying question, only if truly needed.** If the input is a vague fragment
   (e.g. a single word or an ambiguous phrase with no clear angle), ask ONE short question to pin
   down what the idea actually is. Do not ask about tags, structure, audience, or anything else in
   the same turn — one question, maximum, and only if the idea can't stand on its own. If the input
   already reads as a coherent idea (even a rough one), skip questions entirely and just capture it.

3. **Derive the entry fields:**
   - `title` — a short, punchy phrase (a few words) summarizing the idea. Infer it from the input;
     don't ask the user for it separately unless the input is so sparse a title can't be formed.
   - `description` — one to two sentences capturing what the idea actually is, in the user's own
     intent (paraphrase, don't pad with filler).
   - `date` — today's date, in `YYYY-MM-DD` format.
   - `tags` — optional. Infer plausible tags from the content/topic if they're obvious (e.g. a tech
     name, a theme). If nothing obvious comes to mind, omit tags entirely rather than guessing
     wildly or asking the user.

4. **Ensure the backlog file exists.** Check `content/ideas/backlog.md`. If it doesn't exist yet (or
   is empty aside from a `.keep`-style placeholder), create it with a top-level heading:

   ```markdown
   # Idea Backlog
   ```

5. **Append a new entry** to the end of the file, formatted consistently as follows so later
   skills/automation can find entries by title:

   ```markdown
   ## <Title>
   - Date: YYYY-MM-DD
   - Tags: tag1, tag2
   
   <One-to-two sentence description of the idea.>
   ```

   If there are no tags, omit the `- Tags:` line entirely rather than leaving it blank.

   Add a blank line before the new `## <Title>` heading to separate it from the previous entry
   (and from the `# Idea Backlog` heading if this is the first entry).

6. **Confirm briefly.** After appending, tell the user in one short line what was captured (e.g.
   "Captured: '<Title>' added to the backlog."). Do not summarize the whole backlog file back to
   them unless they ask.

## Notes

- `content/ideas/backlog.md` is gitignored — this is intentional, since the repo is public and
  ideas are unpublished raw material. Never suggest committing it or moving it elsewhere.
- Keep the whole interaction tight: read input, capture, confirm. Avoid turning this into a
  brainstorming session or an interview — that belongs to later stages of the pipeline (outlining,
  drafting), not here.
