Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ECBC43638
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByaZvbiZHTZicb9WA1uoRrsn18kpQSy3tNNvahd2x+I=; b=K6VtTmG6hdTXD+
	jhxMZMDFOHDPO92sq/v2rIJ7XZWvpFDc/io/VOL/HwdKOsz+MUYmVApIZimIt9yT9sQPokc5pn9yT
	rOh/7THGMqbZMr+ba/Wxwbgu6JSu5LrtLP14IAlMF/2PHqrQm2tWCZ4wXArtP0n3b9wPDrfbZg6nn
	3MZezfbqc3vWuvCxSGsBTxGlwpVZBdt1t6NTLsSOhf3MpUikuF/MiFWGwE26C35yJwx3YUQEWg+/c
	Yr6OpZSfP34LZFZRHO0eUTk74+8Ti0tvDsmnSgD9OylKlUqK0q3aSkCjzR4qPGb6Jlspef0580Qx5
	3DAmKbbdow1OjW7Mpl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHj-0000000Ew3M-2Xfp;
	Mon, 29 Jun 2026 14:48:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHg-0000000Ew0e-3rxY
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATFZf2579199
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9Wvi0l8jMqT7/U0aQTPnpvZ/UDWx6KX/hO6+hpKeMw=; b=EW68smx10BFKmiie
	Uc6Qa69muzZ00svaL3GZ8DyOhIC3AFRTjGt27zJ1utDUIR+jS3P0XNp67lSDLuRF
	GevsOXtZ598t3WpdoFUdv2YOhya55lbryzDz5qPaeuFNonWu6uPcd+49xYOz8i+8
	M2hrj8wgrVsd+zYz2l+LVF66ZRU56fNUDsIQEMghjj9Pf0aEHd+9d0Ej4zyOE6MQ
	N0rbh0aCMoC2n5+fUowhCIhT3R9xuS3Vmr+vUyxRCxfbyvHfUWNQ5w+fy0E19mlY
	Xy/sFISbVztQgjmL4HuOa64wfZJG0dGNF1D4ecAb7UmJ1ATgcLKUc9KWbelT/xB6
	46in+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hwd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92a62578049so552330285a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744507; x=1783349307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9Wvi0l8jMqT7/U0aQTPnpvZ/UDWx6KX/hO6+hpKeMw=;
        b=ICOy2J6UtrH/WFcYiEkHBw0Z74k18O1bkcrVvfVCzr//pSNrfRlckPNo9VFGuym0Xk
         38GsV03lGbtzGdQpUkt+9sO+4+EF2bv8ozgqmlqZ0lphU/ROrnuxalEJSRnwICEizacw
         AXgpl84A7wFNwNv9LKJjzuJA1c4DMlg9PltpVYU8eZgyr1ugMuw0Uo6zvCZVUpMFdWod
         c7stQGv9XGz+3wht0j3+j2LSkkVhGCmBtj0tYpaMNzPoV3khkcBWWTloHXCTv6Q9ItBU
         SDZ6WuHOw2sEsVhhCjzZ4/goMwRfxXpdZZXFHeqlHnb8JEuJuVYECzmYzeTmPSIizebg
         0ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744507; x=1783349307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9Wvi0l8jMqT7/U0aQTPnpvZ/UDWx6KX/hO6+hpKeMw=;
        b=DQxKqj/yQjwznBxvyO91iUnavNMywgK3ykkNCBrOdCm2G6yPdUh//j60OZoLLmhKbX
         1DHYJoFPn3DxaL2MvNp+8xI+lGNDNfAZC8O76u/lJQxb/SNozk2v+T9ptEAiZOzFlomW
         UkW2NbI9rue+9cIp7WrVoOP0VxmgDfBuGluPGwEhh9H1pvJLLLjEwEqhw2NNBvgMUgue
         4a76FmfVzWlgIjbHTh4rJXIuWaU8hBZrDwSDbYx6acCQU6WvTwx/Bh6fBhcxK4IrlMXn
         owwt1BcRO2r/F6Xfm6jfPrLQ3L0ArXnD/ih4ivRRn9OSBomhdJqwsyvUnJOpbaghmaBr
         l65w==
