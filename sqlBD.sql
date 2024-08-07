CREATE DATABASE  IF NOT EXISTS `conexionvallejo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `conexionvallejo`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: conexionvallejo
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carrera` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Ingeniería de Ciberseguridad'),(2,'Ingeniería de Ciencia de Datos'),(3,'Ingeniería Empresarial'),(4,'Ingeniería Agroindustrial'),(5,'Ingeniería Ambiental'),(6,'Ingeniería Civil'),(7,'Ingeniería de Minas'),(8,'Ingeniería de Sistemas'),(9,'Ingeniería Industrial'),(10,'Ingeniería Mecánica Eléctrica'),(11,'Enfermería'),(12,'Estomatología'),(13,'Medicina'),(14,'Nutrición'),(15,'Psicología'),(16,'Tecnología Médica'),(17,'Administración y Marketing'),(18,'Administración y Negocios Internacionales'),(19,'Administración'),(20,'Administración en Turismo y Hotelería'),(21,'Contabilidad'),(22,'Economía'),(23,'Gestión Pública'),(24,'Artes & Diseño Gráfico Empresarial'),(25,'Ciencias de la Comunicación'),(26,'Ciencias del Deporte'),(27,'Derecho'),(28,'Educación Inicial'),(29,'Educación Primaria'),(30,'Traducción e Interpretación'),(31,'Arquitectura');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo`
--

DROP TABLE IF EXISTS `ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciclo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ciclo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo`
--

