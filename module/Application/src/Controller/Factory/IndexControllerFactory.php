<?php

namespace Application\Controller\Factory;

use Application\Controller\IndexController;
use Application\Service\MailSender;
use Application\Service\ReviewManager;
use Application\Service\VehicleManager;
use Interop\Container\ContainerInterface;
use Zend\ServiceManager\Factory\FactoryInterface;

class IndexControllerFactory implements FactoryInterface {
   
    public function __invoke(ContainerInterface $container, $requestedName, array $options = null) {
        $entityManager = $container->get('doctrine.entitymanager.orm_default');
        $vehiclemanager = $container->get(VehicleManager::class);
        $reviewmanager = $container->get(ReviewManager::class);
        $mailSender = $container->get(MailSender::class);
        return new IndexController($entityManager,$vehiclemanager, $reviewmanager, $mailSender);
    }

}
