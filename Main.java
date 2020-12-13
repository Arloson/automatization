import java.io.File;
import java.io.IOException;
import java.util.Stack;
public class Main {
    public static void main(String[] args) throws IOException {
        File f = new File(args[0]);
        Stack<File> stack = new Stack<>();
        stack.push(f);
        while (!stack.isEmpty()){
            File root = stack.pop();
            boolean listFiles = root.listFiles() != null;
            if (listFiles){
                File list[] = root.listFiles();
                for (File file: list){
                    stack.push(file);
                }
            }else{
                if(root.getAbsolutePath().contains(args[1])){
                    System.err.println(root.getAbsolutePath());

                }
            }

        }

    }
}
