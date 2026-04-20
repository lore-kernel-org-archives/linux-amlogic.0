Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E25F5A8D1
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 23:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+Nx/0XMq93G3dwwOpagMb+g0K/3b0q8vLgBNU2O7eg=; b=WYpj12HOBvLpk+
	VKx50Y/lnlfXZB1oerATpqDhJQDGyMrMQ04rp/8WgihBIPRKH7Fb2Grw+ZJm/UrKKdeiJT5ZflsDL
	on4wHNMk57w000cG0Czuk1UDRRqFRpz2M4uH1qDF+Se//b5NoqByImyrMhbqwEqIiFRIQDu+9sh1V
	YNqCpZH7iXgcKRVu+AUKWi28oOoN7bGVKnFAMlq9KVFW2dD3yZwqvcSmteYoNWy0lAMAXVN73dW6Y
	xm+W72tDG0GV58j/ESQVhYEgrXvLd7aOQM7OJOqc0B8bLclSgZgzoOGnA8IM7dVvyprmRxD0Rht+J
	v58x9A8c3xfWwdGUrR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7m-00000007p1s-0e6l;
	Mon, 20 Apr 2026 23:33:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7j-00000007p01-0yMZ
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 23:33:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KG9NvR2980857
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 23:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=; b=FTUN+HLGt0KoyYp2
	rP/fFnWVIVoXmSIesJiUhpNyWdC5tbUpLdxRY+pd0Tq95/s4RicBWZk7dw5PFbWX
	RtlATGhVWv9ppexR6q20wp3YF2RNTNgYxyEJC5M1jiAYOij5nZTCIFzLDmrQWhTu
	lD1OonyoLeEoblZVbt3AKW7gvDLbKfXhLWdDZibJx9qDItmE/ZHh+OOHrlSLF4eE
	ex+NAFNgvRbxXlsbWuBLq2FdWvuXda6CQJVEeIO1kxuVbpmwc6Bq2KDl6rAox/Oe
	Zl73z1gxPYFvzGeXRfLjNVuADmcKj7z9PyuzcGICHGvmoHKykbJhFPeYME1mKDei
	uKbZkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2ptp6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 23:33:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ee454b1b8cso31691085a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 16:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728029; x=1777332829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=;
        b=cja0kXU9HHuGfyJIm2Fa3GJ6Yu6ThHcNDj8otGUUCyASqxna2slaW4/fWWqp04OByZ
         saGXsbsoE32vdGQW0Lpc3qxlwiKsY04E9fLGWpCZQFTY9GUtKHigmwoAil9biXqh2xO/
         ZTT4mnGXD+2907OPbiIscJvqxhVuara68uRtn+BBFRuOPZWYoiTN0WzLX9nECD1CsAZ5
         gEz6P7nDpgcIwDYWP3UMAZVoelPG18Daxkp9zEtqVz6cx2YILHRsmg6IVkxN/3M3Zotq
         rgbajS4oFQAl8X8oqWsb4X38bazQ463ZeuYkuqluBHaMfgZz4byWxcTrWuqLjynlXr7Z
         OMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728029; x=1777332829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=;
        b=aEg63WMi1ReCrWa9/H9DRyAl5d1QelYPvc7K5MF6GGl72+S7wTer64FgSAMkhWvdr5
         cCvSMnu4VtGIE23DWvI9PYOKr4hszhQC01HlXi8vn2kQmkEEbalPicN3wPMSY7mUiCjy
         q2NJPb4gsu6lK1Qs/OlISn1BLK3rLUFhRA0W8RKcJ0+W0Hz2YjMnsjEKtzd07H/pntC8
         TwXxvPY0T038b0aW3q7PrhrtqwJSw4QNkSMTz4EUXLfD9dqpALeFmV7KZqgBU/KgN4Ke
         Sjc2+TSXaITuvZXwuiv66FsOYnLF7SY1dMYJK3cucxLsObtaJz3DsjZQWa1RuXxl7Ah8
         dqPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cpksRhNtD3E6le2FA7G6s4wH2qhNGzFXE5x7V2Wqf7Q7OKL+Dmg69d9C3nJlg3+FWzkYH6ikzqXXlxTx6@lists.infradead.org
X-Gm-Message-State: AOJu0YyU6PGvL9wtbLA3JhkyZWDYNhoL2cE35MKHkX362gelCm42x5U1
	wk6UKsf/rYkAsaFLXnCfjasoeBoqpfXk9quowxECSIcxG4GjyRjXujNASzOZEv1c/bUJ0ntgDnG
	ewGyu2iB4C77f2zGmiC28xBIP+acnltHm+aSFq0F3VWZ6+S6EvoPagpz5Pv04YpMIStJEkcGZ6g
	==
