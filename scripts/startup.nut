function testfunction() {
    while(true) {
        logo <- FloatingImage("images/objects/logo/logo_final.sprite");
        logo.set_anchor_point(ANCHOR_LEFT);
        logo.set_pos(70, 0);
        logo.set_visible(true);
        wait(1)
    }
}

::testthread <- newthread(testfunction)
testthread.call()