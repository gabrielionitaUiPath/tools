$services = @(
  "Action Center",
  "AI Center",
  "Audit",
  "Authorization", 
  "Automation Hub", 
  "Automation Solutions",
  "Autopilot for Everyone",
  "Business Apps",
  "Data Service",
  "Document Understanding",
  "Experiences",
  "Governance",
  "Identity Service",
  "Insights",
  "Integration Service",
  "License Accountant",
  "LLM Gateway",
  "LLMOps",
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
  "Process Mining"       = @("Accessibility", "Apollo lab", "Apps team PMC", "Backend PMC", "Compliance", "Connector", "Documentation", "End-2-End Tests PMC", "External", "Frontend PMC", "PMC Cross team", "PMC DevOps", "PMT", "Product", "Security")
}
$summary = "Run Athena tests in inner loop"
$parentIssueKey = "QA-2482"
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
              "text": "Your service doesn’t seem to be running Athena tests in the CI pipeline, please configure it to run Athena tests against your service."
            }
          ]
        },
        {
          "type": "paragraph",
          "content": [
            {
              "type": "text",
              "text": "Details about how to adopt Athena in the Inner Loop can be found "
            },
            {
              "type": "text",
              "text": "here",
              "marks": [
                {
                  "type": "link",
                  "attrs": {
                    "href": "https://github.com/UiPath/testsfagents/"
                  }
                }
              ]
            },
            {
              "type": "text",
              "text": ". A high level overview of the Athena contract can be found "
            },
            {
              "type": "text",
              "text": "here",
              "marks": [
                {
                  "type": "link",
                  "attrs": {
                    "href": "https://uipath.atlassian.net/wiki/spaces/CLD/pages/87211479865/Project+Athena+-+Motivation+and+Design"
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
          "type": "paragraph"
        },
        {
          "type": "paragraph",
          "content": [
            {
              "type": "text",
              "text": "Quality asks are explained in "
            },
            {
              "type": "text",
              "text": "Quality asks for MER",
              "marks": [
                {
                  "type": "link",
                  "attrs": {
                    "href": "https://uipath.atlassian.net/wiki/spaces/~5bbf1a3b05166a4324709eae/pages/87982637268/Quality+asks+for+MER"
                  }
                }
              ]
            },
            {
              "type": "text",
              "text": " document. For any questions or further assistance, please reach out in the channel: "
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