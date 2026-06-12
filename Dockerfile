FROM node:24-alpine

# Install PostgreSQL
RUN apk add --no-cache postgresql postgresql-contrib git

# Configure git to trust the workspace directory
RUN git config --system --add safe.directory /workspace

WORKDIR /workspace

# Enable corepack for pnpm
RUN corepack enable && corepack prepare pnpm@11 --activate

# Install NestJS CLI globally via npm (pnpm global installs break schematics resolution)
RUN npm i -g @nestjs/cli

# Copy startup script for PostgreSQL
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh


# Only start PostgreSQL - app will be started by developer in VSCode terminal
CMD ["/usr/local/bin/startup.sh"]