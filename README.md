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

The Navigator is a set of agent instructions, not a hosted service. Choose one
of the following ways to run it.

### VS Code or GitHub Copilot app

1. If you don't have a local checkout, clone the repo:

   ```sh
   git clone https://github.com/fbabaei/microsoft-iq-navigator.git
   ```

2. Open the **`microsoft-iq-navigator` folder** in VS Code with GitHub Copilot
   enabled, or in a local GitHub Copilot app session that supports repository
   custom agents. Opening a different repository will not load this repo's
   workspace agent.
3. In Copilot Chat, choose **Microsoft IQ Navigator** from the **Agent**
   dropdown. In VS Code, run `/assess-project` for a project, `/choose-iq`
   for a single need, or `/plan-weekly-review` for a recurring review.

If the agent is missing in VS Code, select the **Copilot** session target,
then run **Chat: Open Customizations** from the Command Palette and check the
**Agents** tab. Verify that `.github/agents/microsoft-iq-navigator.agent.md`
is in the folder you opened.

### GitHub Copilot CLI

With [Copilot CLI installed and signed in](https://docs.github.com/copilot/how-tos/copilot-cli),
open a terminal in the cloned `microsoft-iq-navigator` folder, run `copilot`,
then enter `/agent` and select **Microsoft IQ Navigator**. Type
`Assess this project:` followed by your brief. See
[GitHub's custom agent guide](https://docs.github.com/copilot/how-tos/copilot-cli/use-copilot-cli/invoke-custom-agents)
for details.

### First-time walkthrough in the Copilot app

Opening the repository folder does not activate the agent. In a Copilot app
that supports repository custom agents and session creation:

1. **Understand its role.** The Navigator helps you choose Work IQ, Foundry
   IQ, Fabric IQ, Web IQ, or no IQ for an app or business need. It provides
   architecture advice, not tenant operations.
2. **Open an agent session.** Open this repository in the Copilot app. In a
   regular Copilot chat for the repository, ask: "Create a session using the
   Microsoft IQ Navigator custom agent and open it." Continue in the new
   session with **Microsoft IQ Navigator** selected.
3. **Describe your goal.** Explain who needs help, what decision they need
   to make, and where the relevant information lives. For example: "Our
   operations managers need approved delivery KPIs and the follow-up actions
   agreed in Teams. Which IQ capabilities fit?"
4. **Review the recommendation.** Check which source should govern each
   requirement, why an IQ capability fits, and which access or freshness
   assumptions need verification.
5. **Narrow the starting point.** Ask: "What is the smallest useful pilot,
   and how would we measure success?"
6. **Verify before implementing.** Confirm source ownership, permissions,
   freshness, and availability with your organization. The Navigator does
   not inspect tenant data, deploy services, or send messages.

### Assess an app or project

Run `/assess-project` in VS Code or start with `Assess this project:` in Chat
on any host. Paste a sanitized brief or attach relevant notes and excerpts
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
