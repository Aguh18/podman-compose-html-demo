FROM docker.io/library/nginx:alpine

# Remove default files
RUN rm -rf /etc/nginx/conf.d/* /usr/share/nginx/html/*

# Copy configuration and site files
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY src/ /usr/share/nginx/html/

# Expose standard web port
EXPOSE 80

# Health check probe
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://127.0.0.1:80/health || exit 1

CMD ["nginx", "-g", "daemon off;"]
