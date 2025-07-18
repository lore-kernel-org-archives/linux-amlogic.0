Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3943BC83F1A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jul 2025 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTQlrOw4vZm3GTVGgebk+DSdEnhy8Us2b/j9opIBH4I=; b=ALPoMeBi0BRdWc
	Fe4uaet8BhYStCDGavp+bjhUGfcFRczCxE/2PJgZ1Q8dVHlXBKv8Za3ThS817ypa/4L2x85KV2tEs
	5TnR/RigJxkJmBw8KYOTuiClyVXELSWGXLewjrltjl9y/0e1hc5JBxeDf3NiqSSkvld9ncMMV4VGK
	2q6s5LUC+Mv/KNHqE1Jbk94gfvGNXnuF3gAt8PkgjxaAhYoOUL6EQK3ah8iyeLPxySXCBlGiyjMA3
	NBK1337j3ablnlGTcbWzNk4XtIJoAoPcPXc8Zit8Qjh2Dh+O9J/Ca0LzX8I8CgwQs1yCfYT7Oxt8V
	UXK0CTwrxfIJLZ77hKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmyR-0000000Cw9f-0qYG;
	Fri, 18 Jul 2025 15:26:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmtw-0000000CvEZ-2eb1
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Jul 2025 15:21:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEHHvK022256
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 15:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OarMjpCIfYSkdkdW6bUdGi1fdmdKOoKfw0cvB3ckh4U=; b=AmltrWNGxBmj1k6t
	l9UbP6BkHkJ0vnsjLYXr4wIitr05ohWFpIytlM/Tevby84MPsPuIY+SPnVGcQpQW
	cmy5wMiKyMCiil4fIhvBKKvNIU974RBeIRkiaCf+CaEfwM57SPUBgcjy3PNZy8RA
	flOLAvwkV15PnN16rJQBTb7LGcDnILIG/Ai9kZNxz1VpRiZ7tJ+Dx8C/DEAcZWgZ
	F5PA68+8HeAcnPUPupsc/xS3uMzTvez2jeEhp6FRYeD3a278oU/Rrl+yj9l67WgA
	l27EeKTEjNRiy+bX3tLBJZt3ynF171R3c85Lau/bKOvx0cgw8Dx07aA0jFPr6cHe
	IooKmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyc2nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 15:21:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e095227f5dso349785385a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 08:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852091; x=1753456891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OarMjpCIfYSkdkdW6bUdGi1fdmdKOoKfw0cvB3ckh4U=;
        b=Gzg9Ml9EqWep7hbs2+sIWG/i8+fp8KBZWGu9DDf1KARYof74GVN3QLSiR5gUb+fOAR
         7cd1WzIfp9klG1bkr7dowNDXsGz6yg0JVO+2+oKqS1L1Dke/3WWMseeup7s1B41hgcT2
         UJanQUidsQ+O3g0H/JXMFCSwr3Lifvg9TU3P07cTNcqTz7mr5vPsW/z88oxImPzZfe/z
         MIsVZAH/uF+88rgKn1gKUVcdvpzVKv1gosD4alBwodX1d+8GQ74ZZIaQVUZ6E8xyP7WH
         /YudHPNmvfxmYpHPZh+ERt4DNN7N7qAN6vlnZS3X+o6xm7HCgo00XfqfVswZly03mT/p
         V43w==
X-Forwarded-Encrypted: i=1; AJvYcCXiQGKYyKrmzmoWTKOpa6ozR2hmpesc0PHO6Sv9D2KzwnsOeupqlL68KVpJhc7D1qZDcBp2EsPAMhH6bag+@lists.infradead.org
X-Gm-Message-State: AOJu0YwAUPyXVhExHmvVwy2EA0Ih4ftFSVkYB0874+UiMGAFHVxmfPnG
	8e0A8fQaH17ZxqU1SLN5EWDVo3EMlvRxpj+Q0rEn93VeUiGN9gZh8SeYmZjhe+L+W0Eprgt+3cV
	3s0zQ5syZosFY+NOcPzXecWJ2HfrcHGJq5BR67jLI0F75+LqHzxvWjrY4lACJ5yLcYsWWjh64fA
	==
