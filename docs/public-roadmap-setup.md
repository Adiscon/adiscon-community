# Public Roadmap Setup

This repository uses an issue-first public roadmap model inspired by GitHub's own public-roadmap pattern.

## Core model

- Roadmap items are GitHub issues
- A GitHub Project provides the public roadmap views
- Labels hold stable metadata only
- Timeline and planning state belong in project fields, not labels

This roadmap communicates intent and prioritization. It is not a hard delivery promise.

## Recommended project fields

### Status

Suggested single-select values:

- Exploring
- Planned
- In Progress
- Shipped
- Deferred

### Target window

Suggested single-select values:

- Now
- Next
- Later

Alternative:

- use quarter buckets such as `2026 Q2`, `2026 Q3`, `2026 Q4`, `Later`

### Product

Suggested single-select values:

- WinSyslog
- EventReporter
- MonitorWare Agent
- rsyslog Windows Agent

### Theme / Area

Suggested single-select values:

- Usability
- Performance
- Reliability
- Security
- Integrations
- Deployment
- Documentation

### Priority or Audience

Optional single-select values:

- High
- Medium
- Low

Or:

- Partners
- End users
- Enterprise
- Internal

## Recommended labels

Use labels only for stable metadata such as:

- `type:roadmap`
- `type:feature-request`
- `type:feedback`
- `type:ui-wording`
- `type:translation`

- `product:winsyslog`
- `product:eventreporter`
- `product:monitorware-agent`
- `product:rsyslog-windows-agent`

- `area:security`
- `area:ux`
- `area:performance`
- `area:integration`
- `area:deployment`
- `area:docs`

- `partner-input`
- `customer-requested`
- `status:needs-triage`

Important:

- do not encode roadmap dates or quarters in labels

## Recommended project views

At minimum, create:

1. Public roadmap
   - grouped or arranged by `Target window`

2. Maintainer planning
   - table view with all fields visible

3. Product-specific views
   - one filtered view per product

4. Shipped
   - shipped or closed roadmap items for reference

## Operational rule

- Adding or changing labels should not be used as a substitute for updating project timeline metadata
- Maintainers should edit project fields directly when roadmap timing changes
