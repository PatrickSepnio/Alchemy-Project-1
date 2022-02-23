import { LightningElement, api, wire } from 'lwc';
//LDS service module to interact with records (decorate with @wire to invoke it's methods)
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = ['Contact.Twitter_Handle__c']
export default class TwitterHandlerLwc extends LightningElement {

    //exposes recordId field as a public property
    @api recordId

    //default twitter handle 
    twitterHandler = '/salesforceorg';
    //getter to return full url for twitter feed, uses wire service data or default value above
    get fullUrl() {
        console.log(this.twitterHandler);
        return `https://velocity-customization-5212-dev-ed--c.visualforce.com/apex/TwitterFeedPage?twitterHandle=${this.twitterHandler}`
    }

    //use wire service to invoke uiRecordApi's getRecord method
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredRecord({ error, data }) {
        if (data) {
            this.twitterHandler = data.fields.Twitter_Handle__c.value //get records Twitter Handle value
        }
        if (error) {
            console.error(error)
        }
    }
}