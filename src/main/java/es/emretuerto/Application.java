package es.emretuerto;

import es.emretuerto.dao.BonoRepository;
import es.emretuerto.dao.ClienteRepository;
import es.emretuerto.dao.FototipoRepository;
import es.emretuerto.dao.LamparaInstaladaRepository;
import es.emretuerto.dao.LamparaRepository;
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
import es.emretuerto.modelo.Lampara;
import es.emretuerto.modelo.LamparaInstalada;
import java.util.List;

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

    @Autowired
    GeneraDatos generaDatos;

    @Autowired
    LamparaInstaladaRepository lamparaInstaladaDao;

    @Autowired
    MaquinaRepository maquinaDao;
    
    @Autowired
    LamparaRepository lamparaDao;

    public static void main(String[] args) throws Exception {
        // SpringApplication.run(Application.class, args);
        SpringApplicationBuilder builder = new SpringApplicationBuilder(Application.class);
        builder.headless(false);
        ConfigurableApplicationContext context = builder.run(args);
    }

    @Transactional
    @Override
    public void run(String... args) throws Exception {

//         rellenarBaseDatos();
        

List<LamparaInstalada> lamparasActivas = lamparaInstaladaDao.obtenerLamparasActivas(2);
        System.out.println(lamparasActivas);
        
//        Maquina maquina1 = maquinaDao.findOne(1);
//        Maquina maquina2 = maquinaDao.findOne(2);
//        System.out.println("********************");
//        System.out.println("MAQUINA 1");
//        System.out.println("********************");
//        System.out.println(maquina1.getLamparasInstaladas());
//        System.out.println("********************");
//        System.out.println("MAQUINA 2");
//        System.out.println("********************");
//        System.out.println(maquina2.getLamparasInstaladas());

    }

    public void rellenarBaseDatos() {
        generaDatos.generarFototipos();
        generaDatos.generarTiposCliente();
        generaDatos.generarBonos();
        generaDatos.generaPotencias();
        generaDatos.generaLamparas();
        generaDatos.generarMaquinas();
        generaDatos.generarClientes();
        generaDatos.generarLamparasInstaladas();
    }
}
