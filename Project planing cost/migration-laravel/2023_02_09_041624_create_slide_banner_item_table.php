<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSlideBannerItemTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('slide_banner_item', function (Blueprint $table) {
            $table->id();
            $table->string('title_slide_banner');
            $table->text('content');
            $table->integer('quantity');
            $table->timestamp('create_at');
            $table->bigInteger('column_6');
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
        Schema::dropIfExists('slide_banner_item');
    }
}
