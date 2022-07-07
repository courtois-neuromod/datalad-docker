FROM python:3.8-slim

# Prepare environment
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                    curl bzip2 git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV GIT_ANNEX_PACKAGE=git-annex-10.20220505-nodep_h1234567_0.tar.bz2

RUN cd /usr/ && \
    curl -sSL   https://anaconda.org/conda-forge/git-annex/10.20220505/download/linux-64/$GIT_ANNEX_PACKAGE | \
    tar -xj

RUN pip install datalad pytest ssh_agent_setup
