#!/usr/bin/env python3

import cgm_library
import argparse
import json

parser = argparse.ArgumentParser()
parser.add_argument('JSON', metavar='json',type=str, help='JSON to parse')
args = parser.parse_args()

# Get JSON data
json_str = args.JSON

# Parse JSON data
json_data = json.loads(json_str)
print(json_data["hostname"])

#filename="./cgm_data/insar/USGS_D071_InSAR_v0_0_1.hdf5"
#reference_pixel = [-116.57164, 35.32064];
#los_angeles = [-118.2437, 34.0522];
#pixel_list = [reference_pixel, los_angeles];
#cgm_library.hdf5_to_geocsv.extract_csv_from_file(filename, pixel_list, ".");

