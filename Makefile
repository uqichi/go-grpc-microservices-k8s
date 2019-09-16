apply_common:
	kubectl apply -f common
apply_activity: apply_common
	kubectl apply -f activity
apply_front: apply_common
	kubectl apply -f front
apply_project: apply_common
	kubectl apply -f project
apply_task: apply_common
	kubectl apply -f task
apply_user: apply_common
	kubectl apply -f user
apply_all: apply_common
	kubectl apply -f activity
	kubectl apply -f front
	kubectl apply -f project
	kubectl apply -f task
	kubectl apply -f user

replace_activity:
	kubectl replace --force -f activity/deployment.yaml
replace_front:
	kubectl replace --force -f front/deployment.yaml
replace_project:
	kubectl replace --force -f project/deployment.yaml
replace_task:
	kubectl replace --force -f task/deployment.yaml
replace_user:
	kubectl replace --force -f user/deployment.yaml
replace_all: replace_activity replace_project replace_user replace_task replace_front

helm_init:
	kubectl create -f helm-tiller/rbac-config.yaml
	helm init --service-account tiller --history-max 200
install_istio:
	cd $HOME
	curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.3.0 sh -
	cd istio-1.3.0
	export PATH=$PWD/bin:$PATH
	helm repo add istio.io https://storage.googleapis.com/istio-release/releases/1.3.0/charts/
	helm install install/kubernetes/helm/istio-init --name istio-init --namespace istio-system
	kubectl get crds | grep 'istio.io' | wc -l
	helm install install/kubernetes/helm/istio --name istio --namespace istio-system
