Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37F8CD4F3F
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 18:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4mJvwutebKolY+ECUmJGx2qq1dnFIgCPUerQXa3CFQ=; b=Q/JusRpXtyGjfF
	wLeqJ+ZKfEIa1rApyv85siiloKMVOvCPRITPppWQ7TQTGzGXQPaflP74gndjm6yJiQ3opVg9ou/9O
	+CpKH1LA/pEKfKWjnzHuK4zHDBxf+h5PdvfFU0Jfewe+8jpk3InAArMpaIdlpRIbyCuJpPZXNsJAq
	gOXMvZMelh8BYrMRVi1AYUXNWsreHU3pXG0TfrpkkB4/vdci301AztIG8xnfsuXUXN5Be7Yrzeckt
	MIZAVbdjkporNAqv/C1HvLHJ5YdJMNEV9P8r4nCFtLlTXPVya8JbpgF7iOMwSafHlvZm5tf+SCsZv
	E3LG1LLgNFdnV9QGrmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFi-00000003SZa-1EJd;
	Wed, 13 May 2026 18:24:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFe-00000003ST3-29sj
	for linux-amlogic@bombadil.infradead.org;
	Wed, 13 May 2026 18:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=QwCv2QwN1f1BTOcIX5IxgZ4b2n
	oPGuzw/KgJN5t2SPA1gCsV9Y4GznqJE4GXSc9PKtVQlfzHiFPIb/MZr1r6doY/POoa8ujrW+UJXYt
	RgDh8rtmIjAgpvPbseAVbfRn6Mnb9GDt4CR7B1socM3ZLS4Nox2/NPoC8RxVxA1s7YgBi5MpX/Wb8
	3OJSY0q4fxgr4l+w/yggL2uaQVJ7dre1z4hgdjaeTyjyJBlbzy/XzH0c+/jboz0OpMkRdyOK/kAn3
	kaN+GQLjbVGSx/6h2nZQ05y3QiQBzprmD6ig6zdAMO5kvS3eNPVoxQ/Y577okHXRCTvKwpuei756T
	ACaQzSrg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFa-00000000q9W-2rej
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 18:24:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DHUQFB1393501
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=Xs5+o8is26i9TDoz
	y3y7X36LjlcrVNTHGo46xIwoGiWfsMdLrS54s/66GDd4akyYZMGQR05NxojrB/R+
	x/9om5EnZ9cPMwmqjxdXO1GVzf+uLhKU5CcYtgZP3w1wETTy2UpkHnSCy0lTgFNF
	ha1pCTN8J/of06OBBF50O1zZWQNiYO0LjxltuBQ4cad3lD3n9Lbl5sffy0vcEfCL
	IoOHFVq8f5zOfv2bTths8NCpQ2GK04suj0VD8Xy6mhDvF5bNx4+W9zSZqTgl2C2M
	hBBxbdFwO6cc+uphD7iBz/MXTLPdYOgJZa1BHoEcpYdI1axmH16oOGw+BayBf7hp
	B5Hjqw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k26329p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:24:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63302aca17aso2256588137.1
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696644; x=1779301444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=h50pR/DMjSX5pm9d+0YRSZKDNdPAPuh/O4QGJUGXHs6Kfb+HTu5BS4KV5VbxDOMvH4
         XOO2aNmhNZwrVaCKk+/A/K5RW163vq+SEPWhrSarOr922Zl2Px4qv7Tr8cMTB5+QhvPw
         zuiVWJ3xXUHkNZxl3HKsVvKoufIoMuTL49rJHSF+S2v9wQkICcwSSNZJg5uQRRWQJmcr
         dF/AT5UYg5HUdQUKAjAIULwBn0Mp8p1Lq0V4iheulWectNLiskdLiK5+3OggFl0Vic1o
         y1rh/BqMvRbXCsSPC1uA8iHrzR7KLl9ZQ3Ir2PuT5S5nxL0ANTR8oBmNQo78JFLPswAA
         rBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696644; x=1779301444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=arKe68CgOFq1+gcldIxH5Q+eccU1hdBrbpmEHH5w2ApjOz0PMD+SvvK9QksrN4+6lS
         cwrItdIydmkLN8FynEPBTqH/ewZe19lDDG0WBvIGf/sAdWP5MEnznIUwj9lyLWlu9oep
         erE3MTuaNDY3HBLSqvV/ke7SLzFN1y//1IORx1LEcIv4uMp6Y2iy1bybNSDF3wt/mBnQ
         hZ/7XmyHWz/IO0WF793SvrUTxOw0a96IZLYLSliytEcbhHZC/vxb4nVy86X4QWsAfgAG
         niJszp84xksx/BmZ4ldD+AvTxRU+vMKNvY8Og1q4PDsq6WlQ4Qoo0QJFB9zgB+XLyoeP
         Vs0A==
