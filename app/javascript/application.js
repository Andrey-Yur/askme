// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("DOMContentLoaded", () => {
    console.log("DOM готов!");
    const flashMsg =  document.querySelector('.message')
    if (flashMsg !=null) setTimeout(()=>{
        flashMsg.remove()
    },2000)
});

