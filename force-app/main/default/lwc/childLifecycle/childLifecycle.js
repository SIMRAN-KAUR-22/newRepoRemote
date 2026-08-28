import { LightningElement } from 'lwc';

export default class ChildLifecycle extends LightningElement {
    constructor (){
        super();
        console.log('CHILD Constructor called');
    }

    connectedCallback(){
        console.log('CHILD Connected Callback called');
    }
    renderedCallback(){
        console.log('CHILD rendered callback called');
    }

    disconnectedCallback() { 
        console.log('CHILD Disconnected Callback called');
    }
    errorCallback    (error, stack){
        console.log('Error Callback called');
}
}