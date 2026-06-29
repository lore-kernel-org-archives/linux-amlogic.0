Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212B2C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hEOEHzMSsWoTL9Ylu2F1HAQ3GKdOGh6ZsYjk0JVT+g=; b=JWZA0mlWWuwlSV
	Xv65fEKzBfluuGFCqhqLqcm33m1EmxxMGDlKbhmOIg2bo78l4QzuhKAoxObVLUh3FKNaAlHByDGQw
	Q34yiKi4sLQFUO/sDj7uWN8Q4NYIlJkvlaXK+STyosB6YymYOJkA12u1dT4sHrkMU+KzlVs6kbiN1
	fYEzIuhLOiU88XsVXnsD3Ht8aEBzQMm29BTnDnGXXOtUPxkPB/7sLWHucvyZPXcvM8Q6VcxoXf7rA
	uccZ+30jjhW8dWXFY49A6VrqKw6pvfYil05IjOGxYADRAo0s3l8tp+N+27NOrvUahcmBlQUr6I+sF
	Bxq7WwR90tixbkcQl9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDI3-0000000EwLI-1lnr;
	Mon, 29 Jun 2026 14:48:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDI0-0000000EwIT-3VeN
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKqO2579262
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DCRc1+pd9Su9ZSSDRhIagXJRwfB5gYRz2Ej4HsfPXE=; b=CN2dAyMlR6FulHz/
	L2n4JtnXLBj5ia8K5IadUawl7zDfJRIk4A0w13vLZMqxvaCTgMMymgGM7/BKX09P
	RCvjyKNID6nZ2MtTvpLdlQdoMNeDbz59482ygF6ek0Woq5hrTT4siHya/USurtTE
	vWyZnKdr8EBIOvQMTnIfBEwwxfu2BNv6kbqEKeZT7MP7Pph69VS+Qiv45sM4FKAk
	VXdA6VGaTJKv7NXxbPj2FqryLI/HMc3odkPmFzH6HGtkJNJKD5KN6Sq6OnusyNpt
	BlA8MteewBp4Lf3P+0p7Qpv/Cbk6zkEYBhhee1XLHVBFzKCpjeY3OAnYEhXET+W1
	LWeFgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hwfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e606e8f3eso32243685a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744527; x=1783349327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DCRc1+pd9Su9ZSSDRhIagXJRwfB5gYRz2Ej4HsfPXE=;
        b=kEncdRmBIay34kd4nr83YhU1Yng+b846vQaeotKC9aJHsYdMO/hyEk52wGQ5xOVFDy
         m79e4LSNEwwGckyE4BO6aogW4WKEJa4+50EiM6knDhZdMl4vss7HKz9zwj8kspTmySZz
         v+NbU+biHAx5JwhcoJh6R6iBhxe5WMa8nYgrlaNOkkgzmF8L5l0K4leSjflgTOaYtDRH
         gBf+trbFSO9L8XxRI2Fg+osT2fEmVHCAeIyvxsfoYsL5LPLRqcL/XyAaKWI5SSkbT8dw
         9QOWTzt6Tqj/Mik0vc2pQcyzM256IwqjmMDvkZpCmY8uOJ68iipRkIaXS0QWjyXoN7hL
         Tujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744527; x=1783349327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0DCRc1+pd9Su9ZSSDRhIagXJRwfB5gYRz2Ej4HsfPXE=;
        b=VnGewxCF8/B60Xj73BLUAQysKCcwPZrrTlHFkZCP4GF5brYSLvY+euvE5dMpffwu5U
         fuukJNchMwCUlWxU9RDRt85322qNLyqakuxiz9JyqTamNjioXqciemt1b2absfOROlTc
         LS8JeU2CeJBUr73fN+shyO+YHebvwU9S05YJixKaFoHBbquSphm4xZh7lPtsjhg+ld9z
         3UhIuARuB+O1StOKRg6LsYCgq77YhQ7X6Hk+r+sxr82+9m7YPfEjxyb6oJ+X1xPlTw+P
         JOYD00ngvd3S1vhjReziTzvIYEmFFewWQdMAUmwQoDpjrLEhqLtXnENK3Y4H7BwP4YRW
         Fm7w==
X-Forwarded-Encrypted: i=1; AFNElJ+Q0CIjGsXShrt9KDELZ45rXfKvjWEaT6v9WzrHNs/dYsIm8o5KegbasMyrDOywDAYQu5ZF9+A3AT5IuSdL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt57DG3RvfWNOXJGHqHYKUs4oOba/eAcHk7viEoTTRoByn4bpp
	/j0s+vgQJmGGvuI4kcTKkDOh2/jutPReSbi0C5delGjiZeOyw82jUMgrVu3+kM8N69xan5LcHx3
	F/RdpRtxzx8g43b9FBFSBElBGqbjzyNAHgKe6iqUJjaE6GrdSuFc6cVXwAngttER7iKaDOjSfuQ
	==
