Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271E5CD8C8C
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed8av9V/ZtOPLLOIqqVaF/Dra08u9cwrmHqdZ9Bt+5s=; b=I6GIK9Un7eXZsw
	6FkfSFJksc40o0lUBGIHhFfe4TNeewIKO62yEwhwAFUMhZ3w8GumNliKxHgb4v/SDpMJIptms9uVv
	GmDt8RmEQVnSxdiEKwCMmBUdYaLYsBA1uS7LzpaxavjbP/W99SHH6ZteMld6LpdafARRl9kGpOgKP
	/MIB2ENTf+DtN7AElPM7pcULkj6Vntr1Ee0KBdr6eyGj636TN02wL1/PLtvSnk30XxJ26EOVJflDF
	4oeajq7Gu28nAx5wwcfE3TxckrVXLig/Gadw/nUSW5NTTsASHnC1eSE2UGuGT1bWTc224DcA4Qxrp
	srDuykRUmn0X+qe0i0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7k-00000002VkZ-48kN;
	Sun, 07 Jun 2026 21:33:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7f-00000002Vdv-3MvP
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:33:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjnPw440155
	for <linux-amlogic@lists.infradead.org>; Sun, 7 Jun 2026 21:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=; b=ed2MZhcPR3ZJGhm5
	+YO16MmNxuN+dCsrIyoX0dbNtKYdE+mXIeUFaI5m4tL/8sC4JDvTHIF+iI/ZKfTy
	5tuPR0kjUDFAN4M/bj01EFAbZmD1vXgW33IHtqdLaKD8+Og9HFpTiEPk6p2rhC3e
	k2QsiU8LYLCa3Uh52T1+5W09iLZykr+H/ckInlthHNkXhnAD7TMu95/MsU7TO+2H
	ka6I5kIsqe4BprbPkA3vl05DmALsf5IyHe1zEyVd6pK1cyEgQY1P1P2Obs57PNDE
	f0NkV/UYxpwp29Ibe4Qt7TgTH/q1wyqQb7nmlqPwWrefKljAe2zwI+rDAhy4Fzcl
	VjPJvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwak7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 21:33:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51775f7b2afso88939161cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868014; x=1781472814; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
        b=JGt/6wgoGtdGUBpHuNAg6dTDni/TUX0tcmpzwlKqV8KDQfR61xDJNyuQuzD42vqAQ7
         48xA9/NIzTepmbey8PiZgVyAqddWsia8SQJ0VPjM+nthrLGdMBD5jpMUQGaksJsroiKa
         JXChgiPkMe0hiE2GcPpsMkqjqYDFVmHUpzSD0wUm5cmb8qUioR4/JAf6gObO7feneCVX
         i/vWKiCVj3NKOXCHwTHfxJoqLco2HqCTNIt/YRbhdaxrmuaqxFaJTyZmlx70iKQgrrhC
         p3t7Ug9PvySMllkj/3doVMhoYPFBins2J9SNh2Gu2QFUkZoTdn90cxZRFkwlslVn3pU/
         KcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868014; x=1781472814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
        b=nC1bftzSbfNJwp1BgTb1uXqyMvxR6T+SK807fIv9avHsRjaaoqLbODaqz6icjimEE8
         iuH5rCjjlESAFWh/Zllblt17e2EY2HOvt4Mn9LPuyipQvRO3s34ElmorlFPOK3YcgPQL
         QgQ6E2bJrmG30u34bOn9uU6IXO1pt7GPTEmeU1MEMcepmFAEIAAD7ubU8losilKcNsIn
         2RAgCr7/M0Y9685KO4U0fLvrpiXpKm7BphAdFa0OAyhW/54nXp25+j9rF3j7bZGzQ70x
         brb0naU7xXQ3l3wHD5e9hiEABBicjRSJCzSX2j2HH/SpnFpVNOgjgFewQUN6L0ZCdBOZ
         3V6w==
X-Forwarded-Encrypted: i=1; AFNElJ8zrSN4Z1+mKaWo+g1J4wrul4ciVy1n5649CgQvaLYDt6Ojb6gLBoMkbXNMZ1G6mKLRHmzY76PpBr+6cXpg@lists.infradead.org
X-Gm-Message-State: AOJu0YyPWfVRvAG7DpelKrsPLb/OxNCtPExQ8JR97yigaMyBRhDkslQf
	FwZjdZMg/x4kFCSZmsjMTh8XWdV/Buh0ROwCQ8ju6N/a9tRr3z5IXIkoyc5wQ6ZYyyNiG9sdF9v
	No4mbBb1A3rEoYguMXVQuX/008KJWerza4zDZBlx+wMAIJqPJ9ymHVPJUKt43KIJNURPi1NXzWg
	==
