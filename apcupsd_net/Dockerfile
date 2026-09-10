ARG BUILD_FROM
FROM $BUILD_FROM

# Set the locale
ENV LANG=C.UTF-8

# Install apcupsd and the tools used by run.sh and event scripts
RUN \
    apk add --no-cache \
        apcupsd=3.14.14-r6 \
        curl=8.14.1-r2 \
        jq=1.7.1-r0 \
        mailx=8.1.2_git20220412-r1 \
        msmtp=1.8.25-r0 \
        openssh=9.6_p1-r2 \
    \
    && ln -sf /usr/bin/msmtp /usr/sbin/sendmail

# Replace the host power scripts so they call the Supervisor API instead
RUN rm -f /sbin/poweroff /sbin/reboot
COPY hassio_poweroff /sbin/poweroff
COPY hassio_reboot /sbin/reboot
RUN chmod a+x /sbin/poweroff /sbin/reboot

# Copy add-on run script
COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /data
CMD [ "/run.sh" ]
