# Update Incident

## Description

A configurable Virtual Agent conversation to find and update a task-based record. Results are paginated. Once selected, the user can add a comment to the record.

## Screenshot

![Update Incident](https://raw.githubusercontent.com/platform-experience/virtual-agent-library/master/src/va-update-incident/images/va-update-incident.png)

## Installation

Download and install update set **[va-update-incident.u-update-set.xml](https://github.com/platform-experience/virtual-agent-library/blob/master/va-update-incident/va-update-incident.u-update-set.xml)**

Required Plugins: Glide Virtual Agent, Virtual Agent Designer.

After installation, the topic can be accessed in `Virtual Agent > Designer` for use and customization, and must be published/active to be made available to users.

## Configuration

Choose a task-based table in the 'Selection' node. Default: 'Incident'.

#### Script Variables

Query can be configured with `encoded_query`. Default: `active=true^caller_id=<user>`.

Results are ordered based on `order_by` and `order_desc`, and show field assigned as `display_field`.

Pagination of results can be controlled with `limit_per_page`.