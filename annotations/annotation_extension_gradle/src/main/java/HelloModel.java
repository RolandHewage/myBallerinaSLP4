class HelloModel {

    private static HelloModel instance = new HelloModel();
    private String greeting;

    private HelloModel() {
    }

    static HelloModel getInstance() {
        return instance;
    }

    String getGreetings() {
        return greeting;
    }

    void setGreeting(String greeting) {
        this.greeting = greeting;
    }
}