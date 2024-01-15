{{range .}}

##  {{.name}}

{{.lint_file}}
{{.data_file}}

{{if .description}}{{.description}}{{end -}}
{{if .message}}{{.message}}{{end -}}
{{if .location}}
```json
{{.location}}
```
{{end -}}
{{if .level}}{{.level}}{{end -}}
{{if .custom}}
```json
{{.custom}}
```
{{end -}}
{{end}}
