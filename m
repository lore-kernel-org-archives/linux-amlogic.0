Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CA3F433CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3IInzE8IKaOMRJoyMiIXUfGD8hhwvRH9BcQqjNCrMY=; b=cu8XmLl+qyCUnb
	cRrzK+6MEfNEsoR3MvXQ6z0CIIfKvEeeVfjUIIWV5ZCYO4Ba45+lVAMVOuSltcDdAUi2OSrFCpO1c
	7FqKmO2vXjbNnJoqr6d341Z7pvaxNtrtCfHHGSBGby3dq36yiGNgaJPeQg+gdpgGHJEQH6r+RyMI8
	g2H19mDeDXR/tpQME+58V+l6RkwbkX6aM6X5i69yh94J/pH9MPUa1X3EeXzKJQl3wc97TaS/yYxZF
	+omxlIyzniTl4HH/Bdbb2q+j/a5GGvJlwvyv4PUvMcxhHCFEjmEkMV3d0+v+rwV013+wqvjLLMsJu
	LTU68MPBpsAD0EYUo7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZG-00000001jkt-3MGU;
	Wed, 15 Apr 2026 23:22:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZC-00000001jif-2gdP
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFFglH1792394
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=; b=HN9jqGQmz0rOg6qq
	gM7Ah4W9Y7kaF29tucblX1H2+R1u9HMVdLhD4pohGhFPwRkMBxkDz43FDkLMQoLN
	jQkAjCv5F8SxaZTZS/FjIzwzRcQHO4DByVL1mJ86ZL/F/QB+5BBEnAXmjnYKsKJB
	VgL0Bgi15wvGsmuL9cz99m8I2UoaMBaPjB90kxh+yJGJDBwcQJlndgmNoQSOq5lG
	MwNjxpGuAyTfHllF3pAV5L5yZc0RF+gc9AXbHSbIFskv2VOaQ2sbmiiSjOIyl98o
	JrQLvEZy2eW/FpHX4FJwnaEiJzTKcmiavrDodZqk56xfxpH7na6bVJRXKflYmCdf
	FsfsIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd5pse3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so146824481cf.3
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 16:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295361; x=1776900161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=;
        b=C/qNZXZqLQ2qVED7DdluitWsT18ddblkYaJK9RHyPcSfKYIs5rCn6BH9G1HCetSmZc
         UsUc+7AImNNSiK4JgdxqO9hA5z0zRn/y7EVwZMon+zE3+Pe7P4ve+bcZy7HXX1Xaea4z
         3PL8GUJ3Q+sYAQDT5DUiZdRsCpviSXFKST0ZNXeX8MiDVzAkWE2kGlpM3Zh6EAcP3bFC
         jVbWtJ9fMr7qkfZML7tmcnu8MBcaiHtNOXxdiSBoUX4+JZIzRRAiBKqTXpWAdMU2EKDZ
         6emWo/uysChX64X+LgvyPmM/Urb1re8BofRmE4FMPLtTuj2z4jRAuddNiG/A8DgvJYw/
         N5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295361; x=1776900161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=;
        b=sUj8DkM19e7gN3UGDp5bv8m6rTnzCecMp8R1rl7iQCLVQSIEjwxahfU2CaddgCIsa/
         xzUDifdMnh78FwQwtj0B7fvpo6fZcHPN0fxo9iT2PYbgMyYhBOw53C7ajxPkejCjAjUq
         woD20aVm0FIB/vvZ9yQ7GWtfu9lk+yS1YH4ALqhJAE8aJ4s7jtAhJuzbGpQUHWdhGuxx
         nmbO6YBcl3Md69mK56JWeQoH0y+/eOXSz4i6vjdqIyo7JGHDngLz6l9r2ENoMkC4HBUs
         4ONJm2EXRtj+vNyudgbbPCg3KAYzwOMdjXzvlBU/gNYIJytUxfdpsN1gnF4ocV1HeRCJ
         51+A==
X-Forwarded-Encrypted: i=1; AFNElJ/+B7RGBdh/M8caD3NV2iyRb+/6R+A8UGYhi1poAoVTdH+uszG3Yzz50yukf5MeQijIKFJ9PMcOqXfR2PWa@lists.infradead.org
X-Gm-Message-State: AOJu0YwvEXmQfLacmd56DxYhInzUN1qSjdxeAQxUPpFQWuUGe9r+45kA
	2DWHZ4hRkgHPJwIR0KxhCPCbQbX/PPQ+rSDXTkqDHbFuvoII5Tk5b1Kr6ZHoexFgqmBETga2qJU
	R29hMw1AZEoPNFWJBk0S5NNeT8UmlMZeNbksvZh9SWWaXUcH2IZZ1y0o+2/Sypa964pSgW7pEtA
	==
