# Django Project Setup Tools

## Versions Supported:
- Django 1.8+
- Ubuntu 14.04, RHEL/CentOS 6, RHEL/CentOS 7

## Prerequisites

- There is functionality to install MySQL and/or Postgresql servers but you should have your database software installed along with the database you intentd to use. The Django setup tool will try to install all prerequisite software as needed.

#### Concerning recreatedb.sh script:

- For posgresql, you must ensure your user can run sudo as postgres user. The database user must also have create and modify table privileges.

- For mysql, you should have a database created with a user that has create and modify table privileges.

- Essentially, the users above must have the same privileges needed for Django's manage.py makemigrations and migrate scripts.

## Scripts

- When used to set up a Django project all of these scripts will be copied to a scripts/ subdirectory inside your Django project.

- django-setup.sh: Will install pyenv (if needed), the Python version for your project (if needed) and will setup your Django project with the appropriate pyenv environment using virtualenv.

- createsuperuser.sh: Will create and set password for your Django admin user. See env.sh below.

- recreatedb.sh: Will re-create your database and migration history if you choose to do so. See env.sh below.

- env.sh: A configuration file that will be used by the Django setup tool scripts. This should be set before running createsuperuser.sh and recreatedb.sh.

### django-setup.sh

- To Do

### createsuperuser.sh

- To Do

### recreatedb.sh

- To Do

### env.sh

- To Do