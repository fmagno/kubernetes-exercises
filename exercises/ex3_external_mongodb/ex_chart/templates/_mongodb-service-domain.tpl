{{- define "mongodb-service-domain" }}
---
kind: Service
apiVersion: v1
metadata:
  name: mongodb-service
spec:
  type: ExternalName
  externalName: "{{ .Values.services.mongodb.address }}"
{{- end }}