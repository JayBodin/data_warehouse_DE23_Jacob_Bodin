use role SYSADMIN; 

create database if not exists movies;

create schema if not exists movies.staging;

use schema movies.staging;