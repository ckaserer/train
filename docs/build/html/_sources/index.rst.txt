.. # define a hard line break for HTML
.. |br| raw:: html

   <br />

.. image:: https://img.shields.io/travis/com/gepardec/hogarama?style=flat-square
   :alt: cicd badge
   :align: left
   :target: https://travis-ci.com/Gepardec/hogarama

.. image:: https://img.shields.io/badge/license-GPL%20v3.0-brightgreen.svg?style=flat-square
   :alt: licence badge
   :align: left

.. image:: https://img.shields.io/maintenance/yes/2020?style=flat-square
   :alt: maintenance badge
   :align: left

.. image:: https://www.gepardec.com/files/gepardec_logo_light_background@2000w.png
   :width: 100px
   :alt: gepardec
   :align: right

|br|

Welcome to our workshop infra documentation!
=======================================================

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Contents

   gettingstarted
   architecture
   why
   documentation

Providing a frictionless experience for workshop participants with hands on, technical sections is key to focus on what is important - hands on learning and experimenting with new technology. 

It should be easy to work through the hands on labs no matter the operating system or hardware specification of your system. 

First steps
----------------

In our :doc:`Getting Started <gettingstarted>` guide you will learn how to manage the lifecycle of a workshop environment on your own.

Architecture
-----------------

What resources do we provision, why do we do it the way we do it? Find out in our :doc:`Architecture <architecture>` section.

Why
-----------------

How did we end up with terraform?! Why not packer, vagrant, or a vm image? In our :doc:`Why Terraform <why>` section you will find all the answers you are looking for.

Documentation
-----------------

We need to be able to understand the technology we work with. In addition to the general awareness we want to make it simple for new colleagues to get started with the tools that we have in place. Hence documentation is key. Here is how we do :doc:`Documentation <documentation>` for our workshop infrastructure.