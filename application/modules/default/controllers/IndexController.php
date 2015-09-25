<?php

class Default_IndexController extends App_Controller_Action_Portal {

    public function init() {
        $this->noCache();
        parent::init();
        $telefono = (isset($_SERVER['HTTP_X_UP_CALLING_LINE_ID'])) ? $_SERVER['HTTP_X_UP_CALLING_LINE_ID'] : '111111';
        if ($telefono != '') {
            $registroModel = new App_Model_Registro();
            $data = $registroModel->obtenerRegistro($telefono);
            if ($data) {
                $this->view->estado = $data['nombre'];
            }
            $this->view->telefono = 1;
        } else {
            $this->view->telefono = 0;
        }
        $pathMUSICA = $this->_config->app->jsonMusica;
        $SoapMusica = json_decode(file_get_contents($pathMUSICA), true);
        $pathSERVICIO = $this->_config->app->jsonServicio;
        $SoapServicio = json_decode(file_get_contents($pathSERVICIO), true);
        $pathJUEGO = $this->_config->app->jsonJuego;
        $SoapJuego = json_decode(file_get_contents($pathJUEGO), true);
        $pathTEXT = $this->_config->app->jsonText;
        $SoapText = json_decode(file_get_contents($pathTEXT), true);
        $pathLINK = $this->_config->app->jsonLink;
        $SoapLink = json_decode(file_get_contents($pathLINK), true);
        $this->view->SoapMusica = $SoapMusica;
        $this->view->SoapJuego = $SoapJuego;
        $this->view->SoapText = $SoapText;
        $this->view->SoapServicio = $SoapServicio;
        $this->view->SoapLink = $SoapLink;
        $this->view->urlServer = $this->_config->resources->view->urlServer;
    }

    public function indexAction() {
        $this->_redirect('/basico240');
    }

    public function basicoAction() {
        $this->_helper->layout->disableLayout();
    }

    public function basico128Action() {
        $this->_helper->layout->setLayout('layout-basico128');
    }

    public function basico240Action() {
        $this->_helper->layout->setLayout('layout-basico240');
    }

    public function basico360Action() {
        $this->_helper->layout->setLayout('layout-basico360');
    }

    public function avanzadoAction() {
        $this->_helper->layout->setLayout('layout-avanzado');
    }

    public function goAction() {
        $enlace = $this->getParam('enlace');
        $perfil = $this->getParam('perfil');
        echo $enlace;
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
