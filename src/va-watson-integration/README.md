# Watson Integration

## Description

An IBM Watson integration experiment looking at two AI services: the Language Translator and Watson Assistant.

## Screenshot

![Watson Integration](https://raw.githubusercontent.com/platform-experience/virtual-agent-library/master/src/va-watson-integration/images/va-watson-integration.png)

## Additional Information/Notes

The topic starts off with a greeting and then Watson uses the Language Identification API to detect the language of the user. The API supports the ability to identify up to 62 languages; [C-3PO](https://en.wikipedia.org/wiki/C-3PO) style. If English is not detected, Watson uses the [Language Translator](https://www.ibm.com/watson/services/language-translator/) to respond in the language of the user and hands them off to a representative to end the conversation. The other route is, English is detected from the user and a [Watson Assistant](https://www.ibm.com/cloud/watson-assistant/) dialog is activated. The assistant engages the user on a Customer Service sample skill around booking an appointment and offering store information. The conversation ends upon the user successfully booking an appointment with a date and phone number confirmation.

## Installation

Download and install update set **[va-watson-integration.u-update-set.xml](https://github.com/platform-experience/virtual-agent-library/blob/master/src/va-watson-integration/va-watson-integration.u-update-set.xml)**.

Required plugins: Glide Virtual Agent, Virtual Agent Designer.

After installation, the topic can be accessed via the `Virtual Agent > Designer` section for use and customization.

- SN Product Documentation - ['Load a customization from a single XML file'](https://docs.servicenow.com/bundle/kingston-application-development/page/build/system-update-sets/task/t_SaveAnUpdateSetAsAnXMLFile.html)

## Configuration

Create an account with [IBM Watson](https://www.ibm.com/watson) to get started. After that, create a service for both the Language Translator & Watson Assistant. From there you will need to fetch the API Key and URL that can be plugged into the REST API of the Virtual Agent for customization. The update set doesn't include the basic auth profile for the three REST messages (IBM Watson Identify Language, IBM Watson Language Translator, IBM Watson Assistant); those will need to be added with _apikey_ as the username and the actual API Key as the password from the corresponding Watson service.
