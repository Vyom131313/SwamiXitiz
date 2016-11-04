import { Component, ViewEncapsulation} from '@angular/core';

@Component({
  selector: 'Ch01Component',
  encapsulation: ViewEncapsulation.None,
  styles: [],
  template: `<span>This is Ch01 component</span>`
})

export class Ch01Component {

  constructor() {
  }

  ngOnInit() {
  }
}