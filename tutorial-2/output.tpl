{{range .}}

##  {{.name}}

{{.lint_file}}
{{.data_file}}

{{if .description}}{{.description}}{{end -}}
{{if .message}}{{.message}}{{end -}}
{{if .location}}{{.location}}{{end -}}
{{if .level}}{{.level}}{{end -}}
{{if .custom}}{{.custom}}{{end -}}
{{end}}
