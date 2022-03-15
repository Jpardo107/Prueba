-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: colegio2
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Temporary view structure for view `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!50001 DROP VIEW IF EXISTS `curso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `curso` AS SELECT 
 1 AS `Nombre`,
 1 AS `Curso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `promrojo`
--

DROP TABLE IF EXISTS `promrojo`;
/*!50001 DROP VIEW IF EXISTS `promrojo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `promrojo` AS SELECT 
 1 AS `Nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alumnospromedios`
--

DROP TABLE IF EXISTS `alumnospromedios`;
/*!50001 DROP VIEW IF EXISTS `alumnospromedios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnospromedios` AS SELECT 
 1 AS `Nombre`,
 1 AS `Curso`,
 1 AS `Promedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `promnotascursoal`
--

DROP TABLE IF EXISTS `promnotascursoal`;
/*!50001 DROP VIEW IF EXISTS `promnotascursoal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `promnotascursoal` AS SELECT 
 1 AS `Nombre`,
 1 AS `Curso`,
 1 AS `Promedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `curso`
--

/*!50001 DROP VIEW IF EXISTS `curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `curso` AS select concat_ws(' ',`a`.`NOM_AL`,`a`.`AP_AL`) AS `Nombre`,`c`.`NOM_CURSO` AS `Curso` from ((`alumno` `a` join `esta` `b`) join `cursos` `c`) where ((`a`.`RUT_AL` = `b`.`RUT_AL`) and (`b`.`ID_CURSO` = `c`.`ID_CURSO`) and (0 <> `c`.`ID_CURSO`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `promrojo`
--

/*!50001 DROP VIEW IF EXISTS `promrojo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `promrojo` AS select concat_ws(' ',`a`.`NOM_AL`,`a`.`AP_AL`) AS `Nombre` from ((((`alumno` `a` join `esta` `b`) join `cursos` `c`) join `pruebas` `d`) join `rinde` `e`) where ((`a`.`RUT_AL` = `b`.`RUT_AL`) and (`b`.`ID_CURSO` = `c`.`ID_CURSO`) and (0 <> `c`.`ID_CURSO`) and (`c`.`ID_CURSO` = `d`.`ID_CURSO`) and (`d`.`ID_PR` = `e`.`ID_PR`) and (`a`.`RUT_AL` = `e`.`RUT_AL`)) group by `c`.`NOM_CURSO`,`a`.`RUT_AL` having (truncate(avg(`e`.`nota_pr`),1) < 4.0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alumnospromedios`
--

/*!50001 DROP VIEW IF EXISTS `alumnospromedios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnospromedios` AS select concat_ws(' ',`a`.`NOM_AL`,`a`.`AP_AL`) AS `Nombre`,`c`.`NOM_CURSO` AS `Curso`,truncate(avg(`e`.`nota_pr`),1) AS `Promedio` from ((((`alumno` `a` join `esta` `b`) join `cursos` `c`) join `pruebas` `d`) join `rinde` `e`) where ((`a`.`RUT_AL` = `b`.`RUT_AL`) and (`b`.`ID_CURSO` = `c`.`ID_CURSO`) and (0 <> `c`.`ID_CURSO`) and (`c`.`ID_CURSO` = `d`.`ID_CURSO`) and (`d`.`ID_PR` = `e`.`ID_PR`) and (`a`.`RUT_AL` = `e`.`RUT_AL`)) group by `c`.`NOM_CURSO`,`a`.`RUT_AL` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `promnotascursoal`
--

/*!50001 DROP VIEW IF EXISTS `promnotascursoal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `promnotascursoal` AS select concat_ws(' ',`a`.`NOM_AL`,`a`.`AP_AL`) AS `Nombre`,`c`.`NOM_CURSO` AS `Curso`,truncate(avg(`d`.`nota_pr`),1) AS `Promedio` from ((((`alumno` `a` join `esta` `b`) join `cursos` `c`) join `rinde` `d`) join `pruebas` `e`) where ((`a`.`RUT_AL` = `b`.`RUT_AL`) and (`b`.`ID_CURSO` = `c`.`ID_CURSO`) and (0 <> `c`.`ID_CURSO`) and (`a`.`RUT_AL` = `d`.`RUT_AL`) and (`d`.`ID_PR` = `e`.`ID_PR`) and (`a`.`RUT_AL` = '175119426') and (`c`.`NOM_CURSO` = 'Programacion')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-13 19:58:59
