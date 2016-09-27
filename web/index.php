<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();

$app->get('/hello/{name}', function($name) use($app) {
    return 'Hello '.$app->escape($name);
});

$app['debug'] = true;

$app->get('/', function() use($app) {
    $link = mysqli_connect("192.168.99.100", "root", "silexphp", "silexphp", "33060");

    var_dump($link);die;
});

$app->run();
