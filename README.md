# MacExperience Signage — Content

Live `content.json` for the digital signage video walls. The displays fetch this file
(every ~5 minutes) and update their slides — **no app rebuild or reinstall.**

- **What lives here:** slide content — services & prices, repair turnaround times, promos,
  featured-slide badges/taglines, which Shopify tags/product handles to show, slide order
  and durations. (No secrets — all public-facing.)
- **What does NOT live here:** the app code / slide *layouts* (that's the renderer bundle,
  published from the `digital-signage` repo), and live product price/image/stock (pulled
  straight from Shopify).

## Versioning

The top-level `version` field is a **`yyyymmddhhmmss`** timestamp of when the content was
published — bumped automatically by `./publish.sh`.

## Editing

1. Edit `content.json` locally (preview it by pointing the signage app's **Content URL** at
   your local file in dev/windowed mode).
2. Run **`./publish.sh`** — it stamps a fresh `version`, validates the JSON, commits, and pushes.
3. Within ~5 minutes every display picks up the change.

The displays' **Content URL** setting points at:
`https://raw.githubusercontent.com/alleychris/signage-content/main/content.json`
