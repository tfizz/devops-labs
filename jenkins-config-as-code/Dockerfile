FROM jenkins/jenkins:slim-jdk11
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY --chown=jenkins:jenkins jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt