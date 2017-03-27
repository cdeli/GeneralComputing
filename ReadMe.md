# General Computing

## FindPII.ps1

This script searches all files under "C:\Users\" for all PII in relation to CC's and SSN's. It saves all files in a
CSV file under a folder it creates at the root of C:. Once it finises, it saves all the information to the CSV and
sends an email to the desired location with the attached CSV. Once the email is sent it force removes the folder and
CSV from existance.

This also saves the CSV file as the computer name.