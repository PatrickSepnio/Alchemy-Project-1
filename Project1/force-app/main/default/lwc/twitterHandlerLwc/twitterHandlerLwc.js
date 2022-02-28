/*
Description: Twitter Feed Page component to display a Twitter timeline. In the org, the timeline will display based on Twitter Handle field value, 
or it will use a default value if that field is not set.  
*/

import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import TWIITTER_HANDLE from '@salesforce/schema/Contact.Twitter_Handle__c'; //import field from object
export default class TwitterHandlerLwc extends LightningElement {

    //expose recordId field as public property
    @api recordId
    //assign a default company value for experience cloud site or users with no Twitter handle
    twitterHandler;
    //get url for twitter feed, use twitterHandle from wire service or default
    get fullUrl() {
        if (this.twitterHandler == null) {
            this.twitterHandler = 'salesforceorg';
        }
        return `https://wise-hawk-gpqvd0-dev-ed--c.visualforce.com/apex/TwitterFeedPage?twitterHandle=${this.twitterHandler}`
    }

    //use wire adapter to invoke 'getRecord' and assign Twitter Handle value from the users Contact record
    @wire(getRecord, { recordId: '$recordId', fields: TWIITTER_HANDLE })
    wiredRecord({ error, data }) {
        if (data) {
            this.twitterHandler = data.fields.Twitter_Handle__c.value //assign Twitter Handle field value from Contact object
        }
        if (error) {
            this.twitterHandler = 'salesforceorg'
            console.error(error)
        }
    }

    firstName = '';
    lastName = '';

    handleChange(event) {
        const field = event.target.name;
        if (field === 'firstName') {
            this.firstName = event.target.value;
        } else if (field === 'lastName') {
            this.lastName = event.target.value;
        }
    }

    get uppercasedFullName() {
        return `${this.firstName} ${this.lastName}`.toUpperCase();
    }
}