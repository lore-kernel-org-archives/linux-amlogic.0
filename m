Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A02CD8C9F
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNhxm1HTmXjjR9iD8H69LJuZyltHmpmU/IWhBNbMojM=; b=PQXIjpkDT91M79
	9xPMnq9cECozpi7orfu46n9CdWiKfabzgpaTZi6zm8d44q0pgCa3dR/FTWhnVYgYu7pjQ4w5hUd3Y
	OKCsRWCYKlJtPLVdJ6X2/k7UHJVsAkXsMjJ6m/AFlNoGUkjBRUMcDEJHPIfRrGprR4cgVhAzFLhOD
	DmUzVqVZVQTE4dFRdSXkufPjmhMP6BfDiI2KBw4dehlr557hvgIkw5aEZamc/DLO4KU6/kgn6BYJ1
	C8iuux+HK1eTmouYTqiyTReNL/cJ0RAXtPlGvRiZ6rMpoJlO3Q6r1xvqHt5eq4XX21Um6tZwo3Zem
	TD89JCN2QVw9j/LdWkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7X-00000002VV2-3eab;
	Sun, 07 Jun 2026 21:33:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7V-00000002VST-2fRr
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:33:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657HSaO31147779
	for <linux-amlogic@lists.infradead.org>; Sun, 7 Jun 2026 21:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=; b=VZFyBLWNd/Q1/Gt2
	R/3Q0qddH8uIz4xr/Vi2dwaYYKBDTMYdvFLyKqfGmTVm+n7b3jJH2ZVadg9w37v6
	oh2t2/rZ/7+YtF+E67j3kAzm5mA+HdMmCv3vcKCY3oIFyZWYWuvQpoiDSa0h4Q5w
	CGj5YXzNnx3ltVgeypqCiTOMGXalehNIEhlnCzrP6Q/AOo5sHwwXvugiEY0+hbP1
	yBdyPbQX3JxgQoNIecF4tfvIBjtiKMFIE0mO34kHVtmPczqZcOweNY7XCAUDMwUG
	69UrqAZRwMiS9Oovk3Q+8cAfzjbDKul8OzF29C0OQPtMLOKc1QVnUATkfA/zCiYf
	x0rK7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6cr05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 21:33:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768072950so50958401cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868004; x=1781472804; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=;
        b=c+9VDzpzQNgoR+p+PiT6NfrSu2sAT95zOMQe5Y+DNTc3X2u5s+b0cjcsU/eR8Cy73R
         WYrTqDITdfxcOBqoLt9XzsZT4CFfJcUDcXReGpJI+wHnHCEmb/Ar1cHwqMD+b0ieX1L0
         qZOZUZwjnVp5DJr12J0torLV+DhAajU6Xbt8uMu9cTyo0FyU4RWTkeoOjF4QArJC+Ta9
         UAoyjU1QWj2Sgrz0S87pRMAA/ojBYPixDuywEyXNutTCTeTDA+PzRoVdGZoAc2EG1KHw
         6EorfGWvp1fesKGJZT1JLBSs8Si4HnwC8dpIa+gq+Di8UKaBYUet1wD86+dDBKIYiP57
         TcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868004; x=1781472804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=;
        b=lTUz/2+/QFDWl0Fk51QPaudfM1jpDU1Rt86ziFRpE/VJa6msW7uqBXXbVtAdVp+afA
         N702Pz4CAu6KCPlpfxkeHAgS/VendQk+17GpkTIMGa5oR+2gyXMmaEs0xIZNgEmRSXsf
         lARn5xNqXpQv2KtNiopI/bAJLfkSoNvYnlCZ38MiqMGEYhxWIG8o9ISBJ99ubIQNSYUf
         Oqy3GApVOEj102YXlK1nzRs7IkpuHv7LSpkKFC3ifThiKA+o0AHhjrEWvmxI96BSW/IY
         5bP0JBBdgDpKI5wtxy/PTPKaYS4HWZFmpBbPWg5Jn5LxS8hGqziIb9Z7RLpFwMImWaUQ
         0n3w==
X-Forwarded-Encrypted: i=1; AFNElJ+UQvA+n0fxnXfpO7aZfNSsWGu4PDeAlyef+hvKoK94ChWK7clvmbmWBjt6KeZnIGvd40WHszmgDLDLOYWs@lists.infradead.org
X-Gm-Message-State: AOJu0YwmXbk7o7vJPybXUC3l6LNnu8MLgzx7rbvXlPaKtRlusuLfA8Hp
	KuaUf7eIHExY0qrHn/+/FOL5JNkIgPwGY8SNzOkYlwgf2uC+uoZdjnZkHANXxlf8IxJiWT+g4Dd
	sRQpqKNNp5sR/zwsH5z3wH25aup62zGIFe1pPlO/h9kiUYRgYU5j7O2P5IKkJ7ph2eDPfnFFYow
	==
