package com.example.grandmamagic;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import androidx.annotation.Nullable;

public class MagicService extends Service {

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null; // Not binding to anything
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        // Your Lua white-noise script could be triggered here later
        return START_STICKY;
    }
}
