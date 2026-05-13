<?php
/**
 * @license   MIT
 * @author    Simone Karin Lehmann
 */


class OMVRpcServiceCustomThemes extends \OMV\Rpc\ServiceAbstract
{

    public function getName()
    {
        return 'CustomThemes';
    }

    public function initialize()
    {
        $this->registerMethod('getSettings');
        $this->registerMethod('setSettings');
        $this->registerMethod('resetSettings');
    }

    public function getSettings($params, $context)
    {
        // Validate the RPC caller context.
        $this->validateMethodContext($context, ["role" => OMV_ROLE_ADMINISTRATOR]);
        // Get the configuration object.
        $db = \OMV\Config\Database::getInstance();
        $object = $db->get("conf.system.customthemes");
        return $object->getAssoc();
    }

    public function setSettings($params, $context)
    {
        // Validate the RPC caller context.
        $this->validateMethodContext($context, ["role" => OMV_ROLE_ADMINISTRATOR]);
        // Validate the parameters of the RPC service method.
        $this->validateMethodParams($params, "rpc.customthemes.setsettings");
        if (substr($params["imagefolder"],0,1) != '/') {
            $params["imagefolder"] = '/' . $params["imagefolder"];
        } 
        // Get the existing configuration object.
        $db = \OMV\Config\Database::getInstance();
        $object = $db->get("conf.system.customthemes");
        $object->setAssoc($params);
        $db->set($object);
        return $object->getAssoc();
    }

    public function resetSettings($params, $context)
    {
        // Validate the RPC caller context.
        $this->validateMethodContext($context, ["role" => OMV_ROLE_ADMINISTRATOR]);
        $db = \OMV\Config\Database::getInstance();
        $object = $db->get("conf.system.customthemes");
        $object->set("imagefolder",       "/usr/share/openmediavault/customthemes/default/");
        $object->set("loginimage",        "login.jpg");
        $object->set("standbyimage",      "standby.jpg");
        $object->set("shutdownimage",     "shutdown.jpg");
        $object->set("lighttheme",        "0");
        $object->set("darktheme",         "0");
        $object->set("removecursor",      "0");
        $object->set("customcolor",       "0");
        $object->set("hue",               "200");
        $object->set("wallpapers",        "0");
        $db->set($object);
        return $object->getAssoc();
    }
}
