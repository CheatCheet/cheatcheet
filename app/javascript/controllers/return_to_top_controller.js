import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  // REF: https://www.codegrepper.com/code-examples/javascript/how+to+detect+scroll+up+and+scroll+down+in+javascript
  connect() {
    this.lastScrollTop = 0;
  }

  onScroll() {
    if (this.deactivateScrollingEvent)
      return

    const scrollTop = window.pageYOffset || document.documentElement.scrollTop

    if ((scrollTop > this.lastScrollTop) || (scrollTop == 0)) {
      this.element.classList.remove('active')
    } else {
      this.element.classList.add('active')
    }

    this.lastScrollTop = scrollTop <= 0 ? 0 : scrollTop
  }

  proceed() {
    this.deactivateScrollingEvent = true
    document.body.scrollTop = 0 // For Safari
    document.documentElement.scrollTop = 0 // For Chrome, Firefox, IE and Opera
    this.element.classList.remove('active')

    setTimeout(() => {
      this.deactivateScrollingEvent = false
    }, 10)
  }
}
