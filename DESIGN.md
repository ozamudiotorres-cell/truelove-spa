---
name: Truelove Spa
description: Premium wellness sanctuary rooted in the warmth of San Luis Potosí
colors:
  botanical-olive: "#586e26"
  forest-deep: "#42531C"
  botanical-soft: "#87A24A"
  spa-mist: "#E5EAD4"
  antique-cobre: "#D1B891"
  cobre-soft: "#E5D5BC"
  ink: "#1F2515"
  muted: "#6F7466"
  beige: "#FBF9F4"
  beige-warm: "#EDE4D2"
  cream: "#FFFCF6"
  white: "#FFFFFF"
typography:
  display:
    fontFamily: "Cormorant Garamond, Georgia, serif"
    fontSize: "clamp(3.25rem, 8.5vw, 6.75rem)"
    fontWeight: 400
    lineHeight: 1.15
    letterSpacing: "-0.02em"
  headline:
    fontFamily: "Cormorant Garamond, Georgia, serif"
    fontSize: "clamp(2.375rem, 5vw, 3.875rem)"
    fontWeight: 500
    lineHeight: 1.08
    letterSpacing: "-0.01em"
  title:
    fontFamily: "Cormorant Garamond, Georgia, serif"
    fontSize: "1.625rem"
    fontWeight: 500
    lineHeight: 1.15
  body:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "0.9375rem"
    fontWeight: 400
    lineHeight: 1.7
  label:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "0.6875rem"
    fontWeight: 600
    lineHeight: 1
    letterSpacing: "0.18em"
rounded:
  card: "24px"
  pill: "100px"
  video: "20px"
spacing:
  xs: "12px"
  sm: "18px"
  md: "28px"
  lg: "44px"
  xl: "72px"
  section: "130px"
components:
  button-primary:
    backgroundColor: "{colors.forest-deep}"
    textColor: "{colors.white}"
    rounded: "{rounded.pill}"
    padding: "17px 36px"
  button-primary-hover:
    backgroundColor: "{colors.botanical-olive}"
  button-outline:
    backgroundColor: "transparent"
    textColor: "{colors.white}"
    rounded: "{rounded.pill}"
    padding: "17px 36px"
  button-service:
    backgroundColor: "transparent"
    textColor: "{colors.botanical-olive}"
    rounded: "{rounded.pill}"
    padding: "13px 24px"
  button-service-hover:
    backgroundColor: "{colors.botanical-olive}"
    textColor: "{colors.white}"
  tab-default:
    backgroundColor: "transparent"
    textColor: "{colors.muted}"
    rounded: "{rounded.pill}"
    padding: "14px 34px"
  tab-active:
    backgroundColor: "{colors.botanical-olive}"
    textColor: "{colors.white}"
    rounded: "{rounded.pill}"
    padding: "14px 34px"
---

# Design System: Truelove Spa

## 1. Overview

**Creative North Star: "La Casa Dorada"**

Truelove Spa's design system channels the feeling of being welcomed into a beloved, privately-run home — one that happens to be exquisitely appointed. Not the sterile anonymity of a chain wellness brand, not the performative excess of an oversaturated Instagram aesthetic, and not the clinical coldness of a medical facility. La Casa Dorada is the antidote to all three: a warm sanctuary where every surface communicates care, every spacing decision carries intentionality, and the golden accents feel earned rather than applied.

The palette grounds in a botanical olive — the green of a well-tended herb garden at midday, not a corporate forest — against a cream ground that reads as natural light filtering through white curtains. Antique Cobre (the gold accent) carries the premium signal: aged and handcrafted rather than metallic and generic. The typography pairs Cormorant Garamond (literary, intimate, emotional) with Inter (precise, legible, contemporary) — never mixed within the same phrase, each holding its register. Motion is candlelit and deliberate: surfaces lift and breathe, they don't bounce or flash.

This system explicitly rejects: chain pharmacy beauty brand aesthetics (mass-market greens, neon pill shapes, zero soul), oversaturated Instagram visual language (loud gradients, filter noise, heavy glow), cold clinical whites and blues that strip warmth from every surface, and the "dark background + gold serif" generic luxury template that has no voice of its own.

