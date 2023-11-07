# Container image that runs your code
FROM mcr.microsoft.com/dotnet/sdk:6.0

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y jq
RUN dotnet tool install -g GitReleaseManger.Tool

ENV PATH /root/.dotnet/tools:$PATH
# Code file to execute when the docker container starts up (`entrypoint.sh`)
COPY  entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
