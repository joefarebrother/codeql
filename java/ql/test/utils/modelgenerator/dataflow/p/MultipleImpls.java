package p;

import java.util.concurrent.Callable;

public class MultipleImpls {

  public static interface Strategy {
    // MaD=p;MultipleImpls$Strategy;true;doSomething;(String);;Argument[0];Argument[this];taint;df-generated
    // MaD=p;MultipleImpls$Strategy;true;doSomething;(String);;Argument[0];ReturnValue;taint;df-generated
    String doSomething(String value);
  }

  public static class Strat1 implements Strategy {
    public String doSomething(String value) {
      return value;
    }
  }

  // implements in different library should not count as impl
  public static class Strat3 implements Callable<String> {

    @Override
    public String call() throws Exception {
      return null;
    }
  }

  public static class Strat2 implements Strategy {
    private String foo;

    public String doSomething(String value) {
      this.foo = value;
      return "none";
    }

    // MaD=p;MultipleImpls$Strat2;true;getValue;();;Argument[this];ReturnValue;taint;df-generated
    public String getValue() {
      return this.foo;
    }
  }
}
