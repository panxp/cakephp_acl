<?php
class HelloShell extends AppShell {
    public function main() {
        $this->out('Hello world.');
    }
    public function startup() {
        $this->out('startup'.__LINE__);
    }
    
}
