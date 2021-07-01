<?php
namespace App\HttpController;

use EasySwoole\Http\AbstractInterface\AbstractRouter;
use FastRoute\RouteCollector;

class Router extends AbstractRouter
{

    function initialize(RouteCollector $routeCollector)
    {
        $this->setGlobalMode(true);
        $routeCollector->get("/", "/Index");

    }
}