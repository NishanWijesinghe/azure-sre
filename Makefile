#REFERENCES:
# Note about legacy CLIs: https://azure.microsoft.com/en-us/blog/announcing-azure-cli-2-preview/
# Docker & Azure CLI: https://docs.microsoft.com/en-us/cli/azure/run-azure-cli-docker?view=azure-cli-latest

PROJECT_NAME=azure-cli

run_cli: pull stop_rm
	@echo "Docker run with -i: Keep STDIN open even if not attached | -t: Allocate a pseudo-tty."
	@echo "run: az login"
	docker run -it --name=${PROJECT_NAME} -v `pwd`/src:/src mcr.microsoft.com/azure-cli


pull:
	docker pull mcr.microsoft.com/azure-cli

stop_rm:
	docker stop ${PROJECT_NAME} || true && docker rm ${PROJECT_NAME} || true