Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00550CD37AC
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+Nx/0XMq93G3dwwOpagMb+g0K/3b0q8vLgBNU2O7eg=; b=UIOhgPFC5a37OV
	fLbdWiVuYOc1P/U1oUafQsJ5aN5Rq010UEkFHAAxDGzWPZdG0y1BDSnHomS3ZNUQcTi4h33XgvQSQ
	XHGh+K5kS/8KuIbIqEj55oIM5kn/3JlPMLtqVUn/U9VzSiFm+akjmLldeu/pPI6dnIu8S+jrMsHvX
	RTaxhyWEYBzKvpF4YPHbuUKtdBQly881gTrepuXn1nn5EPcrqDLTp8/j/CZxMMXMZAfBx4yME10hy
	CaTo2owfT37OghEPIL8AA17pXXNXRjFKg0/WAGhQxYzM7bF6JgA70sodO7xRjXy3tMbtKlDj5TWCu
	3XpHxu2dS0pb8lalQJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFh-00000003SXS-1yPI;
	Wed, 13 May 2026 18:24:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFY-00000003SOB-3r8X
	for linux-amlogic@bombadil.infradead.org;
	Wed, 13 May 2026 18:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=; b=NifltLfniEX/D4Ud9bmB2a5LJD
	4f+8zWMcNBAC8o5bOwE/BmwiDjtqc6/qKDa9AJVNBh3nxw1LjzvRK9LmiYhT5McQ3OOH7/FyAsaUu
	Day9ry9W7TQih92BI9O6/ijXWxznnBqfr8a5cD79JcN1RUk/vfYW3qBqo68m9FjcsYhfDhJn8eeUl
	b0LoxSE/D9nDxCp4ZPX+Yru2oEoTjbCQhbo34ri9chb003WkPYpHKMFynfBx1AQlfaMXU7IKTzhWD
	EOH2g0pWUySzZijEaRVoUutKUA8Al7J/UDj+awcN8OH3UZ4xkpRYQQi7GSrqK1hnA5BcbM0A4Gg7/
	KCKEgAGA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFU-00000000q3o-1JBg
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 18:24:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG3u7q3007701
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=; b=ZN3X5zQq82m9ph1P
	6DK7N9XOMtvv+DpVX8n2YXVdtRAOXtyfCO7JRs51nFJiHCV5yLl/t54OFCaFnhLg
	U8FX7oBM6A8wJ5kl+NO5FeHdxulglXb0CH4Woib6U9PgbhAYWLj8Rj0U6FniejFw
	FX+Q2Avi0wc2dNvvTsEOEZES1bJ2WKho3MZ5u55ADSTNZKymyjA8/QHmuhlq7n9s
	hf2qHUgq8TuEZar1JoOUnqckaw8qNsFOYJAje3C6TImZFr250pmNL6Is0fecaJPB
	xRnKQXwRUk/w1VROpXrhey5pTrwD5rXboPCwFNrA7gEK0nt0k+KVF0HHvwoU8ePV
	ATyR0Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0j0bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:23:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-631b097bbd6so7494868137.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696638; x=1779301438; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=;
        b=bQFk0dJTzvoUffwKuL/CLVnyKau1e7kMTIdSn37b0cZsXFG9KKB44ocrwUyeRsrEYR
         sj5RNB4fOSR/g25Li8pz+MpAT3bRjtT768c6z0w3pdYAjGsp2VhRv4HEU0dl28JOkJKT
         UNfHgCHhaL3IRARsylh4eV17hbM2tMniXQb0VNBml4GSmDZLfaFCgxxk9v5IagAYMkeS
         sOuh6CLfg4IjHb2VnLnA5shv7HcklJSGZ5pn62dTUtUorf/Ji0eE/uU+zegDlCfv+y3b
         uNM/Or+ZvOdODhi35Qx3RQecca3ZF7G+WT7FI0bRgBv08JdhYWeHU0mLjgpnGn9aqCVB
         rwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696638; x=1779301438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=;
        b=RZpR3XM0KdkXKS2qkikuqbbd18CpsoDyX66FPGGg6LRC21unMr2mR/Q3a059EtKvvJ
         RIWJe34VdhVmOrOnrlEvxoqM/Nk2+VKWE8DBkEwnJqFQzFR2R3fcPIZ2VS6mL+Qwk7uX
         G0a7LUBmRXUOJauq2UIL9f0XPcLG9G3C3Qh7nPIvdBmFQKaz+78g0s6XvvXseLyS6kQn
         feZlNYEKGzYajn9QMLVS1mh0HEyVLakDp8EzifiXFDvxKmJn96o0jjVkaeBsFJto66Wx
         prE1cSDcj5JZE+DDaizBt+gvlq2aO7deb85JdSx32lr8PgF3pwaIxSF8Tq2BoNFr5736
         BLSg==