X-Forwarded-Encrypted: i=1; AFNElJ/gGb+1XXymG8OX2bp7C2+Q0Ggcxn5BfFYmn1Qn05eLNNZC8v1bKNbjkVxas3ApUrbS4k7KiyKs7bvrHMiE@lists.infradead.org
X-Gm-Message-State: AOJu0YxRNIzaWxoUMC193lXFBRap43PQukIpeRS0gjRgDe/+rF8wFjvt
	RXDNbVp30Xw0a+PwNKLPyzyMP0m4wqEH5sSPcIagJjEg4OpsW1QBUb/q6r6llBY1JQA4A5kvJ4h
	g6XZIc4J2suWifIYv/EO2hwCtD6tBQTHgHtQs8iuXw7fErwIk3Wm8NhfSM2WHi7sv5leLuca3vg
	==
X-Gm-Gg: Acq92OHyMQGKT5t+wLwaQAVuH64jt+M6n09F2Uinn00QeFkjo6Yco6D9dDc7yXxu/GV
	6xw03bOfs/seZSkjcJNzPHMFq8ktcUwQXmLoOTH0YKTG9JRX0v2R/QRcNicsSq11BXaO50N+wmT
	rdnX0mhvkpzP4vzrxC97rRXBjUbJe3teBVtruaKteL0DL1EGthiUFgq49heNdc2s+xwoPQV7KlT
	vxA55oTGo8iT8FOmCaaS35wHvHoTiZoZceGsPJquV5Vkir+jQGWY7GIgKJ8DCqk8NBNOptixaT6
	nnFn7vlfa5xDgnMUxCO2T4a7BqU02ke4LKPDs2uICK4mLAo8nYoV+uPrIpHfBGhcN1EKmm3keGp
	iiWMtouAy+9WBlpfSCqVt+mCCdq0iY66xcjJNNrS2PLw2KQuSvLBgXZXthO8NkA6nNEIwJoSlK3
	le79NlX2CowSe9ObgPfIiqReLCSV9Gw2j4UMw1k4MK1VO8YA==
X-Received: by 2002:a05:6102:4a95:b0:631:2a80:e492 with SMTP id ada2fe7eead31-63774777cf0mr2754215137.30.1778696644194;
        Wed, 13 May 2026 11:24:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4a95:b0:631:2a80:e492 with SMTP id ada2fe7eead31-63774777cf0mr2754191137.30.1778696643647;
        Wed, 13 May 2026 11:24:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:26 +0300
Subject: [PATCH RESEND v3 6/6] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
MIME-Version: 1.0
Message-Id: <20260513-hpd-irq-events-v3-6-086857017f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0hilhJ2gGkZQQxe/0GBPH0fFPTqqZlimMt
 5EPtgQGMWaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1UfqB/sEB1F2WFxCMTR2F1PIB/yP08QefwUon51gJHLQXhYRVsVZgMzGsE56RR40iDFtt0PCNNR
 e8/bhQUFNOGrzI8yy7h2fUumtwY6WquWhqqhJdrMaos/EEi0wqo92efWacjzI8ohK4UFbJt5bjN
 ffYm9hQw7mZu7rzFKn0nk5m4neMOewWtG2qMy4tDxV+FcYWNWYNdbOIiroBSVTXPvibDr1zfc6B
 lWhGMFxqUSjlgv/QMEhFapwgacJOv8N956Zein+/YYHUDvNrrMCD25WxF9YwwoRqVq6nRJacaJq
 0UUW8vbtRRRMty0+1dZCHZVxEpa+Qw3X4pIkBQ/WmrrFhFvO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04c1c5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX4uYiBca72Nvj
 dGbFwcn77TTKyjcW/MAT1GX889Nfyz7oRXrLb6Oj7WUk0qW1/4xXZQuyjXv+5Dpmdle4q18CpNk
 45qp5ujpyeO4+LbniAQ06zPrk1xLC3Mne9a8BUVacuMeLIVL2wPVFDII7Gwm4LiNg9x8RELnttT
 SEWfqnEgm4jo4ZZzUYk/2IOX1EEO2Q0WAy4e7UjieWWAj1CBghYhbgiGOjChJ8A1yVu/hsij7cC
 cz+ZEAKc6YXw7x53j8mDzGUzTkU8ovyV7wvIg42PgI3PcUfeMfjeOnmoSyz4ADGIFT4bEjgkKKX
 oDYsbiKIo9DF2MN7LXTG8bN6wZY6hH/tGyYj9ulPnc4nAOWmvUIZfYyHbsZbc0BSVLcSly5Z0rR
 H0xp9zap4hyOJbFaR4T+X1XFdQMVTGTb2OUBm5qpZd4wgZxtnjIpMQjp2eSPFaA8gu8jPvHpPlo
 XTawpQSPzHF/pTZVF4Q==
X-Proofpoint-ORIG-GUID: H_O1hJZVtdmQSJ5ROvWIcu0AO87u99Fz
X-Proofpoint-GUID: H_O1hJZVtdmQSJ5ROvWIcu0AO87u99Fz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_192407_494082_61BABD98 
X-CRM114-Status: GOOD (  11.02  )
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

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..5e3f887ecbd8 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,13 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
