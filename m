Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FE9CD4F43
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBMn/H34wQhN90FoqiboIZ3oWfkygeWNvCUXap2VYjE=; b=UVBRZiRRcSOCZe
	3cAxkJPioma0umXHdOIPua8xlhSF7QY0OKAHvZ5HqfPbzPTP3Mdls9RR5q7MlQ0r7ck51ubfSKuRZ
	vlcj1qiNirMSe5zedkaLXpQSTbdL/U1uglR7MUnSviieJc04NVq8DaTu7Y71aPdIsK4EJ5/gGn6BN
	wcD3HfcPr0+aWCOWzw6OoEfKEk6kj+x+ePZgZFr1eptN+AHDHtXPATJ+U6VFmaFDx6hbYwXhrf1QV
	WS+JTYRifmXmcQr43gByjpgt4BZZpy+OdA5OnplLPBE7QwMJvykETjpJ6U2d0H/FnUOKSK7gkxyPm
	NtXRRB378CAfWHuCJ2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFR-00000003SHe-2fiI;
	Wed, 13 May 2026 18:23:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFO-00000003SEe-1rQ2
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 18:23:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG1iLp3008285
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=Rc0jFcRtiw+h55So
	zoTr6UzoG1TzenCRG2BQXvDfD6fxKCDKrQmyLxG3/4Wa1QnskXhnepcU30WtlDMR
	zz/9dkXLcAnffHFqLks3kors5Tm70GRjvq57IMCk3wa6L0jP8xr102vGPPnq8Iol
	3fAYLdgOU4sp/7uInRa1f7k1uShv/ddhwwPxFnd8B/6M5to5JtodKsLaHR7UAJC+
	wgUYdnL8KgQ7h/n/Xy5YnkjnuZi0CJ+2m1uQ7IoN8LuI1V38k+AuWwns8KAMNq+L
	NlgVMGdZH84ny1tN+npBtZROT80H8lbUDeHKYovQGMUtquWbdMEahR4Lobe0MK1r
	GjJpbg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0j0ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:23:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6333021c63fso4998741137.2
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696633; x=1779301433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=C9fncjd98BV+qfpbxuweVI2UvGJkYuLKOiBrsJFG8rxj2fAfCRwGKBdgouhOR2XoKC
         bvj2IMrWNXBHQ79JfVddP1BwshimZdG5ePc2qSK7exCqEl562J3jwWUxJyfN0unCDHFg
         iNOciC4QtTSz7ieG5+n+JKfrUwNbpz1ZxSidfYPR0vOTW0qoHVMTfhNykRkvSSd968M9
         1lH7dGSAie2oPjdmvZARZSCUQ02S0trNz39KE/VXHgoIklWhveZCs8B5smMma6Er3i3x
         73HTWMODtPbtl4L0J3S3IQP7g0/GQPueP/PTp1kX4tjk2Ks7ySBWKHeWqcYwKAhjF19l
         Dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696633; x=1779301433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=JKFNPMf7n9RI8ju/uOyeaU/dZFM4DUau79jezdc4dsd6zcvdNJzmd2NTMG/OJgcQ0X
         kg0fzpagZHziBgCQ2kpxjd+a9d3X35FzNK/em82OGJxLgPdh69oaMhkZM8SofEL3yJXs
         NiJQUmMk+pBruideW/tLq68h0uRiZxTRgFXhU0fcjKYbfM6WaY7c1MENE1i0atgSVH+N
         eGeTBX6CprP0LxtA0DXMJWcKJBQl0AYrfstxWo65MU/AqOxNEQAU36bDrstYxrEamTKe
         HwZQci1FT7kkthoXuREMfse2nFZ8q8LAxinTjeJhZp1M3lhDUS+eF6RnIElELt4qw+3E
         z9Ww==
X-Forwarded-Encrypted: i=1; AFNElJ/8MoCfhdgAC9fQx4FHpIX6aHsROhpIQafioLTnu+ysqBE/stZBJZj+kqsn1rywCpkCyIOmOEFuyjVgqR2C@lists.infradead.org
X-Gm-Message-State: AOJu0YyRTVP6gpT9GnIo1shsS0SA1SdjENOq8QOkqrFo322AudBCZiyJ
	JVCYVcf6KINN/qXzdalC29z6sOY/gkyAVR2PrGjkuvBvZx9JxlxZBBqgYbHx6O1wDfHICLLSETV
	LMzVlCqf2mjy6qOjCtAoKR4A05zZNoqHvuIIq7TBPPm0czgxNBJdxQmdkXz5yNMYY8J/JU6DhEQ
	==
