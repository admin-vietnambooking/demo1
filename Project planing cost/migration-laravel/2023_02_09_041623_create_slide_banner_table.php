<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSlideBannerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('slide_banner', function (Blueprint $table) {
            $table->bigInteger('slide_banner_id');
            $table->foreign('slide_banner_id')->references('id')->on('slide_banner_item');
            $table->bigInteger('update_slide_banner_id');
            $table->foreign('update_slide_banner_id')->references('id')->on('update_slide_banner');
            $table->bigInteger('deleteId');
            $table->foreign('deleteId')->references('id')->on('delete_slide_banner_id');
            $table->id();
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
        Schema::dropIfExists('slide_banner');
    }
}
