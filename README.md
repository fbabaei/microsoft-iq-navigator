# Microsoft IQ Navigator

A read-only architecture advisor that helps you decide where Work IQ, Foundry
IQ, Fabric IQ, or Web IQ fits an app or project, and where no IQ is needed.
It does not check tenant data, provision services, or send messages.

| If you need to ... | Start with ... |
| --- | --- |
| Understand a decision or who owns an action | Work IQ |
| Find the authoritative policy or runbook | Foundry IQ |
| Confirm the source for an official KPI | Fabric IQ |
| Research a recent public change | Web IQ |

## Get started

1. Open **this repository** in VS Code with GitHub Copilot, or in a local
   GitHub Copilot app session that exposes repository custom agents.
2. Select **Microsoft IQ Navigator** in the agent picker and describe your goal.
   For example: "I need to explain late shipments using an official delivery KPI
   and what the team agreed to. Where should I start?"
3. Use the recommendation to choose one source, verify access and freshness
   with its owner, and expand only if a claim needs another source.

Use `/choose-iq` for a single need or `/plan-weekly-review` for a recurring
review. In VS Code, select the Navigator before running any of these prompts.

### Assess an app or project

Run `/assess-project` in VS Code, or ask the Navigator to assess your project
in Chat. Paste a brief or attach the relevant architecture notes and excerpts
if your client supplies their content. Include who will use the app, what
decisions it must support, which sources are governed, and any access or
freshness requirements. A repository path or URL alone is not enough: the
GitHub Copilot profile has no tools and does not open files or check docs live.

For example: "Our operations app needs the approved delivery KPI, team
follow-up owners, and a fixed alert when a package is late. The KPI is in our
approved semantic model; team decisions are recorded in Teams. Only the KPI
is needed for the pilot."

The Navigator maps each requirement to its source of truth. In this example,
it would recommend Fabric IQ for the governed KPI, defer Work IQ for team
follow-ups, and recommend a deterministic rule rather than IQ for the fixed
alert. It separates architectural fit from tenant checks and proposes a small
pilot with an observable success check.

## Scout and Microsoft 365 Copilot

Use the Markdown body (everything after the closing `---`) of the
[agent definition](.github/agents/microsoft-iq-navigator.agent.md) as the
portable instructions. Edit the definition rather than keeping a separate
copy of the routing rules in this repository.

- **Scout:** The existing `/microsoft-iq-navigator` skill in the OneDrive
  example still reads that example's `navigator.txt`. To use this repository
  instead, update the skill to read the new definition and use its body, or
  copy the body into Scout's configured instruction file. No Scout skill
  configuration is changed by opening this repository. Leave tenant tools
  and messaging actions disabled for this guide.
- **Microsoft 365 Copilot:** In Agent Builder, paste the body into
  **Configure > Instructions**. Keep the guide advisory: do not add tenant
  grounding or write actions. Review the
  [Agent Builder grounding options](https://learn.microsoft.com/en-us/plugins/agent-builder-add-knowledge)
  and verify the host's effective permissions before sharing.

Use the [manual acceptance scenarios](evaluations/README.md) to check routing
and boundaries before sharing in a new host.
