<?php

namespace Application\Model;

use Doctrine\ORM\Mapping as ORM;
use Application\Model\VehicleType;
use Application\Model\Review;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="\Application\Repository\VehicleRepository")
 * @ORM\Table(name="vehicle")
 */
class Vehicle {

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(name="id", type="integer")   
     */
    protected $id;

    /**
     * @ORM\Column(name="make")  
     */
    protected $make;

    /**
     * @ORM\Column(name="model")  
     */
    protected $model;

    /**
     * @ORM\Column(name="year")
     */
    protected $year;

    /**
     *  @ORM\Column(name="price", type="integer", nullable=true)
     */
    protected $price;

    /**
     *  @ORM\Column(name="description")
     */
    protected $description;

    /**
     *  @ORM\Column(name="metadata")
     */
    protected $metadata;

    /**
     * @ORM\OneToMany(targetEntity="\Application\Model\Review", mappedBy="vehicle")
     * @ORM\JoinColumn(name="review_id", referencedColumnName="id")
     */
    protected $reviews;

    /**
     * @ORM\OneToMany(targetEntity="\Application\Model\VehicleImage", mappedBy="vehicle")
     * @ORM\JoinColumn(name="image_id", referencedColumnName="id")
     */
    protected $images;

    /**
     * @ORM\ManyToOne(targetEntity="\Application\Model\VehicleType", inversedBy="vehicles")
     * @ORM\JoinColumn(name="type_id", referencedColumnName="id",  nullable=false)
     */
    protected $vehicleType;

    /**
     * @ORM\ManyToOne(targetEntity="\Application\Model\Seller", inversedBy="vehicles")
     * @ORM\JoinColumn(name="seller_id", referencedColumnName="id")
     */
    protected $seller;

    function __construct() {
        $this->reviews = new ArrayCollection();
        $this->images = new ArrayCollection();
    }

    function getReviews() {
        return $this->reviews;
    }

    function getImages() {
        return $this->images;
    }

    function addReview($review) {
        $this->reviews[] = $review;
    }

    function addImage($image) {
        $this->images[] = $image;
    }

    function getId() {
        return $this->id;
    }

    function getMake() {
        return $this->make;
    }

    function getModel() {
        return $this->model;
    }

    function getYear() {
        return $this->year;
    }

    function getPrice() {
        return $this->price;
    }

    function getDescription() {
        return $this->description;
    }

    function getMetadata() {
        return $this->metadata;
    }

    function getVehicleType() {
        return $this->vehicleType;
    }

    function setMake($make) {
        $this->make = $make;
    }

    function setModel($model) {
        $this->model = $model;
    }

    function setYear($year) {
        $this->year = $year;
    }

    function setPrice($price) {
        $this->price = $price;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function setMetadata($metadata) {
        $this->metadata = $metadata;
    }

    function setVehicleType($vehicleType) {
        $this->vehicleType = $vehicleType;
    }
    function getSeller() {
        return $this->seller;
    }

    function setSeller($seller) {
        $this->seller = $seller;
    }


}
