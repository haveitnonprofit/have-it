FROM node:24-alpine

# Install PostgreSQL
RUN apk add --no-cache postgresql postgresql-contrib git

# Configure git to trust the workspace directory
RUN git config --system --add safe.directory /workspace

WORKDIR /workspace

# Enable corepack for pnpm
RUN corepack enable && corepack prepare pnpm@11 --activate

# Move pnpm store outside workspace so it survives bind mount
RUN pnpm config set store-dir /root/.pnpm-store

# Install project dependencies into image (populates pnpm store + node_modules)
# --ignore-scripts: safe in devcontainer, packages run scripts naturally at runtime if needed
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
RUN pnpm install --frozen-lockfile

# Install NestJS CLI globally via npm (pnpm global installs break schematics resolution)
RUN npm i -g @nestjs/cli

# Configure git branch in shell prompt
RUN echo "PS1='\\w \$(git branch --show-current 2>/dev/null)\\\$ '" >> /root/.profile

# Source .profile for all interactive ash shells (not just login shells)
ENV ENV=/root/.profile

# Copy startup script for PostgreSQL
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh


# Only start PostgreSQL - app will be started by developer in VSCode terminal
CMD ["/usr/local/bin/startup.sh"]