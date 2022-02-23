import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi'; //import LDS user interface Api

//load Twitter Handle field
const FIELDS = ['Contact.Twitter_Handle__c']
export default class TwitterHandlerLwc extends LightningElement {

    //expose recordId field as public property
    @api recordId
    //assign a default twitter handle 
    twitterHandler = 'salesforce';
    //get url for twitter feed, use twitterHandle from wire service or default
    get fullUrl() {

        return `https://velocity-customization-5212-dev-ed--c.visualforce.com/apex/TwitterFeedPage?twitterHandle=${this.twitterHandler}`
    }

    //use wire adapter to invoke 'getRecord' method
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