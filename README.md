# Microsoft IQ Navigator

A read-only advisory agent that helps you choose among Work IQ, Foundry IQ,
Fabric IQ, and Web IQ. It recommends where to start and what to verify; it
does not check tenant data, provision services, or send messages.

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

In VS Code, the reusable `/choose-iq` and `/plan-weekly-review` prompts provide
two starting points. Use them with the Navigator selected. The GitHub Copilot
profile exposes no tools, so it links to official docs without claiming it
checked them live.

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
