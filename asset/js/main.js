import * as jQuery from 'jquery'
import {EventEmitter} from 'events'

class Main extends EventEmitter {

  constructor() {
    this.on('ready', (e)=> {
      console.log("ES6 is working!");
    });
  }
}

var app = new Main();
jQuery(document).ready((e) => app.emit('ready', e));

global.jQuery = jQuery;
global.app = app;
