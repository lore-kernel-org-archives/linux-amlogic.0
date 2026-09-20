Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C4BC982DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8S6XFUySufntDifAM9XPaK6DWFU1JAqDsqr5wW7rOs=; b=hCMCj5yZVy7Tfv
	jhC7Pf4Nw0Nf/cvmibKKTOft0aV1PzsAt9yodTA+7cJg1qqQlnM3w3yKpHVn4x+ljuz7LKzlByPo6
	xO4KLnxKM3Id0X1g2VH7YmIVKO18NsydatooTghhg9ys9QXwvyYWYj6ZBpGWIBDDBSXhb9gkvxVVd
	CeRKlklQ1LcxuIoUk6967Z0GPiQRSvf71ebltDhClG6mNzu+mK9w3mrDLrVxesmN1J5V4NqtTPLBM
	9TvADVbOrjRPsx+OxOY11l4r7qtvsXYZJd2x6AG8ziCjPcltDeHA2RsDxWCvRyEg8WfvA2ovEHsbK
	rQw80WWe2O6h4j/8JiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J3H-0000000019W-03zS;
	Sun, 20 Sep 2026 15:01:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J36-0000000011x-3Lt8
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:01:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo2A03271500
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=; b=DXC/ueKzIq/kzAF9
	rFYqtVTFD/hrOYA2YzaXtLkcnUoXM2sFtzvQtwmd/9/ZSZ6Y/3CFQ8sg9RUnOeiZ
	RFVYdj9zMPsAnhI8p9o0mGPf/Wjr70Pl3ScG0L/EVdMNh78/beTatZcT9xf7ZxHd
	yD4hZW/OZLFu8g4dTZs5GmNjUuiDIqK+mWMecon6ao0P+rvaBAPtwiXz0wzLzBsU
	EthYaBSLNRtrODbJ8MFm/30Yo8KRbDC+8YVsY6Yr1m8vDa1DCBDIAx+ZhiYd9mwY
	rN3XRbVxjKOVnk8EYpA0uXNwGP3mMuf+mfD9AGoK5uhIrsAwuuf5AHCBxIbAp0Hv
	R5evsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsbc7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so68173201cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916507; x=1790521307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
        b=B0X9G2bsODtHcBc17ho+0CzcbRlwSPtSLqXVPm46G0iQeBNZ7sH4gmO8ecLa+faeSG
         fTUbm+WaWO9uusyDXMdZqqYbtwLfIvl4Alxe4xiMWClNLe/s/b0JtAwsKeOda6axSZJ/
         nNXwxojtrbCl72THVX/ZM7ORhVxE0Wrb5A46OF5LnLit4aeBt6BX+3IyDKbGwfqii9Oo
         VDOqu39390aFxRE/90YsFszgGtcvUiQMiG3+B0pVA4uV/dRRBDJfm2vF5HFrL9uzq52k
         XSG66OvtOUSp+1ASwbJ8YKLCfQAlHtj5vWZoII0bLXAQEzVABaizIKCYsyj3dAIh37lq
         jDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916507; x=1790521307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
        b=JrFKvcCXHbzI4BLi/mZeKjMcccRL14lWpVREW22QP+XRCHANpUkzPuuDTml83wtqg1
         5lMu1e3JCtoeqUEsR7lvseNskRSSWE8deQhAKUDPBQpY6XGI1AWVwks2oDPGZyfczmb4
         3eMwSLHMv/NMsIyUmGTKEb2uTdLEkDBdqTRppz85wLWSB+HlPD6zcKH18htVp+BPU4RL
         j3z+IR+7VyzH1wAuAXi0xoqSMuA7hXcV8A24BuRvx0Icqp3V8epWRADfx1wkZttuSqT9
         lNs5KGQDpupfaQQRmBR2rHLOtcnhhVOOt8XnUieDoqdaYh1g3OpGBModiY5SIV/2v0tv
         01vw==
X-Forwarded-Encrypted: i=1; AKwUvBxYT8mertPE/Kn2ae5NPzkuKzL16jV4yW/Zum6l39y/Z+Xqpy8p+54dw+t/zjWiy7+L2hypLD4KSiaqJY5I@lists.infradead.org
X-Gm-Message-State: AFuF++kfl9NlN96gqYkCX1aqMNwQxx7XtDw6+GonUHSqvXdWptCvaZ0g
	/CNgygUPCKZNvsYMuOc3KeaOV6YQvxDZGZvQZk4nTRtWz5w/548lL/cwOx1Lgf1+zuR0Boc3wNw
	l/lb51hNZ5tgBYGlan2GZEPNE4TJ6zcih4/Z6OV3EpAAJzR0H1Tl1gmhLhuvwykdd5fug8X+1Ng
	==