LOCK TABLES `ciclo` WRITE;
/*!40000 ALTER TABLE `ciclo` DISABLE KEYS */;
INSERT INTO `ciclo` VALUES (1,'I'),(2,'II'),(3,'III'),(4,'IV'),(5,'V'),(6,'VI'),(7,'VII'),(8,'VIII'),(9,'IX'),(10,'X');
/*!40000 ALTER TABLE `ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by_user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `comment_text` text,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_user_id` (`created_by_user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_dislikes`
--

DROP TABLE IF EXISTS `likes_dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_dislikes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `is_like` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_post` (`post_id`),
  CONSTRAINT `fk_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_dislikes`
--

LOCK TABLES `likes_dislikes` WRITE;
/*!40000 ALTER TABLE `likes_dislikes` DISABLE KEYS */;
INSERT INTO `likes_dislikes` VALUES (84,18,168,1);
/*!40000 ALTER TABLE `likes_dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `message` text,
  `is_read` tinyint(1) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `leido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (13,46,148,'Pedro Cano ha respondido a tu pregunta.',0,'2024-06-18 15:59:27','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',0),(14,29,150,'Pedro Cano ha respondido a tu pregunta.',0,'2024-06-18 16:01:58','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',0),(15,29,149,'Pedro Cano ha respondido a tu pregunta.',0,'2024-06-18 16:03:57','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',0),(21,29,149,'Pedro Cano ha respondido a tu pregunta.',0,'2024-06-21 01:59:13','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',0),(22,18,178,'Sofía Morales ha respondido a tu pregunta.',0,'2024-06-23 01:50:21','/uploads/images (5).jpeg',1),(36,18,178,'Pedro Cano ha respondido a tu pregunta.',0,'2024-07-03 22:37:38','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',0),(37,18,178,'Pedro Cano ha respondido a tu pregunta.',0,'2024-07-03 22:42:14','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',0),(38,18,178,'Pedro Cano ha respondido a tu pregunta.',0,'2024-07-03 22:43:06','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',0),(39,18,178,'Pedro Cano ha respondido a tu pregunta.',0,'2024-07-03 22:47:03','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',1),(40,18,178,'Pedro Cano ha respondido a tu pregunta.',0,'2024-07-03 22:47:13','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',1),(50,18,178,'Pedro Cano ha respondido a tu pregunta.',0,'2024-07-04 01:30:40','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg',1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by_user_id` int DEFAULT NULL,
  `parent_question_id` int DEFAULT NULL,
  `post_type_id` int DEFAULT NULL,
  `accepted_answer_id` int DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_details` longtext,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_ibfk_1_idx` (`created_by_user_id`),
  KEY `posts_ibfk_2_idx` (`parent_question_id`),
  KEY `posts_ibfk_3_idx` (`post_type_id`),
  KEY `posts_ibfk_4_idx` (`accepted_answer_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`parent_question_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`post_type_id`) REFERENCES `posttypes` (`id`),
  CONSTRAINT `posts_ibfk_4` FOREIGN KEY (`accepted_answer_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (100,27,NULL,1,NULL,'Cómo implementar un algoritmo de búsqueda binaria en Python','<p><span style=\"font-family:\'Courier New\', Courier, monospace;\">Estoy tratando de implementar un algoritmo de búsqueda binaria en Python. He leído sobre cómo funciona el algoritmo, pero tengo dificultades para traducir la lógica a código. A continuación, incluyo mi código actual y una descripción de los problemas que estoy encontrando:</span></p><p>&nbsp;</p><p>&nbsp;</p><pre><code class=\"language-plaintext\">def busqueda_binaria(lista, objetivo):\r\n    inicio = 0\r\n    fin = len(lista) - 1\r\n\r\n    while inicio &lt;= fin:\r\n        medio = (inicio + fin) // 2\r\n        if lista[medio] == objetivo:\r\n            return medio\r\n        elif lista[medio] &lt; objetivo:\r\n            inicio = medio + 1\r\n        else:\r\n            fin = medio - 1\r\n\r\n    return -1\r\n\r\n# Prueba de la función\r\nlista = [1, 3, 5, 7, 9, 11]\r\nobjetivo = 7\r\nresultado = busqueda_binaria(lista, objetivo)\r\nprint(f\'Índice del objetivo: {resultado}\')\r\n</code></pre>','2024-06-12 23:25:13'),(124,18,100,2,NULL,NULL,'<p>sadsasadsadsad</p>\r\n','2024-06-15 03:54:45'),(129,18,NULL,1,NULL,'Agregue \"etiquetas\" que ayuden a hacer llegar su pregunta a los miembros de la comunidad.','<p style=\"margin-left:0px;\"><code>Agregue \"etiquetas\" que ayuden a hacer llegar su pregunta a los miembros de la comunidad.</code></p><p><br><code>Agregue \"etiquetas\" que ayuden a hacer llegar su pregunta a los miembros de la comunidad.</code></p><p><br>&nbsp;</p>','2024-06-15 05:05:21'),(133,18,NULL,1,NULL,'¿Cómo optimizar un algoritmo de búsqueda en inteligencia artificial?','<p><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><span lang=\"es\" dir=\"ltr\">Estoy trabajando en un proyecto de inteligencia artificial y necesito optimizar un algoritmo de búsqueda para mejorar su rendimiento. ¿Cuáles son algunas técnicas comunes para lograr esto?</span></span></p><p><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><code><span lang=\"es\" dir=\"ltr\">public class SearchAlgorithm {</span></code></span><br><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><code><span lang=\"es\" dir=\"ltr\">&nbsp; &nbsp;public void optimize() {</span></code></span><br><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><code><span lang=\"es\" dir=\"ltr\">&nbsp; &nbsp; &nbsp; &nbsp;// Implementación de optimización</span></code></span><br><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><code><span lang=\"es\" dir=\"ltr\">&nbsp; &nbsp; &nbsp; &nbsp;for (int i = 0; i &lt; data.length; i++) {</span></code></span><br><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><code><span lang=\"es\" dir=\"ltr\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Lógica de búsqueda optimizada</span></code></span><br><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><code><span lang=\"es\" dir=\"ltr\">&nbsp; &nbsp; &nbsp; &nbsp;}</span></code></span><br><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><code><span lang=\"es\" dir=\"ltr\">&nbsp; &nbsp;}</span></code></span><br><span style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"><code><span lang=\"es\" dir=\"ltr\">}</span></code></span><br>&nbsp;</p>','2024-06-16 23:15:48'),(141,32,NULL,1,NULL,'Desafíos en la implementación de redes neuronales','<p><span style=\"font-size:12px;\">Estoy teniendo problemas para implementar redes neuronales en mi proyecto de machine learning. ¿Cuáles son los desafíos comunes y cómo se pueden resolver?</span></p><p>&nbsp;</p><p>&nbsp;</p><div style=\"background-color:#1e1f22;color:#bcbec4;\"><pre style=\"font-family:\'JetBrains Mono\',monospace;font-size:9.0pt;\"><span style=\"color:#cf8e6d;\">import </span>tensorflow as tf<br><br>          <span style=\"color:#c77dbb;\">model </span>= tf.keras.models.Sequential([<br>          tf.keras.layers.Dense(<span style=\"color:#2aacb8;\">128</span>, activation=<span style=\"color:#6aab73;\">\'relu\'</span>),<br>    tf.keras.layers.<span style=\"color:#56a8f5;\">Dense</span>(<span style=\"color:#2aacb8;\">10</span>, activation=<span style=\"color:#6aab73;\">\'softmax\'</span>)<br>])<br><br>       model.<span style=\"color:#56a8f5;\">compile</span>(optimizer=<span style=\"color:#6aab73;\">\'adam\'</span>, loss=<span style=\"color:#6aab73;\">\'sparse_categorical_crossentropy\'</span>, metrics=[<span style=\"color:#6aab73;\">\'accuracy\'</span>])<br>&nbsp;</pre></div><p>&nbsp;</p>','2024-06-17 00:28:03'),(143,33,NULL,1,NULL,'Impacto de la bioinformática en la medicina personalizada','<p><span style=\"font-size:12px;\">Quiero entender mejor cómo la bioinformática está impactando el desarrollo de la medicina personalizada. ¿Qué avances se han logrado y cuáles son los desafíos actuales?</span></p><p><span style=\"font-size:12px;\"><code># Script para análisis de datos genéticos</code></span><br><span style=\"font-size:12px;\"><code>python analyze_genetics.py --input data/genetic_data.csv --output results/analysis_results.csv</code></span><br>&nbsp;</p>','2024-06-17 01:45:33'),(144,30,NULL,1,NULL,'Principios básicos de la criptografía en seguridad informática','<p><span style=\"font-size:12px;\">Estoy estudiando seguridad informática y me gustaría conocer más sobre los principios básicos de la criptografía. ¿Cómo se aplican en la protección de datos y comunicaciones?</span></p><div style=\"background-color:#1e1f22;color:#bcbec4;\"><pre style=\"font-family:\'JetBrains Mono\',monospace;font-size:9.0pt;\">    from cryptography.fernet <span style=\"color:#cf8e6d;\">import </span>Fernet<br><br># Generar clave<br>    key = Fernet.<span style=\"color:#56a8f5;\">generate_key</span>()<br>    cipher_suite = <span style=\"color:#56a8f5;\">Fernet</span>(key)<br><br># Encriptar datos<br>    encrypted_text = cipher_suite.<span style=\"color:#56a8f5;\">encrypt</span>(b<span style=\"color:#6aab73;\">\"Mensaje secreto\"</span>)</pre></div><p><br>&nbsp;</p>','2024-06-17 01:47:50'),(145,28,NULL,1,NULL,'Métodos de análisis en big data para la economía','<p><span style=\"font-size:12px;\">Estoy investigando cómo se utilizan los métodos de análisis de big data en el campo de la economía. ¿Cuáles son las técnicas más eficaces y qué tipo de datos se analizan?</span></p><p><span style=\"font-size:12px;\"><code># Análisis de datos económicos en R</code></span><br><span style=\"font-size:12px;\"><code>data &lt;- read.csv(\"economic_data.csv\")</code></span><br><span style=\"font-size:12px;\"><code>summary(data)</code></span><br><span style=\"font-size:12px;\"><code>plot(data$variable1, data$variable2)</code></span><br>&nbsp;</p>','2024-06-17 01:48:47'),(146,27,NULL,1,NULL,'La importancia de la inteligencia natural en la robótica','<p><span style=\"font-size:12px;\">Me gustaría saber más sobre cómo se está aplicando la inteligencia natural en el desarrollo de robots. ¿Qué beneficios tiene en comparación con la inteligencia artificial?</span></p><div style=\"background-color:#1e1f22;color:#bcbec4;\"><pre style=\"font-family:\'JetBrains Mono\',monospace;font-size:9.0pt;\">#include &lt;iostream&gt;<br><br>    <span style=\"color:#cf8e6d;\">class </span>Robot {<br>       <span style=\"color:#cf8e6d;\">public</span>:<br>       <span style=\"color:#cf8e6d;\">void </span><span style=\"color:#56a8f5;\">useNaturalIntelligence</span>() {<br>          std::cout &lt;&lt; <span style=\"color:#6aab73;\">\"Implementando inteligencia natural en el robot.\" </span>&lt;&lt; std::endl;<br>       }<br>    };<br>&nbsp;</pre></div>','2024-06-17 01:50:09'),(147,26,NULL,1,NULL,'Uso de blockchain en la seguridad de transacciones financieras','<p><span style=\"font-size:12px;\">Estoy trabajando en un proyecto sobre la seguridad de las transacciones financieras y me interesa saber cómo se puede utilizar la tecnología blockchain para mejorarla. ¿Cuáles son los principales beneficios y desafíos?</span></p><div style=\"background-color:#1e1f22;color:#bcbec4;\"><pre style=\"font-family:\'JetBrains Mono\',monospace;font-size:9.0pt;\">    pragma solidity ^<span style=\"color:#2aacb8;\">0.8.0</span>;<br><br>    contract TransactionSecurity {<br>    <span style=\"color:#56a8f5;\">mapping</span>(address =&gt; uint) balances;<br><br>    function <span style=\"color:#56a8f5;\">transfer</span>(address recipient, uint amount) <span style=\"color:#cf8e6d;\">public </span>{<br>       require(balances[msg.sender] &gt;= amount, <span style=\"color:#6aab73;\">\"Fondos insuficientes\"</span>);<br>       balances[msg.sender] -= amount;<br>       balances[recipient] += amount;<br>    }<br>}<br>&nbsp;</pre></div>','2024-06-17 01:51:37'),(148,46,NULL,1,NULL,' Integración de la ciberseguridad en redes empresariales','<p><span style=\"font-size:12px;\">Estoy buscando información sobre cómo integrar medidas de ciberseguridad en redes empresariales. ¿Cuáles son las mejores prácticas y los errores comunes a evitar?</span></p><p><span style=\"font-size:12px;\"><code># Configuración de firewall en red empresarial</code></span><br><span style=\"font-size:12px;\"><code>ufw allow 22/tcp</code></span><br><span style=\"font-size:12px;\"><code>ufw allow 80/tcp</code></span><br><span style=\"font-size:12px;\"><code>ufw enable</code></span><br>&nbsp;</p>','2024-06-17 01:53:05'),(149,29,NULL,1,NULL,'Aplicaciones de la ciencia de datos en la investigación biológica','<p><span style=\"font-size:12px;\">Me gustaría saber cómo se está utilizando la ciencia de datos en la investigación biológica. ¿Qué herramientas y técnicas son las más comunes y qué tipo de datos se analizan?</span></p><p>&nbsp;</p><div style=\"background-color:#1e1f22;color:#bcbec4;\"><pre style=\"font-family:\'JetBrains Mono\',monospace;font-size:9.0pt;\"><span style=\"color:#cf8e6d;\">import </span>pandas as pd<br><span style=\"color:#cf8e6d;\">import </span>matplotlib.pyplot as plt<br><br># Cargar datos biológicos<br>          <span style=\"color:#c77dbb;\">data </span>= pd.read_csv(<span style=\"color:#6aab73;\">\"biological_data.csv\"</span>)<br><br># Análisis de <span style=\"color:#c77dbb;\">datos</span><br><span style=\"color:#c77dbb;\">          summary_stats </span>= <span style=\"color:#c77dbb;\">data</span>.describe()<br>plt.<span style=\"color:#56a8f5;\">hist</span>(<span style=\"color:#c77dbb;\">data</span>[<span style=\"color:#6aab73;\">\'gene_expression\'</span>])<br>plt.<span style=\"color:#56a8f5;\">show</span>()</pre></div>','2024-06-17 01:55:26'),(150,29,NULL,1,NULL,'Impacto de la Inteligencia Artificial en la Automatización de Procesos Industriales','<ul><li><p style=\"text-align:center;\"><span style=\"background-color:hsl(0,0%,100%);font-size:18px;\"><strong>Aplicaciones Actuales de la Inteligencia Artificial en la Automatización Industrial</strong></span></p></li><li><hr><ul><li><strong>Descripción</strong>: Explorar cómo la IA está transformando la automatización de procesos en diversas industrias, desde la manufactura hasta la logística.</li><li><strong>Avances y Casos de Uso</strong>:<ul><li>Utilización de algoritmos de aprendizaje automático para optimizar el rendimiento de líneas de producción.</li><li>Sistemas de visión por computadora para inspección de calidad automatizada.</li><li>Robótica avanzada y sistemas de control autónomo en entornos industriales.</li></ul></li><li><strong>Ejemplos</strong>:<ul><li><strong>Automatización de Fábricas</strong>: Implementación de robots colaborativos que trabajan junto con humanos para aumentar la eficiencia y seguridad.</li><li><strong>Logística Inteligente</strong>: Optimización de rutas y gestión de inventarios utilizando algoritmos de IA para reducir costos y tiempos de entrega.</li></ul></li></ul></li><li><strong>Herramientas y Tecnologías más Comunes en la Automatización con IA</strong><ul><li><strong>Descripción</strong>: Enumerar las herramientas y plataformas de IA utilizadas en la automatización industrial.</li><li><strong>Tecnologías Destacadas</strong>:<ul><li>Plataformas de software de IA como TensorFlow y PyTorch para el desarrollo de modelos de aprendizaje automático.</li><li>Sistemas de control y monitoreo basados en IoT (Internet de las cosas) para la recopilación de datos en tiempo real.</li><li>Frameworks de automatización de procesos robóticos (RPA) para la gestión de tareas repetitivas.</li></ul></li><li><strong>Impacto y Beneficios</strong>: Reducción de costos operativos, mejora de la precisión en la producción y respuesta rápida a cambios en la demanda del mercado.</li></ul></li><li><p>Video:<br>&nbsp;</p><figure class=\"media\"><div data-oembed-url=\"https://www.youtube.com/watch?v=8lMIdrlIWOQ\"><div style=\"position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;\"><iframe src=\"https://www.youtube.com/embed/8lMIdrlIWOQ\" style=\"position: absolute; width: 100%; height: 100%; top: 0; left: 0;\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe></div></div></figure></li></ul>','2024-06-17 01:58:32'),(167,19,148,2,NULL,NULL,'<p>sdasdasadsad</p>','2024-06-18 15:59:27'),(168,19,150,2,NULL,NULL,'<p>sadsadsad</p>','2024-06-18 16:01:58'),(177,19,149,2,NULL,NULL,'<p><mark class=\"marker-yellow\">creo que es algo asi amigo:</mark><br><span style=\"color:rgb(207,142,109);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">import </span></span><span style=\"font-size:12px;\">pandas as pd</span><br><span style=\"color:rgb(207,142,109);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">import </span></span><span style=\"font-size:12px;\">matplotlib.pyplot as plt</span><br><br><span style=\"font-size:12px;\"># Cargar datos biológicos</span><br><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:rgb(199,125,187);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">data </span></span><span style=\"font-size:12px;\">= pd.read_csv(</span><span style=\"color:rgb(106,171,115);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">\"biological_data.csv\"</span></span><span style=\"font-size:12px;\">)</span><br><br><span style=\"font-size:12px;\"># Análisis de </span><span style=\"color:rgb(199,125,187);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">datos</span></span><br><span style=\"color:rgb(199,125,187);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; summary_stats </span></span><span style=\"font-size:12px;\">= </span><span style=\"color:rgb(199,125,187);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">data</span></span><span style=\"font-size:12px;\">.describe()</span><br><span style=\"font-size:12px;\">plt.</span><span style=\"color:rgb(86,168,245);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">hist</span></span><span style=\"font-size:12px;\">(</span><span style=\"color:rgb(199,125,187);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">data</span></span><span style=\"font-size:12px;\">[</span><span style=\"color:rgb(106,171,115);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">\'gene_expression\'</span></span><span style=\"font-size:12px;\">])</span><br><span style=\"font-size:12px;\">plt.</span><span style=\"color:rgb(86,168,245);font-family:Poppins, sans-serif;font-size:12px;\"><span style=\"box-sizing:border-box;list-style:none;margin:0px;padding:0px;text-decoration:none;\">show</span></span><span style=\"font-size:12px;\">()</span></p>','2024-06-21 01:59:13'),(178,18,NULL,1,NULL,'Tengo un problema con el archivo de index.html','<p>Estoy desarrollando un sitio web utilizando HTML y CSS, y he encontrado que el diseño se ve diferente en varios navegadores (Chrome, Firefox, Safari, Edge). Esto está causando inconsistencias visuales y problemas de usabilidad en la experiencia del usuario. Necesito identificar y resolver estos problemas de renderización para asegurar que el sitio se vea y funcione de manera uniforme en todos los navegadores principales.</p><p><strong>Requisitos del proyecto:</strong></p><p><strong>&nbsp;</strong></p><ul style=\"list-style-type:disc;\"><li style=\"tab-stops:list 36.0pt;\"><strong>Consistencia entre Navegadores</strong>: Asegurar que el sitio web se vea y funcione de manera consistente en todos los navegadores.</li><li style=\"tab-stops:list 36.0pt;\"><strong>Soluciones Sencillas y Mantenibles</strong>: Implementar soluciones que sean fáciles de entender y mantener.</li><li style=\"tab-stops:list 36.0pt;\"><strong>Soporte para Versiones Anteriores</strong>: Proveer soluciones para versiones ligeramente anteriores de navegadores, si es posible.</li><li style=\"tab-stops:list 36.0pt;\">&nbsp;</li></ul><p style=\"margin-left:36.0pt;\"><i>Código de index.html</i></p><p>&nbsp;</p><ul style=\"list-style-type:disc;\"><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:gray;font-size:9.0pt;\">&lt;!</span><span style=\"color:#569CD6;font-size:9.0pt;\">DOCTYPE</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">html</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:gray;font-size:9.0pt;\">&lt;</span><span style=\"color:#569CD6;font-size:9.0pt;\">html</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">lang</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">=</span><span style=\"color:#CE9178;font-size:9.0pt;\">\"en\"</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;</span><span style=\"color:#569CD6;font-size:9.0pt;\">head</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;</span><span style=\"color:#569CD6;font-size:9.0pt;\">meta</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">charset</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">=</span><span style=\"color:#CE9178;font-size:9.0pt;\">\"UTF-8\"</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;/</span><span style=\"color:#569CD6;font-size:9.0pt;\">head</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;</span><span style=\"color:#569CD6;font-size:9.0pt;\">body</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;</span><span style=\"color:#569CD6;font-size:9.0pt;\">style</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#D7BA7D;font-size:9.0pt;\">#container</span><span style=\"color:#D4D4D4;font-size:9.0pt;\"> {</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">width</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">:&nbsp;</span><span style=\"color:#B5CEA8;font-size:9.0pt;\">1000px</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">margin</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">:&nbsp;</span><span style=\"color:#B5CEA8;font-size:9.0pt;\">20px</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp;</span><span style=\"color:#CE9178;font-size:9.0pt;\">auto</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#D7BA7D;font-size:9.0pt;\">.ck-editor__editable</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">[</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">role</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">=</span><span style=\"color:#CE9178;font-size:9.0pt;\">\"textbox\"</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">] {</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#6A9955;font-size:9.0pt;\">/* Editing area */</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">min-height</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">:&nbsp;</span><span style=\"color:#B5CEA8;font-size:9.0pt;\">200px</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#D7BA7D;font-size:9.0pt;\">.ck-content</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp;</span><span style=\"color:#D7BA7D;font-size:9.0pt;\">.image</span><span style=\"color:#D4D4D4;font-size:9.0pt;\"> {</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#6A9955;font-size:9.0pt;\">/* Block images */</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">max-width</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">:&nbsp;</span><span style=\"color:#B5CEA8;font-size:9.0pt;\">80%</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">margin</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">:&nbsp;</span><span style=\"color:#B5CEA8;font-size:9.0pt;\">20px</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp;</span><span style=\"color:#CE9178;font-size:9.0pt;\">auto</span><span style=\"color:#D4D4D4;font-size:9.0pt;\">;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#D4D4D4;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;/</span><span style=\"color:#569CD6;font-size:9.0pt;\">style</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;</span><span style=\"color:#569CD6;font-size:9.0pt;\">div</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">class</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">=</span><span style=\"color:#CE9178;font-size:9.0pt;\">\"question\"</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;</span><span style=\"color:#569CD6;font-size:9.0pt;\">div</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">class</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">=</span><span style=\"color:#CE9178;font-size:9.0pt;\">\"question-inner\"</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></span><span style=\"color:gray;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&lt;</span></span><span style=\"color:#569CD6;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">label</span></span><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&nbsp;</span></span><span style=\"color:#9CDCFE;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">for</span></span><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">=</span></span><span style=\"color:#CE9178;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">\"details\"</span></span><span style=\"color:gray;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&gt;</span></span><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">Detalles</span></span><span style=\"color:gray;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&lt;/</span></span><span style=\"color:#569CD6;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">label</span></span><span style=\"color:gray;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&gt;</span></span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></span><span style=\"color:gray;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&lt;</span></span><span style=\"color:#569CD6;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">textarea</span></span><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&nbsp;</span></span><span style=\"color:#9CDCFE;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">id</span></span><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">=</span></span><span style=\"color:#CE9178;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">\"details\"</span></span><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&nbsp;</span></span><span style=\"color:#9CDCFE;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">name</span></span><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">=</span></span><span style=\"color:#CE9178;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">\"postDetails\"</span></span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\"><span lang=\"EN-US\" dir=\"ltr\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></span><span style=\"color:#9CDCFE;font-size:9.0pt;\">placeholder</span><span style=\"color:#CCCCCC;font-size:9.0pt;\">=</span><span style=\"color:#CE9178;font-size:9.0pt;\">\"Presenta el problema y amplía lo que pusiste en el título. Mínimo 20 caracteres.\"</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#9CDCFE;font-size:9.0pt;\">required</span><span style=\"color:gray;font-size:9.0pt;\">&gt;&lt;/</span><span style=\"color:#569CD6;font-size:9.0pt;\">textarea</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;/</span><span style=\"color:#569CD6;font-size:9.0pt;\">div</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li><li style=\"line-height:normal;tab-stops:list 36.0pt;\"><p style=\"text-align:justify;\"><span style=\"color:#CCCCCC;font-size:9.0pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:gray;font-size:9.0pt;\">&lt;/</span><span style=\"color:#569CD6;font-size:9.0pt;\">div</span><span style=\"color:gray;font-size:9.0pt;\">&gt;</span></p></li></ul>','2024-06-22 15:13:32');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posttag`
