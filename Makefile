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
