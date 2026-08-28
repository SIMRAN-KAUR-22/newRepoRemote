import { LightningElement } from 'lwc';

export default class LifecycleHooks extends LightningElement {
    userName = 'Simran Kaur';
    handleNameChange(){
        this.userName = 'Billu';
    }
    constructor (){
        super();
        //console.log('Constructor called');
    }

    connectedCallback(){
        //console.log('Connected Callback called');
    }
    renderedCallback(){
        //console.log('Constructor called');
    }
    
    disconnectedCallback(){
        //console.log('Disconnected Callback called');
    }
    errorCallback    (error, stack){
        //console.log('Error Callback called');
}
}
    