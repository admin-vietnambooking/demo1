<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUpdateSlideBannerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('update_slide_banner', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('slide_banner_id');
            $table->foreign('slide_banner_id')->references('id')->on('slide_banner_item');
            $table->string('title');
            $table->string('content');
            $table->integer('quantity');
            $table->timestamp('update_at');
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
        Schema::dropIfExists('update_slide_banner');
    }
}
