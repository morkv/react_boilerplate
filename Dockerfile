FROM registry.ketl.tech/react:master
LABEL maintainer="nico@ketl.tech"

# Install files
COPY package.json yarn.lock ./

RUN yarn

# Semantic files (uncomment if modified the semantic default theme)
# COPY semantic.json ./
# COPY semantic ./semantic
# RUN yarn semantic

# Build files (uncomment in case of changes in these config files)
COPY tsconfig.json \
    .eslintrc \
    .eslintignore \
    .babelrc \
    .browserslistr \
    postcss.config.js \
    ./

# Code files
COPY src ./src

# In case of changes to the lighttpd config
# COPY lighttpd.conf ./

CMD yarn run build && lighttpd -D -f lighttpd.conf