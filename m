Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C9DC83F1A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jul 2025 15:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHvpeq7ByCfy+996QJCdt9X968+cDNdYQq5LWpfvTKs=; b=dtB9ETeuyoqhTF
	uk4P3CHqPsLxoVNg3VmvQ0uX4iGlp5piurvF+L9cXB/QCiaaaFmXtxUerxVP/BYrzMQGVM7cBaSsh
	T+ks0vs4kYGoDSIjrYUnMuv6/dgO/zTzNFGoLkJ96jDWURX0IiPnQ7mj8NJEK0rxGaA5JrIljTJZo
	AyPFwgrxYz+4/a6L21pjdlwDJI6dsb2+gRscVDIXNaYjNBRvHC49OMMvCMRwpQymBtDsmGwyyBuHC
	+p/i1aV8rqE8lSt+JeCF6hZDr8mY1N98q+MFeuK1QROVjFpnImsyDmU33bvl/Y57lfp8HTuIRoNVu
	3cZHmQJYuDtghIRpV7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucn3H-0000000CxC7-0wr5;
	Fri, 18 Jul 2025 15:31:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmuF-0000000CvLU-3yxs
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Jul 2025 15:21:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8NjEs008518
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 15:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=VrDSLmWS/fBuwTcb
	05J7LPH6Cz+belbs7qtt/Lx0NORZ1V/C/d6EAFXc1vIrQRBz0uFlwCeytXmlnP9x
	nxPjxBa/heOJFz4DAnvUC1JNx2OX7A9qoDlcg1RO1fnmfc/dFmBmSCfbN71NI/Gc
	Qc4LEolwTW/yIXHvha4V5MQO8v1TIDvYVq7qmN+1FLSWyj7aYAzfSEMfCsBBYePx
	reP3dV3zMwrn0cXXa2JI1W6JCcZcNQehVsf7HxqExk31n3MQLq0fkkqas/efJ1so
	IAZQ3O8LftQAJaHeYqbocS1/nW+ceBO579IkjZ/F+yezBxXdff5lbC8pNdETnyFr
	7gqXQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbc32f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 15:21:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e338e627f1so591017585a.0
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 08:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852110; x=1753456910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=;
        b=GqTcNuCExHmPyUU/kU+C2E4/iUwxJw1oKv3cB3sObVoajwrljfEghzHgIcqj2fJosR
         hYc/v2256/mebiMWjcJtgE6ScaAmA3/L8gwrEyC4XIztRUNHm4KgynqX43Arw9Hj5n5j
         pIAED6m8KjGpEpXfU5XsZvjwFCDzpxHx7FPBlOZvlChc4T3uDycvxyt128ent2OjVXsE
         Rrws2C6kbdWAyd6dL84pDEKxrW/wOXZnX7yMeTzNhqj0Fb1B1ScxR+AQjWY/auZ5r1tB
         BDLXmwaBmcfA4jT8hAs1zeQO1KOBe1MjbzCCWU2crGdu5iwVuNMKsjbVgRUtAKczgzfg
         OpPA==
X-Forwarded-Encrypted: i=1; AJvYcCUOZzU0UK2AytGSMZFNK7W3Kbbf+tRpdkLRIQqZ48IuH0mNffKWe08MHxFSkUX5d69g5j+9Jb/sZnsDt+7P@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp7nvOzmAVTFjR1ijBOe8XO2OBPUcy8Qi5/iZqlyaeHcNxz/Wl
	SAGCGoqry4dCD5zzQc8w0lJScIXaoBa6JvXUGMIA3wkFAcQ4UZ7xjC4wYdmWUMhQHkXa0sCBXlD
	ubEhfo6Addg1akSO1v74ixzlMm1fntYQVxxqCq+WU+cz8LbkGcy++7ID12SfsWZgLko/BNxmtse
	uAaHm1MQ==
X-Gm-Gg: ASbGnctp52qS7Nh0D/FsBM64Olr4Bie3CiHPgHNmeIM1y72CBERt9ubYenP6rUxV42V
	NWBpKOdjUhrQl6ZMb+3YBjtzQPxLWKk0Ft0tzv5hmq9cH1xMV4QFOXuZv0ZeIP0jHIrBNqQgUUy
	yTUuDi1l30gRBI1uiRDQNktoih0de3Q/qyTKcVP60lIQMWG7fHhwSr5RuhDMzPecwvOF11sCqdT
	S+q11IHb1UxypwLgAHvTzbJiFQFBQzXltkTm2Op3zDearvva1NsRGHjWPTc0ij9RI4eweL4KMqm
	i3Uw6yP2rEZSWdPPr2EgSJtTv1m17KvJXfwq6SvU0fuDgdiTOHXi43kc21ef/Bl+H+SQF+f7ics
	SNAlAL8jmCFgw3WkiYqmgwJaEq3sfoM9XrQq6mCvSwiwwCq1yaMXP
