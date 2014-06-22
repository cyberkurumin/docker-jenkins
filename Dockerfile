FROM ubuntu:13.10
MAINTAINER Jorge GOMES <jorge@blondeel-gomes.net>

RUN apt-get update
RUN apt-get -y install wget git curl

# Prepare php install
RUN apt-get install -q -y php5-common
RUN apt-get install -q -y php5-cgi
RUN apt-get install -q -y php5
RUN apt-get install -q -y php5-json
RUN apt-get install -q -y php5-dev
RUN apt-get install -q -y php-pear
RUN apt-get install -q -y php5-xdebug
RUN pear upgrade PEAR
RUN pear channel-discover pear.pdepend.org
RUN pear channel-discover pear.phpmd.org
RUN pear channel-discover pear.phpunit.de
RUN pear channel-discover components.ez.no
RUN pear channel-discover pear.phpdoc.org
RUN pear channel-discover pear.phing.info
RUN pear install --alldeps phpunit/PHPUnit
RUN pear install pdepend/PHP_Depend
RUN pear install --alldeps phpmd/PHP_PMD
RUN pear install phpunit/phpcpd
RUN pear install phpunit/phploc
RUN pear install phpdoc/phpDocumentor
RUN pear install PHP_CodeSniffer
RUN pear install --alldeps phpunit/PHP_CodeBrowser
RUN pear install --alldeps phing/phing

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean

RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y jenkins

VOLUME /var/lib/jenkins
ENV JENKINS_HOME /var/lib/jenkins

EXPOSE 8080

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

CMD /usr/local/bin/run
