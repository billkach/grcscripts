

# Script Name                           foldergenerator_CSF_functionbasedversion.ps1
#
# Authors                               Bill Kachersky
#
# Date of last revision                 07/07/2022
#
# Description of purpose                This script allows the user to quickly create 
#                                       the directory structure for NIST CSF's domains, 
#                                       categories, and subcategories for keeping documentation 
#                                       organized by subcategory during the evidence collection 
#                                       phase of a security assessment based on CSF.
#
# Tips                                - Your filepath can be quickly copied by browsing to the 
#                                       folder where you want the directory tree to reside in, 
#                                       then clicking 'Copy Path' in the Home Ribbon. 
#
#                                     - If you are unable to run scripts on your machine,
#                                       try to copy and paste the code itself from the "# Main" 
#                                       section of the "foldergenerator_CSF_sansfunction.ps1" 
#                                       version of this script. That should work, hopefully.
#
#                                       Enjoy!


# Functions

function CSF_Folder {
    $FolderName=Read-Host -Prompt "Please specify the project name for the parent folder"
    $FolderPath=Read-Host -Prompt "Please specify the filepath where you would like this folder to reside"
    New-Item -Type Directory -Path "$FolderPath\$FolderName"


# Variable
    $CatFolder = "$FolderPath\$FolderName"


# Identify 
    New-Item -Type Directory -Path "$CatFolder\Identify (ID)"
    $ID_Folder="$CatFolder\Identify (ID)"
# Generate Categories
    'Asset Management (ID.AM)',`
    'Business Environment (ID.BE)',`
    'Governance (ID.GV)',`
    'Risk Assessment (ID.RA)',`
    'Risk Management Strategy (ID.RM)',`
    'Supply Chain Risk Management (ID.SC)'`
    | ForEach-Object {New-Item -Path "$ID_Folder\$_" -Type 'Directory'}
# Generate Subcategories  
    1..6 | ForEach-Object {mkdir "$ID_Folder\Asset Management (ID.AM)\ID.AM-$_"}
    1..5 | ForEach-Object {mkdir "$ID_Folder\Business Environment (ID.BE)\ID.BE-$_"}
    1..4 | ForEach-Object {mkdir "$ID_Folder\Governance (ID.GV)\ID.GV-$_"}
    1..6 | ForEach-Object {mkdir "$ID_Folder\Risk Assessment (ID.RA)\ID.RA-$_"}
    1..3 | ForEach-Object {mkdir "$ID_Folder\Risk Management Strategy (ID.RM)\ID.RM-$_"}
    1..5 | ForEach-Object {mkdir "$ID_Folder\Supply Chain Risk Management (ID.SC)\ID.SC-$_"}


# Protect
    New-Item -Type Directory -Path "$CatFolder\Protect (PR)"
    $PR_Folder="$CatFolder\Protect (PR)"
# Generate Categories
    'Identity Management, Authentication and Access Control (PR.AC)',`
    'Awareness and Training (PR.AT)',`
    'Data Security (PR.DS)',`
    'Information Protection Processes and Procedures (PR.IP)',`
    'Maintenance (PR.MA)',`
    'Protective Technology (PR.PT)'`
    | ForEach-Object {New-Item -Path "$PR_Folder\$_" -Type 'Directory'}
# Generate Subcategories  
    1..7 | ForEach-Object {mkdir "$PR_Folder\Identity Management, Authentication and Access Control (PR.AC)\PR.AC-$_"}
    1..5 | ForEach-Object {mkdir "$PR_Folder\Awareness and Training (PR.AT)\PR.AT-$_"}
    1..8 | ForEach-Object {mkdir "$PR_Folder\Data Security (PR.DS)\PR.DS-$_"}
    1..12 | ForEach-Object {mkdir "$PR_Folder\Information Protection Processes and Procedures (PR.IP)\PR.IP-$_"}
    1..2 | ForEach-Object {mkdir "$PR_Folder\Maintenance (PR.MA)\PR.MA-$_"}
    1..5 | ForEach-Object {mkdir "$PR_Folder\Protective Technology (PR.PT)\PR.PT-$_"}


# Detect 
    New-Item -Type Directory -Path "$CatFolder\Detect (DE)"
    $DE_Folder="$CatFolder\Detect (DE)"
# Generate Categories
    'Anomalies and Events (DE.AE)',`
    'Security Continuous Monitoring (DE.CM)',`
    'Detection Processes (DE.DP)'`
    | ForEach-Object {New-Item -Path "$DE_Folder\$_" -Type 'Directory'}
# Generate Subcategories  
    1..5 | ForEach-Object {mkdir "$DE_Folder\Anomalies and Events (DE.AE)\DE.AE-$_"}
    1..8 | ForEach-Object {mkdir "$DE_Folder\Security Continuous Monitoring (DE.CM)\DE.CM-$_"}
    1..5 | ForEach-Object {mkdir "$DE_Folder\Detection Processes (DE.DP)\DE.DP-$_"}


# Respond 
    New-Item -Type Directory -Path "$CatFolder\Respond (RS)"
    $RS_Folder="$CatFolder\Respond (RS)"
# Generate Categories
    'Response Planning (RS.RP)',`
    'Communications (RS.CO)',`
    'Analysis (RS.AN)',`
    'Mitigation (RS.MI)',`
    'Improvements (RS.IM)'`
    | ForEach-Object {New-Item -Path "$RS_Folder\$_" -Type 'Directory'}
# Generate Subcategories  
    mkdir "$RS_Folder\Response Planning (RS.RP)\RS.RP-1"
    1..5 | ForEach-Object {mkdir "$RS_Folder\Communications (RS.CO)\RS.CO-$_"}
    1..5 | ForEach-Object {mkdir "$RS_Folder\Analysis (RS.AN)\RS.AN-$_"}
    1..3 | ForEach-Object {mkdir "$RS_Folder\Mitigation (RS.MI)\RS.MI-$_"}
    1..2 | ForEach-Object {mkdir "$RS_Folder\Improvements (RS.IM)\RS.IM-$_"}


# Recover
    New-Item -Type Directory -Path "$CatFolder\Recover (RC)"
    $RC_Folder="$CatFolder\Recover (RC)"
# Generate Categories
    'Recovery Planning (RC.RP)',`
    'Improvements (RC.IM)',`
    'Communications (RC.CO)'`
    | ForEach-Object {New-Item -Path "$RC_Folder\$_" -Type 'Directory'}
# Generate Subcategories  
    mkdir "$RC_Folder\Recovery Planning (RC.RP)\RC.RP-1"
    1,2 | ForEach-Object {mkdir "$RC_Folder\Improvements (RC.IM)\RC.IM-$_"}
    1..3 | ForEach-Object {mkdir "$RC_Folder\Communications (RC.CO)\RC.CO-$_"}

}


# Main

Write-Host `
"Hello! This script is meant to help you quickly `
generate a directory tree for storing evidence submitted during `
a security assessment that leverages the NIST CSF Framework. `
If this is what you would like to do, `
please follow the instructions below."

Start-Sleep -Seconds 1

CSF_Folder

Write-Host "Process Complete."

# End