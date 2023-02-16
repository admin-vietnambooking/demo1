<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PermissionsController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['namespace' => 'App\Http\Controllers'], function()
{
    /**
     * Home Routes
     */
    Route::get('/', 'HomeController@index')->name('home.index');

    Route::group(['middleware' => ['guest']], function() {
        /**
         * Register Routes
         */
        Route::get('/register', 'RegisterController@show')->name('register.show');
        Route::post('/register', 'RegisterController@register')->name('register.perform');

        /**
         * Login Routes
         */
        Route::get('/login', 'LoginController@show')->name('login.show');
        Route::post('/login', 'LoginController@login')->name('login.perform');

    });

    Route::group(['middleware' => ['auth', 'permission']], function() {
        /**
         * Logout Routes
         */

    });
        Route::get('/logout', 'LogoutController@perform')->name('logout.perform');

        /**
         * User Routes
         */
        Route::group(['prefix' => 'users'], function() {
            Route::get('/', 'UsersController@index')->name('users.index');
            Route::get('/create', 'UsersController@create')->name('users.create');
            Route::post('/create', 'UsersController@store')->name('users.store');
            Route::get('/{user}/show', 'UsersController@show')->name('users.show');
            Route::get('/{user}/edit', 'UsersController@edit')->name('users.edit');
            Route::patch('/{user}/update', 'UsersController@update')->name('users.update');
            Route::delete('/{user}/delete', 'UsersController@destroy')->name('users.destroy');
        });

        /**
         * User Routes
         */
        Route::group(['prefix' => 'posts'], function() {
            Route::get('/', 'PostsController@index')->name('posts.index');
            Route::get('/create', 'PostsController@create')->name('posts.create');
            Route::post('/create', 'PostsController@store')->name('posts.store');
            Route::get('/{post}/show', 'PostsController@show')->name('posts.show');
            Route::get('/{post}/edit', 'PostsController@edit')->name('posts.edit');
            Route::patch('/{post}/update', 'PostsController@update')->name('posts.update');
            Route::delete('/{post}/delete', 'PostsController@destroy')->name('posts.destroy');
        });

        Route::group(['prefix' => 'roles'], function() {
            Route::get('/', 'RolesController@index')->name('roles.index');
            Route::get('/create', 'RolesController@create')->name('roles.create');
            Route::post('/create', 'RolesController@store')->name('roles.store');
            Route::get('/{role}/show', 'RolesController@show')->name('roles.show');
            Route::get('/{role}/edit', 'RolesController@edit')->name('roles.edit');
            Route::patch('/{role}/update', 'RolesController@update')->name('roles.update');
            Route::delete('/{role}/delete', 'RolesController@destroy')->name('roles.destroy');
        });

        Route::group(['prefix' => 'permissions'], function() {
            Route::get('/', 'RolesController@index')->name('roles.index');
            Route::get('/create', 'RolesController@create')->name('roles.create');
            Route::post('/create', 'RolesController@store')->name('roles.store');
            Route::get('/{permission}/show', 'RolesController@show')->name('permissions.show');
            Route::get('/{permission}/edit', 'RolesController@edit')->name('permissions.edit');
            Route::patch('/{permission}/update', 'RolesController@update')->name('permissions.update');
            Route::delete('/{permission}/delete', 'RolesController@destroy')->name('permissions.destroy');
        });


//        Route::resource('roles', RolesController::class);
//        Route::resource('permissions', PermissionsController::class);
//
});
