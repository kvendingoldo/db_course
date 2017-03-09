#!/usr/bin/python3.5
# -*- coding: utf-8 -*-
# @Author: Alexander Sharov

from __future__ import print_function

import json


class ConfigContoller(object):

    config_file = "config.json"

    def load(self):
        with open(self.config_file, 'r') as cfg_file:
            return json.load(cfg_file)


    def reload(self):
        return self.load()


    def upd_par(self, par, value):
        current_config = self.load()
        current_config[par] = value
        with open(self.config_file, 'w') as cfg_file:
            json.dump(current_config, cfg_file)

    def get_db_name(self):
        pass