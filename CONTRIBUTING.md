# Contributing to HaveIt

First off, thanks for taking the time to contribute! 🎉

This project is a community-driven open-source platform. Every contribution — whether code, docs, design, or feedback — is equally valued.

---

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Agentic Development Using OpenCode](#agentic-development-using-opencode)
- [Commit Message Conventions](#commit-message-conventions)
- [Branch Naming](#branch-naming)
- [Pull Request Workflow](#pull-request-workflow)
- [Need Help?](#need-help)

---

## Code of Conduct

This project is for the people, by the people. Be respectful, inclusive, and constructive. Harassment, trolling, and personal attacks will not be tolerated.

---

## Getting Started

### Prerequisites

- **Docker** (with Docker Compose) — all development runs inside containers.

### Setup

1. **Fork and clone** the repository.
2. **Create an `.env` file** from the template:
   ```bash
   cp .env.example .env
   ```
3. **Build and start the development container:**
   ```bash
   docker compose up --build -d
   ```
   This starts a Node.js container with PostgreSQL, installs dependencies via pnpm, and keeps running in the background.

4. **Enter the container:**
   ```bash
   docker compose exec app sh
   ```

5. **Verify the setup:**
   ```bash
   pnpm start:dev
   ```
   The server starts at `http://localhost:${APP_PORT}` (default `3000`).

### Useful Commands

| Command | Description |
|---|---|
| `pnpm build` | Build the project |
| `pnpm start:dev` | Start with watch mode |
| `pnpm test` | Run unit tests |
| `pnpm test:e2e` | Run end-to-end tests |
| `pnpm lint` | Lint and fix source files |
| `pnpm format` | Format with Prettier |

---

## Agentic Development Using OpenCode

This project supports agentic development using **opencode**. The AI agent can explore the codebase, propose changes, and implement them with your approval.

**Setup:**
1. Install opencode from [opencode's official website](https://opencode.ai/).
2. Open this project in opencode (or any editor that supports opencode).
3. The agent already has all the context it needs from the project's `.opencode/` configuration.

**Usage:**
Simply describe the task you want done in natural language. For example:
- *"Add a volume for PostgreSQL data in docker-compose.yml"*
- *"Remove external PostgreSQL connection code from startup.sh"*
- *"Fix the terminal profile in devcontainer.json"*

The agent will explore the relevant files, propose a plan, wait for your approval, and then implement the changes.

---

## Commit Message Conventions

This project follows **Conventional Commits**. This leads to clearer history and enables automated tooling.

### Format

```
<type>: <short summary>

<optional body>

<optional footer>
```

The commit template is configured at `.gitmessage` and shows automatically when you run `git commit`. 

### Types

| Type | Usage |
|---|---|
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation only changes |
| `style` | Formatting, missing semicolons, etc. (no code change) |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `perf` | Performance improvement |
| `test` | Adding or fixing tests |
| `build` | Changes to the build system or dependencies |
| `ci` | Changes to CI configuration |
| `chore` | Other changes (tooling, config, etc.) |
| `revert` | Reverts a previous commit |

### Guidelines

- **Subject**: imperative mood, no period, ≤ 50 characters.
- **Body** (if needed): wrap at 72 characters, explain **what** and **why**, not **how**.
- **Footer** (if needed): use `BREAKING CHANGE:` for breaking changes, `Closes #N` to link issues.

### Examples

```
feat: add user authentication

Implements JWT-based login with refresh token rotation.
Closes #42
```

```
fix: resolve NPE when order payload is missing items
```

```
refactor: extract payment validation into dedicated service
```

```
docs: update API endpoint references in README
```

### Why?

- Generates changelogs automatically.
- Simplifies semantic versioning.
- Makes git history scannable at a glance.

---

## Branch Naming

Use short, descriptive names prefixed with the relevant category:

| Prefix | Example |
|---|---|
| `feat/` | `feat/user-authentication` |
| `fix/` | `fix/order-total-calculation` |
| `docs/` | `docs/api-endpoints` |
| `refactor/` | `refactor/extract-validation` |
| `chore/` | `chore/update-dependencies` |

Use hyphens to separate words. Avoid including issue numbers in branch names — link the PR to the issue instead.

---

## Need Help?

- Open a **Discussion** on GitHub for questions or ideas.
- Tag your issue with **`good first issue`** if you're looking for a place to start.
- For bugs, open an **Issue** with reproduction steps.
