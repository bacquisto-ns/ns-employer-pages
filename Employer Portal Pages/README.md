# NueForms – Employer Portal Pages

> **Customer Focused & Technology Driven**

This repository houses the employer-facing experiences that power NueSynergy’s benefits portal. Every page in this folder is a self-contained HTML prototype that can be opened directly in a browser or embedded in platforms such as Go High Level. There is no build system, no package installation, and no backend dependency—just modern, responsive UI assets that demonstrate how employers review dashboards, manage plans, complete renewals, and submit requests.

---

## Overview

- **Scope** – Nine production-ready HTML pages that cover the employer dashboard, plan administration workflows, compliance announcements, renewal orchestration, and two embeddable forms (agency onboarding + FSA renewal).
- **Use cases** – Rapid prototyping, stakeholder demos, or drop-in content for static hosting and iframe/portal embeds.
- **Architecture** – Each file references shared CDN resources (Tailwind CSS, Inter, Font Awesome, Anime.js; `main.html` also uses Three.js + Mermaid). State is mock-only; the lone persistence example is the FSA Renewal portal, which stores history in `localStorage`.

---

## File Map

| File | Purpose | Highlights |
| --- | --- | --- |
| `main.html` | Employer landing dashboard | Animated 3D background via Three.js, stat tiles, benefit cards, task timeline, Mermaid journey visualization, contact blocks |
| `manage-benefits.html` | Plan portfolio overview | Filter chips, animated cards for FSA/COBRA/HSA, CTAs to add plans or start renewals |
| `add-benefit.html` | 3-step wizard to request a new benefit | Benefit selection grid, step indicators, summary panel, success state animation |
| `terminate-benefit.html` | Termination request form | Risk messaging, authorization checkbox, confirm dialog redirect |
| `renewal-center.html` | Renewal checklist workspace | Multi-card checklist with Anime.js transitions, sidebar progress meter, dynamic completion % |
| `compliance-notices.html` | Regulatory & system updates feed | Category filter, urgency color coding, slide-in animations |
| `contact-change.html` | Contact information update journey | Three-step process cards, validation messaging, journey visualization, progress bar |
| `add-new-group.html` | Agency connection / group onboarding (embed friendly) | Tailwind fallback styles, modal interactions, tablet-friendly layout, iframe-safe resource loading |
| `fsa-renewal-portal-embed.html` | Embeddable FSA renewal portal | Scoped CSS, conditional CDN loading, status timeline, activity feed, document checklist, `localStorage` persistence |

---

## Experience Highlights

### Employer Dashboard (`main.html`)
- Hero header with gradient branding, quick navigation pills, and live-contact panel.
- Animated stats grid + benefit detail cards with hover states.
- Progress trackers, compliance highlights, task timeline, and support CTAs.
- Three.js canvas + Anime.js page transitions plus Mermaid diagram for workflow storytelling.

### Plan Management Workspace (`manage-benefits.html`, `add-benefit.html`, `terminate-benefit.html`)
- Provides a single-click path to add, renew, or terminate plans.
- Wizards include lightweight validation, step indicators, and success modals to mimic production flows.
- Warning + acknowledgement patterns reinforce high-risk actions like terminations.

### Renewal & Compliance Operations (`renewal-center.html`, `compliance-notices.html`, `fsa-renewal-portal-embed.html`)
- Renewal center drives multi-benefit checklist completion with real-time percentage updates.
- Compliance feed differentiates urgent vs informational notices using badges and subtle motion.
- FSA embed ships with scoped styles, embeddable resource loading, action cards, and a mock audit trail saved in `localStorage`.

### Communication & Onboarding (`contact-change.html`, `add-new-group.html`)
- Contact change journey showcases progressive disclosure, animated step cards, and branded components that respect larger tap targets.
- Agency onboarding form includes iframe-safe script loading, Tailwind fallback utilities, modal confirmations, and detailed field validation hooks.

---

## Shared Tech Stack

- **HTML5 / CSS3 / ES6+** – Semantic markup with custom properties for the NueSynergy brand tokens.
- **Tailwind CSS (CDN)** – Rapid layout + spacing utilities, extended at runtime where needed.
- **Inter (Google Fonts)** & **Font Awesome 6.4** – Primary typography and iconography.
- **Anime.js** – Micro-interactions for cards, checklists, and step transitions.
- **Three.js & Mermaid.js** – Used exclusively by `main.html` for the hero background and process diagram.
- **LocalStorage** – Lightweight persistence in `fsa-renewal-portal-embed.html` for mock activity snapshots.

---

## Running Locally

1. Clone or download the repository.
2. Open any `.html` file directly in a browser **or** serve the folder via a static server:
   ```bash
   # Python
   python -m http.server 8000

   # Node
   npx http-server -p 8000
   ```
3. Navigate to `http://localhost:8000/main.html` (or another file) to explore the UI.

> Tip: Because all assets load from CDNs, there is no npm install or build step required.

---

## Embedding Notes

- `add-new-group.html` and `fsa-renewal-portal-embed.html` check for host-page resources before injecting Tailwind, Font Awesome, Inter, or Anime.js—making them safe to drop into existing marketing platforms.
- Scoped wrapper classes (`.fsa-renewal-portal-wrapper`, etc.) prevent style collisions when embedded via iframe or custom HTML blocks.
- For Go High Level or CMS embeds, wrap the entire file contents in a container div supplied by the host and ensure the iframe height is set to `auto` or `100%` with postMessage-based resizing if needed.

---

## Data & Integration Placeholders

- All numbers, plan names, due dates, and submission flows are mock data meant to demonstrate layout and logic.
- No network requests are issued; submission buttons either show alerts or redirect back to the relevant hub screen.
- Replace mock handlers (`alert`, `confirm`, placeholder summary values, etc.) with API calls or webhook posts when wiring to production services.

---

## Accessibility & Performance Commitments

- Color contrast meets AA guidelines (4.5:1) across primary flows.
- Keyboard focus states are visible; tab order follows DOM structure; modals/buttons include ARIA-friendly text.
- Animations are powered by Anime.js and can be wrapped in `prefers-reduced-motion` checks during production hardening.
- Critical assets (`fonts.googleapis.com`, Tailwind, Font Awesome) are preloaded on the larger flows; embeddable versions dynamically lazy-load them only when missing.

---

## Development Tips

- Keep new pages self-contained: include CDN links, inline styles, and scripts directly in the HTML file.
- Reuse the brand variables defined in each file’s `:root` declaration to maintain visual consistency.
- When cloning an existing view, update CTA links so navigation remains coherent (`main.html` → `manage-benefits.html` → child flows).
- For persistence, follow the `fsa-renewal-portal-embed.html` pattern: namespace `localStorage` keys (`fsa-renewal-<employer-id>-history`) and wrap access in `try/catch`.

---

## Testing Checklist

- **Layout**: Validate desktop (1440px), tablet (768px), and mobile (375px) breakpoints for each file.
- **Interactions**: Click through every CTA, confirmation, and wizard step—ensuring Anime.js transitions complete without console errors.
- **Keyboard**: Tab through forms, buttons, and links; confirm focus rings remain visible on gradient backgrounds.
- **Embeds**: For iframe deployments, verify that conditional resource loaders don’t duplicate scripts already supplied by the host.

---

## Status & Ownership

- **Current version**: 1.1 (November 2025)
- **Maintained by**: NueSynergy Employer Experience Team
- **Support**: employersupport@nuesynergy.com · 1-800-413-4138

---

## License

This project is proprietary software owned by NueSynergy. All rights reserved.

---

*Customer Focused & Technology Driven* 🚀
