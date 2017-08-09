package es.emretuerto;

import java.awt.Container;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;


@SpringBootApplication
public class Aplicacion  extends JFrame implements CommandLineRunner {


    
    
    public Aplicacion(){
        initUI();
    }

    public static void main(String[] args) throws Exception {
           ConfigurableApplicationContext ctx = new SpringApplicationBuilder(Aplicacion.class)
            .headless(false).web(false).run(args);

    EventQueue.invokeLater(() -> {
        Aplicacion ex = ctx.getBean(Aplicacion.class);
        ex.setVisible(true);
    });
    }

    @Override
    public void run(String... args) throws Exception {
        

    }

    public void initUI(){
        
        JButton quitButton = new JButton("Quit");

        quitButton.addActionListener((ActionEvent event) -> {
            System.exit(0);
        });

        createLayout(quitButton);

        setTitle("Quit button");
        setSize(300, 200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }

    private void createLayout(JComponent... arg) {

        Container pane = getContentPane();
        GroupLayout gl = new GroupLayout(pane);
        pane.setLayout(gl);

        gl.setAutoCreateContainerGaps(true);

        gl.setHorizontalGroup(gl.createSequentialGroup()
                .addComponent(arg[0])
        );

        gl.setVerticalGroup(gl.createSequentialGroup()
                .addComponent(arg[0])
        );
    }

}
