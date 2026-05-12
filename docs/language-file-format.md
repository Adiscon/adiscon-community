# Language File Format

## Purpose

Language files can be used to customize visible UI text in supported Adiscon products. They may help adapt wording, terminology, or translations for specific environments or audiences.

## Basic structure

The exact structure of a language file may differ by product and version. In general, a language file maps internal UI text identifiers to user-visible text values. Some products may use different file names, sections, encoding rules, or formatting conventions.

Because formats may evolve over time, contributions should remain generic unless a specific product and version is clearly identified.

Current exported CSV files use this structure:

```text
Unit,Unit Name,ID,Text,Comment
```

`Unit`, `Unit Name`, and `ID` identify the source UI element and must not be changed during translation review. `Text` is the user-visible value. `Comment` may contain policy hints for reviewers and translation tools.

## Review policy hints

The `Comment` column can contain these machine-readable hints:

- `PROTECTED_TERM`: preserve the product name spelling and capitalization.
- `PLACEHOLDER_REQUIRED`: preserve placeholders such as `%1`, `%2`, and `%msg%` exactly.

Protected product names must remain in English in every language:

- EventReporter
- MonitorWare Agent
- RSyslog Windows Agent
- WinSyslog

For titles and labels such as "EventReporter Configuration Client" or "About EventReporter", translators may localize "Configuration Client", "About", or the surrounding grammar, but the product name must stay unchanged.

## Customization use cases

Typical use cases may include:

- adjusting terminology to match internal standards
- improving clarity for operators and administrators
- providing localized text for different languages
- refining labels or messages for customized deployments

## Limitations

- Language file formats may vary between products.
- File formats may also change between software versions.
- Not every UI element may be customizable through language files.
- Community contributions should not assume undocumented product internals.

## Contribution suggestions

When proposing language file changes or examples, it is helpful to include:

- the target product
- the product version, if known
- the affected file or area of the UI
- the current text and the proposed replacement
- a short explanation of the intended outcome
