Terraform Functions Learning Guide - Assignments
Console Commands
Practice these fundamental commands in terraform console before starting the assignments:

# Basic String Manipulation
lower("HELLO WORLD")
max(5, 12, 9)
trim("  hello  ")
chomp("hello\n")
reverse(["a", "b", "c"])
Assignments
Assignment 1: Project Naming Convention
Functions Focus: lower, replace

Scenario:
Your company requires all resource names to be lowercase and replace spaces with hyphens.

Input:

"Project ALPHA Resource"
Required Output:

"project-alpha-resource"
Tasks:

Create a variable project_name with the given input
Create a local that uses the required functions
Use the transformed name to create an Azure resource group
Add an output to display the transformed name
Assignment 2: Resource Tagging
Function Focus: merge

Scenario:
You need to combine default company tags with environment-specific tags.

Input:

# Default tags
{
    company    = "TechCorp"
    managed_by = "terraform"
}

# Environment tags
{
    environment  = "production"
    cost_center = "cc-123"
}
Tasks:

Create locals for both tag sets
Merge them using the appropriate function
Apply them to a resource group
Create an output to display the combined tags
Assignment 3: Storage Account Naming
Function Focus: substr

Scenario:
Azure storage account names must be less than 24 characters and use only lowercase letters and numbers.

Input:

"projectalphastorageaccount"
Requirements:

Maximum length: 23 characters
All lowercase
No special characters
Tasks:

Create a function to process the storage account name
Ensure it meets Azure requirements
Apply it to a storage account resource
Add validation to prevent invalid names
Assignment 4: Network Security Group Rules
Functions Focus: split, join

Scenario:
Transform a comma-separated list of ports into a specific format for documentation.

Input:

"80,443,8080,3306"
Required Output:

"port-80-port-443-port-8080-port-3306"
Tasks:

Create a variable for the port list
Transform it using appropriate functions
Create an output with the formatted result
Add validation for port numbers
Assignment 5: Resource Lookup
Function Focus: lookup

Scenario:
Implement environment configuration mapping with fallback values.

Input:

environments = {
    dev = {
        instance_size = "small"
        redundancy    = "low"
    }
    prod = {
        instance_size = "large"
        redundancy    = "high"
    }
}
Tasks:

Create the environments map
Implement lookup with fallback
Create outputs for the configuration
Handle invalid environment names
Assignment 6: VM Size Validation
Functions Focus: length, contains

Scenario:
Implement validation rules for VM sizes.

Requirements:

Length between 2 and 20 characters
Must contain 'standard'
Test Cases:

Valid:    "standard_D2s_v3"
Invalid:  "basic_A0"
Invalid:  "standard_D2s_v3_extra_long_name"
Tasks:

Create a variable for VM size
Implement both validation rules
Test with various inputs
Create helpful error messages
Assignment 7: Backup Configuration
Functions Focus: endswith, sensitive

Scenario:
Create a secure backup configuration handler.

Input:

backup_name = "daily_backup"
credential  = "xyz123" # Should be sensitive
Requirements:

Name must end with '_backup'
Credentials must be marked sensitive
Handle validation failures
Tasks:

Create variables for both inputs
Implement proper validation
Handle sensitive data correctly
Create secure outputs
Assignment 8: File Path Processing
Functions Focus: fileexists, dirname

Scenario:
Validate Terraform configuration file paths.

Paths to Validate:

./configs/main.tf
./configs/variables.tf
Tasks:

Create path validation function
Extract directory names
Handle missing files
Create status outputs
Assignment 9: Resource Set Management
Functions Focus: toset, concat

Scenario:
Manage unique resource locations.

Input:

user_locations    = ["eastus", "westus", "eastus"]
default_locations = ["centralus"]
Tasks:

Combine location lists
Remove duplicates
Create location validation
Output unique locations
Assignment 10: Cost Calculation
Functions Focus: abs, max

Scenario:
Process monthly infrastructure costs.

Input:

monthly_costs = [-50, 100, 75, 200]
Required:

Convert negative values to positive
Find maximum cost
Calculate averages
Tasks:

Create cost processing function
Handle negative values
Calculate statistics
Create cost report output
Assignment 11: Timestamp Management
Functions Focus: timestamp, formatdate

Scenario:
Generate formatted timestamps for different purposes.

Required Formats:

Resource Names: YYYYMMDD
Tags: DD-MM-YYYY
Tasks:

Create timestamp generation
Format for different uses
Implement validation
Create formatted outputs
Assignment 12: File Content Handling
Functions Focus: file, sensitive

Scenario:
Securely handle configuration file content.

Requirements:

Read from config.json
Mark content as sensitive
Handle file errors
Validate JSON structure
Tasks:

Implement secure file reading
Add error handling
Validate file content
Create secure outputs