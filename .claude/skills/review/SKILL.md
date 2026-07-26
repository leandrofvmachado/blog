---
name: review
description: Critical read-through of a blog draft before publishing. Use this when the user wants feedback on a draft under content/drafts/, says things like "review this draft", "give this a pass", "critique this", or "/review ...". This is the fourth stage of the writing pipeline — after "draft" (which expands an outline into prose) and before "publish" (which moves a finished piece into content/posts/). Do not use this to write or expand prose yourself; that belongs to the draft skill. Do not use this to move files into content/posts/; that belongs to the publish skill.
---

# Review

A critical read-through pass over a draft, producing concrete suggested edits. This is the fourth
stage of the writing pipeline (idea -> outline -> draft -> **review** -> publish). By this point
there should be full prose, not bullet notes — this skill's job is to find what's weak, unclear,
inconsistent, or unfinished, and propose fixes, not to write the piece for the user.

## What this skill does NOT do

- It does not silently rewrite the draft. Never apply edits wholesale on your own initiative.
- It does not expand outline bullets into prose — that's the draft skill's job. If you find a
  section that's still just bullet notes, flag it as unfinished (see below); do not write the
  prose for it yourself unless the user explicitly asks you to fix that specific issue.
- It does not move the file to `content/posts/` or touch front matter fields like `date`/`slug`
  for publishing purposes — that's the publish skill's job.

## Steps

1. **Locate the draft.** The user should point you at a path under `content/drafts/`. If they
   only give a slug or a fuzzy name, look for a matching file under `content/drafts/` before
   asking. If nothing matches, say so and stop rather than guessing at a different file.

2. **Read the full draft**, front matter included. Note the declared `title`, `tags`, and
   `summary` — you'll check the body against these later (e.g. does the piece actually deliver
   on what the summary promises).

3. **Check `style/STYLE.md`.** Read it if it exists. Use judgment on whether it currently
   contains real, settled guidance (concrete rules, preferences, examples) versus placeholders,
   open questions, or scaffolding TODOs. If it's still mostly scaffold, skip style-consistency
   checks against it and don't mention it as a factor — don't manufacture feedback from a file
   that has no real content yet. If it does contain real guidance, check the draft against it
   specifically (e.g. voice, sentence length preferences, banned words/phrases, formatting
   conventions) and cite which STYLE.md rule an edit relates to.

4. **Read through the draft critically**, looking for:
   - **Intro/thesis**: Does the opening establish what the piece is about and why it matters?
     Flag a missing, buried, or wishy-washy thesis specifically — quote the offending sentence
     (or note its absence) rather than saying "the intro is weak."
   - **Headings vs. content**: For each section heading, check whether the prose under it
     actually delivers on what the heading promises. Flag sections that wander off-topic, restate
     the heading without adding substance, or leave the implied question unanswered.
   - **Clarity**: Sentences that are ambiguous, overly dense, or require re-reading. Quote the
     sentence and explain what's unclear about it.
   - **Grammar and mechanics**: Typos, subject-verb agreement, punctuation, tense shifts.
   - **Tone consistency**: Shifts in register (e.g. casual aside dropped into a formal section, or
     vice versa) — quote both sides of the inconsistency.
   - **Repetition/redundancy**: Ideas or phrases repeated across sections without adding anything.
   - **Unsupported claims**: Assertions that read like they need a concrete example, data point,
     or code snippet to land, but don't have one.

5. **Explicitly flag anything unfinished**, as its own callout separate from stylistic feedback:
   - Leftover `<!-- TODO: ... -->` or similar HTML-comment markers — quote them verbatim with
     their location.
   - Sections that are still outline bullets (short fragments, no connecting prose) rather than
     full sentences/paragraphs.
   - Sentences that trail off or are obviously incomplete (dangling clauses, missing words).

   Call this section out clearly (e.g. "Unfinished / not ready" as a heading) so the user knows
   these aren't optional polish — the piece likely isn't ready to publish until they're resolved.

6. **Present the full list of findings to the user before touching the file.** Format each
   finding as a short, addressable item:
   - Quote or closely paraphrase the exact sentence/section it applies to (line number or a short
     unique excerpt to locate it).
   - State the specific problem.
   - Propose a specific fix — not "tighten this up" but the actual suggested rewording, or at
     least a concrete direction (e.g. "cut the second clause" / "swap 'utilize' for 'use'").
   - Group findings under headings that make them scannable, e.g.: Unfinished/not ready, Intro &
     thesis, Structure (headings vs. content), Clarity, Grammar & mechanics, Tone, Style guide
     consistency (only if STYLE.md has real content).

7. **Wait for the user's decision on each edit.** Do not touch the draft file until they respond.
   They may:
   - Confirm individual edits one at a time — apply only those, using Edit with the exact
     old/new text.
   - Say something like "apply all" or "apply everything" — in that case apply every proposed
     edit from the list in one pass.
   - Reject or modify a suggestion — follow their direction instead of the original proposal.
   - Ask you to skip a category entirely (e.g. "don't worry about grammar nits") — drop those
     from consideration and don't re-raise them.

8. **After applying any edits, briefly confirm what changed** (a short list, not a full diff
   dump) and note any findings the user didn't act on, in case they want to revisit them later.

## Tone

Be specific and constructive, never vague. "Improve clarity" or "this section feels weak" is not
useful feedback — always anchor to the exact sentence or section and explain the concrete problem
and a concrete fix. The goal is to help the user see their own draft with fresh eyes, not to
grade it.

## Notes

- Drafts live under `content/drafts/` and are gitignored — this review happens entirely outside
  git history, which is expected. Nothing about this skill should suggest committing the draft.
- If the draft looks essentially finished with only minor nits, say so plainly rather than
  padding the list to seem thorough.
- If the draft is clearly still in outline form throughout (not expanded prose), say so up front
  and suggest running the draft skill first, rather than doing a full line-edit pass on notes.
