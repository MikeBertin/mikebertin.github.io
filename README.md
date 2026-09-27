# Propylaia

The front door to Mike Bertin's interactive explainers and from-scratch builds, served at https://mikebertin.github.io/.

**Privacy:** public. It is a landing page written for anyone arriving from GitHub or LinkedIn.

## What it does

One page of cards, one per live project, grouped by theme. Each card shows the project's own social image, a one-line description and a link to its site. Every project's own README and site link back here.

## Why Propylaia

The Propylaia is the great gateway on the Athenian Acropolis. Nobody went up to the temples without passing through it first, and it was built to show you what lay beyond before you reached it. This page does the same job for the projects: it is the way in.

## Running locally

```bash
python3 -m http.server 8187 --bind 127.0.0.1
```

Then open http://127.0.0.1:8187/.

## Adding a project

When a project goes live on Pages, add one card to the right section of `index.html`, update the project count in the header, the social description and the card in `brand/og-card.html`, then re-render the cards with `brand/make-cards.sh` and check the link and image load.

## Layout

| Path | What lives there |
|---|---|
| `index.html` | The whole page |
| `vendor/` | Shared theme and card styles, copied in |

## License

MIT
