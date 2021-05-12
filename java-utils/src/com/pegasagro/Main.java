package com.pegasagro;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {

    public static void main(String[] args) throws IOException {
        if (args.length==3){
            List<String> log = Files.readAllLines(new File(args[0]).toPath());
            Pattern pattern = Pattern.compile(args[1]);
            StringBuilder sb = new StringBuilder();
            log.stream().forEach(line -> {
                Matcher matcher = pattern.matcher(line);
                if (matcher.find()){
                    sb.append(String.format("%s,%s%s", matcher.group(1), matcher.group(2), System.lineSeparator()));
                }
            });
            //System.out.println(sb.toString());
            File file = new File(args[2]);
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
                writer.write(sb.toString());
            }
        }
    }
}
