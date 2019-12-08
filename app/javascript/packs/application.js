import "bootstrap";
import { setupQuiz } from '../plugins/quiz'

if(document.querySelector('.quiz-answers')) {
  setupQuiz()
}

import { setupUserWordsForm } from '../plugins/create-user-word'
import { setupCardFlipper } from '../plugins/flip-word-card'
import { setupNoThanks } from '../plugins/remove_user_word'

if (document.querySelector('form.new_user_word')) {
  setupUserWordsForm()
  setupNoThanks()
}

if (document.querySelector('.flipper')) {
  setupCardFlipper()
}

