run_jupyter:
	# Start Jupyter notebook
	docker-compose -f docker-compose.yml run --service-ports covid19-da jupyter notebook --no-browser --ip='0.0.0.0' --allow-root