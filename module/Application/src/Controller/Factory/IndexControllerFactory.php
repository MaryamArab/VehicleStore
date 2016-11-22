<?php

namespace Application\Controller\Factory;

use Application\Service\VehicleManager;
use Interop\Container\ContainerInterface;
use Zend\ServiceManager\Factory\FactoryInterface;
use Application\Controller\IndexController;

class IndexControllerFactory implements FactoryInterface {
   
    public function __invoke(ContainerInterface $container, $requestedName, array $options = null) {
        $entityManager = $container->get('doctrine.entitymanager.orm_default');
        $vehiclemanager = $container->get(VehicleManager::class);
        return new IndexController($entityManager,$vehiclemanager);
    }

}
