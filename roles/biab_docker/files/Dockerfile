FROM continuumio/miniconda

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN apt-get install -y git
RUN apt-get install -y lockfile-progs
RUN apt-get install -y zip

RUN apt-get install -y Xvfb x11-utils

WORKDIR /opt/biab
EXPOSE 5757

COPY src/ ./
RUN chmod +x hook.sh
RUN git clone https://github.com/gregcaporaso/An-Introduction-To-Applied-Bioinformatics.git
RUN npm install -g jthoober

ENTRYPOINT xvfb-run jthoober --host 0.0.0.0 --rules ./hook_rules.js --secret $GITHUB_SECRET
