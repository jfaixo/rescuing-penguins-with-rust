{{/*
Namespace
*/}}
{{- define "green-bench.namespace" -}}
{{- printf "%s-%s" .Chart.Name .Release.Name  | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "green-bench.name" -}}
{{- printf "%s-%s" .Chart.Name .Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "green-bench.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "green-bench.labels" -}}
helm.sh/chart: {{ include "green-bench.chart" . }}
{{ include "green-bench.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "green-bench.selectorLabels" -}}
app.kubernetes.io/name: {{ include "green-bench.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
