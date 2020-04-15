Getting Started
#################################

Requirements
---------------

* AWS IAM with programatic access
* terraform and aws cli OR docker

IAM programatic access
------------------------

You need to create an AWS IAM user with programatic access and store the credentials on your workstation. For the rest of the doc we will assume that your aws credentials file exists as :code:`~/.aws/credentials`.

Provision workshop infra
------------------------

No software requirements except docker

.. code-block:: bash

   docker run --rm -it \
     -v $(echo ~)/.aws:/root/.aws:ro \
     -v $(pwd)/workdir:/opt/train/workdir \
     gepardec/train apply

Assuming you have terraform and aws cli installed on your machine you can alternative execute the entrypoint directly via

.. code-block:: bash

   entrypoint.sh create

Destroy workshop infra
------------------------

.. code-block:: bash

   docker run --rm -it \
     -v $(echo ~)/.aws:/root/.aws:ro \
     -v $(pwd)/workdir:/opt/train/workdir \
     gepardec/train destroy


.. code-block:: bash

   entrypoint.sh destroy

