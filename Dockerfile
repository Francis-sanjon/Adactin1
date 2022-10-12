#Base image taken from:https://github.com/cypress-io/cypress-docker-images
#FROM cypress/browsers:node16.17.1-chrome106-ff105-edge
#FROM cypress/base:12.1.0
FROM cypress/included:10.9.0
#Create the folder where our project will be stored
RUN mkdir /my-cypress-project1 && \
xvfb \
#We make it our workdirectory
WORKDIR /my-cypress-project1
#Let's copy the essential files that we MUST use to run our scripts.
COPY ./package.json .
COPY ./cypress.config.js .
COPY ./cypress ./cypress
COPY ./cucumber-html-reports.js .
COPY ./cucumber-json-formatter.exe .
#Install the cypress dependencies in the work directory
RUN npm install
RUN npm install -D @badeball/cypress-cucumber-preprocessor
RUN npm install -D @bahmutov/cypress-esbuild-preprocessor
RUN npm install -D @esbuild-plugins/node-modules-polyfill
#RUN node cucumber-html-reports.js
#RUN npm install cypress-cucumber-preprocessor

#Executable commands the container will use[Exec Form]
ENTRYPOINT ["npx","cypress","run"]
#With CMD in this case, we can specify more parameters to the last entrypoint.
CMD [""]    
