# Watson Integration

## Description

A Virtual Agent conversation centered around an [IBM Watson](https://www.ibm.com/watson) integration; looking at two AI services: the Language Translator and Watson Assistant.

## Screenshot

![Watson Integration](https://raw.githubusercontent.com/platform-experience/virtual-agent-library/master/src/va-watson-integration/images/va-watson-integration.png)

## Additional Information/Notes

The topic starts off with a greeting and then Watson uses the Language Identification API to detect the language of the user. The API supports the ability to identify up to 62 languages; [C-3PO](https://en.wikipedia.org/wiki/C-3PO) style. If English is not detected, Watson uses the [Language Translator](https://www.ibm.com/watson/services/language-translator/) to respond in the language of the user and hands them off to a representative to end the conversation.

The other route is, English is detected from the user and a [Watson Assistant](https://www.ibm.com/cloud/watson-assistant/) dialog is activated. The assistant engages the user on a Customer Service sample skill around booking an appointment and offering store information. The conversation ends upon the user successfully booking an appointment with a date and phone number confirmation.

## Installation

Download and install update set **[va-watson-integration.u-update-set.xml](https://github.com/platform-experience/virtual-agent-library/blob/master/src/va-watson-integration/va-watson-integration.u-update-set.xml)**.

Required plugins: Glide Virtual Agent, Virtual Agent Designer.

After installation, the `Watson Integration` topic can be accessed via the `Virtual Agent > Designer` section for use and customization.

- SN Product Documentation - ['Load a customization from a single XML file'](https://docs.servicenow.com/bundle/madrid-application-development/page/build/system-update-sets/task/t_SaveAnUpdateSetAsAnXMLFile.html)

## Configuration

Sign up for an [IBM Cloud account](https://dataplatform.cloud.ibm.com/registration/stepone) or simply log in. After that, create a service for both the [Language Translator](https://www.ibm.com/watson/services/language-translator/) & [Watson Assistant](https://www.ibm.com/cloud/watson-assistant/). Get the API Key for both services for authentication in your ServiceNow instance.

In your instance, add a basic auth profile to the REST Messages provided in the update set: _IBM Watson Identify Language_, _IBM Watson Language Translator_ and _IBM Watson Assistant_. For each auth profile, add _apikey_ as the username and the actual API Key as the password.
