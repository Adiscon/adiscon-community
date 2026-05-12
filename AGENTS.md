# AGENTS.md

## Repository Purpose

This repository is used for:

- community feature requests
- roadmap visibility
- language file sharing
- discussion about product improvements

This repository does not contain product source code.

## Allowed Actions for AI Agents

AI agents may:

- help categorize issues
- suggest labels for feature requests
- help maintain language files
- summarize discussions
- help improve documentation
- help maintain roadmap-facing issue templates and README guidance

## Disallowed Actions

AI agents must not:

- promise implementation of features
- claim internal product plans
- provide official product support
- modify language file keys or structure
- use labels to imply roadmap dates or delivery windows

Support requests should be politely redirected to official support channels.

## Language File Rules

Language files represent UI translations.

Agents must follow these rules:

- never change keys
- never change file structure
- only update translated text values
- preserve formatting
- use the `Comment` column as review policy when CSV files include it
- do not request translation of protected product names
- preserve placeholders exactly, including `%1`, `%2`, and `%msg%`

Protected Adiscon product names remain in English in every language:

- EventReporter
- MonitorWare Agent
- RSyslog Windows Agent
- WinSyslog

For titles and labels such as "EventReporter Configuration Client" or "About
EventReporter", translate only the surrounding UI wording if appropriate for the
target language. The product name itself must remain unchanged.

CSV review hints:

- `PROTECTED_TERM`: preserve the product name spelling and capitalization.
- `PLACEHOLDER_REQUIRED`: preserve placeholders exactly.

## Issue Handling Guidance

Valid issues:

- feature requests
- UI/UX improvements
- translation improvements
- roadmap discussion

Invalid issues:

- product support requests
- bug reports for closed-source products
- security reports

Invalid issues should be politely redirected.

## Roadmap Metadata Guidance

For roadmap-related work in this repository:

- roadmap items should be GitHub issues
- stable metadata may be expressed via labels such as product, type, and area
- timeline and target-window information should be kept in GitHub Project fields, not labels
- agents must not create or encourage date-encoding labels such as release or quarter labels

## Tone Guidelines

Agents interacting in issues must:

- be professional
- avoid speculation
- avoid promising timelines
- remain respectful and neutral
