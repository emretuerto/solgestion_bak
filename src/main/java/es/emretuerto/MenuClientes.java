/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto;

import es.emretuerto.modelo.Fototipo;
import es.emretuerto.servicios.FototipoServicioInterface;
import es.emretuerto.servicios.impl.FototipoServicioImpl;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;

/**
 *
 * @author eduardo
 */
@SpringBootApplication
public class MenuClientes extends Application {

    protected ConfigurableApplicationContext springContext;

    @Override
    public void start(Stage primaryStage) {

        Button btn = new Button();
        btn.setText("Say 'Hello World'");

        FototipoServicioInterface fototipoService = springContext.getBean(FototipoServicioImpl.class);

        System.out.println(fototipoService);
        ArrayList<Fototipo> listaFototipos = fototipoService.obtenerFototipos();
        ObservableList<Fototipo> fototipos = FXCollections.observableArrayList(listaFototipos);
        //   fototipos.addAll("I","II","III","IV","V","VI");
        ComboBox<Fototipo> comboBox = new ComboBox(fototipos);
        comboBox.setValue(listaFototipos.get(0));
        btn.setOnAction(e
                -> System.out.println("Hello World!")
        );

        comboBox.setOnAction(e -> System.out.println("Action Nueva Selección: " + comboBox.getValue()));

    
        
        comboBox.valueProperty().addListener((ov, p1, p2) -> {
            System.out.println("Obsersable value" + ov);
            System.out.println("Nueva Selección: " + p2);
            System.out.println("Vieja Selección: " + p1);


        });

        StackPane root = new StackPane();
        root.getChildren().add(btn);
        root.getChildren().add(comboBox);

        Scene scene = new Scene(root, 300, 250);

        primaryStage.setTitle("Hello World!");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    @Override
    public void init() throws Exception {
        springContext = springBootApplicationContext();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Application.launch(args);
    }

    private ConfigurableApplicationContext springBootApplicationContext() {
        SpringApplicationBuilder builder = new SpringApplicationBuilder(MenuClientes.class);
        String[] args = getParameters().getRaw().stream().toArray(String[]::new);
        return builder.run(args);
    }

}
