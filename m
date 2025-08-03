Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1563C87FCB
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Aug 2025 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHvpeq7ByCfy+996QJCdt9X968+cDNdYQq5LWpfvTKs=; b=MGMuPFhbACBdqn
	0PLA6uq6gtmbwhdHnF95DXlIDECJH98Gc23XqF3LLcggArZkz/IBhtjkHuUf9f9OKR8VSnnS4kiqs
	zxleYfWmeMePk52bh98qixLgtZKzfZbkzxKq97cMl8TuXtGt0nebA/KRRr2GNXhXNg/P11X0u66/W
	8hQnirvHVhCgiPuEGZ6ltowq9Gr1BR36LrtnMR4hZia+EpWkel/Pp2R46F7K4zGLJen5Y334ShFv/
	vhC81R5sqDX4QLH7vot8O+3DYw4QMGZQ0Z5ZJnwqSzYU7ppwtV8wqyab45O2g9QvduWRhmVJicr6K
	4xwshF77yQu+igno3vaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiXN1-00000008gDk-2puM;
	Sun, 03 Aug 2025 11:59:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiXHy-00000008flU-1Drl
	for linux-amlogic@lists.infradead.org;
	Sun, 03 Aug 2025 11:54:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5739NcBB021456
	for <linux-amlogic@lists.infradead.org>; Sun, 3 Aug 2025 11:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=BfVw/9to//LrIK8s
	VXJEXmVCiEgN+jwiLXUa3IP/qCazSwoZtY70Xrf3yuj98LPBQk74JI/K4rccamH8
	fjRfoSpT0qochLZPvtOcknVP7vFVn1OZ2BcSJM1IPDvs5bPb/2BmOIHlYR1PtHmH
	H5LZPked8kVU9kUEEpf05MiOctYkAT9dCd3K58ueTYKKlSdEifLYfQ9qGowHJ+bg
	TryaGyR58PBWa1/7YLv1bnd9OInRSvBH1azQZ+eWjIbqWfNBPaPhfMritNCtgFIS
	RkAEJ33RKnb+WlV0Y37gz7uoWi+7nlWtece6CWzaxxTHlPhmXiwA5/hrP5rNSWS7
	yrOBpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a26kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 03 Aug 2025 11:54:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e69dbe33faso160711385a.1
        for <linux-amlogic@lists.infradead.org>; Sun, 03 Aug 2025 04:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754222044; x=1754826844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=;
        b=F69jx+SG6JHCdvwPAKZc85jQBxkVVvAMjaQHmUKRyR5C3nMdsQ83MDbq/1wJks2Pf8
         syyXhpH0MI/CSbF8vHchzyTjbbNS4Hy4d9VTLMSZMlQyvmqi8JQ9zMO5Sm0YnixbmpUc
         PlMSS8ojD+e45NaEEzkZkVnKJskw3ZIO5z9n4IaHM5/B9OXMUaiZZ9fPOGi6GoTKdJK8
         PzApIl5LLJ7mUmY0te2xnn/eHqHLoAAWcguUsNX/TEXMeeQ0sbs5oI1l01UqAmyf99g5
         uIkOVf0hAqs2SbMxZyYEJBsbbnOs0EOf0jJySdmkczOcEqTbCYxC1Jf3lyTWZXZhoXxW
         xm+w==
X-Forwarded-Encrypted: i=1; AJvYcCVsj2PsEFqwJrp/qJRuujJjGxuAyvr1jc9YJK/UjC2XoFhNqlSpUdWxa92lJIN0sZoRrYqI6BzVUwvc/SX0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxifn997fHmDke/mJdZw9iIBIjnySP10sMAnJh21zFh52Qf/3NG
	xxQJOHb1DKxpTHDxNUDXI67/GVo2p/nN6U7Nf+ksJo8SQiHIntUMdlbqP8sNo1Jok6jPfW4N+Rn
	QcmVF4vnUUGEVKhv0GZq6ANNd49HR46WCsfEoPPWH2+kKBk7JG/1A5Gd10DE9bhjpTRaALuXEvA
	==
