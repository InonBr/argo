import "bootstrap";

import { setupUserWordsForm } from '../plugins/create-user-word'

if (document.querySelector('form.new_user_word')) {
  setupUserWordsForm()
}
