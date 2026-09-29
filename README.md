# CRICKSTATS — Cricket Player Performance Tracking Application

Salesforce DX project based on the supplied CRICKSTATS specification.

## Core data model
- Player__c: parent/master object
- Match_Performance__c: child/detail object
- Match Performance has a Master-Detail relationship to Player.
- Roll-up summary fields on Player calculate matches, 50s, 100s, fours, sixes, runs, overs, wickets, stumpings and catches.
- Lookup from Player to Match Performance is included only as an optional reference because Salesforce roll-up summaries require the child-to-parent Master-Detail relationship.

## Included source
- Custom objects
- Player and Match Performance fields
- Master-detail relationship
- Roll-up summary fields
- Validation rules
- Apex trigger/service for derived performance metrics
- Apex unit tests
- Permission set
- Report metadata
- Deployment documentation

## Salesforce Setup items
The source document also specifies a Lightning App named CRICKSTATS, custom tabs,
a Screen Flow named Player Flow, and placement of that flow on the CRICKSTATS Home page.
These can be created/activated in Setup after deploying the source.

## Deploy
sf org login web --alias crickstats
sf project deploy start --source-dir force-app --target-org crickstats
sf apex run test --target-org crickstats --test-level RunLocalTests --wait 10
