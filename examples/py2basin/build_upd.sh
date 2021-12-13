docker image build -t py2basin .

docker tag py2basin mpihuisu/py2basin:2.0
docker push mpihuisu/py2basin:2.0
