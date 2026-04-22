#!/usr/bin/env sh
set -eu

REPO="${REPO:-adiscon/adiscon-community}"

if ! command -v gh >/dev/null 2>&1; then
  echo "error: gh (GitHub CLI) is not installed or not on PATH" >&2
  exit 1
fi

if ! gh auth status -h github.com >/dev/null 2>&1; then
  echo "error: gh is not authenticated (run: gh auth login)" >&2
  exit 1
fi

echo "repo: ${REPO}"

existing_labels="$(gh label list --repo "${REPO}" --limit 1000 --json name --jq '.[].name' || true)"

created=0
updated=0
deleted=0

has_label() {
  printf '%s\n' "${existing_labels}" | grep -Fx -- "$1" >/dev/null 2>&1
}

apply_label() {
  name="$1"
  color="$2"
  description="$3"

  if has_label "${name}"; then
    echo "update: ${name}"
    gh label edit "${name}" --repo "${REPO}" --color "${color}" --description "${description}" >/dev/null
    updated=$((updated + 1))
  else
    echo "create: ${name}"
    gh label create "${name}" --repo "${REPO}" --color "${color}" --description "${description}" >/dev/null
    existing_labels="${existing_labels}
${name}"
    created=$((created + 1))
  fi
}

delete_label() {
  name="$1"

  if has_label "${name}"; then
    echo "delete: ${name}"
    gh label delete "${name}" --repo "${REPO}" --yes >/dev/null
    existing_labels="$(printf '%s\n' "${existing_labels}" | grep -Fxv -- "${name}" || true)"
    deleted=$((deleted + 1))
  fi
}

# Stable roadmap and feedback metadata. Dates and target windows must not be encoded as labels.
apply_label "type:roadmap" "0e8a16" "Public roadmap item"
apply_label "type:feature-request" "1f77b4" "Feature proposal or improvement request"
apply_label "type:feedback" "0052cc" "Roadmap or product feedback"
apply_label "type:ui-wording" "5319e7" "UI wording or wording-quality suggestion"
apply_label "type:translation" "6f42c1" "Translation-related suggestion"

apply_label "product:winsyslog" "6f42c1" "Related to WinSyslog"
apply_label "product:eventreporter" "6f42c1" "Related to EventReporter"
apply_label "product:monitorware-agent" "6f42c1" "Related to MonitorWare Agent"
apply_label "product:rsyslog-windows-agent" "6f42c1" "Related to rsyslog Windows Agent"

apply_label "area:security" "b60205" "Security-related area"
apply_label "area:ux" "a371f7" "User experience or usability area"
apply_label "area:performance" "fbca04" "Performance-related area"
apply_label "area:integration" "0e8a16" "Integration-related area"
apply_label "area:deployment" "1d76db" "Deployment or setup-related area"
apply_label "area:docs" "0075ca" "Documentation-related area"

apply_label "partner-input" "d4c5f9" "Input from a partner or reseller context"
apply_label "customer-requested" "f9d0c4" "Requested by a customer or prospect"

apply_label "status:needs-triage" "fbca04" "Needs maintainer review"

apply_label "lang:de" "d4d4d4" "German language related"
apply_label "lang:en" "d4d4d4" "English language related"
apply_label "lang:fr" "d4d4d4" "French language related"
apply_label "lang:jp" "d4d4d4" "Japanese language related"

# Clean up labels that encode roadmap timing or duplicate the new lighter model.
delete_label "type:discussion"
delete_label "type:ux-improvement"
delete_label "product:general"
delete_label "status:under-review"
delete_label "status:planned"
delete_label "status:accepted"
delete_label "status:declined"
delete_label "status:implemented"
delete_label "roadmap:short-term"
delete_label "roadmap:long-term"
delete_label "roadmap:investigating"
delete_label "community:good-idea"
delete_label "next major"

echo "done: created=${created} updated=${updated} deleted=${deleted}"
