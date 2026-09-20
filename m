Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6238FC982E1
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBLxFgzcUCXhY34jbp9Sja0mtrLVGt0/0FR+5Llp91Q=; b=n/CYQrE8p8JRM3
	d3OMOpyTYedIu98Ql8GTvm48tUDn/8dBUsXvlsz0wpSOABC1AZ80/+A5BbX89hyRvBdKx+WC+QE1e
	mboUyYCiDQvI3iv5nJGRRGaVh89wx7VAAaOnwMFYaBijWDRikuPixWQFiBCxxGn7gVI6QGPwU8S1U
	scv2vGvP331zygY7kgZ4/ela2BBfTayImAtSJS9HEb/5VfaKtVkcWMpXdIqFXEhSOupzl0zfqrYxc
	cJ/kDCXHhi7evc81kt9eeiBjPBqkz1PYxd8vQZgE37F78LvGjy3MXnMUpPA6UTGdtP0Hh6M2VMUpu
	f4EuFgFymmDftUJX7vKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J3G-00000000192-3g7o;
	Sun, 20 Sep 2026 15:01:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J34-000000000yb-0i7c
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:01:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnmsb2568986
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=; b=fDwitiGUAlmn+T3A
	wgOVHrwULnPTDg9jDbWTok799UNFv16tdbaqlNDnLjhMmTZ4b/rU7ICOL2q5n0ZH
	AEDkUcQGXBbvDcKLQBGELs3KXEfYcQzEHcH2eUYXfIpa5OTilkznskHsMWSSBgTV
	A+h/z9K45JMRA616ToMAoA6PfP3WOh1qYXSYGEZQztA+1MFiVP14eezAXuRPcUt5
	ZqlmlL03hNR6ZQgBZgua1syuym1OVKxvGp2EGHog1lVZ7YoxlL2UOtG8Qs4BT/G6
	JMqimxdRVwbv938mTFpEAiGczcn+pNEXuvnZE3zw8fAVJRae1FL+UYbzbs4NOc0/
	lkRxrQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfuk71c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a9378b844dso2480137.1
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916504; x=1790521304; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=;
        b=DMURgih2jr8ScXvx6OmUh4pZ0p2npLkVBUPJqYoz4fFtH0oe/N+A3Qm8KYB4DKBRU3
         BXPs1EfFUGbcvsFvJa4+LyaTuQnOzmnYwS3o7TkJfC2Hye865kRkP1HGlp0OwaW+ZeJ3
         cWvdTlZJEKvlBRtfTCH6Fl6OTJdCsAjI6mQRMXGXrjWnPlxn54A928A+B4VtEEe4cpsR
         vE08O2idcXeFF1gK7sQkNyOlXekoYoura5fUYjIsU2f8lnAjMWyqH4KqesT/l93hRpuh
         wnffoK0pihGmDnbmx5EozbYRyFz9wV7h7XRiZ+r3lI3jyJihPy8ugY8E5xzWOOOSzFnJ
         07ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916504; x=1790521304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=;
        b=lNuF0l4DPGMm8mTFdGq+A9SmLCZpN1iIbvHr/KJVOh+COlH1tjG62dBYdiq/mCqAUT
         u/T1sFdJq9uIirXM7ocebq0WMhFrXpiMvWNY9PDTuMwN1JDnJbHTk6u35z/yFyZDjRdg
         FWqDFLGNJs0neuzSR0hT/gMVlOjD/kDp3DOf3WFkbvRWlqbhafuHUmwHECAjXZtC3WET
         OBTD91glTMpnVctcLV9Mv6PSCaxNancBxvILEpTr3hwvBQC2z/rRszHyd0qIEBTwyVy9
         F0gSrhbHVp7bskJn0nVzl6visLvILYBqbiMt4LEouxjk03/1JkwPbiT4wGPDcoAMuRtp
         HivQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlbuy/d5+FvS5RUtOzI2pNK+rAWlgbeGx76njrwKxterSPrl7Bq3b4s370mak5OEsxymr12oGH9MIH+bIm@lists.infradead.org
X-Gm-Message-State: AFuF++kT+VIi+NARycKlvpezUT4DHpTUIIAD/AMmSCCP/JpdO+O3bCk6
	/r0Fw68daAa4bwHv1+eOtoI8DZu3cjdOsZGwb/3M39BNMH9Ghpj/Njll2TuAs171L1rLihA4vBc
	MGkdwqFt8jZYGruKOeHVYeEFr2lwo5bgBcDj52PDOGmjCH+bUTO3QGoyimDV+YJqmpA9eBkXjcg
	==
