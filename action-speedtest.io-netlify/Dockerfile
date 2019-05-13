# ARG version
# FROM sitespeedio/sitespeed.io:${version}
FROM sitespeedio/sitespeed.io:8.0.6-action

LABEL "com.github.actions.name"="Run sitespeed.io on Netlify"
LABEL "com.github.actions.description"="Test the performance of your web site"
LABEL "com.github.actions.icon"="monitor"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/sitespeedio/sitespeed.io"
LABEL "homepage"="https://www.sitespeed.io/documentation/sitespeed.io/continuous-integration/#github-actions"
LABEL "maintainer"="Peter Hedenskog <peter@soulgalore.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]