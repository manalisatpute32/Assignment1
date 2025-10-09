# FROM ubuntu:22.04

# ENV DEBIAN_FRONTEND=noninteractive

# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#         fortune-mod cowsay netcat-openbsd && \
#     rm -rf /var/lib/apt/lists/*

# WORKDIR /app
# COPY . /app

# RUN chmod +x /app/wisecow.sh

# EXPOSE 4499

# CMD ["./wisecow.sh"]

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fortune-mod fortunes cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:${PATH}"

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh

RUN chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]
