// Lista de ingredientes
final List<String> ingredientes = [
  // Frutas
  'manzana', 'platano', 'naranja', 'limon', 'fresa', 'uva', 'pera', 'piña',
  'melon', 'sandia', 'kiwi', 'mango', 'cereza', 'frambuesa', 'mora',
  'arandano', 'ciruela', 'higo', 'granada', 'coco',

  // Verduras
  'tomate', 'zanahoria', 'lechuga', 'cebolla', 'ajo', 'pimiento', 'papa',
  'brocoli', 'pepino', 'espinaca', 'calabaza', 'calabacin', 'berenjena',
  'apio', 'puerro', 'champinon', 'esparrago', 'coliflor', 'repollo',
  'acelga', 'remolacha', 'nabo', 'rabano', 'cebolla frita', 'patatas',

  // Carnes
  'pollo', 'carne', 'pescado', 'cerdo', 'jamon', 'pavo', 'cordero',
  'ternera', 'salchicha', 'chorizo', 'bacon','chuleta de pollo',

  // Pescados y mariscos
  'atun', 'salmon', 'sardina', 'camaron', 'calamar', 'pulpo', 'mejillon',
  'langosta',

  // Lácteos y huevos
  'leche', 'queso', 'yogurt', 'mantequilla', 'crema', 'huevo', 'clara',
  'yema','queso monterrey', 'crema de leche',

  // Granos y cereales
  'arroz', 'quinoa', 'avena', 'trigo', 'maiz', 'cebada', 'centeno',

  // Pastas
  'espagueti', 'macarron', 'lasana', 'ravioli',

  // Legumbres
  'frijoles', 'lentejas', 'garbanzos', 'habas', 'soja', 'guisantes', 'frijoles verdes',

  // Condimentos y especias
  'sal', 'pimienta', 'comino', 'oregano', 'canela', 'curry', 'pimenton',
  'jengibre', 'nuez_moscada', 'azafran', 'cardamomo',

  // Hierbas frescas
  'albahaca', 'perejil', 'cilantro', 'menta', 'romero', 'tomillo', 'laurel',

  // Frutos secos
  'almendras', 'nueces', 'cacahuetes', 'pistachos', 'anacardos', 'avellanas',

  // Aceites y grasas
  'aceite_oliva', 'aceite_girasol', 'manteca',

  // Endulzantes
  'azucar', 'miel', 'sirope', 'stevia', 'vestido de miel dijon',

  // Productos horneados
  'pan', 'croissant', 'bagel', 'muffin', 'galletas',

  // Salsas y aderezos
  'mayonesa', 'ketchup', 'mostaza', 'salsa_soja', 'vinagre', 'tabasco',

  // Bebidas
  'agua', 'cafe', 'te', 'vino', 'cerveza', 'leche_coco',

  // Otros
  'chocolate', 'cacao', 'levadura', 'gelatina', 'vainilla'
];

