export function getElement(icon: string): HTMLElement {
  const element = document.createElement('a')

  element.classList.add(`icon-${icon}`)

  element.appendChild(document.createTextNode(''))

  return element
}
