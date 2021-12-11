import { Controller } from '@hotwired/stimulus'
import SlimSelect from 'slim-select'
require('slim-select/dist/slimselect.css')

export default class extends Controller {
  connect() {
    this.select = new SlimSelect({
      select: this.element,
      addable: function (value) {
        return value
      },
    })
  }
}
