Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF83F5A8D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBMn/H34wQhN90FoqiboIZ3oWfkygeWNvCUXap2VYjE=; b=ZGYI+MS8ogtuTm
	MoVX3nmSsRS8CxwZKGjmVRRxkwORCPY+Wt2v3Jk73bMNMVJBVU/BG0ktxg+rySXQrMRbewmeCUYmr
	r22As2PCy5qxtbPamwy9Eeo8gXON8/3t87jJGRpXMtVVD+St3LoDHB1Myhdog6RWCfW7nrjUZjjw+
	3jcFtOOSuSs6WEkKEWpItZI87a62GY08EJEw8IwCIQGiR0rEi/sBgLHazGQ1mJ2gNywNwiNDmnuEp
	8T2GwBK306e+nPyMe9gRtmhz8L9tr8KZ/AmvBL7DzWLUu3Wgf5jak41emAU2w9GL2r78bgtJlHZa9
	N3OUo5mDdVrRVqzEza+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7d-00000007ow6-1x4C;
	Mon, 20 Apr 2026 23:33:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7b-00000007out-0vaT
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 23:33:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KI8qiH1599247
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 23:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=dzQXAuQdlW4iR2ry
	TsRnz38gOK2mtMk6dIx5AT1dACjOU2lDQez6DPEiozt9Gn/gNZG02jTIjV7nI7be
	4pwYs2jhKOX3WDX2gqYOD5OpLVtqwoLEv9X6eXs8YvnsQWFaU5BYH6tMU6Hijngm
	9V7yU1tKDtnxZvdxxcxRmxNnYKEzlVwQcI21op+XmRfwka+KUllAJR4TN+yFmprl
	P9ArwTDdJcD7wHcha9M/4AKPegHBcq2AeKhLwqjsLvSFOp+QGxwxsbN0MMBGo/30
	W2PARFyHCho4KV9vIJ2RahcfYEC99h6Kte0oyOwKf7QtKl7QlOc/OTIWeJ07B1Bx
	+HsMvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnkmgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 23:33:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5ca8ffe7so28322321cf.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 16:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728022; x=1777332822; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=OsAKCcwgtCx+9HvfsXUTD1yDxB4D3Xkx7tMywnUjh8pkKgX7gB/ltB99gTWJ7frSVN
         VIQ5+v5W26jt6Ph0EOD7ZJOP0leUK9OFLPplTr2v/YQn7l20TBw5HjbHpqgiIhdLNk2W
         rtupSdQDx80HkteMRvadXacJmJT7RgSAd9D5dmWVrZee8KXlgy7aHknfG8x1tCjGGmfN
         BXzBTmicya54kDJsoCX4ByZe2cLIG5PYJXB+Nvhm51sTJX02TAVzr4CDvKxYkdutZF4C
         9x0nomDy5EfmA1xTO/4R3iFrki15q55T7yjdgl5Hmr1BOBjmbUeFumOw43dAgrlTq5hf
         MC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728022; x=1777332822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=b+k/t2Id/OUEA2hiky7XKtJKeWAh4NMcIlwQxap4TdeyrapqlMZN1akBko5Yg8BEoU
         BSZGcqv+TcDadtfB/88zbtrj0PLBJmmmsr8oxEj0nVTzvvNAAvrBGXICTizQ9Tdnjnt8
         xmTpnYEbL3ZYeP2xKdCtbg+g8uEuarXv9xsBFmMhiGe6PhkOQVFwLrt2wSx4WRI6GNDY
         IAhpXbD23UkW48DCEqXTFibgYNjXcQueXRhEVSCw3KIR/jdoL8iLKvGNNlFeWOMVYsD8
         GqCOQL2OqmMcTh9IQJ4KossBJ+ucUjXmCrAl881SLXzQXFfZ+59SoNPqL83OqQdIf/Nk
         7szQ==
X-Forwarded-Encrypted: i=1; AFNElJ8X8BKPhLx6XCExihotUZm2nuq0SQgTVdEi0xRn497a8sPjzJDx7+IpFl8+gGNV0z18kyAOxHnOrRePheGF@lists.infradead.org
X-Gm-Message-State: AOJu0YwZsHrguM6JJ8cnWVge1f4ujh4SB6LkDPSMWHa4VUtmIghQSD5j
	Dx1ZoLtr+sdB0lyr9rJlxP+jBDsxUoMzrFcYE3HImBRbVz6KV4Z7CNPfuM2zQ/us1uVfrXAGrzt
	tHBSAvJThbZrtnUaRCGwj2JEyrhNQ3ciKA5mwx46qm4zGGD/Kbv1Op5KbJ1ovE6SoKMdnifYMDg
	==
