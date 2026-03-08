<?php
/**
 * @license   MIT
 * @author    Simone Karin Lehmann
 */


class OMVRpcServiceCustomImages extends \OMV\Rpc\ServiceAbstract
{

    public function getName()
    {
        return 'CustomImages';
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
        $object = $db->get("conf.system.customimages");
        return $object->getAssoc();
    }

    public function setSettings($params, $context)
    {
        // Validate the RPC caller context.
        $this->validateMethodContext($context, ["role" => OMV_ROLE_ADMINISTRATOR]);
        // Validate the parameters of the RPC service method.
        $this->validateMethodParams($params, "rpc.customimages.setsettings");
        if (substr($params["imagefolder"],0,1) != '/') {
            $params["imagefolder"] = '/' . $params["imagefolder"];
        } 
        // Get the existing configuration object.
        $db = \OMV\Config\Database::getInstance();
        $object = $db->get("conf.system.customimages");
        $object->setAssoc($params);
        $db->set($object);
        return $object->getAssoc();
    }

    public function resetSettings($params, $context)
    {
        // Validate the RPC caller context.
        $this->validateMethodContext($context, ["role" => OMV_ROLE_ADMINISTRATOR]);
        $db = \OMV\Config\Database::getInstance();
        $object = $db->get("conf.system.customimages");
        $object->set("imagefolder",       "/usr/share/openmediavault/customimages/default/");
        $object->set("loginimage",        "login.jpg");
        $object->set("blendmode",         "hard-light");
        $object->set("standbyimage",      "standby.jpg");
        $object->set("standbyblendmode",  "luminosity");
        $object->set("shutdownimage",     "shutdown.jpg");
        $object->set("shutdownblendmode", "luminosity");
        $db->set($object);
        return $object->getAssoc();
    }
}
