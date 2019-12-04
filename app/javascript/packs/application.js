import "bootstrap";
import { setupQuiz } from '../plugins/quiz'

if(document.querySelector('.quiz-answers')) {
  setupQuiz()

import { setupUserWordsForm } from '../plugins/create-user-word'

if (document.querySelector('form.new_user_word')) {
  setupUserWordsForm()
}
