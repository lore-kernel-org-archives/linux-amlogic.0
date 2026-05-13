Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9698FCD4F3D
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bazh975kevwNU010oTzF7SN68FlLmdBOV4BGnXuptxo=; b=COHv06ZBWZ6PrZ
	TVn431YXMWYD3qQfZTVRkkM9/cI35XvCyqlVv7ER2+q+c1aTgMB7deRFflU+03i171MuJHDi16XDF
	V+YeuLt+ituUwI8gmsgbHRf/komdBsQC5AX9fjtb1ODkiEUk17cQHqL+b+ZRbl77NnTCE0D6Vb5YT
	KbF/wtmLosK+Tx8iSRAo2/0GC0tr/JGYs/85vTdtMkcuoXexIBPUPbHOd3fq3M9kxHVB1C7M66ock
	XNAsiBkS7qeLnjavqoVUN2VO7ICiyDpI/qs9MIb7bbNqNXfIp1pxZCT4JjXA6ufZu4QW+Py8bnAjY
	Jt4Rm3c+CV0fn4cRTdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFh-00000003SXb-2RHi;
	Wed, 13 May 2026 18:24:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFb-00000003SPM-3lsN
	for linux-amlogic@bombadil.infradead.org;
	Wed, 13 May 2026 18:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=VdNS7ZTEG0yjz8ZHalD/rOl+sc
	B9cKTYCG4cBFfdlol5nkVKR/qCOHaQA4E//FzSaSevRP3oOKeENSvDs4WEKvj2uzSm+YyUJIF2ynL
	AT/7gCnbGugP89Zgo/6hq3OQABC5D0nPaOSRx/CFRk9SWvhWBhbu3osXjfnjXwLaLLroXtK6SUThI
	fGlMH2SxSQelMEdXFv3/jiOxZiDnXgx9Qti0FkPZAcqVaOQfXV0j/DiWY4Nt8IRPYKM7gHaWeZK4Q
	72OfDMrlwNxisqqgCG9X5JdzVItd5wJqUcVghI5FSH/7G52vuY+/e/rUmc1LLtT8TORciM8OT56UN
	mEHcXaAg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFX-00000000q6G-2Jon
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 18:24:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdeTQ1242787
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=L926dWnbrlNFEaqp
	srzRYuP0cO0M8CQROQviJ240OwfSEfGfQkjbDWjadxTXeUGNt9JYCz2eOPBXiVMi
	reTJ/PRQJ9I7gmqRo3iKPD6xxNuzJSjsU5HEUsQFY6Vl9KFE4wO14tlNEUuyvvp9
	BV1Q8J/d+hIcdRBvj5Vwf6AwCWTcEQBgR3qPxVBpRg7PbOWMYZaSgsZJh7w+1yJP
	juhymAF7rJU1/fKM7YlysCzzyUCQMC1mZua8c9pmeUD6fi4mdDcceyHTwYp2x1yc
	x+g+3i7jbjZ3Lsljj7CqG7gPLkFr0h8+ay6DFmGE3wnZyULseJ2QoxdDEd920u5L
	ODmvYg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trmvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:24:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63302aca17aso2256549137.1
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696641; x=1779301441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=VyWbaFceISp1U47H6d0uAM+HLKTUtD5dXRBuK+UvTCDKQxPd1yAgOLFozuVHfatFRm
         vR1XwW0ZuXYRnFuRDSnh59FVhUCv4ItbbMPcLkbfiR11n1jB5R+2qlyNvBFLDv0MF2G6
         lTUQBrngCZaYYuI7xCoSU19k6f7tmvW5a9aBygvrXA583RMbI1b+91eHKLWsOjZA03nT
         R2l8x+yGRIYMY++JEKEvTgWm5NlT6FHn9jMSNpBLqJflfowCNYMZbQIC8wi4YOvpD1i1
         +eRqTbH+XInld09JtMNaSVVVWqJeyHPbrA3s2IS0K4iNqHoEK5IQAN4PkOs5fD291CF2
         DivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696641; x=1779301441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=L+IB+DI6Ao5cNyUdb76+KoSu8gMeAvWLYY0ac/EiehlemUeTjz8OJoMOqPSpvoqvN+
         D2VkFTL609FuIBRcw/JhsOx5zlWNmScVic3p4GigJz4/yszj9sLRTb0hlJnucvJ0pE/V
         I3PgzKvZs9sBDMnB7Bh0gu3y8I4xKOjc1tQOosWuMulNM5FQbM/LQRin7Aj2Ey3obuKt
         g8PS3a1Nq+QuqFpm0ZDWR72XIcF1WU6w2rEVWo7pHH/BiUsl+CRlF7UYZp62WYxPqh04
         R2HpHuofjNeqE54X8lAmhkxRihnwCIzx9DQkKnWH5/1beqSRJlmYB2LCd/+p90ghhyF3
         a9Vw==
