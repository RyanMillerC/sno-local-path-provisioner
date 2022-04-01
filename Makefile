.PHONY: install uninstall

install:
	git submodule update --init
	helm dependency update
	helm install \
	    --create-namespace \
	    --namespace local-path-storage \
	    local-path-provisioner .

uninstall:
	helm uninstall \
	     --namespace local-path-storage \
	     local-path-provisioner
