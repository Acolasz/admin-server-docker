FROM acolasz/java-base:1.8.211

ARG app_home=/opt/app
ARG tech_user=acolasz

ENV APP_HOME=${app_path} / 
	TECH_USER=${tech_user}

USER root

RUN mkdir -p /opt/app 
	&& chown -R "${TECH_USER}":"${TECH_USER}" ${APP_HOME}/ \
	&& chmod -R 766 ${APP_HOME}/

COPY ./app/ ${APP_HOME}/

# USER ${TECH_USER}

# ENTRYPOINT ["java", "-jar", ]