--

DROP TABLE IF EXISTS `posttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posttag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7dh8j7x0lb14vgm6yl4l6cqwm` (`tag_id`),
  KEY `FKk8ao1sog3ndkaa2is60c3gnjk` (`post_id`),
  CONSTRAINT `FK7dh8j7x0lb14vgm6yl4l6cqwm` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `FKk8ao1sog3ndkaa2is60c3gnjk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posttag`
--

LOCK TABLES `posttag` WRITE;
/*!40000 ALTER TABLE `posttag` DISABLE KEYS */;
INSERT INTO `posttag` VALUES (4,100,1),(45,129,21),(46,129,18),(47,129,25),(59,133,18),(60,133,1),(61,133,3),(145,141,21),(146,141,18),(147,143,21),(148,143,4),(149,144,1),(150,145,15),(151,146,12),(152,147,17),(153,147,18),(154,148,17),(155,148,16),(156,149,5),(157,149,14),(159,150,3),(169,178,2),(170,178,1);
/*!40000 ALTER TABLE `posttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posttypes`
--

DROP TABLE IF EXISTS `posttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posttypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posttypes`
--

LOCK TABLES `posttypes` WRITE;
/*!40000 ALTER TABLE `posttypes` DISABLE KEYS */;
INSERT INTO `posttypes` VALUES (1,'Pregunta'),(2,'Respuesta');
/*!40000 ALTER TABLE `posttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (10,149,19,'inappropriate','2024-07-04 01:28:47'),(12,150,18,'spam','2024-07-04 02:25:52'),(13,168,18,'spam','2024-07-04 05:47:40'),(14,178,30,'plagiarism','2024-07-09 05:15:51');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savedposts`
--

DROP TABLE IF EXISTS `savedposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savedposts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_post` (`user_id`,`post_id`),
  KEY `fk_saved_posts_post_id` (`post_id`),
  CONSTRAINT `fk_saved_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_saved_posts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savedposts`
--

LOCK TABLES `savedposts` WRITE;
/*!40000 ALTER TABLE `savedposts` DISABLE KEYS */;
INSERT INTO `savedposts` VALUES (28,18,149),(26,19,149),(27,19,178),(24,30,129);
/*!40000 ALTER TABLE `savedposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  `tag_description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'informatica','Etiqueta relacionada con temas de informática y tecnología de la información.'),(2,'desarrollo-web','Etiqueta relacionada con el desarrollo de aplicaciones web.'),(3,'inteligencia-artificial','Etiqueta relacionada con temas de inteligencia artificial y aprendizaje automático.'),(4,'medicina','Etiqueta relacionada con temas de medicina y salud.'),(5,'biologia','Etiqueta relacionada con temas de biología y ciencias de la vida.'),(6,'fisica','Etiqueta relacionada con temas de física y ciencias naturales.'),(7,'matematicas','Etiqueta relacionada con temas de matemáticas y estadísticas.'),(8,'economia','Etiqueta relacionada con temas de economía y finanzas.'),(9,'psicologia','Etiqueta relacionada con temas de psicología y comportamiento humano.'),(10,'educacion','Etiqueta relacionada con temas de educación y pedagogía.'),(11,'programacion','Etiqueta relacionada con temas de programación y desarrollo de software.'),(12,'inteligencia-natural','Etiqueta relacionada con temas de inteligencia natural y ciencias cognitivas.'),(13,'robotica','Etiqueta relacionada con temas de robótica y automatización.'),(14,'criptografia','Etiqueta relacionada con temas de criptografía y seguridad informática.'),(15,'big-data','Etiqueta relacionada con temas de análisis de datos y big data.'),(16,'redes','Etiqueta relacionada con temas de redes de computadoras y comunicaciones.'),(17,'ciberseguridad','Etiqueta relacionada con temas de ciberseguridad y protección de datos.'),(18,'blockchain','Etiqueta relacionada con temas de tecnología blockchain y criptomonedas.'),(19,'realidad-aumentada','Etiqueta relacionada con temas de realidad aumentada y realidad virtual.'),(20,'ciencia-datos','Etiqueta relacionada con temas de ciencia de datos y análisis estadístico.'),(21,'bioinformatica','Etiqueta relacionada con temas de bioinformática y análisis genómico.'),(22,'ingenieria','Etiqueta relacionada con temas de ingeniería en general.'),(23,'diseño','Etiqueta relacionada con temas de diseño gráfico y diseño de experiencias de usuario.'),(24,'marketing','Etiqueta relacionada con temas de marketing digital y estrategias de publicidad.'),(25,'finanzas','Etiqueta relacionada con temas de finanzas personales y empresariales.'),(26,'arte','Etiqueta relacionada con temas de arte y cultura.'),(27,'literatura','Etiqueta relacionada con temas de literatura y escritura creativa.'),(28,'historia','Etiqueta relacionada con temas de historia y ciencias sociales.'),(29,'filosofia','Etiqueta relacionada con temas de filosofía y pensamiento crítico.'),(30,'religion','Etiqueta relacionada con temas de religión y espiritualidad.');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_role` (`user_id`,`role`),
  CONSTRAINT `fk_user_roles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (3,31,'ADMIN');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `about_me` text,
  `carrera` varchar(255) DEFAULT NULL,
  `nacimiento` datetime(6) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `tiktok_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email_address` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (18,'Axel Jhosmell','axeljhosmell13@gmail.com','$2a$10$MWlA.yoOlfWl9N6oPDeNquBgfB55/0CLwzYWB2myQUuyPzW8DCu0m','\"Soy Axel Jhosmell Muñoz Silva, Ingeniero de Sistemas apasionado por la tecnología y la innovación. Siempre en búsqueda de nuevos desafíos y oportunidades para aprender y crecer. ¡Listo para conectar y compartir conocimientos!\"','ingenieria de chistemas',NULL,'/uploads/MarkZuckerberg.jpg','https://www.facebook.com/axel.jhosmell','https://www.linkedin.com/in/axeljhosmell','https://www.instagram.com/axeljhosmell','https://www.tiktok.com/@axeljhosmell'),(19,'Pedro Cano','Maria13@gmail.com','$2a$10$QIl7eM7reKvAqjhSrjQuy.h9SPBQ54ZyEgtanuxtUx/jTOc17y3H6','Me gusta mucho la tecnologia,  tengo sitios web el cual puedan interesarte, siganme en mis redes sociales.','ingenieria de sistemas','2003-08-04 00:00:00.000000','/uploads/D_NQ_NP_895537-MLM48940213120_012022-O.jpg','https://www.youtube.com/watch?v=_ye-8uRxJhU&t=543s','https://drive.google.com/drive/u/1/home','',''),(24,'María López','maria.lopez@example.com','$2a$10$cFtyp6SSGWCbJg/benll5eo0SFZSVyHrlMvg8W7HNQcI8mgv0OY6i','¡Hola! Me llamo María y me encanta la fotografía.','Comunicación Social','1988-09-19 00:00:00.000000','/uploads/images (1).jpeg',NULL,NULL,NULL,NULL),(25,'Juan Pérez','juan.perez@example.com','$2a$10$9KTC3lLrjPNRqOJe1Gk2xOKgAV.T/.VX.VrE0pcckvf0j0dximHA.','Saludos, soy Juan y me gusta el deporte y la lectura.','Educación Física','1995-03-09 00:00:00.000000','/uploads/Alex_turner_2023_4k_background.jpg',NULL,NULL,NULL,NULL),(26,'Laura Martínez','laura.martinez@example.com','$2a$10$eQT5.tGI1E4vVTF8f6DiveggbOIHDA.dR.xt4C9Bs6AyCKMwJV50q','Hola a todos, soy Laura. Amo viajar y descubrir nuevas culturas.','Turismo','1992-11-27 00:00:00.000000','/uploads/images (2).jpeg',NULL,NULL,NULL,NULL),(27,'Carlos Rodríguez','carlos.rodriguez@example.com','$2a$10$nNr7gsowTpoWXTIgq5CAEeJsk2gp.wWY4LplPNV1mibyNTkw60cCC','¡Hola! Soy Carlos y me apasiona la música y la tecnología.','Música','1987-07-04 00:00:00.000000','/uploads/images (3).jpeg',NULL,NULL,NULL,NULL),(28,'Ana García','ana.garcia@example.com','$2a$10$9P7V795CNdQeGp9dqQ05YOgW9gClM5mZPZ59piFWjq7pcoC6yqojS','¡Hola! Me llamo Ana y soy una entusiasta de los libros y el arte.','Historia del Arte','1993-02-13 00:00:00.000000','/uploads/480x624-eza-vip-la-belleza-segun-ana-garcia-sineriz-6906637-2-esl-es-la-belleza-segun-ana-garcia-sineriz-jpg.jpg',NULL,NULL,NULL,NULL),(29,'David Fernández','david.fernandez@example.com','$2a$10$NAd2H8JAmeKN.LdIAhic/OqT6hXpVSCzgjLLZg4PgysXV.nZUKZ26','Saludos, soy David y disfruto mucho del cine y la cocina.','Gastronomía','1991-06-29 00:00:00.000000','/uploads/images (4).jpeg',NULL,NULL,NULL,NULL),(30,'Sofía Morales','sofia.morales@example.com','$2a$10$LwOlwR0ZNI4BvghBXPWsjexE3zkBGk8yO0Vymxl52eiKE9wElHvHW','¡Hola! Me llamo Sofía y me encanta el senderismo y la naturaleza.','Biología','1994-08-11 00:00:00.000000','/uploads/images (5).jpeg',NULL,NULL,NULL,NULL),(31,'Pedro López','pedro.lopez@example.com','$2a$10$ZWhOB9fEt5up1xTvliTIs.dyWM9BKOGDAVDZYIESH64QMRGUGN.Iy','Hola, soy Pedro. Me interesan mucho las finanzas y la economía.','Economía','1989-04-24 00:00:00.000000','/uploads/images (6).jpeg',NULL,NULL,NULL,NULL),(32,'Luisa Ramírez','luisa.ramirez@example.com','$2a$10$GGYpDP69W/.wcNvZwa1pzuUpCB4i7pmU2xW8jxZ4OOB81mQFvAnVK','¡Hola! Soy Luisa y disfruto del yoga y la meditación.','Psicología','1996-01-07 00:00:00.000000','/uploads/DYITcAvWAAAege9.jpg',NULL,NULL,NULL,NULL),(33,'Eduardo Gómez','eduardo.gomez@example.com','$2a$10$Eq5Vq7lnMHTClbFVmbCzaeroP7ERmdXwzdrnKpjV7LY34UNJTWjwu','¡Hola! Soy Eduardo y me gusta la programación y los videojuegos.','Ingeniería en Sistemas','1990-07-17 00:00:00.000000','/uploads/50fb108b-3121-4b42-a712-a26e59a66cb0-1673411269000.png',NULL,NULL,NULL,NULL),(46,'Ciro castillo','eduardo.gomez@ucvvirtual.edu.pe','$2a$10$kCN052BdsOu/TExpkXQtCO2sDpzI5SGPlBFKzsceq0EXM.mo7A3t.','Hola, soy Pedro. Me interesan mucho las finanzas y la economía.','Economía','1989-04-23 00:00:00.000000','/uploads/e73af62e-2a1e-4832-bb16-3d0c0cc64665.jpeg','','','',''),(87,'JuanManuelPerez','amunozsi@ucvvirtual.edu.pe','$2a$10$4Jlbh1r9lF6E2Xmz67xvLueo0WYuWhfN3fpoYi3MxZf7R8RR0Nwba','sadssad','Ingenieria de sistemas',NULL,NULL,'','','','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_token`
--

DROP TABLE IF EXISTS `verification_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_token`
--

LOCK TABLES `verification_token` WRITE;
/*!40000 ALTER TABLE `verification_token` DISABLE KEYS */;
INSERT INTO `verification_token` VALUES (28,'3feac626-9077-44fc-8449-adc43fbff922','pcanosa@ucvvirtual.edu.pe','2024-06-23 06:22:57');
/*!40000 ALTER TABLE `verification_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_types`
--

DROP TABLE IF EXISTS `vote_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vote_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_types`
--

LOCK TABLES `vote_types` WRITE;
/*!40000 ALTER TABLE `vote_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `vote_type_id` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `vote_type_id` (`vote_type_id`),
  CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `votes_ibfk_3` FOREIGN KEY (`vote_type_id`) REFERENCES `votetypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votetypes`
--

DROP TABLE IF EXISTS `votetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votetypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vote_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votetypes`
--

LOCK TABLES `votetypes` WRITE;
/*!40000 ALTER TABLE `votetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votetypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-09  1:31:56
