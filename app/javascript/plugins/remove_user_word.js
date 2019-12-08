const noThanksClicked = (event) => {
  event.preventDefault()

  const removed = event.target.dataset.removed
  // set it in the form
  const hiddenInput = document.getElementById('user_word_removed')
  hiddenInput.value = removed

  // now we can submit the form
  document.querySelector('form.new_user_word').submit()
}


const setupNoThanks = () => {
  // wire up event listeners
  const buttons = document.querySelectorAll('[data-removed]')
  buttons.forEach((button) => {
    button.addEventListener('click', noThanksClicked)
  })
}

export { setupNoThanks }
