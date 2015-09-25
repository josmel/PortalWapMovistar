<?php

/**
 * Description of User
 *
 * @author Jyupanqui
 */
class App_Model_Registro extends App_Db_Table_Abstract {

    protected $_name = 'registro';

    const TABLA_CONFIG = 'registro';

    public function inserRegistro($registros) {
        $this->getAdapter()->insert($this->_name, $registros);
        $id = $this->getAdapter()->lastInsertId($this->_name, 'id');
        return $id;
    }

    public function inserRegistroAreas($area_interes, $idRegistro) {
        foreach ($area_interes as $value) {
            $data = array('idarea' => $value, 'idregistro' => $idRegistro);
            $this->getAdapter()->insert('areas_registros', $data);
        }
    }

    public function getAreas() {
        $query = $this->getAdapter()
                        ->select()->from('areas');
        $result = $this->getAdapter()->fetchAll($query);
        return $result;
    }

    public function obtenerRegistro($telefono) {
        $query = $this->getAdapter()
                ->select()->from($this->_name, array('nombre'))
                ->where('numero = ?', $telefono);

        $result = $this->getAdapter()->fetchRow($query);
        // registrar UserAgent
        return $result;
    }

}
