import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import SystemModstamp from '@salesforce/schema/Account.SystemModstamp';

const FIELDS = ['Contact.Twitter_Handle__c']

export default class TwitterHandlerLwc extends LightningElement {

    @api recordId

    //return full twitter url with default value or reactive value based on wire service
    twitterHandler = 'salesforceorg';
    get fullUrl() {
        return 'https://velocity-customization-5212-dev-ed--c.visualforce.com/apex/TwitterFeedPage?twitterHandle=$this.twitterHandler';
    }

    //use Wire adapter w/ lightning data service to get users twitter handle field from Contact object
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredRecord({ error, data }) {

        if (data) {
            console.log(data.fields.Twitter_Handle__c.value);
            this.twitterHandler = data.fields.Twitter_Handle__c.value;
        }
        if (error) {
            console.error(error);
        }
    }
}