# Base image
FROM ruby:3.0-slim

# Set the environment variables
ENV LANG=C.UTF-8 \
  APP_PATH=/app \
  YARN_PATH=/home/rails_user/.cache/yarn \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3 \
  RAILS_PORT=3001

##############################
# Dependencies for Snowflake #
##############################
# Install ODBC Driver Manager and system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends unixodbc curl build-essential libpq-dev tzdata unixodbc-dev && \
    curl -O https://sfc-repo.snowflakecomputing.com/odbc/linux/2.20.5/snowflake-odbc-2.20.5.x86_64.deb && \
    dpkg -i snowflake-odbc-2.20.5.x86_64.deb && \
    rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1000 rails_user && \
    useradd --uid 1000 --gid rails_user rails_user && \
    mkdir -p $APP_PATH $YARN_PATH && \
    touch /home/rails_user/.yarnrc && \
    chown -R rails_user:rails_user $APP_PATH $YARN_PATH /home/rails_user/.yarnrc

# Set user
USER rails_user

# Set the working directory inside the container
WORKDIR $APP_PATH
COPY --chown=rails_user:rails_user Gemfile* package*.json ./
#COPY --chown=rails_user:rails_user Gemfile* package*.json yarn.lock ./

# Install the dependencies
RUN bundle check || bundle install --jobs $BUNDLE_JOBS

# Precompile assets
RUN rails assets:precompile

EXPOSE $RAILS_PORT

# Set the command to run your Rails application
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
