<?php

class Demo_IndexController extends App_Controller_Action_Portal {

    public function init() {
        parent::init();
        $ua = $_SERVER['HTTP_USER_AGENT'];
        $model = new App_Model_ConfigPerfil();
        $controller = $this->getParam('controller');
        $result = $model->getPerfil($ua, $controller);


        $this->view->perfil = $result["perfil"];
        $perfil = $result["perfil"];
//echo "-".$perfil."-"; 

        $this->_config = Zend_Registry::get('config');
        $config = $this->getConfig();
        $siteUrl = $config->app->siteUrl;
        $elementsUrl = $config->app->elementsUrl;
        $mediaRoot = $config->app->mediaRoot;
        $mediaUrl = $config->app->mediaUrl;
        $elementsRoot = $config->app->elementsRoot;
        /*             var_dump(array('$siteUrl'=>$siteUrl,
          '$mediaUrl'=>$mediaUrl,
          '$elementsUrl'=>$elementsUrl,
          'mediaRoot'=>$mediaRoot,
          '$elementsRoot'=>$elementsRoot) );exit;
         */


        switch ($perfil):
            case '1' :
                $this->forward('basico');
                break;
            case '2' :
                $this->forward('basico128');
                break;
            case '3' :
                $this->forward('basico240');
                break;
            case '4' :
                $this->forward('basico360');
                break;
            case '5' :
                $this->forward('avanzado');
                break;
            default:
                $this->forward('basico240');
                break;
        endswitch;

//$this->forward('avanzado');
        $config = $this->getConfig();
        $path = $config->app->xmlJuegos;
        $this->view->juegos = simplexml_load_file($path);

        $pathMus = $config->app->xmlMusica;
        $this->view->musica = simplexml_load_file($pathMus);

        $pathSer = $config->app->xmlServicios;
        $this->view->servicios = simplexml_load_file($pathSer);
        $a = date('s');
        if (($a >= 0 and $a <= 5) || ($a > 15 and $a <= 20) || ($a > 30 and $a <= 35) || ($a > 45 and $a <= 50)) {
            $pathBan = $config->app->xmlBanner;
        }
        if (($a > 5 and $a <= 10) || ($a > 20 and $a <= 25) || ($a > 35 and $a <= 40) || ($a > 50 and $a <= 55)) {
            $pathBan = $config->app->xmlBanner2;
        }
        if (($a > 10 and $a <= 15) || ($a > 25 and $a <= 30) || ($a > 40 and $a <= 45) || ($a > 55 and $a <= 60)) {
            $pathBan = $config->app->xmlBanner3;
        }
        var_dump($pathBan);exit;
        $this->view->banner = simplexml_load_file($pathBan);
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

}