X-Gm-Gg: Acq92OHKdnjbYdm1niqAbKYDYAwQgBaSNA4VkfTwcZaRUadGKv3ijV7qPC9PdaNQkp+
	gotISVNw8nWtYHDO6z+6/x59OJOLPx9DcSvnXGtdpF8CY03bq5YBlK5NqsalwiX6yBKa54ZNkwZ
	vZKMVC1S+h2le3Iqrj5weFUo16cha3EEX8eKKvnxTIO5jzLRKqXMGLoXsRvVW1ecB8gkhzwjAqb
	fNq0iRT/LahtXmw2OhYVtr/dZSoPw3xiO/4eZr/YsZsAV7ir/GCfGnOCwA5NAGWL2BL8mJVRS9m
	XoHhG0vkUjp6jPS0K9povIAcDGd/awqoHKo5SqDCZiuwNoKyHXgrIktYJsV7B6MyU4AO1eQ/sUZ
	IQ3TPzGP2zEynvUW7nBS49tneZMWK4RUAQe2la+tkw8xkcEQC2oosFj5Vh6vn/nZ0JVHufuxhVa
	h+okorlU+89CrHkv7R/8G9AMQwmIvis3fXWXo=
X-Received: by 2002:a05:6102:3049:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-637a6c2f9bfmr2354053137.4.1778696632716;
        Wed, 13 May 2026 11:23:52 -0700 (PDT)
X-Received: by 2002:a05:6102:3049:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-637a6c2f9bfmr2354028137.4.1778696632148;
        Wed, 13 May 2026 11:23:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:21 +0300
Subject: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0
Message-Id: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
In-Reply-To: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lnVODOLTo2WpHrvqFht5FXa9gKD0IeWSjwE7+hKxwmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG034q0WD1dU9zBBukSN63zwQflgiz212FH+
 aqfkZzELSaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1YnxB/9wgWldcqDS/btctLZ+d4WsAunvc9HMjgx3vDv+jWuyFXbuto6YvRhbSJRFl/bn6USOWD2
 w+hnbxoLs+GoJtRyQnFJYpcDk1fBoIczXXMR6sphI9KOwzaltd2I60W4bmVoFc5Wvsr4+nemF2Z
 pf0UegE91hmpbV+XvOx/ta7AUoZKVfz0FRc/R5JYhifiw+cSJQjoP8x/tu4Ncj6llXyPrg1oN2K
 eFPtDtsEXLMSMnwoXsQRLn3mVftP5QhLrFy41s+AfgyNdqoTgY07/GFwxWrUKJVCGP4hhGzQE2W
 AnzPdKdY/9NCJym/+SY3fUf2/aD8Ud+ZcUgSLRoY/KMHiWaX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX2B9Vh+KNNPg4
 Td50DrxYp2U/M+l/DLun3PiMZ6GvvzeD4oMCjquhxtW/79X/jenA7nXM2cF1Z9msltIuJfGYEhm
 mK8R6cRnyK+7Teqo6kI3Q95oMUGTif3HuRH/AJgwEmRHiq+0Vd2qWy05Esp+XnYT+2YW7ikszXz
 dtl3Qlk1LKRACluw6n/X+Dfp7s9o/6jrSajPRUVDdoPbXDM1jqDUV/Ndx8vqsm3IO5Z3N5i6egq
 oUhBkJTUF5eClB/SJAOOx9/hH53phr+PIMO9It4m+6X09FpIqQCLPpVm6d0eftxzr/O5Wa3rd6M
 jg/q2c16QZQvSLeHoV1OZ5H5AOPaVKWUkBBEEuAsaybAYJrbXyv3Sjq+CnbSS/0vc8KcAgE1XWf
 dxdXKcRVErozLHujuppwy0rLgXELENMkfwJ+MU8cmiCYt7VwlOBl1fngMBN2lu0jRcXpwI+tscI
 t9LbDs06vI9XgqFiCoQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04c1b9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-JEBqWJC5KD3P7x9m9UA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 3k7I9HAQLVTQI8yjVwWQlEFyy1eqtBjn
X-Proofpoint-GUID: 3k7I9HAQLVTQI8yjVwWQlEFyy1eqtBjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112354_620100_1492407E 
X-CRM114-Status: GOOD (  20.22  )
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
