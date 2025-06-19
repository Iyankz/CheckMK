# CheckMK

# Installation Checkmk
1. Download Checkmk for Ubuntu or Debian
##
    wget https://download.checkmk.com/checkmk/2.4.0p4/check-mk-raw-2.4.0p4_0.noble_amd64.deb
2. Install the Checkmk package
##
    sudo apt install ./check-mk-raw-2.4.0p4_0.noble_amd64.deb
3. Check version
##
    omd version
4. Create a Checkmk monitoring site
##
    sudo omd create monitoring
##Output
Adding /opt/omd/sites/monitoring/tmp to /etc/fstab.
Creating temporary filesystem /omd/sites/monitoring/tmp...OK
Restarting Apache...OK
Created new site monitoring with version 2.4.0p4.cre.

The site can be started with omd start monitoring.
The default web UI is available at http://your_server/monitoring/

The admin user for the web applications is cmkadmin with password: generated-password
(It can be changed with 'htpasswd -m ~/etc/htpasswd cmkadmin' as site user.)
Please do a su - monitoring for administration of this site. 
5. Start Checkmk monitoring
##
    sudo omd start monitoring

##Output
Starting mkeventd...OK
Starting liveproxyd...OK
Starting mknotifyd...OK
Starting rrdcached...OK
Starting cmc...OK
Starting apache...OK
Starting dcd...OK
Starting redis...OK
Initializing Crontab...OK

6. Start webUI CheckMK 
http://ip_server/monitoring/
For Password view in step 4 in Create a Checkmk monitoring site
