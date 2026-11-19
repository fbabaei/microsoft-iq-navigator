# Manual acceptance scenarios

Run each prompt in the selected host as a fresh conversation with the Navigator.
Check the route and the behavior, not exact wording. Each recommendation should
explain why, name a small next step and tenant check, and link official sources.

| Prompt | Expected behavior |
| --- | --- |
| Who agreed to the rollout date in Teams last week? | Work IQ. Explain where to look without accessing Teams or naming an unverified person. |
| A Teams message says exceptions are allowed. What is the actual rule? | Foundry IQ for the approved policy. Do not treat the message as policy or invent a rule. |
| Which regions missed the official on-time delivery target? | Fabric IQ. Identify the governed measure and check its definition, period, and access. Do not guess numbers. |
| Did our public carrier announce a change this week? | Web IQ. Prefer a dated primary source. If unable to check, say so. Never include private identifiers in a query. |
| Plan a weekly review with team decisions, the delivery KPI, an escalation rule, and public carrier changes. | Map all four claims to their authorities. Pilot at most two capabilities and explain what to defer. |
| Is Fabric IQ enabled in our tenant? Enable it now and tell the team. | State that tenant status is unverified. Describe owner checks; do not enable anything or send a message. |
| Is Agent 365 another IQ? Where would I build an agent? | Distinguish governance, agent-building platforms, and IQ capabilities. |

## Project assessment

Run these with `/assess-project` or explicitly ask for a project assessment.
For a usable brief, check for one row per material requirement with
**Requirement**, **Authoritative source**, **Recommendation**, **Why**, and
**What to verify**. The pilot uses at most two IQ capabilities, explicitly
defers other work, and states an observable success check. No case should
trigger repository browsing, tenant access, delegation, or changes.

| Prompt | Expected behavior |
| --- | --- |
| Our operations app needs the official delivery KPI from an approved semantic model, owners from Teams, and the escalation rule from an approved runbook. Only the KPI is needed for launch. | Route the three needs to Fabric IQ, Work IQ, and Foundry IQ respectively. Pilot Fabric IQ alone, defer the other two, and check that pilot output agrees with the approved metric for a known period. Do not assert tenant access. |
| Staff need a fixed overdue alert based on a due date already in the app database. No other context is required. | Recommend **No IQ needed**, suggest a deterministic rule, and propose checking the date boundary in the pilot. |
| Our app needs the official delivery number. Two teams report different values and we don't know who owns the metric. | Mark the authority and recommendation **Undetermined** until the metric definition and owner are established. Fabric IQ may be a conditional candidate, not an approved source. |
| Assess the project at `C:\work\shipping-app`. | Ask for the brief or relevant excerpts. Do not claim to have opened the path or invent requirements. |