X-Gm-Gg: AYBFou0PMAmh+cscz6qEnAYtkjxLY6KXYYRWzQDWI3BLqGMDuWMxTKXBS6VMC+rhtzf
	jicBKftUBZ66exZsiiNnOaMvHD5xysaPuOr18fED0IlTdHFM4KdU4GWVlSCXdI3kWn7C0ObcrzK
	DFqdUiqKNDxmOfXX39Dz/QuvmV4hvC9UeqtFjR9MbLUCQ82LBKM7wCqX5ttOtjkvliMQQ8+INit
	1EQQL0kMP45Hr0dhwWyDE8MKh1lo2kHzVglVlD1qVbkutxaAho63/jyfnap3IYpLnMjw4WVzu1X
	5R/Z3Ut1zxejM/z1vbBul/qUd1kmOfe0h0RKN6J3luGrF18Y0O8vHfdo2hISluqfO19Umz1S0Iv
	HidRyL6D4bDay1W5INE7gEwJoIKV2zxZ2B7UqFKstJJoiRMz5vrG/TXRVfDT4r8iKOf14JDQRaB
	s2g/v4g49AiFiO
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id d75a77b69052e-532b6f9c339mr59088231cf.0.1789916507134;
        Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id d75a77b69052e-532b6f9c339mr59087721cf.0.1789916506618;
        Sun, 20 Sep 2026 08:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:31 +0300
Subject: [PATCH v5 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Message-Id: <20260920-hpd-irq-events-v5-6-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IHP/CEHKbEjbTAclh8cTAdfCEyItA+qP7FeirdUUoOg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VITghi4UzzRoE/FzgfbEnUTmORHJmboGa52
 XVMK6F5wo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1Sv7B/0YL5DFJ/q87OBtIjQCInHBNjJWVturTDYh0TaYHFvNJxrU6AlpJU7OUMxKsZfCeqyUQTp
 CLdTznZPfsk0pHv4sgAH3ivr8voWJgY0gF9WW1EDhy+P4p+MTBHcM6fSGNNsIxaGRc7ZDzEWqYJ
 ZrusLtSE1bZYR78wlMziU9RHUX5W7lZPN+sZ/zgMF3FdhkI5Rg4LVp8wHKA3aQLQ4QWGBQ9y2yu
 PfH+vAfW7MsNUXcAVZ0L3QCDqaZCQ5D86IfEyPSfSumHYKRgKikqjEy9a27zrbpMhb99EoIaIMA
 533IC393BTUb0jdbU8nuR0DF7Xsw2gXSG4kvX3t3JpEU/nx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: B1xtxXaHe_wJDe-QxS1ID627b1fZ7m9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX/8Pp2pAiIGZl
 rcYZgo7AO5nE7lzq0CmKlTftAjA1+OQKxPuHh8HlAB307SXoO/BU2LGsY1OwQL+kYjzETdGNaC1
 ffqqDO2VTIADIYgItL0qcG65OCYUi/xwJg5j3fmCm7yp8r2kasxCLgb6vqECyHFQEbDWpI4jHhk
 a1kPCauAWQHBhzF2ubaRBCBwvQpLLvHcMZBu+reKv12Fube1uDU4bYgJVpqCybSsYbUO69CT5qC
 WNTvx99Fy+HRFDBrbyqeogzLikCD/1BnYz3QJderxXBXqKpob31yPj/dA73ZTIKhiGdgirKFGKV
 TxClPbjmWAygQQqqNDr4A7qhCTFan6UzqE6276vTTzP155lJC40SDi5zI8gL/FLhogiicJXaVbT
 17RIhmi7Ggk+pMhnux2aSL4iJUUqc+NbRUg3iNlwO+JJH9kuR0WCZ4L9dwlkKvSSSzQlFeaC3HQ
 K/hY54l6zpre84qKC1g==
X-Proofpoint-ORIG-GUID: B1xtxXaHe_wJDe-QxS1ID627b1fZ7m9X
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaff55c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX6uYWah2ui84R
 pKdw1Goz2dRosvQ+X0zPAjvytVq5PfOmQxjYE4l9z1PjDeMP6wqxkCI3xvDdjeeBaLsx3WZu3kK
 h903PKlZIqii009mUQfM82NxkMZiF30=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080148_883770_C822563B 
X-CRM114-Status: GOOD (  13.71  )
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9308e373447c..a420e3d49928 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1559,11 +1559,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
+		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