X-Gm-Gg: ASbGncstsK1iUKv93R4OSnobvxktPkKMYXDBB7FXh0zmb3hrY7L3Gh+U882tXfXysjI
	H67K/9nPrf3POuuF3vc5iCJUS6S8ElXekF5znN6KdR0YaPFmNiJXGdb81D0tRHxR9Ho9OwULGSJ
	2uY6xKU+W0f+WMyflvq9J/a8sjiE08WifQ6+MeaHYDF7xFzITJu51tlbrI45Myyqf9lcf+T9sn0
	TuUAfAQY0dXHhDlDwnmbz2RjFYn1PX4UmkgqaS/m2TkNHMfbAaNc0xJAUgmy7aIWv1ytERz/oFt
	CUvRb7uTOSa56vV1StFQum4JB9vg8SRcZDEaIFICzgdAafyKlhKpqXh+PAlGXCN+cpdc5pFvlap
	JZG48bSFhjIVkTc0IM1tWl/fq39iS1wq1CwbazYaSolt7JfdLgoi3
X-Received: by 2002:a05:620a:2603:b0:7d6:f963:8764 with SMTP id af79cd13be357-7e342b37069mr1196337285a.34.1752852090414;
        Fri, 18 Jul 2025 08:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeURN+rUaIOAwCaTzNTedfaTWOZy5Nxma8It0geQsI3eLuCA+/iQCIFo8edRjZEHH8GcSBIQ==
X-Received: by 2002:a05:620a:2603:b0:7d6:f963:8764 with SMTP id af79cd13be357-7e342b37069mr1196330285a.34.1752852089500;
        Fri, 18 Jul 2025 08:21:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:21:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:21:09 +0300
Subject: [PATCH 2/2] drm/bridge: lontium-lt9611uxc: switch to HDMI audio
 helpers
MIME-Version: 1.0
Message-Id: <20250718-lt9611uxc-hdmi-v1-2-0aa8dd26a57a@oss.qualcomm.com>
References: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
In-Reply-To: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6559;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q7HopIOTnY6OvjIs/ZdbZ8AVdNk/D/2TLd7Vbpjb/sM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmEnuVxVTiBauoE5GOOhp4UYUNPIRbkjxA+
 vP9nSa4LxuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1ThbCACCWtCZUZEl8wBu44nYByLMT3AoQo5Nv7kagMOgNvKKnel1JkIbcUW4tnGoRpepDUXqyz/
 LmSY4a/at4X19BiDN7XVw91+3cuJYXyw3dPZPnbG2LsnSfNWcYvFy75XRVdAoMfz/Vi1rax5Urr
 PJJWamnVnvyGyz0Gw3OqWnJ0Gep2/a5Ou6W/VGX7NzkoeOssJRObPzVofbsSYaxrLmlaMLaWsGo
 qkEcwHmKq4KW6j4QV/bLkBngpJS/5YjCZevhWzVWpf7ZiKxp4Z4Tp3021IlsPMHHwNsiLr52dDA
 RUxmPm0kQRGBEqqfHulxyC2oCt/GSMUdAx9K5KynWD4c+9WF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX3xsc1MODVwHw
 Gm+ALmWfVrEeFsa9aIOVXV5Ht6gVWqa7yJhuyBAlpDm2VdmGtPm+AcBEfJHE2RdCj5aPOu/cJAS
 4HHOCkP69OsKSaFC4dIZlDZjYw8U5wY96UeXLez9CHUOYS5k1EFfX5XmcS9r3P3qDLq3unb55D8
 2wxHIOno2IWGKvbGwAPQexMV+dsJyecrfUJVXIFUD6mli6iLqpE3SS59iO84yIUH47IZKOxAuIg
 OlJVGwzJj0xecjGReqmhtmY9sCty5aS/TrjETqc+9w4drWDJiQGpkwgsP0RhTF+dCoc8I08r4CN
 dqItN78GNHu3fWvGk7B1qqHNuopg5or2kxgSyEIZkvsNvQPRqEYSL63rLVKsrx+9kNZaWP2gYNs
 c5uOPMKjyOq8/E+QkdQxg5qMeGPqB46SWHAGV0GC5i/0/JDeMIYZzyihcURlESrwFR9+7+GV
X-Proofpoint-GUID: 7kFL70BvAXGtWBGeJ8b0meGdOeApKJ9s
X-Proofpoint-ORIG-GUID: 7kFL70BvAXGtWBGeJ8b0meGdOeApKJ9s
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a667c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rji8DJjHHTBzgOBfyK4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082132_689182_2296922A 
X-CRM114-Status: GOOD (  20.74  )
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

While LT9611UXC is a DSI-to-HDMI bridge, it implements all HDMI-related
functions internally, in the firmware, thus it doesn't make sense to
implement DRM_BRIDGE_OP_HDMI. However it is possible to implement
DRM_BRIDGE_OP_HDMI_AUDIO, streamlining HDMI audio plumbing (which
includes plugged notifications and ELD handling).

