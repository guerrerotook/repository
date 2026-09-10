#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
UPS_CONFIG_PATH=/etc/apcupsd/apcupsd.conf

VALID_SCRIPTS=(annoyme changeme commfailure commok doreboot doshutdown emergency failing loadlimit powerout onbattery offbattery mainsback remotedown runlimit timeout startselftest endselftest battdetach battattach)

NAME=$(jq --raw-output '.name' $CONFIG_PATH)
CABLE=$(jq --raw-output '.cable' $CONFIG_PATH)
TYPE=$(jq --raw-output '.type' $CONFIG_PATH)
DEVICE=$(jq --raw-output '.device' $CONFIG_PATH)

if [[ -n "$NAME" ]]; then
    sed -i "s/^#\?UPSNAME\( .*\)\?\$/UPSNAME $NAME/g" $UPS_CONFIG_PATH
fi

if [[ -n "$CABLE" ]]; then
    sed -i "s/^#\?UPSCABLE\( .*\)\?\$/UPSCABLE $CABLE/g" $UPS_CONFIG_PATH
fi

if [[ -n "$TYPE" ]]; then
    sed -i "s/^#\?UPSTYPE\( .*\)\?\$/UPSTYPE $TYPE/g" $UPS_CONFIG_PATH
fi

if [[ -n "$DEVICE" ]]; then
    sed -i "s/^#\?DEVICE\( .*\)\?\$/DEVICE $DEVICE/g" $UPS_CONFIG_PATH
else
    sed -i "s/^#\?DEVICE\( .*\)\?\$//g" $UPS_CONFIG_PATH
fi

keys=$(jq --raw-output '.extra[].key' $CONFIG_PATH)
OLD_IFS="$IFS"
IFS=$'\n'
keys=($keys)
IFS="$OLD_IFS"

for key in "${keys[@]}"; do
    if [[ ! "$key" =~ ^[A-Za-z0-9_]+$ ]]; then
        echo "Ignoring invalid extra option key: $key" >&2
        continue
    fi

    val=$(jq --raw-output ".extra[] | select(.key == \"$key\").val" $CONFIG_PATH)

    if [ -n "$val" ]; then
        # Escape sed replacement metacharacters (only needed when the value
        # is used as a sed replacement string below, not for the plain
        # append case)
        val_escaped=$(printf '%s' "$val" | sed -e 's/[\/&]/\\&/g')

        if grep -xq "#\?$key\( .*\)\?" $UPS_CONFIG_PATH; then
            # replace in config
            sed -i "s/^#\?$key\( .*\)\?\$/$key $val_escaped/g" $UPS_CONFIG_PATH
        else
            # add to bottom
            echo "$key $val" >> $UPS_CONFIG_PATH
        fi
    else
        # remove from config
        sed -i "s/^#\?$key\( .*\)\?\$//g" $UPS_CONFIG_PATH
    fi
done

for script in "${VALID_SCRIPTS[@]}"; do
    if [ -f "/share/apcupsd_net/scripts/$script" ]; then
        cp "/share/apcupsd_net/scripts/$script" "/etc/apcupsd/$script"
        chmod a+x "/etc/apcupsd/$script"
        echo "copied custom $script script"
    fi
done

if [ -f "/share/apcupsd_net/msmtprc" ]; then
    cp /share/apcupsd_net/msmtprc /etc
fi

if [ -f "/share/apcupsd_net/aliases" ]; then
    cp /share/apcupsd_net/aliases /etc
fi

syslogd -n -O - &

exec /sbin/apcupsd -b
