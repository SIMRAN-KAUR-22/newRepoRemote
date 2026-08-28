import { LightningElement } from 'lwc';

export default class TextChangeOnClick extends LightningElement {
    userName = 'Simran';
    handleNameChange(){
        this.userName = 'Billu';
}
}