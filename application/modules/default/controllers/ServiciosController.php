<?php

class Default_ServiciosController extends Zend_Controller_Action {

    public function init() {
        $this->noCache();
        parent::init();
        $this->_helper->layout->setLayout('layout-servicios');
        $this->_flashMessage = new App_Controller_Action_Helper_FlashMessengerCustom();
    }

    public function redesSocialesAction() {
        
    }

    public function smartphonewebAction() {

        $ua = $_SERVER['HTTP_USER_AGENT'];
        $model = new App_Model_ConfigPerfil();
        $controller = $this->getParam('controller');
        $model->getPerfil($ua, $controller, 'index', 'home', 'index', 6);
        header("Location: /portalwap");
        exit;
    }

    public function noticiasAction() {
        
    }

    public function correoChatAction() {
        
    }

    public function iframeAction() {
        
    }

    public function legalAction() {
        
    }

    public function portal515Action() {
        
    }

    public function registrateAction() {
        $registroModel = new App_Model_Registro();
        if ($this->_request->isPost()) {
            $dataForm = $this->_request->getPost();
            try {
                $this->validar($dataForm);
                if (!isset($dataForm['opt'])):
                    $dataForm['opt'] = 'no';
                endif;
                if (!isset($dataForm['prd'])):
                    $dataForm['opt'] = 'no';
                endif;
                if (!isset($dataForm['optlocalizacion'])):
                    $dataForm['opt'] = 'no';
                endif;
                if (is_numeric($dataForm['dia']) && strlen($dataForm['dia']) == 2) {
                    if (is_numeric($dataForm['mes']) && strlen($dataForm['mes']) == 2) {
                        if (is_numeric($dataForm['anio']) && strlen($dataForm['anio']) == 4) {
                            $fecha_nacimiento = $dataForm['anio'] . '-' . $dataForm['mes'] . '-' . $dataForm['dia'];
                        }
                    }
                } else {
                    $this->_flashMessage->success('fecha de nacimiento invalido');
                    header("Location: /portalwap/registrate");
                    exit;
                }
                $telefono = (isset($_SERVER['HTTP_X_UP_CALLING_LINE_ID'])) ? $_SERVER['HTTP_X_UP_CALLING_LINE_ID'] : '';
                $registro = array(
                    'numero'=>$telefono,
                    'nombre' => $dataForm['nombre'],
                    'apellido' => $dataForm['apellido'],
                    'dni' => $dataForm['dni'],
                    'correo' => $dataForm['correo'],
                    'opt' => $dataForm['opt'],
                    'prd' => $dataForm['prd'],
                    'fecha_nacimiento' => $fecha_nacimiento,
                    'sexo' => $dataForm['sexo'],
                    'provincia' => $dataForm['provincia'],
                    'estado_civil' => $dataForm['estado_civil'],
                    'fecha_registro' => date('Y-m-d'),
                    'nivel_educacion' => $dataForm['nivel_educacion'],
                    'profesion' => $dataForm['profesion'],
                    'optlocalizacion' => $dataForm['optlocalizacion']
                );
                $idRegistro = $registroModel->inserRegistro($registro);
                $registroModel->inserRegistroAreas($dataForm['area_interes'], $idRegistro);
                header("Location: /portalwap/");
            } catch (Exception $e) {
                echo $e->getMessage();
            }
        } else {
            $resultadoAras = $registroModel->getAreas();
            $this->view->areas = $resultadoAras;
        }
    }

    function valid_email($val) {
        if (!filter_var($val, FILTER_VALIDATE_EMAIL)) {
            return false;
        }
        return true;
    }

    public function validar($dataForm) {
        if (empty($dataForm['nombre'])):
            $this->_flashMessage->success('ingrese su nombre');
            header("Location: /portalwap/registrate");
            exit;
        endif;
        if (empty($dataForm['apellido'])):
            $this->_flashMessage->success('Ingrese su apellido');
            header("Location: /portalwap/registrate");
            exit;
        endif;
        if (!is_numeric($dataForm['dni']) || strlen($dataForm['dni']) != 8) {
            $this->_flashMessage->success('DNI invalido o vacio');
            header("Location: /portalwap/registrate");
            exit;
        }
        $correo = $this->valid_email($dataForm['correo']);
        if ($correo == false):
            $this->_flashMessage->success('Email invalido');
            header("Location: /portalwap/registrate");
            exit;
        endif;
        if ($dataForm['provincia'] == '0'):
            $this->_flashMessage->success('Ingrese su provincia');
            header("Location: /portalwap/registrate");
            exit;
        endif;
        if ($dataForm['estado_civil'] == '0'):
            $this->_flashMessage->success('Ingrese su estado civil');
            header("Location: /portalwap/registrate");
            exit;
        endif;
        if ($dataForm['nivel_educacion'] == '0'):
            $this->_flashMessage->success('Ingrese su nivel de educacion');
            header("Location: /portalwap/registrate");
            exit;
        endif;
        if ($dataForm['profesion'] == '0'):
            $this->_flashMessage->success('ingrese su profesion');
            header("Location: /portalwap/registrate");
            exit;
        endif;
    }

    public function rbtAction() {
        
    }

    public function goAction() {
        $_getVars = $_GET;

        $_key = array_keys($_getVars);
        $_valor = array_values($_getVars);
        $numGet = count($_getVars);
        $bucleGet = $numGet - 1;
        $link = '';
        for ($x = 2; $x <= $bucleGet; $x++) {
            if ($x == 2) {
                $link.=$_valor[$x];
            } else {
                $link.="&" . $_key[$x] . "=" . $_valor[$x];
            }
        }
        $ua = $_SERVER['HTTP_USER_AGENT'];
        $model = new App_Model_ConfigPerfil();
        $controller = $this->getParam('controller');
        $model->getPerfil($ua, $controller, $link, $_GET['categoria'], $_GET['descripcion']);
        header("Location: " . $link);
        exit;
    }

    function noCache() {
        header("Expires: Tue, 01 Jul 2001 06:00:00 GMT");
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
    }

}
