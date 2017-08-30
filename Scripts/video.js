var vid = $("video")[0];

if (window.matchMedia('(prefers-reduced-motion)').matches) {
    vid.removeAttribute("autoplay");
}

function vidFade() {
    vid.classList.add("stopfade");
}

vid.addEventListener('ended', function () {
    // only functional if "loop" is removed 
    vid.pause();
    // to capture IE10
    vidFade();
});


pauseButton.addEventListener("click", function () {
    vid.classList.toggle("stopfade");
})