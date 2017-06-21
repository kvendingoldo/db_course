#!/usr/bin/python3.5
# -*- coding: utf-8 -*-
# @Author: Alexander Sharov

import utils.config_controller as cc

from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData, ForeignKey


config_controller = cc.ConfigContoller()


def create_connection():
    return create_engine(config_controller.get_db_name(), echo=True)