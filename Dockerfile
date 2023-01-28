ARG BASE=python:3.6

FROM ${BASE}

ARG SPLEETER_VERSION=1.5.3
ENV MODEL_PATH /models

# install youtube-dl
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl && \
    pip install --upgrade youtube-dl

# install spleeter
RUN apt-get update && \
  apt-get install -y ffmpeg libsndfile1 jq && \
  pip install musdb museval && \
  pip install spleeter==${SPLEETER_VERSION}

# scripts
COPY entrypoint.sh /
COPY post-process-file.sh /root/post-process-file.sh

ENTRYPOINT ["./entrypoint.sh"]
