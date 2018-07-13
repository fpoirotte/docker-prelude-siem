Dockerized Prelude SIEM
=======================

This repository contains a dockerized version of Prelude SIEM.


Requirements
------------

This repository relies on the following dependencies:

* docker.io >= 1.10.0
* docker-compose >= 1.8.0 (optional)

It has been tested on Debian 9.4 (Stretch) against the following
versions of these dependencies:

* docker.io 1.11.2
* docker-compose 1.8.0


Installation and start/stop instructions
----------------------------------------

Using git and docker-composer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Clone this repository:

..  sourcecode:: console

    git clone https://github.com/fpoirotte/docker-prelude-siem.git

To start the SIEM, go to the newly created folder and run ``docker-composer``:

..  sourcecode:: console

    cd docker-prelude-siem
    docker-compose up --build --force-recreate --abort-on-container-exit

``docker-compose`` will recreate the containers, start them and wait for
further instructions.

The following containers will be spawned during this process:

* ``db-alerts``: database server for IDMEF alerts
* ``db-gui``: database server for the user interface (Prewikka)
* ``manager``: Prelude SIEM's manager
* ``correlator``: alert correlator
* ``lml``: log management lackey
* ``prewikka``: web user interface

To stop the SIEM, hit Ctrl+C in the terminal where ``docker-composer``
was run.


Using only docker
~~~~~~~~~~~~~~~~~

TODO


Usage
-----

To access the SIEM, open a web browser and go to http://localhost/

To start analyzing syslog entries, send them to port 514 (TCP, unless you
also enabled the UDP port in the configuration file).

You can also use external sensors. In that case, the sensor must first
be registered against this machine (see
https://www.prelude-siem.org/projects/prelude/wiki/InstallingAgentThirdparty
for instructions on how to do that for the most commonly used sensors).
When asked for a password during the registration process, input the
value from the ``SENSORS_PASS`` variable listed in the ``environment`` file.

..  note::

    Since the containers are meant to be ephemeral, information about
    the external sensors' registrations is lost when the ``manager``
    container is restarted. You may need to register the sensors again
    in that case.


Exposed services
----------------

The following services get exposed to the host:

* ``514/tcp`` (``lml`` container): syslog receiver

* ``514/udp`` (``lml`` container): syslog receiver (disabled by default
  as it usually conflicts with the host's syslog server)

* ``80/tcp`` (``prewikka`` container): web interface

* ``5553/tcp`` (``manager`` container): sensors' registration server
  (to connect external sensors like Suricata, OSSEC, ...)

* ``4690/tcp`` (``manager`` container): IDMEF alert receiver
  (for external sensors)


Customize detection/correlation rules
-------------------------------------

TODO


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
