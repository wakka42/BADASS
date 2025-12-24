all:
	docker build -t host_dasli ./host
	docker build -t routeur_dasli ./router

rm:
	docker container prune

clean:
	docker image remove -f routeur_dasli
	docker image remove -f host_dasli

fclean: rm clean
	docker system prune -af