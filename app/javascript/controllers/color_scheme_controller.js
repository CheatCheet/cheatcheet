import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  connect() {
    this.element.innerHTML = this.detectColorScheme()
  }

  switchColorScheme() {
    // const theme = this.detectColorScheme() === 'light' ? 'dark' : 'light'
    // localStorage.setItem('theme', theme)
    // document.documentElement.setAttribute('data-theme', theme)


    // const darkModeOn = this.detectColorScheme() === 'light' ? false : true
    // document.documentElement.classList.toggle('dark-mode', darkModeOn)
    // this.element.innerHTML = this.detectColorScheme() === 'dark' ? 'dark' : 'light'
  }

  detectColorScheme() {
    let theme = 'light' //default to light

    //local storage is used to override OS theme settings
    if (localStorage.getItem('theme')) {
      if (localStorage.getItem('theme') == 'dark') {
        theme = 'dark'
      }
    } else if (!window.matchMedia) {
      //matchMedia method not supported ==> //return false
      theme = 'light'
    } else if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
      //OS theme setting detected as dark
      theme = 'dark'
    }

    return theme
  }
}