X-Received: by 2002:a05:620a:1920:b0:7e2:6453:cb0c with SMTP id af79cd13be357-7e356b2cd23mr488334385a.58.1752852109675;
        Fri, 18 Jul 2025 08:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXlyUsMs9U0U+O1wbUBh1xpkP1sDmfvcZCUKPqD7lL2WBQwooK09f3VjD66V4Apt17hOmKBw==
X-Received: by 2002:a05:6122:2982:b0:531:2afc:463e with SMTP id 71dfb90a1353d-5376473b9c8mr1645131e0c.5.1752852073027;
        Fri, 18 Jul 2025 08:21:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:21:08 +0300
Subject: [PATCH 1/2] drm/bridge: add connector argument to .hpd_notify
 callback
MIME-Version: 1.0
Message-Id: <20250718-lt9611uxc-hdmi-v1-1-0aa8dd26a57a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmjN+Omvftf4kFa7jkLpiochHZs/3UCyjEQ
 KJocwTiOuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1WMYCACXfUOHlzufAnv7BolBNMuOWQAeu8OseKQIIQ3KxLuNSMdFlg+PMVybvtBqqW6SAy/QCIM
 lCj8zp7+vQG7lcPnFFiHw3Lfou9u2k/+h5nFwZov6t0LG/8WCRGN2SVHr2eh3mMZPLlRB5NVPRL
 TnrsG/OQab8Jy2JDPyOaCFZu8+GjdYU5lDOJQ82IdRVZ0kGD3wKHiANCYz9UUJouAvEkp8igRyN
 b5GhFmELHKA9+Jlqw3HruviFWFQCo0IefgOAeq64gHFK0MJYaIAKduKw6tSd6U4xHoW+95qydOK
 MiOzZn+V5ZV3n3MBx3uYUNVRbpcaek2Y83IJJGVa2xJpB5+9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2t-I00aLuZxfP3Do1hVRglxQ9ns5H83m
X-Proofpoint-ORIG-GUID: 2t-I00aLuZxfP3Do1hVRglxQ9ns5H83m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX8zYnHP3pkOvf
 fOMnpDShGdkAnQw7NANnOul0sUBu+qnDIyMaMWQHPNN9QyUOGmWdhogDC45qY6kIjCo9ZXlicvm
 x17ZkWsBXl1Dko6kvWeH71WPAeuM2DBpXc38Ny/f5kALeKF3s99rAzxZlD9dZB/NPyx365zVawp
 ySFTkT6rNJhYgSi/gBhJIjbVEggxzyADW+IHaHLcV67iK59RXhGqh6XP/AQGIQ27rtK0Px1vXYx
 fjEAPZMMlxrl8JTw/mluLHlXAsPbfY8RweoQQKV4eBlYeFKHUAsDMh8sJZE5Gkad3zwzPkq5N59
 NCES9Z7LaD65X6NOjWb9A7qczDqOqY2Q7aAwdxXKOmv/gkaBGCVr8BeMnCaycFJ8PsDO5GZY7o5
 Wlnq9rNwBkt01jNl7GO+dpkorpnSE+Birz6AEWLWRQeAszUyzaoiHAM2wNzd2MMS1Jw6pe+a
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687a668f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=H7fCCF_eaumybVcuHoAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082152_099127_C6CF282D 
X-CRM114-Status: GOOD (  16.43  )
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

Drivers might need to update DRM connector in the
drm_bridge_funcs.hpd_notify callback (e.g. it might be necessary to
update EDID before setting ELD). Add corresponding argument to the
callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 1 +
 include/drm/drm_bridge.h                       | 1 +
 6 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..f2fd277d694b8c959f913517ff5861b777d8a9dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, status);
+			bridge->funcs->hpd_notify(bridge, connector, status);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691ee7d166b16cfce6932d0308fe6c4..a665c9036878c1e879b7bd88df1d523658fe8849 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,6 +323,7 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 }
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
+					  struct drm_connector *connector,
 					  enum drm_connector_status status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..0676b3423abcb31ac3ea6e6269473764786133ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1774,7 +1774,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status)
+			      struct drm_connector *connector,
+			      enum drm_connector_status status)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6..9eb3431dd93adf096f45b6d981967734bc8a2b0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -40,6 +40,7 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status);
+			      struct drm_connector *connector,
+			      enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 3cd612af24498b057c33eaecb3d43c8df76cd23e..29b2dfb90b5fa3b137d05725d65a1cccb9cd1345 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -428,6 +428,7 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 }
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
 				    enum drm_connector_status status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..1e73d72c55426ec21905070a13b44aa36b02e023 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -730,6 +730,7 @@ struct drm_bridge_funcs {
 	 * controllers for HDMI bridges.
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
 			   enum drm_connector_status status);
 
 	/**

-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
