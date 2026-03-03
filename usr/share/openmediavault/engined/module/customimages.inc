<?php
/**
 * @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
 * @author    Simone Karin Lehmann <skl@lisanet.de>
 */

use OMV\Engine\Module\Manager as ModuleManager;
use OMV\Engine\Module\ServiceAbstract;
use OMV\Engine\Notify\Dispatcher;

class OMVModuleCustomimages extends ServiceAbstract
{
    public function getName()
    {
        return 'customimages';
    }

    public function bindListeners(Dispatcher $dispatcher)
    {
        $dispatcher->addListener(
            OMV_NOTIFY_MODIFY,
            'org.openmediavault.conf.service.customimages',
            [$this, 'setDirty']
        );
    }
}
