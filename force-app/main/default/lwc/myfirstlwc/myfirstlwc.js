import { LightningElement, api, wire } from 'lwc';
import fetchRecord from '@salesforce/apex/AccountController.fetchRecordApex';
import fetchRecordName from '@salesforce/apex/AccountController.fetchRecordNameApex';
export default class Myfirstlwc extends LightningElement {
    @api recordId;
    simranText = 'Simran';
    accountUI;
    //Method 1 to use wire
    @wire(fetchRecord, { recordIdApex: '$recordId'}) fetchRecordUI;

    //this.fetchRecordUI.data;
    //this.fetchRecordUI.error

    //Method 2
    /*@wire(fetchRecord, { recordIdApex: '$recordId'}) fetchRecordUI2({data, error}) {
        console.log('recordId: ' + this.recordId);
        console.log('fetchRecordUI2: ' + this.fetchRecordUI2);
        console.log('>> '+this.simranText);
        if (data) {
            console.log(data);
        } else if (error) {
            console.log(error);
        }
    }*/

    connectedCallback() {
        console.log('from connected callback !!');
        //console.log('details here are '+this.fetchRecordUI.data);
        this.loadAccount();
        this.loadAccountBasedoName();
    }

    renderedCallback() {
        console.log('from renfdered callback !!');
        console.log('details here are '+this.fetchRecordUI.data);
    }

    loadAccount(){
        fetchRecord({recordIdApex: this.recordId})
        .then(result => {
            console.log('result: ' + result);
            console.log('result: stringified' + JSON.stringify(result));
            this.accountUI = result;
        })
        .catch(error => {
            console.log('error: ' + JSON.stringify(error));
        });
    }

    loadAccountBasedoName(){
        fetchRecordName({nameApex: this.simranText})
        .then(result => {
            var temp = 10;
            console.log('method 2 ' + result +temp);
            console.log('method 2 ' + JSON.stringify(result));
            this.accountUI = result;
        })
        .catch(error => {
            console.log('error: ' + JSON.stringify(error));
        });
    }
}

//assignment
//pass this.simranText in wire and see
//explore how to get recordid in connectedcallback and wire
//write all methods of lifecyclehooks - render, disccsonnected


//communication to and from apex
//parent to child, child to parent communication
//get the record id on record page componenta and quick action modal
//wire methods - LDS