import "bootstrap";
import { setUpQuiz } from '../plugins/quiz'

if(document.querySelector('.quiz-answers')) {
  setUpQuiz()
}

import { setupUserWordsForm } from '../plugins/create-user-word'
import { setupCardFlipper } from '../plugins/flip-word-card'

if (document.querySelector('form.new_user_word')) {
  setupUserWordsForm()
}

if (document.querySelector('.flipper')) {
  setupCardFlipper()
}
