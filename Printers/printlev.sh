#!/bin/sh



lpoptions | tr ' ' '\n' | grep marker-levels | sed 's/.*[=:]//'


