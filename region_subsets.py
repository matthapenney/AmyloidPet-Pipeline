#!/usr/local/python-3.4.1-ana/bin/python -u
# Gautam Prasad - gprasad@usc.edu - 12/16/15

# extract a subset of regions from a label image

# library support
import sys
import gp_start
gp_start.add_commercial_libs()
gp_start.add_gp_libs()
import connectome_tools as ct

connectome_args = {'labels_name': sys.argv[1], 'sub_labels_list_name': sys.argv[2], 'sub_labels_image_name': sys.argv[3]}

mk = ct.MakeConnectome(connectome_args)

mk.extract_sub_labels()
