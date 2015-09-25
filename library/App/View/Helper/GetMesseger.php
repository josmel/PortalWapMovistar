<?php

/**
 *
 * @author 
 */
class App_View_Helper_GetMesseger extends Zend_View_Helper_Abstract {

    /**
     * @param  String
     * @return string
     */
    public function getMesseger() {
        $flashMessage = new App_Controller_Action_Helper_FlashMessengerCustom();
        $arrayClass = array(
            'info' => 'alert info',
            'success' => 'alert success',
            'warning' => 'alert',
            'error' => 'alert error');

        $arrayMsgs = array('info' => '', 'success' => '', 'warning' => '', 'error' => '');

        $messages = $flashMessage->getMessages();
        foreach ($messages as $message) {
            $arrayMsgs[$message->level] .=
                    ($arrayMsgs[$message->level] == '' ? '' : '<br>') . $message->message;
        }
        if (Zend_Registry::isRegistered('Temp_FMessages')) {
            $messages = Zend_Registry::get('Temp_FMessages');
            foreach ($messages as $message) {
                $arrayMsgs[$message->level] .=
                        ($arrayMsgs[$message->level] == '' ? '' : '<br>') . $message->message;
            }
        }

        foreach ($arrayMsgs as $type => $msg) {
            if ($msg != '' && isset($arrayClass[$type])) {
//                echo'<div class="' . $arrayClass[$type] . '">';
//                 echo'<div class="head">';
//                echo '<p>' . $msg . '</p>';
//                echo'</div>';
//                
//                
                      echo'  <div class="verde"></div>';
                    echo'    <div class="text_item_li">';
                                 echo '<p style="text-align: center">' . $msg . '</p>';
                     echo'   </div>';
                     echo'   <div class="verde"></div>';
                     echo'   <br>';
//                
//                echo '<table class="artist-photo"><tr>';
//                echo '<td class="artist"  colspan=2 style="background-color: #F68E1F;">';
//                echo '<div class="artist-text" style="color: white" >';
//                echo '<div class="title-img">';
//                echo '<a class="text-title" style="color: white;font-size:15px"';
//                echo 'href="#">' . $msg . '';
//                echo ' </a></div></div></td></tr>  </table><br>';
            }
        }
    }

}
