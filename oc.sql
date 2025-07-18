-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-07-2025 a las 10:13:13
-- Versión del servidor: 5.6.42
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gustavof_oc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `comi` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `location_id` int(11) NOT NULL DEFAULT '0',
  `bank` int(11) NOT NULL DEFAULT '0',
  `userlink` varchar(200) NOT NULL DEFAULT '',
  `ean` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`, `comi`, `location_id`, `bank`, `userlink`, `ean`) VALUES
(1, 1, 'dirsis', '345dacfd0d562ce77d69028c4951873d896afd33', 'M8Oyhdt45', 'John', 'Doe', 'dirsis@gmail.com', '', '', '200.105.110.228', 1, '2025-05-13 09:57:39', '0.0000', 0, 0, '', ''),
(2, 1, 'admin', 'e5bd4bb1821dc2ec14fc0b77172926f9af1bcc29', 'mWGkeeRjy', 'admin', 'admin', 'info@ccpa.com.ar', '', '', '181.93.248.251', 1, '2025-05-13 21:51:11', '0.0000', 0, 0, '', 'admin'),
(3, 1, 'gustavof', '94acccf5519555c706a96aedff7da7049198c22e', 'csIpMpW3A', 'gustavo', 'ferreyra', 'info@gustavoferreyra.com.ar', '', '', '181.93.191.200', 1, '2025-07-14 10:21:59', '0.0000', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT '0',
  `altas` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`, `nivel`, `altas`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/nproduct\",\"catalog\\/opinion\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"catalog\\/stock\",\"common\\/column_left\",\"common\\/dashboard2\",\"common\\/dashboard3\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/address\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/customer_search\",\"customer\\/customerlg\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/ecoactivity\",\"extension\\/dashboard\\/ecocart\",\"extension\\/dashboard\\/ecochart\",\"extension\\/dashboard\\/ecocliente\",\"extension\\/dashboard\\/ecocustomer\",\"extension\\/dashboard\\/ecofiltro\",\"extension\\/dashboard\\/ecoonline\",\"extension\\/dashboard\\/ecoorder\",\"extension\\/dashboard\\/ecopedido\",\"extension\\/dashboard\\/ecopedidoentrega\",\"extension\\/dashboard\\/ecopedidoporciudad\",\"extension\\/dashboard\\/ecopedidoporzona\",\"extension\\/dashboard\\/ecopedidopromedio\",\"extension\\/dashboard\\/ecoproducto\",\"extension\\/dashboard\\/ecorecent\",\"extension\\/dashboard\\/ecosale\",\"extension\\/export_import\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/cart\",\"extension\\/module\\/category\",\"extension\\/module\\/facebook_business\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/service\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/social_login\",\"extension\\/module\\/store\",\"extension\\/module\\/todo\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/mp_standard\",\"extension\\/payment\\/mp_ticket\",\"extension\\/payment\\/mp_transparente\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/flat1\",\"extension\\/shipping\\/flat10\",\"extension\\/shipping\\/flat2\",\"extension\\/shipping\\/flat3\",\"extension\\/shipping\\/flat4\",\"extension\\/shipping\\/flat5\",\"extension\\/shipping\\/flat6\",\"extension\\/shipping\\/flat7\",\"extension\\/shipping\\/flat8\",\"extension\\/shipping\\/flat9\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/pickup\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/dirsis_discount\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/codiva\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/factura_status\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/notifica\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/concurso\",\"marketing\\/contact\",\"marketing\\/correo\",\"marketing\\/coupon\",\"marketing\\/cumple\",\"marketing\\/cumpleaporte\",\"marketing\\/ganador\",\"marketing\\/marketing\",\"marketing\\/sucursal\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"meli\\/api\",\"meli\\/consultorio\",\"miservice\\/miservice\",\"miservice\\/miserviceestado\",\"pkdirsis\\/agente\",\"pkdirsis\\/download\",\"pkdirsis\\/flyers\",\"pkdirsis\\/informe\",\"pkdirsis\\/operacion\",\"pkdirsis\\/ppsrdownload\",\"pkdirsis\\/ppsrinforme\",\"pkdirsis\\/ppstdownload\",\"pkdirsis\\/ppstestadi\",\"pkdirsis\\/ppstinforme\",\"pkdirsis\\/recurring\",\"pkdirsis\\/review\",\"pkdirsis\\/uniondownload\",\"pkdirsis\\/unioninforme\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/abando\",\"sale\\/order\",\"sale\\/order.php\",\"sale\\/orderxmanu\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user.php\",\"user\\/user_permission\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/nproduct\",\"catalog\\/opinion\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"catalog\\/stock\",\"common\\/column_left\",\"common\\/dashboard2\",\"common\\/dashboard3\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/address\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/customer_search\",\"customer\\/customerlg\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/ecoactivity\",\"extension\\/dashboard\\/ecocart\",\"extension\\/dashboard\\/ecochart\",\"extension\\/dashboard\\/ecocliente\",\"extension\\/dashboard\\/ecocustomer\",\"extension\\/dashboard\\/ecofiltro\",\"extension\\/dashboard\\/ecoonline\",\"extension\\/dashboard\\/ecoorder\",\"extension\\/dashboard\\/ecopedido\",\"extension\\/dashboard\\/ecopedidoentrega\",\"extension\\/dashboard\\/ecopedidoporciudad\",\"extension\\/dashboard\\/ecopedidoporzona\",\"extension\\/dashboard\\/ecopedidopromedio\",\"extension\\/dashboard\\/ecoproducto\",\"extension\\/dashboard\\/ecorecent\",\"extension\\/dashboard\\/ecosale\",\"extension\\/export_import\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/cart\",\"extension\\/module\\/category\",\"extension\\/module\\/facebook_business\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/service\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/social_login\",\"extension\\/module\\/store\",\"extension\\/module\\/todo\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/mp_standard\",\"extension\\/payment\\/mp_ticket\",\"extension\\/payment\\/mp_transparente\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/flat1\",\"extension\\/shipping\\/flat10\",\"extension\\/shipping\\/flat2\",\"extension\\/shipping\\/flat3\",\"extension\\/shipping\\/flat4\",\"extension\\/shipping\\/flat5\",\"extension\\/shipping\\/flat6\",\"extension\\/shipping\\/flat7\",\"extension\\/shipping\\/flat8\",\"extension\\/shipping\\/flat9\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/pickup\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/dirsis_discount\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/codiva\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/factura_status\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/notifica\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/concurso\",\"marketing\\/contact\",\"marketing\\/correo\",\"marketing\\/coupon\",\"marketing\\/cumple\",\"marketing\\/cumpleaporte\",\"marketing\\/ganador\",\"marketing\\/marketing\",\"marketing\\/sucursal\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"meli\\/api\",\"meli\\/consultorio\",\"miservice\\/miservice\",\"miservice\\/miserviceestado\",\"pkdirsis\\/agente\",\"pkdirsis\\/download\",\"pkdirsis\\/flyers\",\"pkdirsis\\/informe\",\"pkdirsis\\/operacion\",\"pkdirsis\\/ppsrdownload\",\"pkdirsis\\/ppsrinforme\",\"pkdirsis\\/ppstdownload\",\"pkdirsis\\/ppstestadi\",\"pkdirsis\\/ppstinforme\",\"pkdirsis\\/recurring\",\"pkdirsis\\/review\",\"pkdirsis\\/uniondownload\",\"pkdirsis\\/unioninforme\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/abando\",\"sale\\/order\",\"sale\\/order.php\",\"sale\\/orderxmanu\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user.php\",\"user\\/user_permission\"]}', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
