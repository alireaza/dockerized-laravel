FROM nginx:1.22.1-alpine

HEALTHCHECK --start-period=5s --timeout=5s --interval=5s --retries=5 CMD curl --silent --fail http://localhost/health | grep "Healthy" || exit -1