X-Gm-Gg: ASbGncsnf9jel+zojDkwH7cUXFudey53XzK2SSr/USJZXYGPY5bKmp2Bz0CepcrSjaj
	dOUZ2YHfXuHaf0nyjXhWVvRHgjeQMn1UU7SNXykfbUhYflRlfPxBHoD3xPhEgmoK5Cce5cNTESz
	6vJBD4Rxb1fWcyH3Qwtlx3zAR48RU1N2huro93FOG75wZu8W1dfvOW3D+hEqjlmUWyBALzgnMB/
	BsJVFU6nxPmvDC9zo6IrYkIRipwBfLlHUXgCzFvDFfxh4T1wDrE0io5TFOVKnNvzGoUoTSfp1DX
	enLcIJmb8ksP4sINPjyGGZhbdlDrPB5y8QMTJBtnHCcHQS2gy86B01U2x+mL4jfa2HuYLbS4lIi
	W0KuZRPNM7a2IQvJHXSJh/0krGtsoHd/YjPM4K27iwe2v/yHho5yi
X-Received: by 2002:a05:620a:a512:b0:7e3:4413:e492 with SMTP id af79cd13be357-7e6963b6948mr669904685a.62.1754222044405;
        Sun, 03 Aug 2025 04:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi7Z0g+HyOmwylpAHIiombJAZTJQt2apb7Na+ugRVHriOOOlyXxwTa0sV5vkEVVpsO/Em1Bg==
X-Received: by 2002:a05:620a:a512:b0:7e3:4413:e492 with SMTP id af79cd13be357-7e6963b6948mr669902785a.62.1754222043929;
        Sun, 03 Aug 2025 04:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a6f74sm13281731fa.20.2025.08.03.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 04:53:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 03 Aug 2025 14:53:51 +0300
Subject: [PATCH RESEND 1/2] drm/bridge: add connector argument to
 .hpd_notify callback
MIME-Version: 1.0
Message-Id: <20250803-lt9611uxc-hdmi-v1-1-cb9ce1793acf@oss.qualcomm.com>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoj03TORatWDOhTPjdc70eBEsioKoAJxcth/ivq
 6H3TOAa2NaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaI9N0wAKCRCLPIo+Aiko
 1QxoB/4i8bbQq2ZRNNqvbwxjSBbSZKHD3rqd1LvOlKVXxTCw9xRz7M59eO61jbwviaJTjcUWHtr
 nat0Tkw4bP4fyurXtBFoiOk5cjelwMu530WZgg72N7d4pTcMgIaNVqiOVnXdSybVb57migXZRtW
 ahHeSSx7JKf534W/gUtiNJ5HZV1UEIDs8AVUPdLYZ34oZ3rcwTPS0PnFafnn9n0/GDPT5WUE2JR
 1aPLLB5OixRNVZW19DBu7pO7f6V8vgUkBVwmVlApeKGve4pHDLA9H4ASGTTie+Mf/kPC+y3YDFu
 r8DUxHju5Qzz75JBY5gJEUuBL4zPUX+E/EF/F/p89lW3t9qW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=688f4ddd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=H7fCCF_eaumybVcuHoAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: anyRtp3TYgemWYn6JiByT-2OVfglMI2K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA4MCBTYWx0ZWRfX/dAkun4qCZIF
 4jHPOmZzfZHXMynBDHP/y7iv5nnZL006wUTiFSU4Q0ldBbYKKXpofO6r8bCZLMIOwkWls7K+HBr
 IJ6lq+ACTDBnu4velvUOlNgMtpQQzJczBkgatzcICr3XMQow5WVnUeEI8GPsVJvaN+Mqdun4ife
 t/UN0FHAJTr5qrteWGHSw4p5vcaBv9P8wOHs9cZ2SseLdbqWPuqRBWTxyDoGM/vW7XWunxU19a6
 98QAetHNp/yWWZeUAqiKiZDUkyPBkOMbklEGKKoorgTe2/t8KgmIhGf1OhogfBh+zyUgEO9kWyD
 yqE+i3bZ/29TKDWump2OlQDnSpEuQ70KOGvdxmrPUE6uWm6+5RjyOWzd67fCL9JBrMaHikD4ycs
 XQY+fxFEgfUpA5SlVHx1pyka+avQRvqzqg2mW45oo6/9J1wEpHivnBOXJ6gwyDdMk03u4r4X
X-Proofpoint-GUID: anyRtp3TYgemWYn6JiByT-2OVfglMI2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_045406_454003_4C0524EB 
X-CRM114-Status: GOOD (  16.27  )
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
