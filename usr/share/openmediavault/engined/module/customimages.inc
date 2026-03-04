<?php
/**
 * @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
 * @author    Simone Karin Lehmann <skl@lisanet.de>
 */


class OMVModuleCustomImages extends \OMV\Engine\Module\ServiceAbstract
    implements \OMV\Engine\Notify\IListener
{
    public function getName()
    {
        return 'customimages';
    }

    function bindListeners(\OMV\Engine\Notify\Dispatcher $dispatcher)
    {
        $dispatcher->addListener(
            OMV_NOTIFY_MODIFY,
            'org.openmediavault.conf.service.customimages',
            [$this, 'setDirty']
        );
    }
}