**Key Characteristics:**
- Conversion-first hierarchy — booking CTAs always present, always premium
- Warmth carried by accent color and typography, never by a warm-tinted background alone
- Green-tinted shadows (`rgba(66, 83, 28, ...)`) that belong to the palette
- Cormorant for emotion, Inter for action — two voices in distinct roles
- Layouts that breathe and lift rather than flatten and compress
- Spanish-language copy register woven into the design voice, not treated as a translation

## 2. Colors: The Casa Dorada Palette

A botanical palette grounded in two greens and anchored by Antique Cobre — three colors that could exist in a real garden in San Luis Potosí.

### Primary
- **Botanical Olive** (`#586e26`): The living brand green. Active states, primary CTAs on secondary surfaces, interactive fills, tab active state. The color of the spa's visible vitality.
- **Forest Deep** (`#42531C`): The darker anchor. Primary booking button resting state, heading color on light surfaces, full-bleed dark section backgrounds (philosophy section, video gallery). Where Botanical Olive signals action, Forest Deep signals permanence.

### Secondary
- **Botanical Soft** (`#87A24A`): The warm mid-green. Used exclusively for `<em>` and italic spans within Cormorant Garamond headings. Never as a background fill. Its role is emotional warmth inside language, not surface coverage.
- **Spa Mist** (`#E5EAD4`): A near-white green tint. Dividers, avatar backgrounds, dashed borders, subtle surface differentiators. Whisper-weight; its job is to carry the hue with almost no presence.

### Tertiary
- **Antique Cobre** (`#D1B891`): The gold accent. Prices, star ratings, icon accents, premium badge fills, eyebrow dividers. Deployed sparingly — its scarcity is its value.
- **Cobre Soft** (`#E5D5BC`): Softer gold for hero subheading text, decorative separators, and banner supporting copy where full Antique Cobre would be too heavy.

### Neutral
- **Ink** (`#1F2515`): Near-black with a green undertone — the correct body text color on all light surfaces. It belongs to the palette; a generic `#111111` does not.
- **Muted** (`#6F7466`): Secondary text. Card descriptions, supporting labels. ⚠ This achieves approximately 4.1:1 against white — below WCAG AA 4.5:1. Verify per context; use `#5e6257` for critical body-text roles.
- **Beige** (`#FBF9F4`): The visual floor. Primary body background for the entire page.
- **Beige Warm** (`#EDE4D2`): Slightly richer surface. Hero em text, button hover fills.
- **Cream** (`#FFFCF6`): Lightest surface. Service section gradient terminus.
- **White** (`#FFFFFF`): Cards, scrolled navigation background, modal surfaces.

### Named Rules
**The Cobre Reserve Rule.** Antique Cobre (`#D1B891`) appears on ≤15% of any given screen. Its value comes from contrast against the botanical greens; dilute it and the premium signal collapses into decoration.

**The Green Shadow Rule.** All `box-shadow` values use `rgba(66, 83, 28, ...)` — the deep forest green — not `rgba(0, 0, 0, ...)`. Generic black shadows are borrowed. Green shadows belong here.

## 3. Typography

**Display Font:** Cormorant Garamond (Georgia, serif fallback)
**Body Font:** Inter (-apple-system, BlinkMacSystemFont, sans-serif fallback)

**Character:** A study in complementary registers. Cormorant Garamond brings literary authority and quiet intimacy — the word *bienestar* in 80px italic Cormorant is an experience, not a label. Inter grounds it in clean metropolitan precision. The two never compete because they never share a line.

### Hierarchy
- **Display** (weight 400, `clamp(3.25rem, 8.5vw, 6.75rem)`, line-height 1.15, -0.02em letter-spacing): Hero headlines only. Often contains italic `<em>` spans in Botanical Soft for emotional counterpoint. The existing hero size reaches 6.75rem (108px) — a deliberate brand choice for the full-bleed hero; do not apply this scale to any other context.
- **Headline** (weight 500, `clamp(2.375rem, 5vw, 3.875rem)`, line-height 1.08, -0.01em): Section titles (h2). One or two per screen. Apply `text-wrap: balance`.
- **Title** (weight 500, `1.625rem` / 26px, line-height 1.15): Card headings, subsection labels (h3).
- **Body** (weight 400/300, `0.9375rem`–`1.0625rem` / 15–17px, line-height 1.7): All prose. Max 65–75ch per line. Weight 300 for supporting paragraphs; 400 for primary copy. Apply `text-wrap: pretty` to paragraphs.
- **Label** (weight 600, `0.6875rem`–`0.75rem` / 11–12px, 0.18–0.36em letter-spacing, ALL CAPS): Navigation links, button text, tab labels, eyebrow categories, price sub-labels.

