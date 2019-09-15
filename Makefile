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