X-Gm-Gg: AfdE7cl0DVwjImyllU0QuUdzwWdJdDvEpVVJaCGhgNKuVkZSe6Tf5oTLJNPHOo667U8
	htcuv0tc3vVztCc2kaK8wpyq+dKuRiSNdFFgZnptKfTNcX+7QkG92zbgw/1JRTRCjk0HxtFjXCj
	YE/u6BARFwN+bsCPf7/eqhyQhz/51xvU1PQC6MRL4Lfa3kyUVqNgKV/Ms7WZn5yHNKJtNecRjNG
	QWZ+u0laVphs7hG4Q/XZZXTKpXccKWANGhFpKIFAW1iOwvioFq/9LZUYVsHPitJVAuPxIvkDltS
	pvBfKhnJw0I2NXFjzNk/fl+d7TEzB0qqa+TqcTtlGZK3NqJeRcP9MW3y2LC8inD95Eyx1v01eqz
	66rn048lDVSO+peJvbchyn84SK4h/C5pfbJl9wRMX/0DvG22oWR8d7lhcq9etFeVQ3iKk2KLlLA
	==
X-Received: by 2002:a05:620a:4050:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-92b3b00a2d1mr1531796385a.10.1782744526013;
        Mon, 29 Jun 2026 07:48:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4050:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-92b3b00a2d1mr1531790485a.10.1782744525425;
        Mon, 29 Jun 2026 07:48:45 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:05 +0800
Subject: [PATCH 3/5] drm/msm/dp: suppress bridge hotplug events during MST
 operation
MIME-Version: 1.0
Message-Id: <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=2450;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=HP/cW/Tw37YstcovENSRbx+bTNeC9rrNJjB508cDOAc=;
 b=DhGa0Wr8tIbwVvFaZ+bpQnM6r2zbyTcERPBAAfH1jQ8mk+FZG4WQ2mgMtUZ4hCw5ENlOZGq6j
 uU8xr6dBr2YA52fJcrO1a+YGmKFCgXLAWGeqtbRA1D/miCilsRUfAJV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX2nxK5K3A+IDA
 lP20SpOmCn06tLpV01aNg1QtEdqSa6ibVY+IRgabonD6IYKUy5iTbzkQaRU8MKzNGEN2UWiSDbz
 WO7V33jwU7TSnLUQkEv1YcVIk7/ERA0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX+V7toRbq7zod
 gcU3VpmXsLRUmz8tLGXVG086scB/aHcVruBVMA46B34syBkiHXM+ZOcpgiUavGpG+96X8nRnRCi
 NmXmtzGFhYW7sFVqX+WeGXXfjiXXftLWNCRwcp4eVLtfuzi+BOMAWIcLhUzDPhDuAtufR27+ue7
 jUB+idxcU8mnYn9OhfGYMYhFOqTse471G0tfG/tzW1atQ2XSUGeED1BRAQjp5IJZMEKKyF8Argh
 afTxSq+tLSG+camuT9V9UfsivW2/280fdWYlubm5R5weL/38F2lkDP/dWU6A/9Z92Lrc9unujAR
 mmMh9wLOVHqHH7NRBubUM/tvIJFwHD1c1lkfnB3oS/JF5Yvc9eVaf/LCJudDzmFApO7xVRmGQpd
 gSgTk3MeBJ+BhKthX+zv97IBHqrfdkY+IUJHHgcnULC0iZo+KKJBTgUyn/x/2D+TQGJIBO9RzWH
 HwCMNOF5zS3zZPmRfUw==
X-Proofpoint-ORIG-GUID: 4bmMxTfhvhXEEcWI6wbwVa6g5CNRFmFT
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4285d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MZjPE3D8UQgFyAeDyYcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4bmMxTfhvhXEEcWI6wbwVa6g5CNRFmFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074848_873501_FB59BE45 
X-CRM114-Status: GOOD (  15.40  )
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

The DP MST framework already generates the required hotplug events for
MST topology changes.

Suppress connector hotplug event generation from the bridge connector
path while MST is active, and continue propagating HPD notifications to
the DP driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
 drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7334d6677604..82ed0dc450ab 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
+	bool send_hotplug = true;
 
 	/*
 	 * IRQ-only notification: extra_status carries the event but
@@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
+	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
 
-	drm_kms_helper_connector_hotplug_event(connector);
+	if (send_hotplug)
+		drm_kms_helper_connector_hotplug_event(connector);
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6835c68fe510..bc93b566fbca 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			msm_dp_hpd_plug_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
+			/* mst_active is set in plug_handle; suppress SST hotplug */
+			if (send_hotplug && msm_dp_display->mst_active)
+				*send_hotplug = false;
 		}
 	} else {
-		if (hpd_link_status == ISR_DISCONNECTED)
+		if (!msm_dp_display->mst_active) {
 			msm_dp_hpd_unplug_handle(dp);
+		} else if (send_hotplug) {
+			msm_dp_hpd_unplug_handle(dp);
+			*send_hotplug = false;
+		}
 	}
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