X-Forwarded-Encrypted: i=1; AFNElJ83h0B9QhHGplWqxMyUKnGqf2amBzLkY5ti2TuoJAAt9741R2iTkbzY9SNdJJWGV2Eadtc+YVJ2bmNVQHu5@lists.infradead.org
X-Gm-Message-State: AOJu0YzGWLkM5L03Voo84ZifM9Z0+upQs9RYC+3AGXZO9Gf9SCRvY/PB
	OcrCEYr6CyLEikQ04J/enEby8FCOyjAKqUpnVv/DpbodCd0KKU7i9KC/orKr3eskQfJEy4eLnm7
	Rk4edh3wMgNPfVY29Dz4edAaAMZ/94oOF0Q3adYF9yCd/N+CT0ZlpvC58AVXc6Jg4OyyftB1BuA
	==
X-Gm-Gg: Acq92OExlHWV2Zn1l1iV4UnIShC3qmPdy+7UubIfnd61xVs5NTUhsv3F7/Fbwxos9tZ
	fGfWgq6TVNkSYlyHXXjhhb/Gbd+aeysjaPWFV13C3JfeQHeTyYB+x05olTCj+dGzCxQ4I5eq84t
	MyyCljB4pgbyIYESMQY4i4o/iZeTp8Ri3pPAtH0uhZ9SAc/nE1PTjpSj5H/LWRq7IYVwxLUMrIE
	4HOwkvi0JHE+DRGViVVvdRpg4kxNFFNyj7oEJfF5f74lPDPoIxgKgX63fbvaJ6pdfPo4cWvt1MX
	ALqdPUqG/vB8/GZ3JQmFSZafz01raPXplkvaUfRkbm5suYZXhDa+ctae9XWcQ4EnPLPIy70b61U
	N5fw9Cg4yUJoGmgUbR5aoY9irTvO0Pom7bUHWls+CKwBvLC8l5cQmrGwdy4VOJ/7DXGY7CB9rqL
	Ce8NUtRvR1hYeRfO17gU+gKybaMnXFE/TFKng=
X-Received: by 2002:a05:6102:3754:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-63771e93dd2mr2536238137.12.1778696640934;
        Wed, 13 May 2026 11:24:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3754:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-63771e93dd2mr2536205137.12.1778696640430;
        Wed, 13 May 2026 11:24:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:24 +0300
Subject: [PATCH RESEND v3 4/6] drm/msm: dp: handle the IRQ_HPD events
 reported by USB-C
MIME-Version: 1.0
Message-Id: <20260513-hpd-irq-events-v3-4-086857017f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0abAwQqrwNKrmGMKndnLCYyJA6PXn23RVR
 jIy1b2VxsmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1dGPCACNGtpqzbvMTWs5X5vG8ECac3Hmh2yf8eM0hhFimdemipY/3p1uE7tZ1kfXqE9pDI1tP49
 wqoR6jikFqcgnRZ8SpkPDt3z2v8IjbTYJObqopxYBFmBaUt9lrvfMYHjf1IRxPBi0juVhtyKqEE
 I3psZD5FRUZi9u7VKDzuMV4vqUQitc9UgMQYvFPmPG/qomdvVXZJgCwlMUaSCY9/5RHsT3TNKC9
 JQNkKOHh+ORyA8ZutxDUNr1WX70N0HMl6YY7t91D4ZYk7vBzHYUOcRa5mm3GvAXPnywKP3vMquG
 6lyEjDNfEPjnhsGq8tO/gH5cybCBy0/PqZe1OxCjHZf+ALPU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04c1c2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfXz+7uTUbOteMm
 XGvQJyK4JAS3EPUCMhEHAg9CSW97EPnCMw0SrpTV+ewbksC2TG0yeRt4TRPFBJIYmCiqTA6SFyp
 yCGhxyPAlQlIxPtiEMiHp74Mb4GVPI5h2KFLG4WoH+vPPlQeXgRHUKDagob5U1X7kgeiDc/xGWL
 UvTz0ny1qNhk7lD88g7D9iVeJrhGNbEW4H0nb7yDr06+HhgE3d1geJm+2H+v9zzgYi293JFd/aT
 kN4yfcjEYezvWFNbRQAz+XXMpnpt3rh+Y6nxoXhWY6miULYK9KPW6ZmBru9Bg9yFSFdzFtPo0KJ
 ffYgE3jpfnRnYZXlYI7dzkcKtYUSAb5iVEqeCUilOpYsgV2Dp0MsEQNtYzgyvFpWxf8nCPUgtYG
 bpjWEV+YkFq1qC1223hSow59QvP4tOCj6mZ9fYBejLQ6svzyK/c9JF6jBRIiqq/3tTphjsfdWGs
 DuP6zoA0MkoAy/r//oQ==
X-Proofpoint-ORIG-GUID: aMCvjCPfS3X4R_pp-i1X6oA4eA6pq0mF
X-Proofpoint-GUID: aMCvjCPfS3X4R_pp-i1X6oA4eA6pq0mF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_192404_252885_B342BD6B 
X-CRM114-Status: GOOD (  11.58  )
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

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7a0623fdbd8e..8df579bb320a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
