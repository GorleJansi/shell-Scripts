# systemctl is-active --quiet <service> → silently checks if a service is running.
# Returns 0 if active, non-zero otherwise.

#!/bin/bash
services=("apache2" "mysql" "ssh")
for service in "${services[@]}"
do
    if systemctl is-active --quiet "$service";
    then
        echo "Service $service is running"
    else
        echo "Service $service is not running"
        # Restart service or send alert here
    fi
done