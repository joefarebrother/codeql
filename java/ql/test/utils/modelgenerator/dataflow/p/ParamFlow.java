package p;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

public class ParamFlow {

  // MaD=p;ParamFlow;true;returnsInput;(String);;Argument[0];ReturnValue;taint;df-generated
  public String returnsInput(String input) {
    return input;
  }

  public int ignorePrimitiveReturnValue(String input) {
    return input.length();
  }

  // MaD=p;ParamFlow;true;returnMultipleParameters;(String,String);;Argument[0];ReturnValue;taint;df-generated
  // MaD=p;ParamFlow;true;returnMultipleParameters;(String,String);;Argument[1];ReturnValue;taint;df-generated
  public String returnMultipleParameters(String one, String two) {
    if (System.currentTimeMillis() > 100) {
      return two;
    }
    return one;
  }

  // MaD=p;ParamFlow;true;returnArrayElement;(String[]);;Argument[0].ArrayElement;ReturnValue;taint;df-generated
  public String returnArrayElement(String[] input) {
    return input[0];
  }

  // MaD=p;ParamFlow;true;returnVarArgElement;(String[]);;Argument[0].ArrayElement;ReturnValue;taint;df-generated
  public String returnVarArgElement(String... input) {
    return input[0];
  }

  // MaD=p;ParamFlow;true;returnCollectionElement;(List);;Argument[0].Element;ReturnValue;taint;df-generated
  public String returnCollectionElement(List<String> input) {
    return input.get(0);
  }

  // MaD=p;ParamFlow;true;returnIteratorElement;(Iterator);;Argument[0].Element;ReturnValue;taint;df-generated
  public String returnIteratorElement(Iterator<String> input) {
    return input.next();
  }

  // MaD=p;ParamFlow;true;returnIterableElement;(Iterable);;Argument[0].Element;ReturnValue;taint;df-generated
  public String returnIterableElement(Iterable<String> input) {
    return input.iterator().next();
  }

  public Class<?> mapType(Class<?> input) {
    return input;
  }

  // MaD=p;ParamFlow;true;writeChunked;(byte[],OutputStream);;Argument[0];Argument[1];taint;df-generated
  public void writeChunked(byte[] data, OutputStream output) throws IOException {
    output.write(data, 0, data.length);
  }

  // MaD=p;ParamFlow;true;writeChunked;(char[],OutputStream);;Argument[0];Argument[1];taint;df-generated
  public void writeChunked(char[] data, OutputStream output) throws IOException {
    output.write(String.valueOf(data).getBytes(), 0, data.length);
  }

  // MaD=p;ParamFlow;true;addTo;(String,List);;Argument[0];Argument[1].Element;taint;df-generated
  public void addTo(String data, List<String> target) {
    target.add(data);
  }
}
