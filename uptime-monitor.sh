#site uptime monitoring script runs every minutes
#* * * * * /bin/bash /var/www/backups/script/example-com-site-monitor.sh


#!/bin/bash
DATE=$(date)
if curl -s --head https://www.domain.com/ | grep "200" > /dev/null
  then
    echo "The HTTP server is up!" > /dev/null
else
    echo "The HTTP server is down!"
sudo service apache2 start
systemctl restart apache2
echo "$DATE - domain.com - NOT OKAY, apache restarted" >> /var/log/apache2/domain-com-custom-restarts.log
fi

