// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import * as ActiveStorage from '@rails/activestorage'
import Rails from '@rails/ujs'
import 'channels'
import '@hotwired/turbo-rails'
import '../controllers/index'
import 'trix'
import '@rails/actiontext'
import 'simpledotcss'

//icons
import '@fortawesome/fontawesome-free/css/all'

Rails.start()
ActiveStorage.start()
