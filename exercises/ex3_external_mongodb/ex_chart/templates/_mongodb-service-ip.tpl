{{ define "mongodb-service-ip" }}
---
kind: "Service"
apiVersion: "v1"
metadata:
  name: mongodb-service
spec:
  ports:
    - name: mongodb
      protocol: "TCP"
      port: 27017
      targetPort: 27017
      nodePort: 0

---
kind: "Endpoints"
apiVersion: "v1"
metadata:
  name: mongodb-service
subsets:
  - addresses:
      - ip: "{{ .Values.services.mongodb.address }}"
    ports:
      - port: 27017
        name: mongodb
{{ end }}
