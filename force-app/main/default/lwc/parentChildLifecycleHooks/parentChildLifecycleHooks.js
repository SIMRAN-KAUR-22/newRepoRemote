import { LightningElement } from 'lwc';

export default class ParentChildLifecycleHooks extends LightningElement {
    constructor (){
        super();
        console.log('PARENT Constructor called');
    }

    connectedCallback(){
        console.log('PARENT Connected Callback called');
    }
    renderedCallback(){
        console.log('PARENT rendered callback called');
    }

    disconnectedCallback() { 
        console.log('PARENT Disconnected Callback called');
    }
    errorCallback    (error, stack){
        console.log('Error Callback called');
}
}
