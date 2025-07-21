import java.awt.EventQueue;

public class NekoMain {
  /**
   * @param args the command line arguments
   */
  public static void main(String args[]) {
    EventQueue.invokeLater(new Runnable() {
      public void run() { new Neko(); }
    });
  }
}
