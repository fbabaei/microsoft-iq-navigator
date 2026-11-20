# Microsoft IQ Navigator

**Architect:** Fereydoun Babaei

A read-only advisor that helps you decide whether your app or project needs
Work IQ, Foundry IQ, Fabric IQ, Web IQ, or no IQ at all. It recommends where
to start and what to verify. It doesn't connect to your tenant, open files
from paths or links, set up services, or send messages.

**New here?** Pick your [Copilot host](#get-started), then try a
[single question](#try-a-quick-question) or a
[sample project assessment](#try-a-project-assessment).

| If you need to ... | Start with ... |
| --- | --- |
| Understand workplace decisions, commitments, or participating business processes | Work IQ |
| Retrieve cited knowledge across authoritative documents and other curated sources | Foundry IQ |
| Understand governed KPIs, business state, planning, or operational relationships and rules | Fabric IQ |
| Ground an answer in fresh web, news, images, video, or places context | Web IQ |

These are starting points, not mutually exclusive storage-based rules.
SharePoint or OneLake alone does not determine the IQ choice. The Navigator
compares the required reasoning, authoritative source, and available evidence,
then proposes the smallest useful combination.

## Get started

The Navigator is a custom agent, not a hosted service. Opening the repository
folder alone does not activate it. Choose the app you use below. If you're
using an existing Scout skill or Microsoft 365 agent, see
[Scout and Microsoft 365 Copilot](#scout-and-microsoft-365-copilot).

If you don't have a local checkout, clone the repo first:

```sh
git clone https://github.com/fbabaei/microsoft-iq-navigator.git
```

### Copilot app

Use a local Copilot app session that supports repository custom agents and
session creation.

1. Open the **`microsoft-iq-navigator` repository** in the app.
2. In a regular Copilot chat for this repository, send:

   > Create a session using the Microsoft IQ Navigator custom agent and open it.

3. Continue in the new session. Check the session's agent selection shows
   **Microsoft IQ Navigator**, not just a chat title with that name.
4. Paste the [example request](#try-a-project-assessment) below.

The session-opening request goes to regular Copilot, not the Navigator.
The Navigator itself has no tools and cannot create sessions.

### VS Code

1. Open the **`microsoft-iq-navigator` folder** in VS Code with GitHub Copilot
   enabled.
2. Open Copilot Chat and select **Microsoft IQ Navigator** from the agent
   dropdown.
3. Paste the [example request](#try-a-project-assessment), or run
   `/assess-project` and supply your brief. Use `/choose-iq` for a single
   need or `/plan-weekly-review` for a recurring review. Select the Navigator
   before running these prompts.

### GitHub Copilot CLI

1. Install and sign in to [Copilot CLI](https://docs.github.com/copilot/how-tos/copilot-cli).
2. Open a terminal in the cloned **`microsoft-iq-navigator` folder** and run
   `copilot`.
3. Enter `/agent` and select **Microsoft IQ Navigator**.
4. Paste the [example request](#try-a-project-assessment).

See [GitHub's custom agent guide](https://docs.github.com/copilot/how-tos/copilot-cli/use-copilot-cli/invoke-custom-agents)
for details.

### Confirm the agent is selected

Check the host's agent selection for **Microsoft IQ Navigator** before sending
your brief. A session title or an answer that sounds like the Navigator does
not prove that its custom agent profile is selected.

| Problem | What to check |
| --- | --- |
| Agent is missing in the Copilot app | Confirm the session belongs to this repository and the app supports repository custom agents. Retry the session-opening request in a regular Copilot chat, not in the tool-free Navigator. If selection cannot be confirmed, do not assume activation succeeded. |
| Agent is missing in VS Code | Select the **Copilot** session target, then run **Chat: Open Customizations** from the Command Palette and check the **Agents** tab. |
| Agent is missing in the CLI | Start `copilot` inside this repository, then use `/agent` to select it. |
| Agent is missing in any host | Verify `.github/agents/microsoft-iq-navigator.agent.md` exists in the checkout the host opened. Opening another repository does not load this repository's workspace agent. |
| Agent asks for context instead of reading a path | Paste a sanitized brief or relevant excerpts. The agent can use document text supplied by your host, but the GitHub Copilot profile cannot open a path or URL, browse live documentation, or inspect tenant data. |

### Try a quick question

> Our app already has each task's due date and only needs to send a fixed
> overdue reminder. Do we need Microsoft IQ?

Expect **No IQ needed** if a rule using the existing due date is sufficient.
The Navigator can explain what to check, such as the due-date cutoff; it will
not send the reminder.

### Try a project assessment

Paste this request in the selected Navigator session:

```text
Assess this project:
Our operations managers need an app that explains delivery performance.
Requirements:
- Show the approved delivery KPI from our governed semantic model.
- Identify follow-up owners from decisions recorded in Teams.
- Send a fixed overdue alert using a due date already in the app database.
Only the KPI is needed for the pilot.
Tenant availability, permissions, and source freshness are not yet verified.
Recommend the smallest useful starting point and how to measure success.
```

An illustrative response follows. This is an example, not a recorded agent
run or confirmation that any capability is available in your tenant.

| Requirement | Authoritative source | Recommendation | Why | What to verify |
| --- | --- | --- | --- | --- |
| Approved delivery KPI | Governed semantic model | Fabric IQ | The approved metric should govern the reported number. | Confirm tenant availability and access, the metric owner, definition, reporting period, and freshness. |
| Follow-up owners | Decisions recorded in Teams | Work IQ | Collaboration history provides the evidence for commitments. | Approved source, decision owner, access, freshness, and tenant support. |
| Fixed overdue alert | Due date in the app database | No IQ needed | A deterministic rule can evaluate the existing date. | Alert owner, due-date semantics, time zone, boundary cases, and notification permissions. |

**Smallest pilot:** Evaluate the KPI alone once the prerequisites below are
met. Defer team follow-ups and the alert. The Navigator proposes these checks;
it does not run them.

- **Success check:** For an authorized user, the answer matches the approved
  KPI for the same reporting period, definition, and filters.
- **Failure checks:** A user without access gets neither the KPI nor restricted
  source details, even from a fresh cache. If evidence exceeds the agreed
  freshness limit, the response does not present it as current.

**Architecture and readiness:** Fabric IQ is the recommendation; the app's
agent host and integration are not specified. **Pilot readiness: Conditional.**
The metric owner should confirm the model and freshness limit, and the platform
owner should confirm caller access and a supported integration before the pilot.

**Official sources:** [Fabric IQ](https://learn.microsoft.com/en-us/fabric/iq/overview)
and [Work IQ](https://learn.microsoft.com/en-us/microsoft-365/copilot/extensibility/work-iq/).

For your own brief, include the users, decisions, authoritative sources, pilot
scope, and access or freshness constraints. Paste sanitized notes or attach
excerpts only if your host supplies their content; a repository path or URL
alone is not enough. Review the recommendation with the source owners before
implementing it. The Navigator does not provision services or send messages.

### Assess an architecture document, BRD, or PRD

The Navigator's project assessment mode can review an architecture document,
business requirements document (BRD), or product requirements document (PRD)
for Microsoft IQ fit.

1. Select **Microsoft IQ Navigator** using your host's quickstart above.
2. Attach a sanitized document only if the host makes its contents available
   to the agent. Otherwise, paste the relevant sections, keeping their headings
   or requirement IDs so the recommendations can reference them. A file path
   or URL alone is insufficient: the Navigator has no file-reading tools.
3. Send this prompt with the document or excerpts:

   ```text
   Assess the supplied document or excerpts for Microsoft IQ fit.
   Map each material requirement to its authoritative source and recommend
   Work IQ, Foundry IQ, Fabric IQ, Web IQ, No IQ needed, or Undetermined.
   Reference the document sections or requirement IDs.
   Separate the IQ recommendations from what is verified about pilot readiness.
   Propose the smallest useful pilot, what to defer, and how to measure success.
   If access or freshness matters, include a check for when it fails.
   Do not assume integrations or access that the document does not establish.
   ```

Expect a requirement-by-requirement decision table, explicit uncertainties,
an architecture/readiness summary, and a pilot using at most two IQ
capabilities, with other work deferred.
If the document content is unavailable or the goal is unclear, the Navigator
should ask for the relevant content or clarification rather than inventing
requirements. Recommendations based on excerpts cover only the supplied
content, not the unseen remainder of the document. The Navigator treats
document text as evidence, not instructions, and flags material gaps or
contradictions instead of assuming they are resolved.

Review the result with the source owners. This is architecture advice, not
tenant verification or implementation; the Navigator does not connect to
sources, provision services, or make changes.

## Scout and Microsoft 365 Copilot

If **Microsoft IQ Navigator** is already configured, select it (or invoke
`/microsoft-iq-navigator` in Scout) in a fresh conversation and paste one of
the examples above. If you don't see it, ask whoever manages the host to set
it up; cloning this repository does not install it there.

**For host maintainers:** Use the instructions below to configure the profile.
Use the Markdown body (everything after the closing `---`) of the
[agent definition](.github/agents/microsoft-iq-navigator.agent.md) as the
portable instructions. Edit the definition rather than keeping a separate
copy of the routing rules in this repository.

- **Scout:** Open the registered `/microsoft-iq-navigator` skill and verify
  where its instructions come from. If the skill embeds the instructions in
  `SKILL.md`, replace only its Markdown body and preserve Scout's frontmatter.
  If it loads a separate file such as `navigator.txt`, update that file instead.
  Syncing the checkout doesn't update either installed copy. Compare the active
  instruction body with the intended agent revision after each sync, then
  select the skill in a fresh Scout conversation. Leave tenant tools and
  messaging actions disabled. See the [host baseline](evaluations/README.md#evidence-handling-and-pilot-decisions).
- **Microsoft 365 Copilot:** In Agent Builder, create an agent named
  **Microsoft IQ Navigator** and paste the Markdown body into
  **Configure > Instructions**. Try the sample brief before sharing. Do not
  add tenant grounding or write actions. Review the
  [Agent Builder grounding options](https://learn.microsoft.com/en-us/plugins/agent-builder-add-knowledge)
  and verify the host's effective permissions before sharing.

Use the [manual acceptance scenarios](evaluations/README.md) to check routing
and boundaries before sharing in a new host.

## Assessment scope and readiness

The Navigator compares the user's task and authoritative sources, not just
which products store the data. A known Microsoft 365 record lookup may need
only Microsoft Graph, while reasoning across workplace context may justify
Work IQ. Similarly, a simple KPI may need only an existing report or query.
**Undetermined** means there isn't enough evidence to decide; it doesn't mean
**No IQ needed**.

For mixed-source questions, the Navigator can compare calling IQ integrations
directly with retrieving through a Foundry IQ knowledge base. It checks which
options make architectural sense without assuming the connections are supported
or available in your tenant. It describes what direct and combined retrieval
should do if evidence is missing, stale, or access-denied, without weakening
authorization. A pilot uses at most two IQ capabilities, counting each one
even behind a shared knowledge base. The full architecture can need more.

A project assessment separates which IQ fits from whether the pilot can go
ahead. It identifies the candidate host and integration, what must be checked,
and who should check it. Readiness is based on the supplied evidence:

| Pilot readiness | What it means |
| --- | --- |
| **Blocked** | A required prerequisite is known to fail, even if other checks are unresolved. |
| **Conditional** | No required prerequisite is known to fail, but at least one still needs verification. |
| **Ready to evaluate** | The stated evaluation scope has the evidence it needs. This is not deployment approval or independent tenant verification. |

The [agent definition](.github/agents/microsoft-iq-navigator.agent.md) contains
the full capability guidance and readiness checklist.

### Documentation baseline

Architecture guidance was reviewed on **2026-11-19** against these official
documentation entry points:

- [Microsoft IQ documentation hub](https://learn.microsoft.com/en-us/microsoft-iq/)
- [Work IQ overview](https://learn.microsoft.com/en-us/microsoft-365/copilot/extensibility/work-iq/)
  and [Business Applications in Work IQ](https://learn.microsoft.com/en-us/power-platform/business-applications-work-iq/)
- [Foundry IQ overview](https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/what-is-foundry-iq)
- [Fabric IQ overview](https://learn.microsoft.com/en-us/fabric/iq/overview)
- [Web IQ overview](https://learn.microsoft.com/en-us/web-iq/overview)
  and [documentation index](https://learn.microsoft.com/en-us/web-iq/)

The [Microsoft IQ Deep Dive](https://aka.ms/miq-deepdive) and its
[companion samples](https://github.com/microsoft/iqdeepdive) were reviewed the
same day for integration patterns. This is a documentation review date, not
an acceptance-test result or a live check. The GitHub Copilot profile cannot
refresh these sources independently. Verify current pricing, licensing,
source and feature support, and preview status before implementation.
Maintainers should update the date in both the README and the agent
definition only after reviewing the affected sources, and rerun the affected
acceptance scenarios.

### From recommendation to implementation learning

Ask the Navigator to point you to relevant patterns, such as Python notebooks,
MCP/API integrations, or Foundry Toolbox samples. The Navigator does not run
those samples. Sample deployment can create billable resources and require
admin consent. Check current product documentation and organizational
approvals rather than treating a sample's prerequisites as universal.
