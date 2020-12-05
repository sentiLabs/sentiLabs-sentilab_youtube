package com.sentilab.futuretask

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.FutureTask

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        futureTask()
    }

    fun futureTask() {
        //1. FutureTask
        val futureTaskCallable = FutureTask {

            return@FutureTask "RESULT :: futureTaskCallable"
        }
        val futureTaskRunnable = FutureTask ({

        }, "RESULT :: futureTaskRunnable")

        //2. ExecutorService
        val executorService = Executors.newFixedThreadPool(2)
        executorService.execute(futureTaskCallable)
        executorService.execute(futureTaskRunnable)

        //+ result
        Log.d("SENTI", "SENTI ::: " + futureTaskCallable.get())
        Log.d("SENTI", "SENTI ::: " + futureTaskRunnable.get())

        //+++ for loop
    }
}