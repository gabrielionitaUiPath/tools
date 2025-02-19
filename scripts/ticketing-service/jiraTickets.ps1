$services = @(
    "Action Center" ,
    "AI Center",
    "Audit",
    "Authorization", 
    "Automation Hub", 
    "Business Apps", 
    "Data Service", 
    "Document Understanding",
    "Experiences",
    "Governance",
    "Identity Service",
    "Insights",
    "Integration Service",
    "License Accountant",
    "Location Service",
    "Message Bus",
    "Notification Service",
    "Orchestrator",
    "Organization Management Service",
    "Process Mining",
    "Resource Catalog Service",
    "RoboTube",
    "Serverless",
    "Studio Web",
    "Task Mining",
    "Test Manager",
    "Webhooks"
)
$servicesMapping = @{
    "Serverless" = "Automation Suite Robots (Serverless)"
}
$componentsMapping = @{
    "Action Center"        = @("Accessibility", "Apps", "CommonInfra", "Engineering", "FedRAMP", "Notification Service", "Persistence Activities", "Processes UI", "Tasks UI")
    "Notification Service" = @("Notification Service")
}
$summary = "AS Automated Sign Off"
$parentIssueKey = "QA-2723"
$labels = @("MER", "Athena")
$description = @'
{
    "type": "doc",
    "version": 1,
    "content": [
      {
        "type": "paragraph",
        "content": [
          {
            "type": "text",
            "text": "We want that to release Automation Suite based solely on Athena tests; this will help us improve quality, scale the tests execution, reduce testing time and cut down costs."
          }
        ]
      },
      {
        "type": "paragraph",
        "content": [
          {
            "type": "text",
            "text": "For this purpose, each team should strive to achieve Automated Sign Off."
          }
        ]
      },
      {
        "type": "paragraph",
        "content": [
          {
            "type": "text",
            "text": "You can declare that you will perform Automated Sign Off either by letting the Eng Sys team know on the "
          },
          {
            "type": "text",
            "text": "#proj-athena-as-test-framework",
            "marks": [
              {
                "type": "link",
                "attrs": {
                  "href": "https://uipath.enterprise.slack.com/archives/C05511QHA67"
                }
              }
            ]
          },
          {
            "type": "text",
            "text": " channel, or, when asked by the AS team, before a CU, whichever comes first. "
          }
        ]
      },
      {
        "type": "paragraph",
        "content": [
          {
            "type": "hardBreak"
          },
          {
            "type": "text",
            "text": "More details about this can be found in the "
          },
          {
            "type": "text",
            "text": "Quality asks for MER document",
            "marks": [
              {
                "type": "link",
                "attrs": {
                  "href": "https://uipath.atlassian.net/wiki/spaces/~5bbf1a3b05166a4324709eae/pages/87982637268/Quality+asks+for+MER#5.-Define-a-list-of-critical-scenarios-for-all-components%2Fproducts-and-test-them-(Critical_Scenarios)"
                }
              }
            ]
          },
          {
            "type": "text",
            "text": "."
          }
        ]
      },
      {
        "type": "paragraph",
        "content": [
          {
            "type": "text",
            "text": "For any questions or further assistance, please reach out in the channel: "
          },
          {
            "type": "text",
            "text": "#proj-athena-as-test-framework",
            "marks": [
              {
                "type": "link",
                "attrs": {
                  "href": "https://uipath.enterprise.slack.com/archives/C05511QHA67"
                }
              }
            ]
          },
          {
            "type": "text",
            "text": "."
          }
        ]
      },
      {
        "type": "paragraph",
        "content": [
          {
            "type": "text",
            "text": "IMPORTANT: Please add a remediation ETA in the Due Date field. This will be reflected in the MER Dashboard. Thank you!"
          }
        ]
      }
    ]
  }
'@ | ConvertFrom-Json
$request = New-RequestBody -Services $services -Description $description -Summary $summary -Labels $labels -ParentIssueKey $parentIssueKey | ConvertFrom-Json
foreach ($issue in $request.issues) { 
    if ($servicesMapping[$issue.service]) {
        $issue.summary = $issue.summary -replace $issue.service, $servicesMapping[$issue.service]
    }
    if ($componentsMapping[$issue.service]) {
        $issue.components = $componentsMapping[$issue.service]
    }
}
$request | ConvertTo-Json -Depth 10 | Out-File "temp.json"