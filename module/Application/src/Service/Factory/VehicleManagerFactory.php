<?php
namespace Application\Service\Factory;

use Interop\Container\ContainerInterface;
use Zend\ServiceManager\Factory\FactoryInterface;
use Application\Service\VehicleManager;


class VehicleManagerFactory implements FactoryInterface {
    
    public function __invoke(ContainerInterface $container, $requestedName, array  $options = null) {
         $entityManager = $container->get('doctrine.entitymanager.orm_default');
        
        // Instantiate the service and inject dependencies
        return new VehicleManager($entityManager);
    }

}
