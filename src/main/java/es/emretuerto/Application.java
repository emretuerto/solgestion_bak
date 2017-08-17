package es.emretuerto;

import es.emretuerto.dao.BonoRepository;
import es.emretuerto.dao.ClienteRepository;
import es.emretuerto.dao.FototipoRepository;
import es.emretuerto.dao.SesionRepository;
import es.emretuerto.dao.TipoClienteRepository;
import es.emretuerto.modelo.Bono;
import es.emretuerto.modelo.Cliente;
import es.emretuerto.modelo.Fototipo;
import es.emretuerto.modelo.Maquina;
import es.emretuerto.modelo.TipoCliente;
import es.emretuerto.servicios.BonoServicioInterface;
import es.emretuerto.servicios.SesionServicioInterface;
import es.emretuerto.servicios.impl.ClienteServicioImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;
import es.emretuerto.dao.MaquinaRepository;

//for jsr310 java 8 java.time.*
//@EntityScan(
//        basePackageClasses = { SpringBootConsoleApplication.class, Jsr310JpaConverters.class }
//)
@SpringBootApplication
public class Application implements CommandLineRunner {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

    @Autowired
    DataSource dataSource;

    @Autowired
    SesionRepository sesionDao;

    @Autowired
    ClienteRepository clienteDao;

    @Autowired
    MaquinaRepository solariumDao;

    @Autowired
    TipoClienteRepository tipoClienteDao;

    @Autowired
    FototipoRepository fototipoDao;

    @Autowired
    ClienteServicioImpl clienteService;

    @Autowired
    BonoRepository bonoDao;

    @Autowired
    BonoServicioInterface bonoService;

    @Autowired
    SesionServicioInterface sesionServicio;

    public static void main(String[] args) throws Exception {
        // SpringApplication.run(Application.class, args);
        SpringApplicationBuilder builder = new SpringApplicationBuilder(Application.class);
        builder.headless(false);
        ConfigurableApplicationContext context = builder.run(args);
    }

    @Transactional
    @Override
    public void run(String... args) throws Exception {

//            System.out.println("DATASOURCE = " + dataSource);
 //       TipoCliente tipoCliente = new TipoCliente("A003", "Cliente V.I.P.");
//        tipoClienteDao.save(tipoCliente);
//        TipoCliente tipoCliente = new TipoCliente("A099", "Cliente Maquina");
//        Fototipo fototipo = new Fototipo("III");
//        Cliente cliente = new Cliente("CLI01", "Eduardo", "Martínez Retuerti", "13155640P", "mi direccion", "39010 ", "Santande", "Cantabria", new Date(), "942237363", "615303890", "emretuerto@gmail.com", fototipo, null   , tipoCliente, null);
//Cliente cliente = new Cliente("CLI001", "Eduardo", "Martínez Retuerto", "13155640P", "C/ San Luis, 10", "39010", "Santander", "Cantabria", new Date(), "942237363", "615303890", "emretuerto@gmail.com", fototipo,tipoCliente);
////           Cliente cliente = new Cliente("Cristina", "Vega Santos", "20203177T", tipoCliente);
////   Cliente cliente = clienteDao.getOne(1);
//   cliente.setCodigoCliente("CLI0009");
//   cliente.setCodigoPostal("39001");
//   cliente.setDireccion("Magallanes, 37");
//   cliente.setFechaNacimiento(new Date(1973,06,21));
//   cliente.setFototipo(fototipo);
//   cliente.setLocalidad("Santander");
//   cliente.setProvincia("Cantabria");
//   cliente.setTelefonoFijo("942222222");
//   cliente.setTelefonoMovil("635471840");
//   
//        
//
//    clienteDao.save(cliente);
//            Maquina solarium = new Maquina("Horizontal2", "Ergoline", "400 classic");
//          solariumDao.save(solarium);
//       Cliente cliente = clienteDao.getOne(1);
//      Maquina solarium = solariumDao.getOne(1);
//      Sesion sesion = new Sesion(cliente, solarium, 14);
//       sesionDao.save(sesion);
//       List<Sesion> sesiones= cliente.getSesionesCliente();
//       
//       sesiones.forEach((sesi) -> {
//           System.out.println(sesi);
//        });
//System.out.println(sesiones.size());
//      System.out.println("Done!");
//FototipoDTO fototipo = new FototipoDTO("VI");
//TipoClienteDTO tipoCliente = new TipoClienteDTO("AAAA", "Very Very Important");
//
//
//ClienteDTO cliente = new ClienteDTO("A0009", "Manuel", "Martínez de la Vega", "2020317t", "San Lsui", "39010", "Santander", "Cantabria", new Date(2010,04,21), "942999999", "669999999", "asdsd@asdsd.es", fototipo, null, tipoCliente);
//
//clienteService.altaCliente(cliente);
//ClienteDTO clienteDto = clienteService.findByCodigo("CLI0009");
//        System.out.println(clienteDto);
//ClienteDto clienteDto = clienteDao.findClienteDTOByNif("13155640P");
//        System.out.println(clienteDto);
//        
//        
//Fototipo fototipo = fototipoDao.findOne(3);        
//Cliente cliente2 = clienteDao.findClienteByNif("13155640P");
//cliente2.setFototipo(fototipo);
//System.out.println(cliente2);
//Bono bono1;
//Bono bono2;
//Bono bono1 = new Bono( "000001", Boolean.TRUE, null, 25);
//Bono bono2 = new Bono("00002", Boolean.FALSE,100.0d, null);
//Bono bono1 = bonoDao.findByIdentificadorBono("000001");
//Bono bono2 = bonoDao.findByIdentificadorBono("00002");
//Solarium solarium = new Maquina("MAQUINA1", "ENCO", "22/1");
//solariumDao.save(solarium);
//       Cliente cliente1 = clienteDao.findOne(1);
//       cliente1.setFechaNacimiento(new Date(73, 3, 6));
//        Cliente cliente2 = clienteDao.findOne(2);
//        Maquina solarium = solariumDao.findOne(1);
//
//        for (int i = 0; i < 10; i++) {
//sesionServicio.insertarSesion(cliente1, solarium, 1.0d, 14);
//            sesionServicio.insertarSesion(cliente1, solarium, 1.0d, 14);
//        }

//cliente.setBono(bono1);
//sesionServicio.insertarSesion(cliente, solarium, 1.5d, 14);
//bonoService.recargaMinutos(bono1, 35);
//bonoService.recargaSesiones(bono2, 50d);


    }

}
