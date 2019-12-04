import "bootstrap";
import { setupQuiz } from '../plugins/quiz'

if(document.querySelector('.quiz-answers')) {
  setupQuiz()
}