Implement corresponding callbacks and trigger EDID read /
drm_connector_hdmi_audio_plugged_notify() from the hpd_notify callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 125 +++++++++++------------------
 1 file changed, 49 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f441ae433c60a7680aaa6501a8956e..11aab07d88df646a54fea287030a183eb823b26d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -17,8 +17,6 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
-#include <sound/hdmi-codec.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
@@ -27,6 +25,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <drm/display/drm_hdmi_audio_helper.h>
+
 #define EDID_BLOCK_SIZE	128
 #define EDID_NUM_BLOCKS	2
 
@@ -48,7 +48,6 @@ struct lt9611uxc {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *enable_gpio;
@@ -429,12 +428,52 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 	return drm_edid_read_custom(connector, lt9611uxc_get_edid_block, lt9611uxc);
 }
 
+static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
+					struct drm_connector *connector,
+					enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+
+	if (status == connector_status_disconnected) {
+		drm_connector_hdmi_audio_plugged_notify(connector, false);
+		drm_edid_connector_update(connector, NULL);
+		return;
+	}
+
+	drm_edid = lt9611uxc_bridge_edid_read(bridge, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	if (status == connector_status_connected)
+		drm_connector_hdmi_audio_plugged_notify(connector, true);
+}
+
+static int lt9611uxc_hdmi_audio_prepare(struct drm_bridge *bridge,
+					struct drm_connector *connector,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	/*
+	 * LT9611UXC will automatically detect rate and sample size, so no need
+	 * to setup anything here.
+	 */
+	return 0;
+}
+
+static void lt9611uxc_hdmi_audio_shutdown(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+}
+
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.attach = lt9611uxc_bridge_attach,
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
 	.edid_read = lt9611uxc_bridge_edid_read,
+	.hpd_notify = lt9611uxc_bridge_hpd_notify,
+	.hdmi_audio_prepare = lt9611uxc_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = lt9611uxc_hdmi_audio_shutdown,
 };
 
 static int lt9611uxc_parse_dt(struct device *dev,
@@ -508,73 +547,6 @@ static int lt9611uxc_read_version(struct lt9611uxc *lt9611uxc)
 	return ret < 0 ? ret : rev;
 }
 
-static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *fmt,
-				    struct hdmi_codec_params *hparms)
-{
-	/*
-	 * LT9611UXC will automatically detect rate and sample size, so no need
-	 * to setup anything here.
-	 */
-	return 0;
-}
-
-static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
-{
-}
-
-static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint,
-					 void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611uxc_codec_ops = {
-	.hw_params	= lt9611uxc_hdmi_hw_params,
-	.audio_shutdown = lt9611uxc_audio_shutdown,
-	.get_dai_id	= lt9611uxc_hdmi_i2s_get_dai_id,
-};
-
-static int lt9611uxc_audio_init(struct device *dev, struct lt9611uxc *lt9611uxc)
-{
-	struct hdmi_codec_pdata codec_data = {
-		.ops = &lt9611uxc_codec_ops,
-		.max_i2s_channels = 2,
-		.i2s = 1,
-		.data = lt9611uxc,
-	};
-
-	lt9611uxc->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611uxc->audio_pdev);
-}
-
-static void lt9611uxc_audio_exit(struct lt9611uxc *lt9611uxc)
-{
-	if (lt9611uxc->audio_pdev) {
-		platform_device_unregister(lt9611uxc->audio_pdev);
-		lt9611uxc->audio_pdev = NULL;
-	}
-}
-
 #define LT9611UXC_FW_PAGE_SIZE 32
 static void lt9611uxc_firmware_write_page(struct lt9611uxc *lt9611uxc, u16 addr, const u8 *buf)
 {
@@ -858,11 +830,17 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt9611uxc);
 
 	lt9611uxc->bridge.of_node = client->dev.of_node;
-	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HDMI_AUDIO;
 	if (lt9611uxc->hpd_supported)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
+	lt9611uxc->bridge.hdmi_audio_dev = dev;
+	lt9611uxc->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	lt9611uxc->bridge.hdmi_audio_dai_port = 2;
+
 	drm_bridge_add(&lt9611uxc->bridge);
 
 	/* Attach primary DSI */
@@ -881,10 +859,6 @@ static int lt9611uxc_probe(struct i2c_client *client)
 		}
 	}
 
-	ret = lt9611uxc_audio_init(dev, lt9611uxc);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -908,7 +882,6 @@ static void lt9611uxc_remove(struct i2c_client *client)
 
 	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
-	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
 	mutex_destroy(&lt9611uxc->ocm_lock);

-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
