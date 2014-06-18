FROM ubuntu:12.04
MAINTAINER Allan Espinosa "allan.espinosa@outlook.com"

RUN apt-get update && apt-get clean

RUN apt-get install -q -y curl git

# Prepare php install
RUN apt-get install -q -y php5-common
RUN apt-get install -q -y php5-cgi
RUN apt-get install -q -y php5
RUN apt-get install -q -y php5-dev
RUN apt-get install -q -y php-pear
RUN apt-get install -q -y php5-xdebug
RUN pear upgrade PEAR
RUN pear channel-discover pear.pdepend.org
RUN pear channel-discover pear.phpmd.org
RUN pear channel-discover pear.phpunit.de
RUN pear channel-discover components.ez.no
RUN pear channel-discover pear.phpdoc.org
RUN pear install --alldeps phpunit/PHPUnit
RUN pear install pdepend/PHP_Depend
RUN pear install --alldeps phpmd/PHP_PMD
RUN pear install phpunit/phpcpd
RUN pear install phpunit/phploc
RUN pear install phpdoc/phpDocumentor
RUN pear install PHP_CodeSniffer
RUN pear install --alldeps phpunit/PHP_CodeBrowser

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.568/jenkins.war /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
VOLUME ["/jenkins"]
CMD [""]