### Named Rules
**The Italic Warmth Rule.** Italic `<em>` spans within Cormorant headings always use Botanical Soft (`#87A24A`). This single color shift on a handful of syllables carries more emotional warmth than any background color change. Never apply it at body or label scale; never use it outside heading contexts.

**The Two-Register Rule.** Cormorant Garamond is the emotional register (headlines, pull quotes, prices, testimonials). Inter is the action register (buttons, navigation, labels, body copy). A heading and the button below it speak different languages from the same brand. Do not mix them within the same sentence or compound element.

## 4. Elevation

The system is ambient and lifted. Surfaces float above the cream ground as if illuminated from below by a single soft light source — candlelit, not spotlit. Shadow opacity is low and spread is wide; depth without drama. All shadows draw from Forest Deep (`rgba(66, 83, 28, ...)`), giving darkness a green undertone that belongs to the palette.

### Shadow Vocabulary
- **Soft** (`0 10px 40px rgba(66, 83, 28, 0.06)`): Cards at rest. Whisper-weight. Present only to separate surface from ground; if you squint and it vanishes, it's working correctly.
- **Medium** (`0 18px 60px rgba(66, 83, 28, 0.10)`): Cards on hover, navigation (scrolled state), modals. Perceivable lift — the surface has moved toward you.
- **Large** (`0 30px 80px rgba(66, 83, 28, 0.16)`): Promo cards on hover, featured/gold-bordered cards. Full elevation — reserved for the highest-priority interaction moment on a given screen.

### Named Rules
**The Flat-at-Rest Rule.** Cards and buttons rest at Soft shadow. Medium and Large shadows appear only in response to interaction (hover, focus, active) or persistent elevation (modal, sticky nav). If everything is elevated all the time, nothing is.

## 5. Components

### Buttons
Pill-shaped (`100px` radius) throughout. The pill is a brand signal — it reads as welcoming and confident rather than sharp or institutional.

- **Primary (Booking CTA):** Forest Deep background (`#42531C`), white text, `17px 36px` padding, label weight (600, 11px, 0.2em letter-spacing, uppercase). Arrow icon (`→`) slides 4px on hover. Hover: background shifts to Botanical Olive (`#586e26`), lifts 3px, shadow-md appears.
- **Outline:** Transparent background, white text, `rgba(255,255,255,0.45)` border, `backdrop-filter: blur(6px)`. For use over video and dark-image backgrounds only. Hover: `rgba(255,255,255,0.10)` fill, full white border.
- **Service (Ghost):** Transparent background, Botanical Olive text, Botanical Olive `1.5px` border. Hover: solid Botanical Olive fill with white text. Used on service cards.
- **Gift/Action:** Botanical Olive background, white text, full-width pill. Hover: Forest Deep fill, lifts 2px.

### Tab Navigation
- **Container:** White background, pill-shaped, shadow-soft, `8px` internal padding, `fit-content` width.
- **Default tab:** Muted text (`#6F7466`), no background, label weight.
- **Active tab:** Botanical Olive background, white text, active glow (`0 8px 20px rgba(88,110,38,0.28)`).
- **Transition:** `0.45s cubic-bezier(0.22, 1, 0.36, 1)` on all state changes.

### Cards / Containers
- **Corner style:** Gently rounded (`24px`). Never sharp, never fully circular.
- **Service cards:** White background, shadow-soft at rest. Hover: lifts 8px + `scale(1.01)`, shadow-md. Image (4:3 aspect) scales `1.08×` on card hover.
- **Promo cards:** Full-bleed image with gradient overlay (`rgba(15,20,10,...)` multi-stop), white text at bottom. Same hover lift. Gold pill tag in top-left corner.
- **Testimonial cards:** White background, shadow-soft. Large decorative Cormorant quotation mark in Spa Mist as background character. Gold stars, italic Cormorant quote text, Ink author name separated by a Spa Mist divider.
- **Featured/Gold cards:** Optional `border: 2px solid #D1B891` for the promoted item in a set. Only one per grid.
- **Internal padding:** `28px`–`44px` depending on card density.