X-Gm-Gg: AeBDievRAPQp+vZU/GHxzQh9fB5M/m6q3hQ1aYVzn65S1QPLFOGst4IPAXOYaNy9lwY
	m+Thicftv02v5Uo2kItHJBhJ96Cl4TKJ7oGJH4/5DbP1cs8gWSzbaDhKTIW+k7QY/ejT9T8XUBZ
	+GZcGDKFwzzWQtjy7gNIWj/Y3U4dhpv10PRq2DURi4XfEKVN1No1v7MZD/N9IHZY0v2FocPczsT
	Qs2IUR2YZMQq1aJQxgzgSKbFM7dSitCbKk91Feyipucb1t4kSoe35ROWMaNdmE5OyOtM1z5SdOq
	4Q2q/kQBU7w3ssKxsBV/ovgkJOSjI6BIC2Ris/QZCdxo1HJxf6AHjV1u4DXTyG26K28BJkIumvo
	ryuz5tv1yde3P6EV6HDk1ITldwWfu311lgmxYXPYb0rna8cEmsa79/ihY+H7OXm+7igBFauDgUY
	5gz4LAkmlSiLbVTuAGv+mEu5WH348Is8+0BqVFQf7wb723Nw==
X-Received: by 2002:a05:622a:11ca:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50e36c74d5amr235550091cf.53.1776728021587;
        Mon, 20 Apr 2026 16:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:11ca:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50e36c74d5amr235549691cf.53.1776728021109;
        Mon, 20 Apr 2026 16:33:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:31 +0300
Subject: [PATCH v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0
Message-Id: <20260421-hpd-irq-events-v3-1-44d2bf40dfc2@oss.qualcomm.com>
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfN9qVkcYl9KlTfgDparsbRrCWpcXopk8vuW
 GUdzBXPSXiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1d1zCACrM1rSnOWM/ansjd2L0dlEIFNtiy0HcCmU29ncv+aHHP/gwemRhujKNggpqM10Xv/vUQG
 Ye+SQyG369jmy5xs4UViG3QvpUxYP5IyWXEu8/j9E/YXe1UjYr4QnPO7M1bWNqxYcw7cQ7jvOuQ
 IVrlZf74JvyhWDOXkFAhZf5wtAKeLWc7+43FJlgw3qQWu8s9HHnNRvZuSSd2BtrnmAvUIjtjwZ7
 Jc7cF38VU8CFgmmWGghTzspdneM6lUl1VI0roh/CbwH+TdS1SrF3HdPe5GczhNCuZsqMRIh15FK
 5IfGYE51m6R2SPeO8rvSUf02COXnmuxI8QsXfNwmzGtedb0X
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Z_v19aMweeGKFjoQUGF7i-XrwL1PjzrG
X-Proofpoint-GUID: Z_v19aMweeGKFjoQUGF7i-XrwL1PjzrG
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e6b7d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-JEBqWJC5KD3P7x9m9UA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX/HsRHn0G6SVY
 Ngsp90lh7v1YY7BU6tPQFzqAOP5/s+aJD+DFGSnuNXis6bLzcIiiHZueVgZqSZ/IyXTCmog9AfJ
 51KCpEE/M5rY4vmDpaA5L/05Da1JHqnPTJFOKqCZW4Jw5vQr9pf8fvwdUUnhpryufmBQWAkhRUk
 5a+U4sw2PDJFx23Vh41F8IP0F9ASZP+nT1sAwhFK8tHVioGxa2X5iOYQCycKoeoJNMI2OtebmEg
 hTdTwk5RPoRs0iq0BNKq46MFBijpr7XAvQ2Zs+0N4y7XskP3IeuXWua9ZGCQDquVDRttx+SyWSW
 C2b32d2WxDMRGzluSj/sx1UC0KTM+edReotu4jP0N35RlpxrUTDKe2HjJnCo3EqwPJdXn3BiIsD
 Fw6FOv45tTX2qNtNiD32nzPD/YOv6/6PDNzwsq6e/9AVBK9oj57H7YeKYU8F8oEO1bV88I1Eh7v
 4i3LCaJKoOCY8/eeQfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_163343_289356_995FA1CD 
X-CRM114-Status: GOOD (  19.98  )
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
