const buttonClicked = (event) => {
  event.preventDefault()
  // what is the value of 'knew'?
  const knew = event.target.dataset.knew
  // set it in the form
  const hiddenInput = document.getElementById('user_word_knew')
  hiddenInput.value = knew

  // now we can submit the form
  document.querySelector('form.new_user_word').submit()
}


const setupUserWordsForm = () => {
  // wire up event listeners
  const buttons = document.querySelectorAll('[data-knew]')
  buttons.forEach((button) => {
    button.addEventListener('click', buttonClicked)
  })
}

export { setupUserWordsForm }
