.PHONY: install uninstall

install:
	git submodule update --init
	helm dependency update
	helm install \
	    --create-namespace \
	    --namespace local-path-storage \
	    local-path-provisioner .
	@echo "local-path-provisioner deployed! OpenShift will be" \
	      "temporarily unavailable for up to 5 minutes while new" \
	      "MachineConfig is processed."

uninstall:
	helm uninstall \
	     --namespace local-path-storage \
	     local-path-provisioner
