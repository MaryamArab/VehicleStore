<?php

/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Application\Model\User;
use Application\Model\VehicleType;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Application\Service\VehicleManager;

class IndexController extends AbstractActionController {

    protected $entitymanager;
    protected $vehiclemanager;

    function __construct($entitymanager, $vehiclemanager) {
        $this->entitymanager = $entitymanager;
        $this->vehiclemanager = $vehiclemanager;
    }

    public function indexAction() {

        return new ViewModel();
    }

    public function vehicleSearchAction() {
        $repository = $this->getEntitymanager()->getRepository(VehicleType::class);
        $types = $repository->findAll();
        return new ViewModel([
            'types' => $types,
        ]);
    }

    public function searchResultAction() {
        $type = $this->getRequest()->getQuery('vtype', false);
        $minbudget = $this->getRequest()->getQuery('minbudget', false);
        $maxbudget = $this->getRequest()->getQuery('maxbudget', false);
        $keyword = $this->getRequest()->getQuery('keyword', false);
        $allvehicles = $this->vehiclemanager->searchVehicle($type, $minbudget, $maxbudget, $keyword);
        return new ViewModel([
            'allvehicles' => $allvehicles,
        ]);
    }
     public function vehicleDetailsAction() {
         $id =(int)$this->params()->fromRoute('id');
         $em=$this->getEntitymanager();
         $vehicle=$em->find('Application\Model\Vehicle', $id);
         return new ViewModel([
             'vehicle' => $vehicle,
             ]);
    }

    /// services
    function getEntitymanager() {
        return $this->entitymanager;
    }

    function setEntitymanager($entitymanager) {
        $this->entitymanager = $entitymanager;
    }

}
