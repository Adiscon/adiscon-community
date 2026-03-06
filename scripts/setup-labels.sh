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

# Fetch existing label names once. We keep this list updated as we create labels.
existing_labels="$(gh label list --repo "${REPO}" --limit 1000 --json name --jq '.[].name' || true)"

created=0
updated=0

apply_label() {
  name="$1"
  color="$2"
  description="$3"

  if printf '%s\n' "${existing_labels}" | grep -Fx -- "${name}" >/dev/null 2>&1; then
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

apply_label "type:feature-request" "1f77b4" "New feature proposal"
apply_label "type:translation" "1f77b4" "Translation improvement"
apply_label "type:discussion" "1f77b4" "Open discussion or idea"
apply_label "type:ux-improvement" "1f77b4" "User interface or user experience improvement"

apply_label "product:winsyslog" "6f42c1" "Related to WinSyslog"
apply_label "product:eventreporter" "6f42c1" "Related to EventReporter"
apply_label "product:rsyslog-windows-agent" "6f42c1" "Related to rsyslog Windows Agent"
apply_label "product:monitorware-agent" "6f42c1" "Related to MonitorWare Agent"
apply_label "product:general" "6f42c1" "General or cross-product topic"

apply_label "status:needs-triage" "fbca04" "Needs maintainer review"
apply_label "status:under-review" "fbca04" "Currently being reviewed"
apply_label "status:planned" "0e8a16" "Accepted and planned"
apply_label "status:accepted" "bfdadc" "Accepted in principle but not yet planned"
apply_label "status:declined" "d73a4a" "Decision made not to implement"
apply_label "status:implemented" "0e8a16" "Implemented or shipped"

apply_label "roadmap:short-term" "0e8a16" "Candidate for near-term roadmap"
apply_label "roadmap:long-term" "5319e7" "Long-term roadmap candidate"
apply_label "roadmap:investigating" "c2e0c6" "Under investigation for roadmap consideration"

apply_label "community:good-idea" "c5def5" "Valuable idea worth noting"

apply_label "lang:de" "d4d4d4" "German language related"
apply_label "lang:en" "d4d4d4" "English language related"
apply_label "lang:fr" "d4d4d4" "French language related"
apply_label "lang:jp" "d4d4d4" "Japanese language related"

echo "done: created=${created} updated=${updated}"

