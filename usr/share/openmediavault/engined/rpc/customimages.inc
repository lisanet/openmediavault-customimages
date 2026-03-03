<?php
/**
 * @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
 * @author    Simone Karin Lehmann <skl@lisanet.de>
 */

use OMV\Config\Database;
use OMV\Config\ConfigObject;
use OMV\Rpc\ServiceAbstract;

class OMVRpcServiceCustomimages extends ServiceAbstract
{
    private $database;
    private $dataModelPath = 'conf.service.customimages';

    public function __construct(Database $database = null)
    {
        $this->database = $database ?: Database::getInstance();
    }

    public function getName()
    {
        return 'customimages';
    }

    public function initialize()
    {
        $this->registerMethod('getSettings');
        $this->registerMethod('setSettings');
    }

    public function getSettings($params, $context)
    {
        $this->validateMethodContext($context, ['role' => OMV_ROLE_ADMINISTRATOR]);
        $object = $this->database->get($this->dataModelPath);
        return $object->getAssoc();
    }

    public function setSettings($params, $context)
    {
        $this->validateMethodContext($context, ['role' => OMV_ROLE_ADMINISTRATOR]);
        $this->validateMethodParams($params, 'rpc.customimages.setSettings');

        $object = $this->database->get($this->dataModelPath);
        $object->setAssoc($params);
        $this->database->set($object);

        // Modul als "dirty" markieren, damit der Apply-Button erscheint
        $this->setModuleDirty('customimages');

        return $object->getAssoc();
    }
}
