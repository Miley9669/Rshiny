#Can see the underlying html code by running the code outside of shiny app#

fluidPage(
  textInput("name", "What's your name?")
)


fluidPage(
  HTML(r"(
       <h1>This is a heading</h1>
       <p class="my-class">This is some text!</p>
       <ul>
       <li>First bullet</li>
       <li>Second bullet</li>
       </ul>
  )")
)