X-Forwarded-Encrypted: i=1; AFNElJ+0x9nSWcFd9+dHiveLL8vWFS88FB2HiZsbdtevSgPW33BcdAtO4YQAFUnK6HwqpCK11LXDGCYzyFhPJXKw@lists.infradead.org
X-Gm-Message-State: AOJu0YxRzPMLrpnIkFIHjAJPNCF5BOaeTqfqfmmbBCk/HsAGMexdHnK3
	3z/A1blmornpjVAD2bRvkyktq5HNZ4TCzPf5AnZh6i5pIG8P6QE1zLaEy1DykmiS820RhxJbcX5
	il0ekZj+lb5S+qrGuHmGQc4doqfCJ0aBSPZoCFVqZIklvkMfYNcMPG9p3oT9o8fHMe1Wolw7fYQ
	==
X-Gm-Gg: AfdE7cl3truupqBQaWQJyKYmK02pFPEw5J/EsAxPA3TGf+p6K6QKot/AQRmgdmwyq7C
	pyG8qoRlqfu6zdzzGJQyG1dGo7fCmIzXZ+YAbV9jxfLm0V8J8FIOfG0xzKbubypz7r8pJBKA07R
	xmj0k7Ibp5Mh0rl3KhONh/e32DNCK3btpcI2hLWfZEl42E5a2x3SblNYkyAJwQxxVJwqra5+Qs1
	jnURSS1XW+NHLVodLFovd/354MS9GQxwi8ZCD7vPC8F4zsTmJiD2rqrc6dli2ZaK7cpQcmptmHi
	RJyFnYo1gtC6bL2YnALsySTYRdYNtiAfAPXdS42JiabrzbkSWnDiFXYTmZEUQiqkm6yG82O3B2Y
	5b/wy5gQLllJ1r9bYlxdYw85pv7W0dG6DD1UMKQ78IQC8ystu6diS+1pY1qkJAWjXbzGXggsvng
	==
X-Received: by 2002:a05:620a:269f:b0:910:c308:159f with SMTP id af79cd13be357-92927eac1a7mr2441205085a.28.1782744507183;
        Mon, 29 Jun 2026 07:48:27 -0700 (PDT)
X-Received: by 2002:a05:620a:269f:b0:910:c308:159f with SMTP id af79cd13be357-92927eac1a7mr2441197485a.28.1782744506554;
        Mon, 29 Jun 2026 07:48:26 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:03 +0800
Subject: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
MIME-Version: 1.0
Message-Id: <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=7698;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=PZfP5zuUOw1cQ4+LbkkW+tP+uE6tAqqOHKM8isRi0iE=;
 b=PvOG0vzHfOEMpn6Uc9ILDR0y6vdBC7zisS8HN4guZduHppi/Eca5NIGvMGyXQQ7++RkaWSBX4
 xjf96he6N3RBpVPKPXR/VP/AEMmjfUrD/o/s9muDMP+aPYaMRfJzPQT
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXxna1JAC0hp1e
 6va/A1s7mPc+S4CcjcoyER7eauwvP3MhrvARnjKU3MqSOCB07fCISrP/BYJTMqGICdcFpfHNllV
 CFrQJUigY8jzOiLKfOkK5ylrREHcO5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXwjlvU9yWxei1
 sAkHzqOiooE4N1rub4iMFthIulxDpnJ2lHP3yIFmxdrEr7ihMKc5DyR2AU3nPMW1R5x0TOeB/Oh
 ZKVmlWc8gaKf8vkQwUumgCd++fC8ijROA7tVr06327VcZYaNK2rWXNStCrSmPf0Hx9DmGrSaLj2
 rH8Yu7pGbpQSCi/T4NnSSqOJ3wHT2mi9AJ+NpooNIuW/R5TXspOdTdTt1Fe1l3MMkJ/BUXIXeZk
 Zq/uZQuj3Pk7+V6mb1zCVIMsZ5sywIOnRUc1aeP0xgbXTJoZicu7DFmFlAx8XlKgKjF4cGv9BKg
 IbEgozdlDzE/NctzxIC822p4D9ElaQR05EzwlgvBrnWRsndV8taIQQY+tF2lP0eakQUshHU1Soc
 Mw4lvWEAuoLsWUb11NAM//wkuzcSDxYbvV2pH4M30loz+4KU7XSa4Y5AYnJfk+EqMhrT4ZAMr1Z
 Qbxl9LyLbAaLq5EUMjQ==
