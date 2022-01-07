FROM app-release-docker-local.registry.paychex.com/base/pxt-python-base:latest
#FROM app-release-docker-local.registry.paychex.com/base/pxt-base:latest

ENV TEST_DIRECTORY=/tmp/tests

# Setting up the virtual environment
###ENV VIRTUAL_ENV=$TEST_DIRECTORY/venv
###RUN python3 -m venv $VIRTUAL_ENV
###ENV PATH=$VIRTUAL_ENV/bin:$PATH
###ENV PYTHONPATH=$TEST_DIRECTORY/services:$PYTHONPATH


ENV CONFIG_EMPTY 1



#RUN ls -aFlR  


RUN pip3 install robotframework && \
    pip3 install --upgrade robotframework-seleniumlibrary && \
	pip3 install --upgrade robotframework-requests

    
RUN ls -aFl  
#RUN ls -aFlR  
    
COPY [ "robot-tests", "/tmp/tests"]

RUN ls -aFl  


COPY [ "pxt-robot-parser.py", "/usr/bin/"]

RUN ls -aFl  

COPY [ "pxt-runner.sh", "/usr/bin/"]

CMD [ "/bin/bash", "-c", "/usr/bin/pxt-runner.sh /tmp/robot-test_1" ]

