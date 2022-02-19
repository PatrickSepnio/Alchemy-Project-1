import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = ['Contact.Twitter_Handle__c']

export default class TwitterHandlerLwc extends LightningElement {

    @api recordId
    twitterHandler = 'salesforceorg'
    get revoUrl() {
        return 'https://velocity-customization-5212-dev-ed--c.visualforce.com/apex/TwitterFeedPage?twitterHandle=${this.twitterHandler}'
    }

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredRecord({ error, data }) {

        if (data) {
            this.twitterHandler = data.fields.Twitter_Handle__c.value
        }
        if (error) {
            console.error(error)
        }
    }


}