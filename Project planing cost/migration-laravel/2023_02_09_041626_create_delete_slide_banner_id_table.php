<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeleteSlideBannerIdTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('delete_slide_banner_id', function (Blueprint $table) {
            $table->id();
            $table->boolean('delete_item');
            $table->bigInteger('title_slider_bannerId');
            $table->foreign('title_slider_bannerId')->references('id')->on('slide_banner_item');
            $table->timestamp('delete_at');
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('delete_slide_banner_id');
    }
}
