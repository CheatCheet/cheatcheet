// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import * as ActiveStorage from '@rails/activestorage'

import '@hotwired/turbo-rails'
import 'controllers'

import 'trix'
import '@rails/actiontext'

ActiveStorage.start()