String getIngredientImage(String ingredient) {
  final Map<String, String> imageUrls = {
    // Frutas
    'manzana' : 'https://cdn-icons-png.flaticon.com/512/415/415733.png',
    'platano' : 'https://cdn-icons-png.flaticon.com/512/1135/1135549.png',
    'naranja' : 'https://cdn-icons-png.flaticon.com/512/415/415731.png',
    'limon': 'https://cdn-icons-png.flaticon.com/512/415/415767.png',
    'fresa': 'https://cdn-icons-png.flaticon.com/512/590/590685.png',
    'uva': 'https://cdn-icons-png.flaticon.com/512/2224/2224241.png',
    'pera': 'https://cdn-icons-png.flaticon.com/512/415/415755.png',
    'piña': 'https://cdn-icons-png.flaticon.com/512/415/415744.png',
    'melon': 'https://cdn-icons-png.flaticon.com/512/415/415747.png',
    'sandia': 'https://cdn-icons-png.flaticon.com/512/415/415751.png',
    'kiwi': 'https://cdn-icons-png.flaticon.com/512/415/415743.png',
    'mango': 'https://cdn-icons-png.flaticon.com/512/415/415748.png',
    'cereza': 'https://cdn-icons-png.flaticon.com/512/415/415735.png',
    'frambuesa': 'https://cdn-icons-png.flaticon.com/512/415/415738.png',
    'mora': 'https://cdn-icons-png.flaticon.com/512/415/415741.png',
    'arandano': 'https://cdn-icons-png.flaticon.com/512/415/415732.png',
    'ciruela': 'https://cdn-icons-png.flaticon.com/512/415/415736.png',
    'higo': 'https://cdn-icons-png.flaticon.com/512/415/415739.png',
    'granada': 'https://cdn-icons-png.flaticon.com/512/415/415737.png',
    'coco': 'https://cdn-icons-png.flaticon.com/512/415/415734.png',
    
    // Verduras
    'tomate'        : 'https://cdn-icons-png.flaticon.com/512/1412/1412511.png',
    'zanahoria'     : 'https://cdn-icons-png.flaticon.com/512/1412/1412542.png',
    'lechuga'       : 'https://cdn-icons-png.flaticon.com/512/1412/1412534.png',
    'cebolla'       : 'https://cdn-icons-png.flaticon.com/512/1412/1412544.png',
    'cebolla frita' : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/5d893672d5991d6a071db150-d0dd4edf.png',
    'ajo'           : 'https://cdn-icons-png.flaticon.com/512/1412/1412525.png',
    'pimiento'      : 'https://cdn-icons-png.flaticon.com/512/1412/1412508.png',
    'papa'          : 'https://fruverianda.com/wp-content/uploads/2020/05/PAPA-SUCIA.jpg',
    'patatas'     : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/6283a92d8766133d500324c1-28662181.png',
    'brocoli'       : 'https://cdn-icons-png.flaticon.com/512/1412/1412533.png',
    'pepino'        : 'https://cdn-icons-png.flaticon.com/512/1412/1412548.png',
    'espinaca'      : 'https://cdn-icons-png.flaticon.com/512/1412/1412537.png',
    'calabaza'      : 'https://cdn-icons-png.flaticon.com/512/1412/1412545.png',
    'calabacin'     : 'https://cdn-icons-png.flaticon.com/512/1412/1412546.png',
    'berenjena'     : 'https://cdn-icons-png.flaticon.com/512/1412/1412532.png',
    'apio'          : 'https://cdn-icons-png.flaticon.com/512/1412/1412526.png',
    'puerro'        : 'https://cdn-icons-png.flaticon.com/512/1412/1412539.png',
    'champinon'     : 'https://cdn-icons-png.flaticon.com/512/1412/1412535.png',
    'esparrago'     : 'https://cdn-icons-png.flaticon.com/512/1412/1412538.png',
    'coliflor'      : 'https://cdn-icons-png.flaticon.com/512/1412/1412536.png',
    'repollo'       : 'https://cdn-icons-png.flaticon.com/512/1412/1412541.png',
    'acelga'        : 'https://cdn-icons-png.flaticon.com/512/1412/1412524.png',
    'remolacha'     : 'https://cdn-icons-png.flaticon.com/512/1412/1412543.png',
    'nabo'          : 'https://cdn-icons-png.flaticon.com/512/1412/1412547.png',
    'rabano'        : 'https://cdn-icons-png.flaticon.com/512/1412/1412549.png',
    
    // Carnes
    'pollo': 'https://cdn-icons-png.flaticon.com/512/1046/1046751.png',
    'carne': 'https://cdn-icons-png.flaticon.com/512/3082/3082068.png',
    'chuleta de pollo': 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/59c2b202c288007f56514711-4f7e3ff4.png',
    'pescado': 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png',
    'cerdo': 'https://cdn-icons-png.flaticon.com/512/1046/1046769.png',
    'jamon': 'https://cdn-icons-png.flaticon.com/512/3082/3082081.png',
    'pavo': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png',
    'cordero': 'https://cdn-icons-png.flaticon.com/512/1046/1046773.png',
    'ternera': 'https://cdn-icons-png.flaticon.com/512/1046/1046775.png',
    'salchicha': 'https://cdn-icons-png.flaticon.com/512/3082/3082088.png',
    'chorizo': 'https://cdn-icons-png.flaticon.com/512/3082/3082076.png',
    'bacon': 'https://cdn-icons-png.flaticon.com/512/3082/3082070.png',
    
    // Pescados y mariscos
    'atun': 'https://cdn-icons-png.flaticon.com/512/3075/3075973.png',
    'salmon': 'https://cdn-icons-png.flaticon.com/512/3075/3075976.png',
    'sardina': 'https://cdn-icons-png.flaticon.com/512/3075/3075974.png',
    'camaron': 'https://cdn-icons-png.flaticon.com/512/3075/3075975.png',
    'calamar': 'https://cdn-icons-png.flaticon.com/512/3075/3075972.png',
    'pulpo': 'https://cdn-icons-png.flaticon.com/512/3075/3075971.png',
    'mejillon': 'https://cdn-icons-png.flaticon.com/512/3075/3075970.png',
    'langosta': 'https://cdn-icons-png.flaticon.com/512/3075/3075969.png',
    
    // Lácteos y huevos
    'leche'           : 'https://cdn-icons-png.flaticon.com/512/2674/2674486.png',
    'queso'           : 'https://cdn-icons-png.flaticon.com/512/517/517561.png',
    'queso monterrey' : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/55c109e74dab7112098b4567-4c6e0a43.png',
    'yogurt'          : 'https://cdn-icons-png.flaticon.com/512/3082/3082094.png',
    'mantequilla'     : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/image/5566e4d74dab71e3078b4569.png',
    'crema'           : 'https://cdn-icons-png.flaticon.com/512/2674/2674457.png',
    'huevo'           : 'https://cdn-icons-png.flaticon.com/512/1652/1652088.png',
    'clara'           : 'https://cdn-icons-png.flaticon.com/512/1652/1652089.png',
    'yema'            : 'https://cdn-icons-png.flaticon.com/512/1652/1652090.png',
    'crema de leche'  : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/5550e1064dab71893e8b4569-dc52e70d.png',

      // Granos y cereales
    'arroz': 'https://cdn-icons-png.flaticon.com/512/3082/3082097.png',
    'quinoa': 'https://cdn-icons-png.flaticon.com/512/3082/3082096.png',
    'avena': 'https://cdn-icons-png.flaticon.com/512/3082/3082074.png',
    'trigo': 'https://cdn-icons-png.flaticon.com/512/3082/3082099.png',
    'maiz': 'https://cdn-icons-png.flaticon.com/512/3082/3082087.png',
    'cebada': 'https://cdn-icons-png.flaticon.com/512/3082/3082075.png',
    'centeno': 'https://cdn-icons-png.flaticon.com/512/3082/3082098.png',
    
    // Pastas
    'espagueti': 'https://cdn-icons-png.flaticon.com/512/3082/3082091.png',
    'macarron': 'https://cdn-icons-png.flaticon.com/512/3082/3082089.png',
    'lasana': 'https://cdn-icons-png.flaticon.com/512/3082/3082086.png',
    'ravioli': 'https://cdn-icons-png.flaticon.com/512/3082/3082092.png',
    
    // Legumbres
    'frijoles'        : 'https://cdn-icons-png.flaticon.com/512/1652/1652077.png',
    'lentejas'        : 'https://cdn-icons-png.flaticon.com/512/1652/1652093.png',
    'garbanzos'       : 'https://cdn-icons-png.flaticon.com/512/1652/1652079.png',
    'habas'           : 'https://cdn-icons-png.flaticon.com/512/1652/1652080.png',
    'soja'            : 'https://cdn-icons-png.flaticon.com/512/1652/1652106.png',
    'guisantes'       : 'https://cdn-icons-png.flaticon.com/512/1652/1652081.png',
    'frijoles verdes' : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/image/5553931dfd2cb9db798b4569.png',
    
    // Condimentos y especias
    'sal'         : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/5566ceb7fd2cb95f7f8b4567-20f73b1d.png',
    'pimienta'    : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/5566dc00f8b25e5b298b4568-b5daf661.png',
    'comino'      : 'https://cdn-icons-png.flaticon.com/512/2674/2674455.png',
    'oregano'     : 'https://cdn-icons-png.flaticon.com/512/2674/2674475.png',
    'canela'      : 'https://cdn-icons-png.flaticon.com/512/2674/2674452.png',
    'curry'       : 'https://cdn-icons-png.flaticon.com/512/2674/2674458.png',
    'pimenton'    : 'https://cdn-icons-png.flaticon.com/512/2674/2674476.png',
    'jengibre'    : 'https://cdn-icons-png.flaticon.com/512/2674/2674466.png',
    'nuez_moscada': 'https://cdn-icons-png.flaticon.com/512/2674/2674474.png',
    'azafran'     : 'https://cdn-icons-png.flaticon.com/512/2674/2674449.png',
    'cardamomo'   : 'https://cdn-icons-png.flaticon.com/512/2674/2674453.png',

    
    // Hierbas frescas
    'albahaca': 'https://cdn-icons-png.flaticon.com/512/1412/1412528.png',
    'perejil': 'https://cdn-icons-png.flaticon.com/512/1412/1412527.png',
    'cilantro': 'https://cdn-icons-png.flaticon.com/512/3082/3082083.png',
    'menta': 'https://cdn-icons-png.flaticon.com/512/1412/1412529.png',
    'romero': 'https://cdn-icons-png.flaticon.com/512/1412/1412530.png',
    'tomillo': 'https://cdn-icons-png.flaticon.com/512/1412/1412531.png',
    'laurel': 'https://cdn-icons-png.flaticon.com/512/1412/1412532.png',
    
    // Frutos secos
    'almendras': 'https://cdn-icons-png.flaticon.com/512/2548/2548439.png',
    'nueces': 'https://cdn-icons-png.flaticon.com/512/1652/1652097.png',
    'cacahuetes': 'https://cdn-icons-png.flaticon.com/512/1652/1652095.png',
    'pistachos': 'https://cdn-icons-png.flaticon.com/512/1652/1652099.png',
    'anacardos': 'https://cdn-icons-png.flaticon.com/512/1652/1652094.png',
    'avellanas': 'https://cdn-icons-png.flaticon.com/512/1652/1652096.png',
    
    // Aceites y grasas
    'aceite_oliva'  : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/5566cdf2f8b25e0d298b4568-a8c7224a.png',
    'aceite_girasol': 'https://cdn-icons-png.flaticon.com/512/2674/2674439.png',
    'manteca'       : 'https://cdn-icons-png.flaticon.com/512/2674/2674447.png',
    
    // Endulzantes
    'azucar'                : 'https://cdn-icons-png.flaticon.com/512/2674/2674492.png',
    'miel'                  : 'https://cdn-icons-png.flaticon.com/512/2674/2674470.png',
    'sirope'                : 'https://cdn-icons-png.flaticon.com/512/2674/2674489.png',
    'stevia'                : 'https://cdn-icons-png.flaticon.com/512/2674/2674490.png',
    'vestido de miel dijon' : 'https://img.hellofresh.com/w_256,q_auto,f_auto,c_limit,fl_lossy/hellofresh_s3/ingredient/5e554e45dfd6a672ce7e0864-1d8a5a6c.png',
    
    // Productos horneados
    'pan': 'https://cdn-icons-png.flaticon.com/512/1702/1702834.png',
    'croissant': 'https://cdn-icons-png.flaticon.com/512/1702/1702835.png',
    'bagel': 'https://cdn-icons-png.flaticon.com/512/1702/1702836.png',
    'muffin': 'https://cdn-icons-png.flaticon.com/512/1702/1702837.png',
    'galletas': 'https://cdn-icons-png.flaticon.com/512/1702/1702838.png',
    
    // Salsas y aderezos
    'mayonesa': 'https://cdn-icons-png.flaticon.com/512/2674/2674468.png',
    'ketchup': 'https://cdn-icons-png.flaticon.com/512/2674/2674467.png',
    'mostaza': 'https://cdn-icons-png.flaticon.com/512/2674/2674471.png',
    'salsa_soja': 'https://cdn-icons-png.flaticon.com/512/2674/2674487.png',
    'vinagre': 'https://cdn-icons-png.flaticon.com/512/2674/2674493.png',
    'tabasco': 'https://cdn-icons-png.flaticon.com/512/2674/2674491.png',
    
    // Bebidas
    'agua': 'https://cdn-icons-png.flaticon.com/512/2674/2674505.png',
    'cafe': 'https://cdn-icons-png.flaticon.com/512/2674/2674450.png',
    'te': 'https://cdn-icons-png.flaticon.com/512/2674/2674502.png',
    'vino': 'https://cdn-icons-png.flaticon.com/512/2674/2674494.png',
    'cerveza': 'https://cdn-icons-png.flaticon.com/512/2674/2674454.png',
    'leche_coco': 'https://cdn-icons-png.flaticon.com/512/2674/2674484.png',
    
    // Otros ingredientes
    'chocolate': 'https://cdn-icons-png.flaticon.com/512/2674/2674456.png',
    'cacao': 'https://cdn-icons-png.flaticon.com/512/2674/2674451.png',
    'levadura': 'https://cdn-icons-png.flaticon.com/512/2674/2674469.png',
    'gelatina': 'https://cdn-icons-png.flaticon.com/512/2674/2674464.png',
    'vainilla': 'https://cdn-icons-png.flaticon.com/512/2674/2674495.png',
    };

  String ingredienteLower = ingredient.toLowerCase().trim();
  return imageUrls[ingredienteLower] ?? 'https://cdn-icons-png.flaticon.com/512/1046/1046857.png';
}