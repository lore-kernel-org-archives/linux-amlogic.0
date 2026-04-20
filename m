Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3BEF588EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBMn/H34wQhN90FoqiboIZ3oWfkygeWNvCUXap2VYjE=; b=4mhYEw9XAv2hGc
	hSa1sqeTzaHwwaxqkLtZxhYm0yzL3gtKbXvbl6SryGkBhb5EPuLJutGxcZL0fvZpSZS3u406Pql9i
	Wyt9Dtq2TmJei+e08/KrZjf5MSbly/M2zgAzGR04Nnyk7sJzIMtulfMfmL8USHbzfUssfcbiYazk2
	JuGGH9Qr/DINKoQiz3x8q9Z+QcT+E4uVGDUiGoMhnpgwUsubB2iphDghnCEOZIwZ6G0iVyvmfomKq
	cEOEQK6QzcEeAnwSdGPSdP4uwS+oiRDFZp3mkzWOYNoAo06z9g9ljgbhCmjwrfeAhjm35JtbU4Utr
	4tS9vKj11zPRK6x/bGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbH-00000007I59-30YZ;
	Mon, 20 Apr 2026 15:31:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbD-00000007I1h-2GYS
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 15:31:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9mOeC3925577
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 15:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=lUIbGvQZ5qpNp4Gr
	QY6vrMBwk+A6tYOPjjoOHnbdSdN3EyYfSEgfbOzFlvu/aTF87y02bKmkxi3fhzyp
	ZLqsTfOcH7bUoEfoDkeQdsfcrL/2WeOKCs5wzHFizkFr1jcHuW/DkpzDvgs8D8TL
	m2KsoVMlz7UD+hSPF9Sjown2QTRx03z8jYu7KvlbH5Rqm6hn6lViKzI4O1Pl8sDG
	o1MP1usTGTfAD5l5lQuVBoCYh8k2z37Wbhvz6YbAXZy6BsuSJ6EDfL7lQ5RZP1Nr
	yu0VyVqqrDy56UkKqn36L/WUrK0SoUC0KJzEM78z0PIC2Y+hZ+8s4m24sKJIanIh
	Wnoe6w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhu9s6u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 15:31:46 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-467e00b684eso3794024b6e.3
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699105; x=1777303905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=V5V8OU2ZaY+YoF/LQZEMtDn8FAlXSgg/DO7OstabaYW03bRNOixLZJ8tP5KzcdtfOF
         MxBI6NEAXtGZqvUEtaGrC8btQxI0ILFbAKTxgnEya85+jftNJILhlqoIwujHYXwSx+qD
         UzSjfa/7F0cI8/RoS6LZOwrDA6eOvF2JS0rKHq88LzH6CviqzWdnYAKbYc9NJj42LIlm
         oq07eOqYAhsao4VERPYnewQ+yhPD7n1bef5OZxgXfF7Z8v+EA8DvLQBWM/v1K/UMiD5N
         rvFkVQvoD0O13YAeXGkxT3ygvP4cAtgfuc0X+DH0FWzEqkC0aS55ZFqoZ0OXAt1J5isr
         k0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699105; x=1777303905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=bb1PawOT800Pq6gZQaeJc4PLpJlj7SkHCuyISkx0FHyAZF59xbFC5MpeeTTKnqLGNH
         oznDBcGr0tLmK5UXb7hTtkTfrgJ3qGZQaNC/S7tHa4tMav2NwIn/eqa9gShKINffpecZ
         b8VI2JZh0xBGJlRs7XgQGAjMSEyipnk5birjgE0UR+Ih9ULKg58SBjTzPGDut2Y3KnkM
         sCFSCBbK3xQ07BLmq2CbKfl0sqYbj1wyeptDh0weGoQhXvrMUo01QXCxI3V2xMiQG52s
         7o5hHQd0Lqmx2BMpqAmdZg6JSjObGexpT5PAeQjRaY8DScWvNujebhzdE8KHTzvJQAvZ
         JMHQ==
X-Forwarded-Encrypted: i=1; AFNElJ++fBuVNLaaO+ifTOexN40OVgvnZzBL1LXJU4hr3hqxZTGTxZT8vRXOCymKK8lRl12OUcNg+iOiLDmlQYIY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz18ajIC/7wlO5P18RnHxfLtk9nzGMVseC8UnuTyllO61c7lmRs
	SgT89Zatex3/Et9dIRiVGzxodYtRZdKn/BurxZFFEoqHvub6vVsC9SoDQkERXngWi9qsb+OSgW/
	RndceRZir6KRdamlyTBZpVzBl3wi4/kHMfFJomUVcQ10p7KQ4MW2UPWuaOLOfcIGCNnUhcYuoHA
	==