X-Gm-Gg: Acq92OG6cPBSFRWVdpqQy/Tl3QJQIk2EsswoCZmlWsbopRyPyhEl35vcBaBo2pEUz12
	SzjjV4ow/yCyjnJ7tUw2SRYr7q2MuytCNrFVapNf0EGaZmfS7cXgrLFnqG8err+9kjhxp88HfiG
	s3YflAWK9mlIevpfYTgQB4xEmBZeKlTel7dkUjuFXwLDn6o70yD+FqJSKlEzBUyFmULjL6RZ/kf
	6tT6SPqzExuIimgqNSVQ1iZtTJz6W2teVNiZFHzafNKkd8atvsaNvhDiGqXBtBNdQJpye3B+PDw
	Gv4Q99+61WV8gsOd8ZYPP9M84THLZTUeGSJIJ9GstQ1+16Fz0Y9j8MeTFBzj8ZnJB/7S+L8A0Up
	1LSSGgnPiZZb433ljMS4w+1fWJvGWds8u0qaeHe39Qg0nimqB6UhErybnapspywCK61k3e3gYJj
	mg0yy/xuaR3F8ZnSoiaidaDQdpedi8JVXidP5KpUk4oZtEIg==
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id d75a77b69052e-517987df585mr128694711cf.27.1780868014034;
        Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id d75a77b69052e-517987df585mr128694481cf.27.1780868013602;
        Sun, 07 Jun 2026 14:33:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:08 +0300
Subject: [PATCH v4 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Message-Id: <20260608-hpd-irq-events-v4-7-30b62b335487@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMohNnP615sOpE6ZWKg1trb/KrvgErHGs2zP2ZkYPtM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQI5tl/0XcA3tgWGBDfparpRR7p6oX7Tvus
 qwjrqzb+oOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1XWXCACmNj3CHr4O+YRbKUG+T11qRjlO3v5XH4k0gj9GScSSKB/i++PNRfIVaB3JOvEoD/AYHrm
 YFUwGw2fBFT2Jv2Fhyilg176SDLOp8RsHVt0LQrKTd3iVzD84bkfPw5YQRsnoC0q2NNOeteuu4P
 oNZgIAB39IsrY1AUoXDu87QaI9/TPgg/T4uL/reYnY2d84fLwma0S1+Jh2/lbnZ1SDxBsBxpeSE
 e6BfBudjneZilPPKvQDNmThuUz1M8q6khvqmx+48G+tdedZN45pveTW7QE0GhFJ4QlRiFxRstqG
 Gz/WYDvc1HTnwPXv2iuBiwsSXHMYqAaiEHZoR0/q/qODETsN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX0OGV0+F2GOer
 kE5ojy3CnHS4vl8t64h3D13Tmrx+bsErk7fepZlBZPLPO7eVrWXjthqDruCej2jflQwtDAEJsTX
 zvyHVeDaazaa1HH0wL6pZPcvtcwe6DG/rmgImBnLlEeK7Fvesm4dSr59euRQHBUVzz2JjoEfAUm
 LeL8UpqAn6Q/HilzWnvvw02c400qKQvwXwzVZ9LY8GdFsuQfO0byS0sGAMnxkDNeA2AEMtxHAwx
 hnhmfW0U/3Gw8RvWD935BYyanFD8eUSHaMSTMhAwnSjqZRvnyt4vfydHyzM6Xbs+0LP17LnS+WO
 2NC6fk1sbpMVJfQMymh/hW6KApJKfbHiK9E1BtBsfzXA3TzYmXQYYM3Kf7YbP1tQcua0JeZRUqL
 9esbheVmMXCh0lS3YDpEknQ9W8lwqytnTYMiz2dp5xeznHA+FlsEe0W+f4/v4TL716R8I7ReM/J
 7MAq98aLIIPAjZ4AZgA==
X-Proofpoint-ORIG-GUID: ABBJzvbMa1iignW-uf9ydwBkXKqFFDwa
X-Proofpoint-GUID: ABBJzvbMa1iignW-uf9ydwBkXKqFFDwa
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25e3af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_143335_865396_C59DB7EC 
X-CRM114-Status: GOOD (  12.94  )
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

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
