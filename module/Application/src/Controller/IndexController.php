<?php

namespace Application\Controller;

use Application\Model\VehicleType;
use Application\Service\MailSender;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController {

    protected $entitymanager;
    protected $vehiclemanager;
    protected $reviewmanager;
    protected $mailSender;

    function __construct($entitymanager, $vehiclemanager, $reviewmanager, MailSender $mailSender) {
        $this->entitymanager = $entitymanager;
        $this->vehiclemanager = $vehiclemanager;
        $this->reviewManager = $reviewmanager;
        $this->mailSender = $mailSender;
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
        $type = $this->getRequest()->getQuery('vtype');
        $minbudget = $this->getRequest()->getQuery('minbudget');
        if ($minbudget === '')
            $minbudget = 0;

        $maxbudget = $this->getRequest()->getQuery('maxbudget');
        if ($maxbudget === '')
            $maxbudget = 1000000000000;

        $keyword = $this->getRequest()->getQuery('keyword');
        $allvehicles = $this->vehiclemanager->searchVehicle($type, $minbudget, $maxbudget, $keyword);

        return new ViewModel([
            'allvehicles' => $allvehicles,
        ]);
    }

    public function vehicleDetailsAction() {
        $id = (int) $this->params()->fromRoute('id');
        $em = $this->getEntitymanager();
        $vehicle = $em->find('Application\Model\Vehicle', $id);
        $vehicleReviews = $this->reviewManager->getReviewsByVehicle($vehicle);
        return new ViewModel([
            'vehicle' => $vehicle,
            'vehicleReviews' => $vehicleReviews,
        ]);
    }

    public function reviewFormAction() {
        $id = (int) $this->params()->fromRoute('id');
        $em = $this->getEntitymanager();
        $vehicle = $em->find('Application\Model\Vehicle', $id);
        if ($this->getRequest()->isPost()) {
            $reviewTitle = $this->params()->fromPost('rTitle', 'default_val');
            $reviewText = $this->params()->fromPost('rBody', 'default_val');
            $this->reviewManager->addReview($vehicle, $reviewTitle, $reviewText);
            return $this->redirect()->toRoute('application', ['action' => 'vehicle-details', 'id' => $id]);
        } else {
            return new ViewModel([
                'vid' => $id
            ]);
        }
    }

    public function mailFormAction() {
        $id = (int) $this->params()->fromRoute('id');
        $em = $this->getEntitymanager();
        $vehicle = $em->find('Application\Model\Vehicle', $id);
        $seller = $vehicle->getSeller();
        if ($this->getRequest()->isPost()) {
            $eSubject = $this->params()->fromPost('eTitle', 'default_val');
            $sellerEmail = $seller->getEmail();
            $eText = $this->params()->fromPost('eBody', 'default_val');
            $this->mailSender->sendSMTPMail('no-reply@example.com', $sellerEmail, $eSubject, $eText);
            return $this->redirect()->toRoute('application', ['action' => 'vehicle-details', 'id' => $id]);
        } else {
            return new ViewModel([
                'vid' => $id,
                'seller' => $seller,
            ]);
        }
    }

    /// services
    function getEntitymanager() {
        return $this->entitymanager;
    }

    function setEntitymanager($entitymanager) {
        $this->entitymanager = $entitymanager;
    }

}
