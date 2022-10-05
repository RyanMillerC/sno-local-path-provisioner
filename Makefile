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

uninstall:
	helm uninstall \
	     --namespace local-path-storage \
	     local-path-provisioner
	oc delete project local-path-provisioner
