Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FAFC83F34
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jul 2025 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UTDOM+aP3+T1AXxtJj8mDn8+F3zicW8unOdvf9rooTc=; b=PrL/mHkLKajd3o
	NnsHrti3Tz8+C5oMHnTDiGWuOPJjdkEhVmKTj7eB7DCe8Y+/LyDxJ+S0KaUrD1RNl6k2VyrSr3Zgf
	10ggUYzxcu/3CTvWN1OGQ3bwWipsXmTTtXyo4bruUTWSJaH5+8uIw2IIVNHRSviChE2p3uqyv9pr7
	4PhhEFxGHj7q8/AvS1iG35gxJrjk2RAfdn76Umfbd1rxPxCXAllcDjiOALuZN/TU7zZz+hfj1ofmG
	DClUxrQDN3d6ZA4Hnpw6pZsptWgXgqyx012YKGUNdSVpqEyYAuhICeMwU3i1b2K98tTmAUdRXraqQ
	Z8O97sPN0wqzB71tA57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmyQ-0000000Cw9W-3Vwh;
	Fri, 18 Jul 2025 15:26:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmtf-0000000CvAm-0LHG
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Jul 2025 15:21:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8UFYC025177
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 15:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=13kqIIhvX8G/h4Zyb4Bf0S
	syUcZjDX5f8XV6NFySlbc=; b=VxzhaWjNb02Cs8EjdF4CxETxfROq7KxpJOKDej
	O6tpWw34I4DPlGeSwh4Qd1BIo9mDYr1T7gJRVU5YgWJ4kmPPioSGGcjIwDuzpu+I
	1e96n6+vXNBe8nSenamcEpnvcxsicaUPjkA49MnC7yU7PZP/bEuOns5LXepDdje7
	TRVsikGQJVp65LX162On9HMCJB4b6OJuCccRsW2hfP3Kl/qr0UZK1ofmZr+c4Fob
	dFJQmjF1qzZ/8AlltQzUMimLiLZeEfDHc+fuF1V7OdNweBDpW3VyMnn96TO87FiG
	Hcb8gLSt5ZxVeKkV6IWyMwNk2Q6Pu+5TsRfE71zFBMm51W5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqg8g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 15:21:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e207330a45so332378785a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 08:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852072; x=1753456872;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=;
        b=YSBf/CGes6gwTd4klRahz1cqPKyiBJx2slB0Mzh1q4ddInSSlel3v31fWMces0pGm/
         ZqRSGTBvJUG7MZsApUwb03J2VUOWWJWFFDVTZy4TtaTlQd4RYD5hYXi96lg1vC2yFW3j
         u1YT3ur3aoxj8dti6qJLl2kFQpTa/BOIJoxoE3tYOO7rmMD5kFEpAa6Gdvjsxl3IoY/Z
         +LdWYOIouL/osgJgGictTU+86AEeeaKN4xgTh5QeZABP3jjIc2XwNhTZ63UTG7pNdeb8
         a6p7tOTCcBilKEG7Re/pFZ7btjF7b7H8GoTmENZ4ZGbqYKG+fJ9x5CYNyS6yMWGsHgvr
         zvEw==
X-Forwarded-Encrypted: i=1; AJvYcCU+CxD3EGQEBcbjwW51Ru++lfTSk8I2kcrn6UkaKqb5VoU+Vq4ljJX6FuVRhFXW0+3KZNQAR4FeoXaKWMIZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj31PdnoBFWVxTBwYBMPfWOuLBKIc2O8jyEgSFPB9G9TdnRcaD
	pty84WeRNMyIpznC125raldoZqIpZFfEhRDz76eG72yZ8Hd6emph1hkT95omVxlLrXr7cbLZpqa
	YwSZhU39kHHyWssoWST4txQzEDgRXKRQzkNds7FmeiR25nLaN7MivIHsALCJvd+8HxO2+bqAZSy
	SZq1JSFg==
