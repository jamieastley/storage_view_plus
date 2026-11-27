tag_storage_view_plus_release:
	@read -p "Enter the version for this release:" version; \
	TAG=storage_view_plus-v$$version; \
	git tag -a $$TAG -m "$$TAG"; \
	echo "Tagged as: $$TAG"
