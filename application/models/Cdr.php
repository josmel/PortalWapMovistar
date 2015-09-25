<?php

/**
 * Description of User
 *
 * @author Jyupanqui
 */
class App_Model_Cdr extends App_Db_Table_Abstract {

    protected $_name = 'cdr';

    const TABLA_CDR = 'cdr';

    public function saveCdr($datos) {
        try {
//			$db = $this->getDefaultAdapter();
//			$db->insert($this->_name, $datos);
//			$id = $db->lastInsertId($this->_name, "codigo");

            $name = date('YmdH');
            if (is_array($datos['url'])) {
                $this->saveCdrBanners($datos, 1, $name);
            } else {
                $this->saveCdrText($datos, 1, $name);
            }
            return 1;
        } catch (Exception $e) {
            echo $e->getMessage();
            exit;
            return false;
        }
    }

    private function saveCdrText($datos, $id, $name) {
        $writer = new Zend_Log_Writer_Stream(APPLICATION_PATH . '/../logs/cdr/' . $name . ".moso");
       // $writer = new Zend_Log_Writer_Stream('/var/log/portalwap/'.$name.".moso");
        $formatter = new Zend_Log_Formatter_Simple('%message%' . PHP_EOL);
        $writer->setFormatter($formatter);
        $log = new Zend_Log($writer);
        $mensaje = $datos['fecha'] . "," . $datos['hora'] . "," . $id . "," . $_SERVER['REMOTE_ADDR']
                . "," . $_SERVER['SERVER_ADDR'] . "," . $datos['telefono'] . ",perfil:" . $datos['perfil']
                . "," . $datos['categoria'] . "," . $datos['descripcion']. "," . $datos['url']. "," . $datos['user_agent'];
          $log->info($mensaje);
    }

    private function saveCdrBanners($datos, $id, $name) {
        $writer = new Zend_Log_Writer_Stream(APPLICATION_PATH . '/../logs/cdr/' . $name . ".banners");
       // $writer = new Zend_Log_Writer_Stream('/var/log/portalwap/'.$name.".banners");
        $formatter = new Zend_Log_Formatter_Simple('%message%' . PHP_EOL);
        $writer->setFormatter($formatter);
        $log = new Zend_Log($writer);
        $banners = 'banner1.'.$datos['url'][0] . "," . 'banner2.'.$datos['url'][1] . "," . 'banner3.'.$datos['url'][2] . "," .'banner4.'. $datos['url'][3]
                . "," . 'banner5.'.$datos['url'][4];
        $mensaje = $datos['fecha'] . "," . $datos['hora'] . "," . $_SERVER['REMOTE_ADDR']
                . "," . $datos['telefono'] . ",perfil:" . $datos['perfil']
                . "," . $banners;
        $log->info($mensaje);
    }

}