X-Gm-Gg: AeBDiesKs/syW09p6ReUDk+3drRfDGMr48z6OdePC18OZ6YH4nRJ8BdjMSCN1viIinH
	deykNEapaW7g6/K1/dwBchA6jMJt7MHdKVy/Qw3Vcd1P5a39e3V3OPD1wTgXkG/L/4ZsvRNj0Lk
	/HlRIhD8wRojYpFQcz6KL5RVVEPSzV8XO3lEq+8ASRz58VV77BHT2v9bZdSF6VbTfAC3GR8/Z8a
	hyZTal2SxsHpWXiHqwPYkRq5uPxseUiCS3JLSiRtKcD/PxdJIFL48BeRj+yycxZP7JX1F1LkKAU
	udqHfuQaOMkneSabZGNI9vkuGVgfglOC6J6lCZ6H1j/Hl/G2H02KPLG5P6mgoWfUSGMdp7k4MDR
	3lxiscIIpzWw0U848TKKESGJXoWrkdg1RTLmmnX7oR6pmzDmXqZgk5IfoXfYTe2bKrNNnackb0x
	XtJadAIAlvs6oQp/5wM9woTvRTp0pndbJ/BS/z7Wl8876qqA==
X-Received: by 2002:a05:622a:394:b0:50d:863d:b50e with SMTP id d75a77b69052e-50e367ff503mr244884111cf.3.1776728029501;
        Mon, 20 Apr 2026 16:33:49 -0700 (PDT)
X-Received: by 2002:a05:622a:394:b0:50d:863d:b50e with SMTP id d75a77b69052e-50e367ff503mr244883731cf.3.1776728028992;
        Mon, 20 Apr 2026 16:33:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:33 +0300
Subject: [PATCH v3 3/6] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
MIME-Version: 1.0
Message-Id: <20260421-hpd-irq-events-v3-3-44d2bf40dfc2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7164;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ND7iJgLsvG3cprXNomvoKMU6TvVGvnMNqba7Eqodcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNFfiDI/oAjaEPT7KXRvUNtjKmblgNuU/VC
 RcrXoPSZnOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1bxkCACWKX5M78zNcjPdthzzqBCQACFaYi9I7XaBJHz9vGOGMYjyghgnA1q5XxDVV7BXuJZmhd3
 20S6aNDERGrfmYWNpL1MQWraUEPDkseJMpCb/ROzY3pzMXazV6pQvmw2gvakyuOIOB6LJo0HHuB
 JR0ZlOUoZO3/go41L/QfJI07EsfkO+oiYcYpFZO/BpV6xWwVHf8lUa2XMaIS6FdCeHyWyfy4cwf
 SePs79NGlazQjPzjfAWnw1bnnxKk1uVNUkylo+38TgEtBoOS5HVV0WzmNIqI1QM7XKdyQwS4exH
 wxxbeD16R5xCcddl866D9KYU+bg9SAyBXCUs+2WQqm2iPmfs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uAxNHQbRr9DiTdgk1YYnXobCbLrM90ZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfXwknT+1tNkxTx
 WkSFAHRcBROLaPRjzvFwsYjAc5WWvJuVKAJdVRrHQ0O1zqWcrZZMOdqeYDF7deDfVpSuwtBQRfQ
 PLd10xQxTUods3KAE/zmlu6iiCoun6IVFeRX2ZKxlkdBeLpW6OthOqCC2LLEOHCMNgxrmBHlC5b
 Ha3kwRSLBVCzdj75w9zCKT8VbZo1BxzMmvuhycRJCxyvE9YqGkHyQSoJRVcMXqYdFEdzz5GF3oG
 kk5HJKD9xV0LRq4mlxctp+2RBZWlbbp9VzA5Opu3fv8ymvIN0hBxjlgblLkkjkpIEusPpKijSNf
 eVMYBPAnV25i3kyS3jFaIeoTUw4q05KL9suT6W8uluCsQdrOlWXYlx7WFjzngp8+dVbaxQuZTgV
 PZoYtz/Ed/gEFnk90bf0mEQv0wt8cSxVD+/SmW/bJaa9QOSYvTaJrTcG1/Q1c0KFht+l0/yuqMh
 gmAuUGDRhiUAjV8HaMw==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e6b7de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zEMOeRQCFk_hQCPR_I0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: uAxNHQbRr9DiTdgk1YYnXobCbLrM90ZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_163351_303315_0C163DA2 
X-CRM114-Status: GOOD (  19.13  )
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

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is keps to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the driver which only care about the connector status and will always
pass false as the irq_hpd event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 17 ++++++++++-------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..0e2f0b046121 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @extra_status: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -153,9 +156,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, extra_status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c8c3301cd936..09c3f5954ade 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @extra_status: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..f9a86886b0df 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_status_extra extra_status)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3e4672fbd7a8..2cf604cf02db 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1556,8 +1556,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