X-Gm-Gg: AeBDiesaFWsNi30QiV8CiES5QHzueRW7z30e40tOauXiIz3Z5LPHqwOii5ZsnaOLtcD
	ePlBLho/LaERSzzXU0hdvI06d3vzF1zFC4Kr5DzZItH07F/9+eBtwV3Utr7txzHREXZRXPdALel
	/Ld9Ql0g0uFiThUUSDi2IC+BtKhP+QCh2/AYu8nSnwiCOq+Qhy9IIy4HnvbV84uQD07x7+wK4lw
	EFDCEZbxdxse9xrSZChScX3eVK2excgmiTpsbiayvmzTB/jWj7pZnisCz7iGrxm9iBqc4jcZEtP
	mAZwA5z5fNwNorBPhEMGeiQti/Ffp4Xmjs0X/qRaLYMvOlJMA9vio5KzR/dICyqqbVBQ/Jjs3zQ
	lgncHlEulYLOJe1snvku/p6a/mntwnHJUqr8bN3PrRB1Wg+lN31vrMLW9SgqmpPHRtNOoyXw6CX
	a3jHZRJBNO5+wyktTtEiGMVhbNUNwM3sFKa1vMMUmqXrK0vQ==
X-Received: by 2002:a05:622a:13cd:b0:50d:c0c9:c985 with SMTP id d75a77b69052e-50dd5b30efcmr356728351cf.2.1776295360510;
        Wed, 15 Apr 2026 16:22:40 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:50d:c0c9:c985 with SMTP id d75a77b69052e-50dd5b30efcmr356728031cf.2.1776295359994;
        Wed, 15 Apr 2026 16:22:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:32 +0300
Subject: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0
Message-Id: <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3Awa0W9x47e9VDImgKb//FhRzSC+4krtGr/Wy12gno=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+YD2Z0/KxXy+84z8JxSP2aQ1M3eUcvU9ilBtXjR/aqj+
 2Z3LuboZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEegXY/0d62BYrmU3n/7zq
 w+ajokINzO7HGphf9f7u+KVYY9GZPPPd+dPrFkd72JYIiEYv+Cgyof3QC9HYhe8y7N7v8o55f8f
 3X2Ke4BGewnim+rd2rxrcf07ba/hJLfSBAqcl671TPhwNIbvfN0euXzJFsjR5bzDT9YdzJh+Ym/
 DrT8lMr/j1XxkOpW5ULS/5e7N5VoX432Vz5+0VLIppu617LG7ZrHzlp8d/Zss9j9FTmRRq5zq/c
 aVoRAqT3bZowYyZno1Hlf17Mu6zn+s/mVhZfvShDm/vs2P85XszgkUDjLKetR15xhyY5ufn1Hkv
 c23zbjeWi9birs2+dzzKg7olbd5uy6nRu3vQ1+Tx4h1/AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: txav-nMQPpv8qSePN6O72IovmxU_cZll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfXzWsElg4pSCuK
 91e71jrpcL6p/5GjrcxDrNjYnoR+Y57GJpkS8eTaJQ5U6gMb0FpA/7a5VpIOzGMyaVcIoQ9zmXP
 loxpwki+P/KjIFdu50O7jEypmRFBVRBowjZQAj30aQ9ZcH5LI5t2gggraxIpDrUHbdSJx+FkhfW
 XNk1S5nYJ6T+Rd/q/UGVsVhYTgagCbCmPUesOjLM77vIZnb2/l7FEd764wOmh8U31XDlzkdl0/F
 2bBxaAlKFTPXiRTn0JCc+Anmvnv3V91B26J3+9Zxrya464Vsv7FOnHOyg4LHnFnX19kBy9thJJp
 4ElsZRCA1rMv//shsnRHxD6LZwhYnYf/MFBKzqX25pAOSx0BfFbuMQzGpimYvNIYzUm+vRCfoLC
 ajl9TRNh+Z5EdDL8GV8Rw2ge3czaw/6BSUlPJYsEXHTGszLBdTuYP2K6HyLGsn5E0Cz7jP6PunW
 viOcpXsTCFb3fVy1wIQ==
X-Authority-Analysis: v=2.4 cv=AcmB2XXG c=1 sm=1 tr=0 ts=69e01dc1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TP8XqTAxF71JeV6NEI0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: txav-nMQPpv8qSePN6O72IovmxU_cZll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162242_800148_509E6C34 
X-CRM114-Status: GOOD (  17.22  )
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
 drivers/gpu/drm/drm_connector.c          |  4 +++-
 drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
 include/drm/drm_connector.h              |  3 ++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 47dc53c4a738..5fdacbd84bd7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @irq_hpd: HPD pulse detected
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+				     enum drm_connector_status status,
+				     bool irq_hpd)
 {
 	struct drm_connector *connector;
 
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 35d9c3086990..0cade62da905 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -189,7 +189,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						hpd && irq_hpd);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -212,7 +213,8 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 */
 	if (dp->pending_hpd) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+						connector_status_connected,
+						dp->pending_irq_hpd);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -397,7 +399,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			if (dp->hpd) {
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+								connector_status_disconnected,
+								false);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -827,7 +830,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+						connector_status_disconnected,
+						false);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f83f28cae207..e8e7e6c9eb5c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2521,7 +2521,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 }
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+				     enum drm_connector_status status,
+				     bool irq_hpd);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
