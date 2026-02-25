.PHONY: app-up app-down ingress-up ingress-down

app-up:
	kubectl apply -f apps/echo.yaml
	kubectl apply -f apps/echo-ingress.yaml

app-down:
	kubectl delete -f apps/echo-ingress.yaml --ignore-not-found
	kubectl delete -f apps/echo.yaml --ignore-not-found

ingress-up:
	kubectl create namespace ingress-nginx --dry-run=client -o yaml | kubectl apply -f -
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm repo update
	helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --set controller.service.type=LoadBalancer

ingress-down:
	helm uninstall ingress-nginx -n ingress-nginx || true
	kubectl delete namespace ingress-nginx --ignore-not-found
