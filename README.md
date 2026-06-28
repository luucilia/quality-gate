# Quality Gate

Automated repository inventory and technology compliance tool built with **GitHub Actions**.

It scans repositories from a GitHub user or organization, detects Java and .NET projects, validates their runtime versions against configurable baselines, and generates a consolidated CSV inventory report.

## Prerequisites

* GitHub account
* GitHub Actions enabled
* GitHub Personal Access Token (PAT)

### Required Secret

| Secret   | Description                                                                           |
| -------- | ------------------------------------------------------------------------------------- |
| `GH_PAT` | Personal Access Token used to access repository metadata through the GitHub REST API. |

## Features

* Scan all repositories.
* Detect Java and .NET projects.
* Identify Java and .NET Target Framework versions.
* Validate versions against configurable baselines.
* Classify repositories as `OK`, `BELOW_TARGET`, `BELOW_MINIMUM`, or `UNKNOWN`.
* Generate a consolidated CSV inventory report.
* Store historical results.
* Run entirely on GitHub Actions.

## How it Works

1. Retrieve repositories using the GitHub REST API.
2. Detect each repository's default branch.
3. Scan the repository contents.
4. Identify the project type and runtime version.
5. Compare the detected version against the configured baseline.
6. Generate a CSV report.
7. Upload it as a workflow artifact.
8. Commit the report for historical tracking.

## Configuration

Technology baselines are defined in:

```text
baselines/baseline.json
```

Example:

```json
{
  "java": {
    "min": "17",
    "target": "21"
  },
  "dotnet": {
    "min": "8",
    "target": "9"
  }
}
```

Updating this file changes the validation rules without modifying the workflow.

## Generated Report

Each execution generates a CSV containing:

* `org`
* `repo`
* `language`
* `current_version`
* `baseline_min`
* `baseline_target`
* `status`
* `execution_date`

## Repository Structure

```text
.
├── .github/workflows/
├── baselines/baseline.json
├── results/
└── README.md
```

## Implementations

This repository contains three implementations of the same solution:

* Pure GitHub Actions
* GitHub Actions + Bash
* GitHub REST API (current implementation)

## Author

**Lucilia Oliveira**

Architecture • Modernization • DevSecOps • Cloud
