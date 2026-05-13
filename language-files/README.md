# Language Files

This directory contains CSV-based UI language files for Adiscon Windows products. Community members can use them to review translations, propose wording improvements, or contribute new language variants by submitting a Pull Request.

## Directory structure

Each sub-directory corresponds to one product:

| Directory | Product |
|-----------|---------|
| `clientcore/` | Shared client UI components |
| `eventreporter/` | EventReporter |
| `monitorware/` | MonitorWare Agent |
| `rsyslog-agent/` | RSyslog Windows Agent |
| `winsyslog/` | WinSyslog |

Inside each directory you will find one CSV file per locale, named with a BCP 47 locale tag, for example `en-US.csv`, `de-DE.csv`, `fr-FR.csv`.

## CSV file format

Every CSV file uses the following five columns:

```
Unit,Unit Name,ID,Text,Comment
```

| Column | Description |
|--------|-------------|
| `Unit` | Internal path that identifies the source form or module (e.g. `CFGEvntSLog/frmAbout`). **Do not change.** |
| `Unit Name` | Human-readable name of the form or module (e.g. `About Form`). **Do not change.** |
| `ID` | Internal identifier of the specific UI element within the form (e.g. `lblTitle.Text`). **Do not change.** |
| `Text` | The user-visible string that appears in the UI. **This is the only column you should edit.** |
| `Comment` | Optional policy hints for reviewers and translation tools (see below). **Do not change.** |

### Example rows

```
Unit,Unit Name,ID,Text,Comment
CFGEvntSLog/frmAbout,About Form,lblTitle.Text,About EventReporter,PROTECTED_TERM: preserve product name exactly; translate surrounding UI words when appropriate
CFGEvntSLog/frmMain,Main Form,$this.Text,EventReporter Configuration Client,PROTECTED_TERM: preserve product name exactly; translate surrounding UI words when appropriate
```

In a German (`de-DE.csv`) file the same rows look like:

```
CFGEvntSLog/frmAbout,About Form,lblTitle.Text,Über EventReporter,PROTECTED_TERM: ...
CFGEvntSLog/frmMain,Main Form,$this.Text,EventReporter Konfigurationsclient,PROTECTED_TERM: ...
```

## Review-policy hints in the Comment column

The `Comment` column may contain one or more of the following machine-readable hints:

| Hint | Meaning |
|------|---------|
| `PROTECTED_TERM` | A product name appears in the `Text` value and must remain in English. Translate only the surrounding words. |
| `PLACEHOLDER_REQUIRED` | The `Text` value contains a placeholder such as `%1`, `%2`, or `%msg%`. The placeholder must appear unchanged in any translation. |

### Protected product names

The following product names must remain in English in every language file:

- EventReporter
- MonitorWare Agent
- RSyslog Windows Agent
- WinSyslog

For example, "About EventReporter" may become "Über EventReporter" in German, but never "Über EreignisMelder".

## Rules for contributors

1. **Only edit the `Text` column.** Never change `Unit`, `Unit Name`, `ID`, or `Comment`.
2. **Keep the file structure intact.** Do not add, remove, or reorder rows.
3. **Preserve placeholders exactly.** If a `Text` value contains `%1`, `%2`, or `%msg%`, carry them through unchanged.
4. **Keep the same encoding.** Files use UTF-8. Do not change the encoding or line endings.
5. **One locale per file.** Each file covers exactly one locale. Do not mix languages within a file.

## How to submit changes as a Pull Request

1. **Fork the repository.**  
   Click **Fork** in the top-right corner of the GitHub page to create your own copy of the repository.

2. **Edit the CSV file(s).**  
   Navigate to the correct product directory and locale file (e.g. `language-files/eventreporter/de-DE.csv`).  
   You can edit directly in the GitHub web editor (click the pencil icon) or clone your fork locally and use any text or spreadsheet editor that can handle UTF-8 CSV files.

3. **Commit your changes.**  
   Write a short, descriptive commit message, for example:  
   `language-files/eventreporter: improve German translation for About form`

4. **Open a Pull Request.**  
   Go to your fork on GitHub and click **Compare & pull request**. In the PR description, please include:
   - The target product and locale (e.g. EventReporter, `de-DE`)
   - A brief summary of what you changed and why
   - If applicable, the current text and your proposed replacement

5. **Respond to review feedback.**  
   A maintainer will review your PR and may ask questions or request adjustments. Once approved, the changes will be merged.

## More information

For a detailed explanation of the file format and contribution guidelines, see [docs/language-file-format.md](../docs/language-file-format.md).
