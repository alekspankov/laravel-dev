Laravel local environment
=========================

Usage
-----

1. Pull or download package contents to your local folder. I usually place it in `app/root/.local` folder
2. Edit the `docker-compose.yml` according your needs.
   - Available tags: [Docker Hub Repository](https://hub.docker.com/repository/registry-1.docker.io/aleksxp/laravel-dev/tags)
3. From you project root directory run this command: `docker-compose -f .local/docker-compose.yml up -d`
4. Enjoy!

Requirements
------------

- Docker
- Docker Composer
