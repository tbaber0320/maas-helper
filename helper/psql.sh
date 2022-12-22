#!/bin/bash

psql -U postgres

create user neuralink with encrypted password 'neuralink';

create database maas;

grant all privileges on database maas to neuralink;