X-Gm-Gg: Acq92OEuJy3nE4h6Dlldb0/LX5V9vOkkqhRXmVwHRDQRYmTdo9xdxHSPn77YbcUHwaY
	GSQ1nwjk6UEyJrTg9KT6CShOiuh9BUQfiKd6Wwx/0dGlLMWaNn0UWdfCmcASnLG5FxcqwKu2rFJ
	o9HqCvQJDF/TPtQktG1D0IqHQnVWGgRgdpg3LroBtwZCnjiA9MDJO3+BqUX20I8oTkmEECPTKbK
	MmuDZqdvFgrSxusqv+2zjzVUnf5o5z0/qx/KnWF9MDWlhcXKD3PvPhmYcXSHwlyZ9gaWqfj10RC
	ce2h4bOfNXrnT9oyjMuyGgPlO+e+0wELvfObeKS/cvppvm+hsIdWyChxsRfecYTOmQtza/mZY52
	ou+sFi+7EIECAQZll11eX84gtp4cMohDngURj+/n2a+QVspf8dF1VdGjyAG66W0HjGlrayHZ176
	llqGwtloj18kGAJmhAIQMTqF5QwP583ChEdAAtYJcnFvuyHw==
X-Received: by 2002:a05:622a:20e:b0:517:9157:ecf3 with SMTP id d75a77b69052e-51795be129emr193812611cf.36.1780868004041;
        Sun, 07 Jun 2026 14:33:24 -0700 (PDT)
X-Received: by 2002:a05:622a:20e:b0:517:9157:ecf3 with SMTP id d75a77b69052e-51795be129emr193811791cf.36.1780868003426;
        Sun, 07 Jun 2026 14:33:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:05 +0300
Subject: [PATCH v4 4/8] drm/bridge: pass extra events to the HPD callback
MIME-Version: 1.0
Message-Id: <20260608-hpd-irq-events-v4-4-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xv8OK5b4aegzohrbDrEYK2LgkMwGQ21VRNuRHpj/5us=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQTkKDpqt97cyPjjeSFT2syRbXebSWwlKv3
 9mydw2N4yiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1QKhB/0bt9RHhoBHoeWzG982WH5dV54vogSpgf/IUDHcvtgk9lubK9mayJlYBeFGJ0ZIBUpzcs3
 jSDS3jSHxob1NPQdfrE4CuJxL1ttAWQ2ltEvFK8DPvdxL3rlQbWb+3vJ2wBhU7qo/SpXd5LyLzX
 z3dy6ikv1Xe0oxmdeOoeE1pztaMX9L2npVlthrH8PJeArW3Ge2WMtvQkWZiPzykgD2tNH67fE1F
 Zv6WdqrGj1pz42HnAvlRjEQ55aEtrGQjtIoM3K6dDw8hDMs1LUS+1536p77CDkRB/FUNi2mmaXy
 YqZSic4Y4eDW+mUWyoxgu1gPNfex2LX4ve6q7jqYnwxwmFhU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25e3a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=x0urvBsf9yKnxdYdiaoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNiBTYWx0ZWRfX+xl8ckisqjH1
 HpA6oduo3xhSorVI5HRjFMZ7HeNljONQnP7hlNckgmo9TNSe+svr1P04g22LLhWB2eNj+DQTkiT
 XcKIfOSWPAOzkxXWEH+S/pvVVjiW6n75HQUe5hNB35P2jJ76QZpy5sInOvwr7QiQeG8qS1rTyZv
 dkb164y0Xipd0Y2MZG4KJJXmkRdLA2Hu06lSYf3jAOTmvmKbyv+EcIkDI5w2x3UushspvtcnCBO
 53kMBHtSYLfMSQwrePHu1OPKf8yMdud91QIU28sjTUJkeJb76u1OZO0O+SmbXWAv/dkUkbbjpOL
 xp23a0GFBHwnUM9bwKsJ14UHziy/5qlCQVMtgP8szipGUrOnpsgJWiti3APmSFq6ofO56+B1EEm
 F+gggfO+2WWItiU41w+HeXK1Csl22dpdGlOP5LwQ2QFRzOLgXAnCqS9FZZ5K++fgLtNNnrrH21N
 BE0/IW5lalx7SFsY1Fw==
X-Proofpoint-GUID: IsfI5YBW2eU4BdoN6nau7MXzIavDmbG_
X-Proofpoint-ORIG-GUID: IsfI5YBW2eU4BdoN6nau7MXzIavDmbG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_143325_807076_D6742CEF 
X-CRM114-Status: GOOD (  15.75  )
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       | 3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 5 +++--
 include/drm/drm_bridge.h                       | 6 ++++--
 6 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index a237c65ebd69..35df99b02c9c 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_status_extra extra_status)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 729b12b67470..b8e643cf1d4d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -505,7 +505,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index bf4ab4eaf269..e2eedaaa3552 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_status_extra extra_status)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 046efd913064..a34643d3ddef 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -171,9 +171,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_status_extra extra_status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, extra_status);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 84e55db5c1fe..3fd3e7bac588 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1445,7 +1445,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_status_extra extra_status),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1513,7 +1514,7 @@ void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 78b0d83ef2aa..6a5edfda2ddd 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1260,7 +1260,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_status_extra extra_status);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1578,7 +1579,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