X-Gm-Gg: ASbGncvWvs7vN3tycOBI97MYef7j9QCW8VWf5Dw7Sy+KV0TM5SBiMA+jjWATsfLVtJT
	nLJrN7FgStvWVBVpM2aAwvh+NnDT+UKgirr/m01MuCLocwWjtTt3F22b7EjJl3LvybOTaOmUO9p
	TF00bQtQgW0D2JSKvsFW7OVyof7rgNpg5uxVmY4Csn384o6qPl17+RryfGvhlVHmosdPx7Q4lL9
	i5/o/kNfEHYK97pry4bnVL6OldrsTkSFMxw2CZT+KK0xh/cU5tbzAyL3D9odY6G7sLExHoGZIDv
	JC6YEugSBVXUdglWVJXHVnc+VNnUJnb+0U5x+9uneV/KEslAeGCGRO0yzSjz04Ugn0NoPrpFGId
	X/jPlpxZ4FI5T8C5B+lYOym77B8SrpuYdFKuT/pzmuCpYq8vo63J2
X-Received: by 2002:a05:620a:2145:b0:7e3:5550:22af with SMTP id af79cd13be357-7e3555022ffmr475411985a.16.1752852072322;
        Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGih5HUBirffAz2WZL4QKYwy08DDOZqNQMloXSzP16EApN9OS9U886pytxqNhKO8kzqfu4L4Q==
X-Received: by 2002:a05:620a:2145:b0:7e3:5550:22af with SMTP id af79cd13be357-7e3555022ffmr475405285a.16.1752852071615;
        Fri, 18 Jul 2025 08:21:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:21:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Date: Fri, 18 Jul 2025 18:21:07 +0300
Message-Id: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGNmemgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0ML3ZwSSzNDw9KKZN2MlNxMXeOUFEszYwOz5JS0NCWgpoKi1LTMCrC
 B0bG1tQByS41fYAAAAA==
X-Change-ID: 20250718-lt9611uxc-hdmi-3dd96306cdff
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmrEL2Zztp1/d85i0Oy9Zc2oZaO+hb0CQUZ
 ZBKX+ii2zqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1Rd/CACs4rPc7tst3TZYIDDeEoQX9zKw6b34Lk1QY82wtNiwp1z7kv5KTqL+H5iB5gH9P1UDiSS
 nw3HcHcejQ5xrn5NDQRYCAtIh+Yk8v3MYHW1UHNxSPIHyMS8SbNufXY3ThYqJMcFkJ5OF+mVlVe
 3nQcukkkQUAj59qsqfWFJsN70YCDBUQIe9qu1Y9Sx6orOgASt4ws1mGKpBEx0TTwa/F5j8cSk1v
 y1NqCttIgJc/n5GDXUbDDzKXUJxU16RWjIDq+u8NnSu8N2+u1+mtGdsTKxEh89zBNGgpILUZhTR
 ybERI466cwrPMuVeppkJibCtOrWqkLHbQsc6qCw9J4KcJ+gV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a6669 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=viR3P9R_XIStfHs_oGYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: GOm0FW4QohUXUDXe0EoMKS1ucgOuuad4
X-Proofpoint-GUID: GOm0FW4QohUXUDXe0EoMKS1ucgOuuad4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOCBTYWx0ZWRfX6+sZG7vjYh6I
 0JVbkcQx85CEoZNKUoDStlw+8gqKt/vBwhh4uvBvIXFNyoztXbWMkCcuM5hhJQTQW4S4j4AHJQj
 CvnLPxELDqc6VG2b3mr7WQKqh/UJkmVZye8T1ITdp3VL8kiWHsZIJpEFTkCw36aOOj1DMST/GuA
 GeoGw1zDLMw2gNvUsX2ptR4KEw0Gk5Z2Hu0hZJagZGa31IogEo1FkPUou+/X0/jSDlhTgO/+ZIR
 HWCJO8yHsb/eGJbBSSXEGu0Tb92E3Wdw7BNeE9hN1guqbt4Nl584MB6PC8OfCzXMFG1rvQn6aDA
 i7TnCkya1VEkbO5vgitJdz1bU56hxojGGV69vfavqhdI6fIb8zzvs0gVusOQrWwC7N0H602JoJe
 7osqpR8enz5tP7RFR3dhA2bCZTDEVG4LmCVweIHbA99Wlst+zUmGbPKOdjb6YmJJ5Hp03azH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082115_233828_564ABFA5 
X-CRM114-Status: GOOD (  10.06  )
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

Use DRM HDMI audio helpers in order to implement HDMI audio support for
Lontium LT9611UXC bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
 drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
 include/drm/drm_bridge.h                       |   1 +
 7 files changed, 57 insertions(+), 79 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff

Best regards,
-- 
With best wishes
Dmitry


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
