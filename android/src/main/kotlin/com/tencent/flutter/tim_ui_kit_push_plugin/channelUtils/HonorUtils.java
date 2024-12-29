package com.tencent.flutter.tim_ui_kit_push_plugin.channelUtils;

import android.content.Context;
import android.util.Log;

import com.hihonor.push.sdk.HonorPushCallback;
import com.hihonor.push.sdk.HonorPushClient;
import com.tencent.flutter.tim_ui_kit_push_plugin.TimUiKitPushPlugin;
import com.tencent.flutter.tim_ui_kit_push_plugin.common.BadgeUtil;
import com.tencent.flutter.tim_ui_kit_push_plugin.common.Extras;
import com.tencent.flutter.tim_ui_kit_push_plugin.common.Util;

import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.FutureTask;

public class HonorUtils implements ChannelBaseUtils {

    private String TAG = "TUIKitPush | HONOR";

    boolean mIsSupportedBade = true;

    public HonorUtils(Context context) {
        this.context = context;
    }

    private Context context;

    String token = "";

    @Override
    public void initChannel() {
        HonorPushClient.getInstance().init(context, true);
    }

    @Override
    public String getToken() {
        if(token.isEmpty()){
            getHonorToken();
        }
        return token;
    }

    public synchronized void getHonorToken(){
        HonorPushClient.getInstance().getPushToken(new HonorPushCallback<String>() {
            @Override
            public void onSuccess(String pushToken) {
                Log.i(TAG, "getHonorToken, onSuccess: " + pushToken);
                token = pushToken;
            }

            @Override
            public void onFailure(int errorCode, String errorString) {
                Log.i(TAG, "getHonorToken, onFailure: " + errorCode + " - " + errorString);
            }
        });
    }

    @Override
    public void requirePermission() {

    }

    @Override
    public void setBadgeNum(int setNum) {
        Log.i(TAG, "setBadgeNum");
        BadgeUtil.setHuaweiBadgeNum(context, setNum);
    }

    @Override
    public void clearAllNotification() {
        Log.i(TAG, "clearAllNotification");
        Util.clearAllNotification(context);
    }

}
