import { LightningElement } from 'lwc';

export default class ComponentA extends LightningElement {
parentUserName;
handleClick(event) {
    this.parentUserName = this.refs.userName.value;
}   

}