X-Forwarded-Encrypted: i=1; AFNElJ9MKTE5DtAspkzumKVdFMJVdPBWIXUk8Rjznla+86l5ZXKRytv63Tjy24dUW+WiMfNPAsZc2ZjjG1iQdFAG@lists.infradead.org
X-Gm-Message-State: AOJu0YzZRnRnxKk2/eh/nevCboO9JT+jHj0msI3/GVwwV7Nz02JzJhLR
	ztqda9xTlCApzy3zXueeuC6KJlh7tC0cL+fH38HDwpHRhhdNtjujRiPqLg62FWF+6O5c+QblucB
	I9AcPyZISAjcnzASGa7GyhAgkZ3RW9dIkO8I0RDrZSRPNM9RPGKFAWIXKIPi25Oa4tIGuyAJchw
	==
X-Gm-Gg: Acq92OHK4tD55ZpQEZsb7EX20bsUzm+Kq/tI2nElma2Iz/WkzjXC6m3KsH7v9/QPk5L
	GoDoWHuCfZ78nHY5cxVNyM13+SgRgGXco6MMXLKWhvEGgFOLqus+ZGwYAJMOnPNsXxKTNZgSK2g
	pukn44KMzRfzzPFJJ7YckANDyrlfDqpxdZXgOVlawRCsHECO/ZGP/Q4picd7AeMKm5KepPaIo51
	5YBGtmy1eXuGLiwg1Au/KnxbRThX20FC2DXjNVuD9+t6WFBoQ1H9ntayye7s7vFvqEDViw/W/ne
	7Ke87KlyLu5DZr0rxBmKk9mLWNKs+xcO+/mw4/v8q3lo5D1DY7mWsHQXYCDNLY4c1uBp824iHqb
	TW4PR9yRiHTtXKEuwfp5NzALmAGM/a+aEzxITB8qVLlwcid23oxls6l/HM4VfOXoXzDRiwngDkh
	246803RPvkkR2bV9S0D3FDKEBsuH0ESJ9B3Ojim2xccRI4cw==
X-Received: by 2002:a05:6102:6883:b0:610:db51:6f3d with SMTP id ada2fe7eead31-63773e1c1b1mr2855693137.12.1778696638012;
        Wed, 13 May 2026 11:23:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:610:db51:6f3d with SMTP id ada2fe7eead31-63773e1c1b1mr2855644137.12.1778696637357;
        Wed, 13 May 2026 11:23:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:23 +0300
Subject: [PATCH RESEND v3 3/6] drm/bridge: aux-hpd: let drivers pass
 IRQ_HPD events
MIME-Version: 1.0
Message-Id: <20260513-hpd-irq-events-v3-3-086857017f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7164;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ND7iJgLsvG3cprXNomvoKMU6TvVGvnMNqba7Eqodcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0S88LTfrlotDPFQ6SiDe7cKoRp0xcJ9JmS
 hADUx0XTxKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1WMbB/4/R94r4TBQje4rZ53xfXGO4Acm+KRv+31SpUJ/7Tjp/EDS2WzFK37ZW2rnye18vgrbURD
 v0F98QIrEG77Y9vJyBOwFZbTNZhVRv7TcZtBMGMJlZ/+pXt8B2VAbOUxw1QWXIyGDX9GeZa5jfS
 D3cDLDS9/4Ve8xRkNOruvYI7qS7A5NgKyyuuEbBx1X4Lluk+MhmpFB1K0OIdfBQapFX8aThp+7Q
 pXS/R2pbKujWHBIbiUBpkpD1+cm2FlJSWRWNDL1m78nL14CDGijDtsPgg4BiDs+8ePOdhYdZvPj
 ZNGXJ2ejI1x2LrIWizu8+UEQkZgB5NQpSJ0LX65iK4l88rRq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX1bTMAUupQWfj
 opd2i4RVhgOthW39+qUsSxFMALzAiaN9NxpSgeYD++SYu5V0rrFajZ2QBYExjnTBeGR+5+FpXKH
 fErRQERS0DPe3/jWPFP5cg6kzYelo85IKLz36/h6dkL+aHaHio4o6pZA4pdG87DlYGy0bkFFPDR
 bJS+3eAOLqa9+XY9PkSrTWRil4+G8Lj6c6nvKgZioJplyMWxUnxo0rjUS2Th3U3ax07EalZwa24
 MJvdSEbRVoGV32OhTVZzWTZy43OuIV0EBnkuUeo8DgTBLFKjgxKq2IxywViU/SEkprm9JzKl/Os
 XTw9nhPZPzzo7yCXqwjKLuVPCsBJ4eupVwEfR/68NcSziOSM4IUYaCBg4NDTaiINeJxVBxdhEsu
 JXmwciFplhOTmzSxgUJvTWm5SBv+cg4r/FU+CA85094iavUDLUEFyHXbAxybq+jU5oq+ZMzh+ZK
 Ft6Jfwqyh3Tjy4sU7Kg==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04c1be cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zEMOeRQCFk_hQCPR_I0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: fmvY_hIiECMlP6OKbCunwb0Wq-g8pwo3
X-Proofpoint-GUID: fmvY_hIiECMlP6OKbCunwb0Wq-g8pwo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_192400_928508_6EC39565 
X-CRM114-Status: GOOD (  19.20  )
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
