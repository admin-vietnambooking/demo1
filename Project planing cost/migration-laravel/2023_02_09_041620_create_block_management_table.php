<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBlockManagementTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('block_management', function (Blueprint $table) {
            $table->id();
            $table->foreign('blockId')->references('id')->on('block_item');
            $table->bigInteger('delete_blockId');
            $table->foreign('delete_blockId')->references('id')->on('delete_block');
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
        Schema::dropIfExists('block_management');
    }
}
