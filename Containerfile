FROM registry.access.redhat.com/ubi8/python-38

LABEL maintainer="Noah Sayre"

# This will make sure your poetry.lock file is installed in the assemble step.
ENV ENABLE_MICROPIPENV="1"

# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
COPY . /tmp/src
RUN /usr/bin/fix-permissions /tmp/src

# Add src to Python path so fivecast is importable
ENV PYTHONPATH="$HOME:$PYTHONPATH"

# # Change file ownership to the assemble user. Builder image must support chown command.
RUN chown -R 1001:0 /tmp/src
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble

CMD ["echo", "container is live"]
