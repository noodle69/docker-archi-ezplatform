CC:=docker-compose

run: user.compose.yml
	$(CC) up -d

user.compose.yml: .user.compose.yml
	@cp $< $@
	@sed -i 's/__UUID__/'$(shell id -u)'/g' $@
	@sed -i 's/__GUID__/'$(shell id -g)'/g' $@
