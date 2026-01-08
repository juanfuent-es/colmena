import mitt from 'mitt';

window.RAF = mitt();

function animate(time) {
    requestAnimationFrame(animate);
    window.RAF.emit('animate', time)
}

animate(0);