Docvert-agov 5.1
===============

Introduction
------------

> Converts Word Processor office files (e.g. `.DOC` files) to OpenDocument, DocBook, and structured HTML.

*Docvert-agov* is a custom-themed version of [Docvert](http://docvert.com/) built for the ACT Government, specifically as an OOXML (`.docx`) to HTML converter. Additionally this version is supplemented with ‘install’ and run shell scripts to help automate deployment. Testing was done on Amazon EC2 servers.

Technology
----------

Docvert utilises a daemon of LibreOffice to convert Microsoft Word documents → OpenDocument → DocBook → HTML via XSLT. This conversion approach makes use of ‘XML pipelines’ to stage the conversion and theme its output through XSLT, making it extensible and highly customisable.

For more information see [the official FAQ](http://static.holloway.co.nz/docvert/faq.html#xml-pipelines) and the how-to on writing themes under `doc/`.


Web Service
-----------

    python ./docvert-web.py [-p PORT] [-H host]


Command Line
------------

    python ./docvert-cli.py

    usage: docvert-cli.py [-h] [--version] --pipeline PIPELINE
        [--response {auto,path,stdout}]
        [--autopipeline {Break up over Heading 1.default,Nothing one long page}]
        [--url URL]
        [--list-pipelines]
        [--pipelinetype {tests,auto_pipelines,pipelines}]
        infile [infile ...]


Community
---------

Mailing list: [http://lists.catalyst.net.nz/mailman/listinfo/docvert](http://lists.catalyst.net.nz/mailman/listinfo/docvert)


Requirements
------------

Docvert-agov was tested on Ubuntu 12.04 and 13.04 but should run on most *nix systems.

### Dependencies

    Python 2.6 or 2.7 (we'll support Python 3 when it supports PyUNO)
    libreoffice
    python-uno
    python-lxml
    python-imaging
    pdf2svg
    librsvg2-2
    git (used in the optional install shell script)

Quickstart guide
----------------

### Install

Download/clone a copy of the repository or simply grab the install script (`install-docvert.sh`). Use the install script if you are on Debian or Ubuntu and you want to skip the manual steps, which essentially are:

1. Install dependencies (via `apt-get`).
2. Delete the docvert directory and fetch/re-fetch `master` of docvert-agov from GitHub.

To install, from the intended working directory execute the install script:

    ./install-docvert.sh

**Note:** You may have to make the downloaded shell script executable if it errors when running. Use `chmod`:

    chmod +x install-docvert.sh

To deploy on other systems use their respective package managers to install the required dependencies.

### Starting the web service

Docvert relies on LibreOffice for conversion. We can start the daemon as follows:

    /usr/bin/loffice -headless -norestore -nologo -norestore -nofirststartwizard -accept="socket,port=2002;urp;"

This runs a single instance (if you want to run a pool of instances then try something like [Open Office Server Daemon](http://oodaemon.sourceforge.net/)).

Starting this daemon and then launching docvert’s web interface is automated by the `start-docvert.sh` bash script. Executing this will launch the LibreOffice daemon as well as serve the Python web front-end. The terminal will display output and errors as the service is operated.


Automating launch of the service
--------------------------------

The service can be automated to launch on boot/reboot of a system.

This is done using the [cron daemon](https://en.wikipedia.org/wiki/Crontab) (a job scheduler). To tell the system to launch the start script each time the system boots an instruction is added to the cron table (the table of scheduled tasks) by calling `crontab` and parsing it the edit option (`-e`):

	crontab -e

This will open the cron table file using the user- or system-defined text editor. The line to add is:

	@reboot /home/ubuntu/docvert-agov/start-docvert.sh

If docvert has been placed elsewhere ensure the path to the start script matches its location.


LICENCE
-------
Released under the GNU GPL3; see `LICENCE`.


Misc
----

This readme file is based on the original docvert readme.