### Inputs / Fields
- **Style:** White background, `1px solid rgba(66,83,28,0.15)` border, `12px` radius.
- **Focus:** Border shifts to Botanical Olive (`#586e26`), no glow box-shadow (warmth, not tech-UI feedback).
- **Error:** Border shifts to a warm red; label text adopts the same red.
- **Disabled:** `0.5` opacity, `cursor: not-allowed`.

### Navigation
- **Transparent state (over hero):** Logo and nav links white. Reserve button: Forest Deep pill. Background: none.
- **Scrolled state:** `rgba(255,255,255,0.94)` background, `backdrop-filter: blur(18px)`. Logo and nav links shift to Ink. Shadow: `0 1px 0 rgba(66,83,28,0.06), 0 12px 30px rgba(66,83,28,0.05)`. Padding reduces: `22px → 16px`.
- **Nav links:** Label weight (12px, 0.18em tracking, uppercase). Antique Cobre underline (`width: 0 → 100%`) on hover.
- **Mobile toggle:** Three-line hamburger (1.5px strokes), white over hero / Forest Deep when scrolled. Expands to full-height panel.

### Video Cards
- **Shape:** `20px` radius, `9:16` aspect ratio, `background: #000`.
- **Overlay:** Four-stop gradient — dark top, transparent middle, transparent upper-bottom, dark bottom.
- **Glass tag (top-left):** `rgba(255,255,255,0.20)` background, `backdrop-filter: blur(12px)`, Antique Cobre dot indicator, label text.
- **Play indicator:** White circle (`56px`), opacity `0` at rest, `scale(0.85)` at rest; reveals to `opacity:1` / `scale(1)` on hover.

### Signature: Booking Modal
Full-viewport overlay (`rgba(15,20,10,0.85)`), centered white card (`max-width: 560px`, rounded-card radius). Header stripe: Forest Deep background, Cormorant title, Antique Cobre accents. Form fields: standard input style. Submit: Primary button, full-width.

## 6. Do's and Don'ts

### Do:
- **Do** use Forest Deep (`#42531C`) for the primary booking button at rest and shift to Botanical Olive (`#586e26`) on hover — this specific transition communicates warmth in motion.
- **Do** use `rgba(66, 83, 28, ...)` as the shadow color on every `box-shadow` — green-tinted depth is non-negotiable.
- **Do** use italic Cormorant Garamond `<em>` spans in Botanical Soft (`#87A24A`) within headings as the system's primary warmth signal.
- **Do** honor `prefers-reduced-motion` on all animations: hero sparkles, titleShine, heroBreathe, scroll-triggered entrances, button shines. Every animation needs a crossfade or instant-swap fallback.
- **Do** verify Muted (`#6F7466`) contrast in every context — it's ~4.1:1 against white, below WCAG AA. Use `#5e6257` for body-text roles where compliance is required.
- **Do** apply `text-wrap: balance` on h1–h3 and `text-wrap: pretty` on long prose blocks.
- **Do** keep Antique Cobre (`#D1B891`) to ≤15% of any screen surface.
- **Do** keep `box-shadow` transitions on the hover path: cards at soft at rest, medium on hover, not the reverse.

### Don't:
- **Don't** use chain pharmacy beauty brand aesthetics — no mass-market wellness greens, no neon pill accents, no Farmacia Guadalajara / generic health-retail color logic.
- **Don't** use oversaturated Instagram aesthetics — no neon glows, no heavy gradient fills on text blocks, no loud image filter overlays.
- **Don't** use cold whites or clinical blues as primary surfaces or functional accents — every surface must carry the warm, botanical identity.
- **Don't** use a "dark background + gold serif" generic luxury template layout — La Casa Dorada is a specific voice; it does not borrow from unnamed luxury SaaS or hotel booking sites.
- **Don't** extend `background-clip: text` gradient animations beyond the hero h1 `titleShine`. That is a single intentional exception; it is not a pattern.
- **Don't** add `.section-eyebrow` to every section by structural reflex — use it deliberately where the label genuinely orients the reader.
- **Don't** use `rgba(0, 0, 0, ...)` as a shadow color anywhere in the system.
- **Don't** let heading copy overflow its container — test `clamp()` display sizes at 375px viewport width; if words break or overflow, reduce the `clamp()` max or rewrite the copy.
- **Don't** nest cards. The recovery-card inside a white container inside the beige page is the ceiling; never add a third layer.
