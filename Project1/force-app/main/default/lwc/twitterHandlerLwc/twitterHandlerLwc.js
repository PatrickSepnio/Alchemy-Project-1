import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi'; //LDS service module to interact with records (decorate with @wire to invoke it's methods)

//set fields to interact with
const FIELDS = ['Contact.Twitter_Handle__c']
export default class TwitterHandlerLwc extends LightningElement {

    //expose recordId field as public property
    @api recordId

    //default twitter handle 
    twitterHandler = 'salesforceorg';

    //get full url for twitter feed, use data from wire service or default
    get fullUrl() {

        return `https://velocity-customization-5212-dev-ed--c.visualforce.com/apex/TwitterFeedPage?twitterHandle=${this.twitterHandler}`
    }

    //use wire service to invoke uiRecordApi's getRecord method
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredRecord({ error, data }) {
        if (data) {
            this.twitterHandler = data.fields.Twitter_Handle__c.value //assign Twitter Handle value from Contact object
        }
        if (error) {
            console.error(error)
        }
    }
}