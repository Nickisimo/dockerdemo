import xml.etree.ElementTree as ET
import json
import sys

# Default file path.
output_location = "/var/opt/pxt/results/output.xml"
pxt_json_result = "/var/opt/pxt/results/pxt-results.json"

# Variables.
total_tests = 0
total_passed = 0
total_failed = 0
overall_result = "PASSED"

# Parse the output file.
root = ET.parse(output_location).getroot()

# Collect the results.
for all_tests_tag in root.findall("./statistics/total/stat"):
    if all_tests_tag.text == 'All Tests':
        total_failed = int(all_tests_tag.attrib.get("fail"))
        total_passed = int(all_tests_tag.attrib.get("pass"))
        total_tests = total_failed + total_passed
	
# Set the status to FAIL if there were failures.
if total_failed > 0:
    overall_result = "FAILED"
    
    
# Create the dictionary result.
result_dictionary = {
    'testsRun'       : total_tests,
    'testsPassed'    : total_passed,
    'testsFailed'    : total_failed,
    'overallResult'  : overall_result
}

print("Results: ", str(result_dictionary))

# Write the file.
with open(pxt_json_result, 'w') as pxt_json_file:
    json.dump(result_dictionary, pxt_json_file)
    
print("Successfully wrote results to ", pxt_json_result)