X-Proofpoint-ORIG-GUID: edhViuFDBAGUcKGUQ5XGHi6RrKP6OiiS
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4285bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dveiew7hPdaQvXAhsgwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: edhViuFDBAGUcKGUQ5XGHi6RrKP6OiiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074828_981833_5B0C1404 
X-CRM114-Status: GOOD (  16.15  )
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

The bridge connector framework currently invokes all bridge
hpd_notify() callbacks and unconditionally emits a connector hotplug
event afterwards.

However, not every HPD notification requires a userspace hotplug event.

In particular, DP MST bridges may use hpd_notify() to propagate HPD and
IRQ notifications through the bridge chain while the actual hotplug
handling is performed by the DRM DP MST core. Connector creation,
removal and userspace hotplug events are already managed by the MST
topology framework.

Allow hpd_notify() implementations to suppress the bridge connector
hotplug event by introducing a bool *send_hotplug parameter. Drivers
can clear this flag when HPD processing should not result in a
connector hotplug notification.

A NULL pointer indicates that hotplug suppression is not supported by
the caller, such as the connector detect polling path.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 include/drm/drm_bridge.h                       |  3 ++-
 7 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 8cb17bd0e238..42e1cadcd3fb 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -430,7 +430,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
 					enum drm_connector_status status,
-					enum drm_connector_status_extra extra_status)
+					enum drm_connector_status_extra extra_status,
+					bool *send_hotplug)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8f7075fd2aa5..5edca47a025f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 					    enum drm_connector_status status,
-					    enum drm_connector_status_extra extra_status)
+					    enum drm_connector_status_extra extra_status,
+					    bool *send_hotplug)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -150,13 +151,14 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status, extra_status);
+			bridge->funcs->hpd_notify(bridge, connector, status,
+						  extra_status, send_hotplug);
 	}
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status,
-					    enum drm_connector_status_extra extra_status)
+	enum drm_connector_status status,
+	enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -165,7 +167,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status, extra_status);
+	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -227,7 +229,8 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		drm_bridge_connector_hpd_notify(connector, status,
+						DRM_CONNECTOR_NO_EXTRA_STATUS, NULL);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 4aecf0ffcf75..a67e7b365c5b 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -324,7 +324,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
 					  enum drm_connector_status status,
-					  enum drm_connector_status_extra extra_status)
+					  enum drm_connector_status_extra extra_status,
+					  bool *send_hotplug)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fcfee26f0078..6835c68fe510 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1763,7 +1763,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
 			      enum drm_connector_status status,
-			      enum drm_connector_status_extra extra_status)
+			      enum drm_connector_status_extra extra_status,
+			      bool *send_hotplug)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index f6b96c27408a..07ddcd055962 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -32,6 +32,7 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
 			      enum drm_connector_status status,
-			      enum drm_connector_status_extra extra_status);
+			      enum drm_connector_status_extra extra_status,
+			      bool *send_hotplug);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index d02d432abde4..ad659cef16f5 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -430,7 +430,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
 				    enum drm_connector_status status,
-				    enum drm_connector_status_extra extra_status)
+				    enum drm_connector_status_extra extra_status,
+				    bool *send_hotplug)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9c4c88024cc5..e6de665ce8f6 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -616,7 +616,8 @@ struct drm_bridge_funcs {
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
 			   enum drm_connector_status status,
-			   enum drm_connector_status_extra extra_status);
+			   enum drm_connector_status_extra extra_status,
+			   bool *send_hotplug);
 
 	/**
 	 * @hpd_enable:

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
