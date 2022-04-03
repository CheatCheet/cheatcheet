import { Controller } from '@hotwired/stimulus'
import SlimSelect from 'slim-select'

export default class extends Controller {
  connect() {
    const base = { select: this.element, closeOnSelect: false }
    const addSection = this.addableOption()
    const selectOptions = {
      ...base,
      ...addSection
    }

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
