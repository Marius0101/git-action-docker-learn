FROM mcr.microsoft.com/dotnet/sdk:7.0

LABEL "com.github.actions.name" = "Auto Release Milestone"
LABEL "com.github.actions.description" = "Draft a GitHUb release based on newly closed Milestone"

LABEL version: ="0.1.0"
LABEL repository = "https://github.com/Marius0101/git-action-docker-learn"
LABEL maintainer = "Marius Mihalcea"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]