# Microsoft IQ Navigator

A read-only Microsoft IQ fit and architecture advisor that helps you decide
where Work IQ, Foundry IQ, Fabric IQ, or Web IQ fits an app or project, and
where no IQ is needed. It does not check tenant data, provision services, or
send messages. It is not an exhaustive product manual or implementation agent.

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

## Assessment scope and readiness

The Navigator considers Work IQ workplace and participating business-app
context; Foundry IQ indexed/remote knowledge retrieval and shared knowledge
bases; Fabric IQ semantic models, ontology, Graph, planning, and data/operations
agents; and Web IQ retrieval options, source scopes, and provenance.
It recommends workload items only when the requirement justifies them.
An existing app, API, database query, or deterministic rule may be enough.
For example, a known Microsoft 365 record lookup may need only Microsoft Graph,
while reasoning across workplace context may justify Work IQ. Both still
require appropriate authorization.

For mixed-source questions, the Navigator compares direct IQ integrations
with composed retrieval through Foundry IQ using supported knowledge sources.
Source support and identity flows remain conditional, not guaranteed by MCP
compatibility. A knowledge base wrapping several IQs does not turn them into
one capability for pilot sizing: the pilot still uses at most two IQs.

For project assessments, expect the requirement decision table plus a concise
**Architecture and readiness** summary separating the **IQ capability**,
**agent host**, **candidate integration**, and **prerequisites**. Material
checks cover source authority and freshness, identity and source permissions,
network paths and data residency, integration/region/preview availability,
costs, and operational ownership. Unknowns remain explicit owner checks,
not proof that access exists or the capability cannot fit.
Identity checks distinguish acting on behalf of a user from using an application
or agent-owned identity where supported, including consent, accountable ownership,
resource permissions, and audit requirements.

The Navigator can recommend architectures involving governed actions without
performing those actions itself. Its instructions, including the readiness
checklist, live in the [agent definition](.github/agents/microsoft-iq-navigator.agent.md).

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

Supplemental composition and implementation-learning guidance was reviewed
the same day against the [Microsoft IQ Deep Dive](https://aka.ms/miq-deepdive)
and its [Microsoft sample repository](https://github.com/microsoft/iqdeepdive).
These learning materials supplement, rather than override, current product
documentation.

This date records a bounded documentation review, not executed acceptance
tests or tenant validation. The tool-free Copilot profile cannot refresh
these sources independently. Verify current pricing, licensing, feature/source
support, and preview status before implementation. When maintaining guidance,
review the affected official sources, update the baseline date in the agent
definition and here, and rerun the affected acceptance scenarios. Do not
advance the date solely because a file was edited.

### From recommendation to implementation learning

Use the [Microsoft IQ Deep Dive article](https://aka.ms/miq-deepdive) for session
recordings and write-ups, and the [companion samples](https://github.com/microsoft/iqdeepdive)
for Python notebooks, direct MCP/API integrations, composed Foundry IQ retrieval,
and Foundry Toolbox agent patterns.

Ask the Navigator to identify a relevant learning pattern and its prerequisites,
not to run the sample. The samples include deployment infrastructure that can
create billable resources and require elevated permissions or admin consent.
Sample-specific models, licenses, preview access, regions, roles, and capacity
requirements are not universal IQ requirements; verify current documentation
and your organization's approvals before implementation. This repository's
Navigator remains a tool-free advisor.

## Get started

The Navigator is a set of agent instructions, not a hosted service. Choose one
host below. Opening the repository folder alone does not activate the agent.

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
| Agent asks for context instead of reading a path | Paste a sanitized brief or relevant excerpts. The GitHub Copilot profile has no tools and cannot open files, browse documentation live, or inspect tenant data. |

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
| Approved delivery KPI | Governed semantic model | Fabric IQ, conditional on availability and access | The approved metric should govern the reported number. | Metric owner, definition, reporting period, freshness, permissions, and tenant support. |
| Follow-up owners | Decisions recorded in Teams | Work IQ, deferred beyond the pilot | Collaboration history provides the evidence for commitments. | Approved source, decision owner, access, freshness, and tenant support. |
| Fixed overdue alert | Due date in the app database | No IQ needed | A deterministic rule can evaluate the existing date. | Alert owner, due-date semantics, time zone, boundary cases, and notification permissions. |

**Smallest pilot:** Start with the KPI requirement alone. Have the authorized
owner compare the pilot output with the approved metric for one agreed reporting
period; success means the values match under the same definition and filters.
Defer team follow-ups and the alert. The Navigator recommends this check; it
does not run it or send alerts.

**Official sources:** [Fabric IQ](https://learn.microsoft.com/en-us/fabric/iq/overview)
and [Work IQ](https://learn.microsoft.com/en-us/microsoft-365/copilot/extensibility/work-iq/).
These links describe product fit, not verified tenant readiness.

**Architecture and readiness:** Fabric IQ is the capability; the app's agent
host and integration mechanism are not specified and remain to be selected.
The metric owner should confirm the model and access; the platform owner
should verify supported integration, identity, network/residency constraints,
current availability, cost, and operational ownership before implementing
the pilot.

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
3. Send this prompt, replacing "attached document" with "pasted sections" when
   providing excerpts:

   ```text
   Assess the attached document for Microsoft IQ fit.
   Map each material requirement to its authoritative source and recommend
   Work IQ, Foundry IQ, Fabric IQ, Web IQ, No IQ needed, or Undetermined.
   Reference the document sections or requirement IDs.
   Identify missing information and tenant checks.
   Propose the smallest useful pilot with measurable success criteria.
   Do not assume integrations or access that the document does not establish.
   ```

Expect a requirement-by-requirement decision table, explicit uncertainties,
an architecture/readiness summary, and a pilot using at most two IQ
capabilities, with other work deferred.
If the document content is unavailable or the goal is unclear, the Navigator
should ask for the relevant content or clarification rather than inventing
requirements. Recommendations based on excerpts cover only the supplied
content, not the unseen remainder of the document.

Review the result with the source owners. This is architecture advice, not
tenant verification or implementation; the Navigator does not connect to
sources, provision services, or make changes.

## Scout and Microsoft 365 Copilot

Use the Markdown body (everything after the closing `---`) of the
[agent definition](.github/agents/microsoft-iq-navigator.agent.md) as the
portable instructions. Edit the definition rather than keeping a separate
copy of the routing rules in this repository.

- **Scout:** If your Scout environment supports custom skills, configure a
  skill to use the Markdown body as its instructions. If you already have a
  `/microsoft-iq-navigator` skill that reads `navigator.txt`, update the
  configured file with the new instructions. Cloning the repo doesn't install
  or update a Scout skill. Leave tenant tools and messaging actions disabled.
- **Microsoft 365 Copilot:** In Agent Builder, create an agent named
  **Microsoft IQ Navigator** and paste the Markdown body into
  **Configure > Instructions**. Try the sample brief before sharing. Do not
  add tenant grounding or write actions. Review the
  [Agent Builder grounding options](https://learn.microsoft.com/en-us/plugins/agent-builder-add-knowledge)
  and verify the host's effective permissions before sharing.

Use the [manual acceptance scenarios](evaluations/README.md) to check routing
and boundaries before sharing in a new host.
