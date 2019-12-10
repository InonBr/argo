import "bootstrap";
import { setUpQuiz } from '../plugins/quiz'

if(document.querySelector('.quiz-answers')) {
  setUpQuiz()
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

// we tried to do change the border of the navbar - but it's too complicated because the svg is rendered as a bg image
// const bg = document.querySelector(".page-render");
// const bgColor = getComputedStyle(bg.firstElementChild)['background-color'];

// const navbar = document.querySelector('.navbar')
// navbar.style.