X-Gm-Gg: AYBFou1OeUsmgdq/45yhZtxwuYPfJ5ud2befmKWlrkswCfbGcUdR5boZpAsSlyYUF/0
	FeIC0DifPfTLlguOUC+3ZKJ4P8fTxh3AUQOZyx+9GX7MJzk3a4UkzTWltuYfVLI6DJaTgRPK/oX
	fRwvBn8wKGyvAVw4wstuXm/iA6bd6zGGs9T8R7CnzB7rYTrSzBYfYTfS3fra4hEwOG7zKNtyBIr
	k3lK6W9xD0LRS5CLKAyvqPbplYTIwhylQjrq3Uxja056+HCKKvZdnsqFL/MtzITsyiaFTnlp5if
	ALPDNEVbdFmtRAif82HRfh2MtnkjF5JtDVTPyT21MO7Lz/8rOw4IjsIVsoxJ6em4hxkjIqFzzCO
	Q30hson7Qbm0qMQuANp8d1FI/HfStCPk/pK/NFqWmND6CceUsEOEEGFVZbz8q06/8bEiKh92fZB
	ux3DaFLaUTZFma
X-Received: by 2002:a05:6102:148e:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7a7196a9b84mr1109478137.30.1789916504257;
        Sun, 20 Sep 2026 08:01:44 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7a7196a9b84mr1109380137.30.1789916503710;
        Sun, 20 Sep 2026 08:01:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:30 +0300
Subject: [PATCH v5 5/8] drm/bridge: pass down IRQ_HPD to the drivers
MIME-Version: 1.0
Message-Id: <20260920-hpd-irq-events-v5-5-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LqgxKNIayCd11yT2swAvULzdCTzONMVvVLs923p01rQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VH0X+ZgDiNdgzP7ztTorDWrfF/sYFMWjIJ+
 AFYEh8ij4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1dpmB/92Rev8krCBc9OkmzcO4nICFFJMqs1wwor+LYDE1FIuzYroa9qKYU+ewIsPOeIt8K8t7Hp
 Gxp6nAMJTPtAjZdxhgkdecOWQfp4RIJhtTsa3ahM4r8zY5uuXzrEaGYJ+ZGNb6j8FtRUK8EgEiP
 hOpLZguncW4ZDHTzc3E02aMh1s5I/f7f2CCqHzJRxB+H5rYG4EXSBWER3OuELSZ2vqKLTcEqQeg
 y1KaNlpG72U/h2VtMdheehS2cDOllI4OKq/e3bBGrsryLHSF2rSVptWk/gJ9j+M8heIaZdyT4oT
 9ardZe07B+qSesrCWyyiQcefaFdPO9NmF0V/cmMAPR2I2+bi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX5GeoNslLfRAD
 Rg4gxVdqfWiz+/MjzXDhFOSWErN37uKOlqcjf1aycHhF2ZF9BvGq21WAakJTrrxSsCGHpWEVqaA
 esDicFFpFT5kdMt4e0FVwSqT7T0FDxY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXyjO9JBWchdgh
 DsRSNDQ/UenEL102TwycO9gvLDkVQ3Rq8oBor5G65ZdPNxtZijYChK8Kl4jJ5Rb/fy01iakSpgp
 NiCm5pU6Ob9S/3VVNCsIOWxaH3NVbbo7zNKg1hcOkGNBdldZ8siGeGt2dAB2IVdGg46YCBcbyo1
 xfGRU8RQGwAskjgRyyDAB2MjqwsbYOSHwrnS46v6tStc5NbjO4jfNES2XyywvuwooAkXr0wkNJe
 nNbFlgbML3LFx2dJiKYZNqxDCwGNHa4weIkfJXRUDI7dQQoFqD0InmqOy+2c2oUsLlXd/Ab49GJ
 /0crCXECV19l4y4HVy3IbUISmk8CyEeNAkzM+Gjn8zQr9Qpf4TqZQrxR5+KS1DwZeAElvq+Af3V
 COYG4m8mjRHImozUGHk7wSu4tfoAYdGmcVJYoM8tOULD1FUcAamii5B2plXwHsbLBuxIXa9TlAp
 yXhf+WVX1h4rqh5tptg==
X-Proofpoint-ORIG-GUID: vmc__ikkCCLzgKK37sfJXcVeFpD50v0y
X-Proofpoint-GUID: vmc__ikkCCLzgKK37sfJXcVeFpD50v0y
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaff559 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080146_323658_558E2EF4 
X-CRM114-Status: GOOD (  15.30  )
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
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index f8aa2dd1cde7..083d70017f02 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -150,7 +150,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4dcbd9b99d06..9308e373447c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1540,7 +1540,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index ea0d749265d1..47fb10628125 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -430,7 +430,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ed9f77a2597a..2b3cad4bedde 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
