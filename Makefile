DEBUG ?=

SHELL = /bin/bash -o pipefail

DIR = $(shell pwd)

CONFIG_HOME = $(or ${XDG_CONFIG_HOME},${XDG_CONFIG_HOME},${HOME}/.config)

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
INFO_COLOR=\033[36m
WHITE_COLOR=\033[1m

MAKE_COLOR=\033[33;01m%-20s\033[0m

.DEFAULT_GOAL := help

OK=[✅]
KO=[❌]
WARN=[🟡]


.PHONY: help
help:
	@echo -e "$(OK_COLOR)                  $(BANNER)$(NO_COLOR)"
	@echo "------------------------------------------------------------------"
	@echo ""
	@echo -e "${ERROR_COLOR}Usage${NO_COLOR}: make ${INFO_COLOR}<target>${NO_COLOR}"
	@awk 'BEGIN {FS = ":.*##"; } /^[a-zA-Z_-]+:.*?##/ { printf "  ${INFO_COLOR}%-25s${NO_COLOR} %s\n", $$1, $$2 } /^##@/ { printf "\n${WHITE_COLOR}%s${NO_COLOR}\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo ""

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo -e "$(ERROR_COLOR)Environment variable $* not set$(NO_COLOR)"; \
		exit 1; \
	fi

check-%:
	@if $$(hash $* 2> /dev/null); then \
		echo -e "$(OK_COLOR)$(OK)$(NO_COLOR) $*"; \
	else \
		echo -e "$(ERROR_COLOR)$(KO)$(NO_COLOR) $*"; \
	fi

print-%:
	@if [ "${$*}" == "" ]; then \
		echo -e "$(ERROR_COLOR)[KO]$(NO_COLOR) $* = ${$*}"; \
	else \
		echo -e "$(OK_COLOR)[OK]$(NO_COLOR) $* = ${$*}"; \
	fi


# ====================================
# D E V
# ====================================

.PHONY: check ## Check requirements
check: check-terraform check-tfswitch


# ====================================
# T E R R A F O R M
# ====================================

##@ Terraform

.PHONY: terraform-show
terraform-show: guard-SERVICE ## Show infrastructure (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(BANNER)] Show infrastructure$(NO_COLOR)"
	@cd $(SERVICE) \
		&& ( command -v tfswitch >/dev/null 2>&1 && tfswitch || true ) \
		&& terraform init -reconfigure \
		&& terraform show

.PHONY: terraform-plan
terraform-plan: guard-SERVICE ## Plan infrastructure (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(BANNER)] Plan infrastructure$(NO_COLOR)"
	cd $(SERVICE) \
		&& ( command -v tfswitch >/dev/null 2>&1 && tfswitch || true ) \
		&& terraform init -reconfigure \
		&& terraform plan -lock-timeout=60s -var-file=terraform.tfvars

.PHONY: terraform-apply
terraform-apply: guard-SERVICE ## Builds or changes infrastructure (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(BANNER)] Apply infrastructure$(NO_COLOR)"
	@cd $(SERVICE) \
		&& ( command -v tfswitch >/dev/null 2>&1 && tfswitch || true ) \
		&& terraform init -reconfigure \
		&& terraform apply -lock-timeout=60s -var-file=terraform.tfvars

.PHONY: terraform-destroy
terraform-destroy: guard-SERVICE ## Destroy infrastructure (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(BANNER)] Destroy infrastructure$(NO_COLOR)"
	@cd $(SERVICE) \
		&& ( command -v tfswitch >/dev/null 2>&1 && tfswitch || true ) \
		&& terraform init -reconfigure \
		&& terraform destroy -lock-timeout=60s -var-file=terraform.tfvars

.PHONY: terraform-providers-lock
terraform-providers-lock: guard-SERVICE ## Providers lock (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(BANNER)] Providers lock$(NO_COLOR)"
	@cd $(SERVICE) \
		&& ( command -v tfswitch >/dev/null 2>&1 && tfswitch || true ) \
		&& terraform init -reconfigure  \
		&& terraform providers lock -platform=darwin_amd64 -platform=linux_amd64 -platform=darwin_arm64
