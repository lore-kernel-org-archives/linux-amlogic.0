Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725BFCA6018
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asXBnEmspfCQWC+WWwP1AqdVeJ/7TIpveOyEKYxqDIw=; b=HTqlkYb9srQAX7
	wUnpR59ni329eCaMyvFcHxjd7WhHvbrES0UQGjfGsN+tWR81qEKYGQEKSIRWilGXH00Ly0YJcN3m+
	+2kljo1SR83cQefv+sFSn6rSHSlGBk6FqFkurYj2P8jEYqGFjk3ytKJm30JpGFKYowk09jpXN6XCE
	BWrmJD7Z8U+jl3ysyRxrd9o5Vh7FIN6idYH4JrtXECp6i2aZWkf7/qDMS2Et1CZ3NOgCed7igeTzK
	PO0mkaz2kNRh3CznQ3FmT6EfphHyZtmWu4qBlVVW3bs1BHhRjHVvSKhftw+AgI51cgmkiZmuT/Xue
	/aS0FAraHO9qw0irF9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF17U-00000005KDq-2RL0;
	Fri, 09 Oct 2026 03:18:04 +0000
Received: from smtp-usa2.onexmail.com ([35.173.142.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF17R-00000005KBG-21iH
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:18:03 +0000
X-QQ-mid: zesmtpip2t1791515862t41d55fdb
X-QQ-Originating-IP: 78gJAcIGUVSr0IWztGV4pGd7LvEMa0gC7Diilw8quLk=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7530361477103805638
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:02 +0800
Subject: [PATCH v2 10/20] drm/msm/dp: Report stream enable failures through
 link status
MIME-Version: 1.0
Message-Id: <20261009-msm-dp-hdr10-v2-10-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6880; i=sophon@radxa.com;
 h=from:subject:message-id; bh=5ucLmD84+B3JGHJEDlBaULUVYEj81Nym/HMWEBfcJAg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlZeivUsOv2vx/zYC8YDm9s6JW9t3GCoN6/EYFMG0
 6R5+6bt7yhlYRDjYpAVU2RRiGeYy16Ze+2pWKkezBxWJpAhDFycAjCRHV8Y/in15hR7/RG6orVn
 han5289CDGKVqoY3FgQfSzfcc3ju/XaGfwo8R29fLZgZ9enGMzUPL21BsaWr9Jt3T829X3l2u8U
 EUU4A
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MWcODxCKFQ3Yw+dfbVR0V/Z8hur5upFUI+tzvdud2FIP6agfPiq0bhRr
	VceG/iFCyui+tbKs1lCvqLMExiNomDzorWsg3DkzLuhRgTdt9zrteMj8s1uog6LbPpmU4Zh
	3loxSGiIq/Ozqh4BCNPPmLQNYWq0QW92bmgaCSeQdrqaDeCmo0IoXV9eviaFdFXmbbXDXM8
	Okb/Iv3MlXUwDZ+I9viRln3qSctPYBZNcV8I5BkuTaT8rBNHemLyqQvxVOYqyrZ3xYokLwC
	u25aP3jjBApj38/6/r7ZE6PqHKdrUI7AVoPAeT5i88ASzZUMWeyH0MnBJN3j8OqG8W69/ge
	WDddq6etDFwT6Jq1OJWGPZT+Uusvx9Dj4qfZai9dPTuY1Mz7w7l6b+XXQTzK73wMvqi5WBs
	2llLOhBSSFgYyJ68JcjGNiKrgp/bKS8Qkoa1jZfpjNhBz2X/q8/opht8CVSKGbrAabvPmcn
	/LiAmnghFCHzLZJqlEDfTRREdl/PqZJncntB8l6oM+Il/AzryVehdGkG3ZDB5NrC1fTd8zM
	BzsXCVX2MggeOJemGWran5ThhcV0hiEV9JHmmd0HJnOi8gc93dWF77Tko8Nk+QmzMXWcov5
	7Yzz8uUrSl6vA6aFZME6isVvS4u8ZjXPmI2CAq59k/vDd5XxdM+45ajEcOoGvFs+tMf2D4f
	S7ilz5/SvtU2t+ir1aBvSeQNNNVF9+hkdTzVOyVrpqLDO5vDX8dhekw3o1hlCLzeXHf8lyM
	JkjjhXXVOgKh3npe8jd75rHCDnwUkL791ddThbwncBWsCK6T//uclj28aMR2pAfo36aUbS4
	5FSrK7v047bsfMh2eyLdOAbI4yL21F7jto75Rxs8cx5bXMYYIQasUjl3+dktCDTf/KrA3JS
	3c69Bj+hKaqmuuo3cUGu1hfU50ryEr9EodCzQvkVjlgHn3l4arzFXedhgIRh8HPW8tzAyvq
	Hgbuc34q9816KB2VSFPk3m6s0ZZnPhw+EaAKHpQ5q8VslMoRihES5iMD0lHVDaYZ/8QV1/z
	wGxsUPk6OgUVMFksaKfdKmNQoIFgJdTJJbGIjSfaDwTFsBGENfMDrAqbjV29OSbsPttwLrN
	1H4f3jibiOq
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201802_089849_342E1326 
X-CRM114-Status: GOOD (  18.49  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Atomic bridge enable callbacks cannot return an error to userspace.
After a failed enable, leaving link-status unchanged gives userspace
no indication that it needs to retry the configuration.

Mark the connector link status bad from a work item after unwinding
the failed enable.

Send one connector hotplug notification per failure episode. The
notification also invokes the fbdev hotplug handler, which can retry
the modeset synchronously. Since atomic enable callbacks cannot
return errors, another stream enable failure can requeue this work
without reporting a failed commit to fbdev. Notifying on every
failure could therefore cause an unbounded retry loop.

Subsequent failures still restore BAD after a retry sets link-status
to GOOD, but suppress further notifications until a successful enable
or an external sink connection change. Do not reset the notification
latch during eDP's internal plug and unplug handling, which runs on
every retry.

Skip failures superseded by recovery or an external unplug before the
worker checks the failure state. Protect the failure state with
plugged_lock, then release it before calling
drm_connector_set_link_status_property(). The helper takes the
connection mutex, which precedes plugged_lock in atomic check's lock
order. Send the notification after the helper releases the mutex.
Recovery concurrent with the property update can cause an extra retry.

Initialize the work at probe and cancel it before unbinding the
display.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 61 +++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b076d44b5118..816f2dc11aea 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -12,9 +12,11 @@
 #include <linux/phy/phy.h>
 #include <linux/delay.h>
 #include <linux/string_choices.h>
+#include <linux/workqueue.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_probe_helper.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -54,10 +56,14 @@ struct msm_dp_display_private {
 	bool audio_supported;
 	bool stream_pm_active;
 	bool stream_link_attempted;
+	struct work_struct link_status_work;
 
 	/* Serializes HPD, stream and PSR operations while runtime active. */
 	struct mutex plugged_lock;
 	bool plugged;
+	/* Protected by plugged_lock, including accesses from link_status_work. */
+	bool link_failed;
+	bool link_status_notified;
 
 	struct drm_device *drm_dev;
 
@@ -205,6 +211,39 @@ void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display)
 	complete_all(&dp->audio_comp);
 }
 
+static void msm_dp_display_reset_link_status(struct msm_dp_display_private *dp)
+{
+	lockdep_assert_held(&dp->plugged_lock);
+
+	dp->link_failed = false;
+	dp->link_status_notified = false;
+}
+
+static void msm_dp_display_link_status_work(struct work_struct *work)
+{
+	struct msm_dp_display_private *dp = container_of(work,
+			struct msm_dp_display_private, link_status_work);
+	struct drm_connector *connector = dp->msm_dp_display.connector;
+	bool notify;
+
+	scoped_guard(mutex, &dp->plugged_lock) {
+		/* Skip failures superseded before this work starts. */
+		if (!dp->link_failed)
+			return;
+
+		notify = !dp->link_status_notified;
+		dp->link_status_notified = true;
+	}
+
+	/* The helper takes connection_mutex, so drop plugged_lock first. */
+	drm_connector_set_link_status_property(connector,
+					       DRM_MODE_LINK_STATUS_BAD);
+
+	/* fbdev can retry the modeset synchronously from this notification. */
+	if (notify)
+		drm_kms_helper_connector_hotplug_event(connector);
+}
+
 static int msm_dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -235,6 +274,7 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
+	cancel_work_sync(&dp->link_status_work);
 	of_dp_aux_depopulate_bus(dp->aux);
 
 	msm_dp_aux_unregister(dp->aux);
@@ -424,6 +464,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	mutex_lock(&dp->plugged_lock);
 
+	/* eDP calls this for every enable, including automatic retries. */
+	if (!dp->msm_dp_display.is_edp && !dp->plugged)
+		msm_dp_display_reset_link_status(dp);
+
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
 	ret = msm_dp_display_host_phy_init(dp);
@@ -466,6 +510,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	mutex_lock(&dp->plugged_lock);
 
+	if (!dp->msm_dp_display.is_edp)
+		msm_dp_display_reset_link_status(dp);
+
 	dp->panel->video_test = false;
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
@@ -529,10 +576,12 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	if (!rc) {
 		sink_request = dp->link->sink_request;
 		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
-		if (sink_request & DS_PORT_STATUS_CHANGED)
+		if (sink_request & DS_PORT_STATUS_CHANGED) {
+			msm_dp_display_reset_link_status(dp);
 			rc = msm_dp_display_process_hpd_high(dp);
-		else
+		} else {
 			rc = msm_dp_display_handle_irq_hpd(dp);
+		}
 	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
@@ -682,7 +731,6 @@ static int msm_dp_display_prepare_link_locked(struct msm_dp_display_private *dp)
 	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
 	if (rc) {
 		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
 		return rc;
 	}
 
@@ -1278,6 +1326,7 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->hpd_isr_status = 0;
 
 	mutex_init(&dp->plugged_lock);
+	INIT_WORK(&dp->link_status_work, msm_dp_display_link_status_work);
 
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
@@ -1571,6 +1620,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 		goto err;
 	}
 
+	msm_dp_display_reset_link_status(dp);
 	mutex_unlock(&dp->plugged_lock);
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1583,6 +1633,11 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_unplug_handle(dp);
 	msm_dp_display_unprepare(dp);
+	scoped_guard(mutex, &dp->plugged_lock) {
+		dp->link_failed = true;
+		/* Keep reporting BAD, but notify only once until recovery. */
+		schedule_work(&dp->link_status_work);
+	}
 }
 
 void msm_dp_display_atomic_disable(struct msm_dp *dp)

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
