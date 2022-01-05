import { Controller } from '@hotwired/stimulus'
import SlimSelect from 'slim-select'
require('slim-select/dist/slimselect.css')

export default class extends Controller {
  connect() {
    const base = { select: this.element, closeOnSelect: false }
    const addSection = this.addableOption()
    const selectOptions = {
      ...base,
      ...addSection
    }
    debugger

    this.select = new SlimSelect(selectOptions)
  }

  addableOption() {
    if (this.element.dataset.addable === 'true') {
      return {
        addable: function (value) {
          return {
            text: value,
            value: value.toLowerCase(),
          }
        },
      }
    } else {
      return {}
    }
  }
}
