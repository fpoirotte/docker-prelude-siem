Dockerized Prelude SIEM
=======================

This repository contains a dockerized version of Prelude SIEM.


Requirements
------------

This repository relies on the following dependencies:

* docker.io
* docker-compose

It has been tested on Debian 9.4 (Stretch) against the following
versions of these dependencies:

* docker.io 1.11.2
* docker-compose 1.8.0


Usage
-----

To start the SIEM, run the following command:

.. sourcecode:: console

   docker-compose up --build --force-recreate --abort-on-container-exit

This will spawn the following containers:

* ``db-alerts``: database server for IDMEF alerts
* ``db-gui``: database server for the user interface (Prewikka)
* ``manager``: Prelude SIEM's manager
* ``correlator``: alert correlator
* ``lml``: log management lackey
* ``prewikka``: web user interface

To access the SIEM, open a web browser and go to http://localhost/

To stop the SIEM, hit Ctrl+C from the terminal where it was started
and wait for the containers to stop.


Exposed services
----------------

The following services get exposed to the host:

* ``514/tcp``: syslog receiver
* ``514/udp``: syslog receiver (disabled by default as it usually conflicts
  with the host's syslog server)
* ``80/tcp``: web server
* ``5553/tcp``: sensors' registration server (to connect external sensors
  like Suricata, OSSEC, ...)
* ``4690/tcp``: IDMEF alert receiver (for external sensors)


Known caveats
-------------

The following limitations have been observed while using this project:

* The sensors are re-registered every time the containers are restarted,
  meaning new entries get created on the ``Agents`` page every time a
  sensor is restarted.

* This repository does not make use of Docker's secrets management mechanism,
  to ensure compatibility with old versions of Docker like the one available
  on Debian stable.


License
-------

This project is released under the MIT license.
See `LICENSE`_ for more information.

..  _`LICENSE`:
    https://github.com/fpoirotte/docker-prelude-siem/blob/master/LICENSE
