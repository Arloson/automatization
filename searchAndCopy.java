
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import java.util.regex.Pattern;

public class Main {
    public static void serchPdfMoveDirPDF(String name,Path p){


            File f = new File(name);
            System.out.println("copy from "+ f.getAbsolutePath());
            String path = p.toFile().getAbsoluteFile()+"\\"+f.getName();
            System.out.println("copy on "+path);
            Path path1 = new File(path).toPath();
        System.out.println(p.toFile().getAbsolutePath());

        //Path dir = createDirectory(p.toFile().getAbsolutePath());
        // Files.copy(f.toPath(), path1, StandardCopyOption.REPLACE_EXISTING);
        System.out.println("File was copy");


    }

    public static void deleteDir(Path p)  {
        try {
            Files.delete(p);
            System.out.println("Directory is deleted");
        } catch (IOException e) {
            System.err.println("Error created directory");
            e.printStackTrace();
        }
    }

    public static Path createDirectory(String pathDir){
        Path directory = null;
        try {
            directory = Files.createDirectories(Paths.get(pathDir));
            System.out.println("Directory is created!");
        } catch (IOException e) {
            System.err.println("Directory don't created!");
            e.printStackTrace();
        }
        return directory;
    }


    public static void main(String[] args) {

        if(args.length == 0 ||args.length == 1 || args.length > 3){
            System.out.println("arguments");
            System.out.println("1: path directory search\n" +
                    "2: File search and copy\n" +
                    "3: Directory to copy ");
            for (String s:args) {
                System.err.println(s);
            }
           // return;
        }
        //String path = args[0];
       // String fileSearch = args[1];
       // Pattern pattern = Pattern.compile("^[.]{1}[a-z]+$");
       // if(!pattern.matcher(fileSearch).matches()){
       //     System.err.println("Bad input ");
           // return;
      //  }

        Path directory = createDirectory("PDF");

        if(directory == null)return;

        //File root = new File(path);
        String s = "C:\\Users\\Sega\\IdeaProjects\\untitled";
        serchPdfMoveDirPDF(s, directory);

       // start(root,fileSearch, directory);
    }





    public  static void start(File list, String extend, Path p){
        for (File l:list.listFiles()) {
            if(l.isFile()){
                if (l.getName().contains(extend)){
                System.out.println("Run copy...");
                serchPdfMoveDirPDF(l.getAbsolutePath(), p);
                }
            }else {
                start(l,extend, p);
            }
        }
    }
}
