ARG u_version
FROM acolasz/java-base:1.8.${u_version}

ARG app_home=/opt/app
ARG tech_user=acolasz
ARG app_name
ARG app_version

ENV APP_HOME=${app_home} \
	TECH_USER=${tech_user} \
	APP_NAME=${app_name} \
	APP_VERSION=${app_version}

USER root

COPY ./app/ /tmp/

RUN mkdir -p ${APP_HOME} \
	&& mv /tmp/${APP_NAME}-${APP_VERSION}.jar ${APP_HOME} \
	&& chown -R "${TECH_USER}":"${TECH_USER}" /opt/ \
	&& chmod -R 766 /opt/
	
USER ${TECH_USER}

ENTRYPOINT java -jar ${APP_HOME}/${APP_NAME}-${APP_VERSION}.jar