X-Gm-Gg: AeBDiese+SPPV1mXXOTMz/NWiCZLdPHsD586kBqq/PkNiBxh4G/QYh84Qq4F4Bn5P/N
	UT02Kh3Sj330yHNM9Z2tI4m0awbtqX52E++C72M5n0IuHloCiwXEe+7OunXaNwf5cF+Ill+02vp
	NarCkBad2/pQlrsqSSq58ORL9EYPtQ78NRjPN+bKBw9AbIf7o1rzAq+qSB2ZhfiJNKV8Mp0gyYU
	Zaz4WiWUB6FaBt+qL6gwvECm4gEDkCoyA4yAur9Hs74S84hwaqJJ8oHVAIYpnBtjQrMPYk/uz8O
	j5Fjbo9PjMSAZiX4sJKq9FLBvtwtyfIiiq8LJWn5e6HnBS54WT2nOiFTKbF7f/SSQsJ1lfSpu5I
	Ex0myq1xQ4AEL9vbKQw0zcsKNEe31otCXVuVsGASt1jc+wzV/fePR/kktcqBHTmrUNMYj2znUvY
	3rpX7X1rDdLf4aBEHziDXEPm4rzASXFJiCxdljiaV1P/Y9jQ==
X-Received: by 2002:a05:6808:2448:b0:467:db23:25c with SMTP id 5614622812f47-4799ca83a59mr7243560b6e.46.1776699105133;
        Mon, 20 Apr 2026 08:31:45 -0700 (PDT)
X-Received: by 2002:a05:6808:2448:b0:467:db23:25c with SMTP id 5614622812f47-4799ca83a59mr7243507b6e.46.1776699104557;
        Mon, 20 Apr 2026 08:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:39 +0300
Subject: [PATCH v2 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0
Message-Id: <20260420-hpd-irq-events-v2-1-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lnVODOLTo2WpHrvqFht5FXa9gKD0IeWSjwE7+hKxwmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbc/UNMXpIQgQu+RMvj2dYIBCbr7675k+ZbB
 1bJy3KI4xuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1ZEhB/40fMwfOsuT8UnELg06dXKJmgx9BwjiERV+6ig4vkQlD1N3pMzFrTpR7ZV19GcfER4uBAb
 mhH1u4t1lQPCH/rYzpC8djiuPi598d6eQCICO45jiYBrWW2m/5hWcc1ACFO6LwpEJNAMZS9AJTE
 j+Zl4yyKkFLCFRwPOIKR88dQp2S5TYCbs9dHrEQPeNXrhvp3LouEZ6NXq0xRvDGczDb4zKk4GNc
 a4TA9/WzbbmISLLs1bNG76+FGXHvATVLYt+Q/LC+/CBuA1b4WSZzkymfPFtaT3QUMDhR2DHmk9D
 4iKNimC7DYMtYIj+iG+/H2jJk00Ad7W3ys+v2IZuw5LMMjFa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX1OUKdEUeJdRy
 psNlM33s2C3Hi1/h/WQtgHqoLHwxgJktVvGsHENTX1Mo0W9vMZ+KzSR+DXddTDhyp2ytRdoycYX
 MFOL90GIwIbCtzJxWayh508Zk5Ca60Aa3H3+yEoXPIJjzy2L4erMKLng4WzyxDT6EZp28/NAOxd
 Sd3/70fJntCYdp0/gELVvDraXd5Uyvg+6wsn3Fv3f8qCV6Yx6k8LIWVDgmTt1zJYsSCb3YK3mF2
 PDyBl+8MAV+PAHidKz+LqAIE3Vp4hrBig7yGLGKaPGhAVoEKDS3qBznLMMSZgBFBeULtHruZarV
 6pOGOlMpacC7OqlLiCWYRH+wdXO7k2zMERsIHV37kAH8CTkxybpZmptvzERAHCP1xqbvRT5S+Wp
 8NsiHoDnfM9xrCVEGvQFzsCitpitoY+wtGiH8JSl7/0sdvLXtmEKv+B3gCUYiMlYCUyIhwOVh5A
 ITJlUnPiGWugoqL+v9g==
X-Authority-Analysis: v=2.4 cv=IIoyzAvG c=1 sm=1 tr=0 ts=69e646e2 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-JEBqWJC5KD3P7x9m9UA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: eL9HMUBC5-Lt8M8YtsmT-likLQ0-0jQb
X-Proofpoint-ORIG-GUID: eL9HMUBC5-Lt8M8YtsmT-likLQ0-0jQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083147_586124_263A963F 
X-CRM114-Status: GOOD (  19.77  )
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

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are ported through the bits in the AltMode VDOs.

Extend the drm_connector_oob_hotplug_event() interface and report IRQ
events to the DisplayPort Sink drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          |  5 ++++-
 drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
 include/drm/drm_connector.h              | 19 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 47dc53c4a738..edee9daccd51 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @extra_status: additional information provided by the sink without changing
+ * the HPD state (or in addition to such a change).
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector;
 
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 35d9c3086990..7182a8e2e710 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+								   DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 */
 	if (dp->pending_hpd) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+						connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -397,7 +402,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			if (dp->hpd) {
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+								connector_status_disconnected,
+								DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -827,7 +833,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+						connector_status_disconnected,
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f83f28cae207..e05197e970d3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -91,6 +91,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_status_extra - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_status_extra {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2521,7 +2537,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 }
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
