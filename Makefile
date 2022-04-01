.PHONY: install uninstall

install:
	git submodule update --init
	@echo # Line break
	helm dependency update
	@echo # Line break
	helm install \
	    --create-namespace \
	    --namespace local-path-storage \
	    local-path-provisioner .
	@echo # Line break
	@echo "local-path-provisioner deployed! OpenShift will be" \
	      "temporarily unavailable for up to 5 minutes while new" \
	      "MachineConfig is processed."

uninstall:
	helm uninstall \
	     --namespace local-path-storage \
	     local-path-provisioner
