<?php

class App_Controller_Action_Portal extends App_Controller_Action {

    public function init() {
        parent::init();
        $this->_config = $this->getConfig();
        $pathBANNER = $this->_config->app->jsonBanner;
        $totalBanners = json_decode(file_get_contents($pathBANNER), true);
        $util = new App_Util();
        $SoapBanner = $util->groupArray($totalBanners, 'codtbanner');
        foreach (array(1, 2, 3, 4, 5) as $i) {
            $Banners[] = $SoapBanner[$i][0]['norder'];
        }
//        var_dump($Banners);exit;
        $perfil=$this->obtenerPerfil($Banners);
        $this->view->perfil = $perfil;
        switch ('3'):
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
        $bannerMovistar= $util->filter_by_value($totalBanners,'codtbanner',11);
        $this->view->SoapMovistarBanners = $bannerMovistar[0];
        $this->view->SoapBanners = $SoapBanner;
    }

    public function obtenerPerfil($Banners) {
        $ua = $_SERVER['HTTP_USER_AGENT'];
        $model = new App_Model_ConfigPerfil();
        $controller = $this->getParam('controller');
        $model->getPerfil($ua, $controller, 'index', 'home', 'index');
        $result = $model->getPerfil($ua, $controller, $Banners);
        return  $result["perfil"];
    }

}