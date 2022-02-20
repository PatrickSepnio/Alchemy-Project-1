import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = ['Contact.Twitter_Handle__c']
export default class TwitterHandlerLwc extends LightningElement {

    @api recordId

    //getter to return url to twitter feed. Uses default value or reactive value based on wire service
    twitterHandler = 'salesforceorg'
    get fullUrl() {
        console.log(this.twitterHandler);
        return `https://velocity-customization-5212-dev-ed--c.visualforce.com/apex/TwitterFeedPage?twitterHandle=${this.twitterHandler}`
    }

    //use Wire adapter w/ LDS to get user's twitter handle
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