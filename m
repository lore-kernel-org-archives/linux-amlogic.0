Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B2CD8C9F
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F61/0b9+XZyA0dr492oa4on5RmqHD0TknqsOwVkk/jg=; b=ghthaBVg3Y3b+t
	zfu1tD3WMevqwgTgyFAPKn6c6YiKn4gtizqr5yhHBUURmrEQvGuKGuLNmZIG23kH81yd+X0yilbVU
	8/2RbACQeKvhreLHYyi2x78lIIOm4ktr7pOuHRKV7td8fSXAcmv5puosyaXnyYb9qWtBC5FBkU6Aq
	S06WnwyGVSKZu3qUstxRPtnnf4d03ywhAAwm/y/BMfyFIITf3XBeiXGMHZQ47Kg0p4KZ115TQSynb
	rVAyumC1lC+etZ59KbhhRwWBezmFPEZMdRGnQbmOhiwM5WZ//Q410BW3yekHQ+HztVK/QPtoVWvB8
	B37kZJP9qOtY4wNhdnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7n-00000002VnX-0Lgc;
	Sun, 07 Jun 2026 21:33:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7k-00000002Vhp-0EaV
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:33:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElEwi827670
	for <linux-amlogic@lists.infradead.org>; Sun, 7 Jun 2026 21:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=; b=EiVvTbWMNddLSWaX
	m3G9rugq0EFbtLfwWqsRQ3hFgDPCVYJysVU7USetWURk2Wuq306mU05XNloSioDW
	jcsrziM9VNVsqT8zM4nuiL99YeswMiGt/cBhD/5Ose//4pxfRa7cPiBA+2a1SyDN
	+q3U49r1JRYSaK875YDBzAylCpDWi+xrsj1jXbNdJS1i8JWKIUaNzNki86Ky4ahB
	BWtjMrua70BmHtF4shrL32VKmvGOviGHCrb+UuPkdZvshfA5ml2l0oCTfwBwuzgl
	Q+GZbCfbRiPXyolSgympyGUcISNKDocU+ul3Bdmzao2loCOm/mFaVhfiWhgxhjCF
	34NSUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6cr1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 21:33:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175aa1a54bso83214981cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 14:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868018; x=1781472818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=;
        b=P76RpIloJzp0yC4wLFJhkHcvm1nL2ceTX/yF2GChplt0X6avd7fBMA+dmkAxryxgWe
         oJ30nFtjHoLt90TPZRfMem+B0b+JivKbLpsb6cRCwIvOTC+v8i4Ko6MJl4xn8WPjGgV6
         U3gg4eNxWdIwNFI4aFdbyyOMhN7JK01Q8Iu+cPgqk1iscbSrKDCgHNp+3Ap9hwxfXpxi
         TxntdakKVOWKQKC1PT0GPHhKS7J2ZJCWddgtKpimejeqk/3YUerZEw5N3hAwE4J0VM14
         p21+/CRfyJ/jILA0ar9H/vhT1fLaLGVMfm/3rvf0aSPjqsGBQN6cM8K9p5OaKFInrd7U
         e9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868018; x=1781472818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=;
        b=aeWYGz3dBNL2gPJMpBudKgJrONudNh34zeyI77bZB5SPFT3Q/OpN3RPuW6F6JhaPRx
         8k/v/Y0HMrw2yIz+6XdzSZbVH/Z6GdwEi3KfM/1IINRB9GmKTL5ZgDF4w82rJj/wxNcM
         eqDlE/6hLdMZbfKE4kDyw3rev/NMUrih/BtWgFTU5zQYd+dWgsO5DF6EX/Ij4hCkWYuJ
         gWL6kS4fnEk1+WYX4jLJFCA1CwUYRv7gpKW9Ox+nrYT6KWg893Ib41tzIXxkiEzSZVWJ
         XsyyIdKI1z54c+CV4iiIZIgC8MZjDzK55kGuIoRAO/IB6GUjgAaAHOMFt9/EHtU5NL2Y
         d9LQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wi8i3pZb18yVuh7bpNmJl/uZQMst+hDC1CJhMqWhMPKZwQnaflA0JTu2aTdYMXyVxL3unz6qNwGrkBgDa@lists.infradead.org
X-Gm-Message-State: AOJu0YwlC9z4Z5Qu9FFTCtPbQOgKIAkXqWbwo6wM0+RZPzJesfh6Gns0
	4Sc4L5nzDuaOkK20ocfBmF/EE6SIiFNKf0xUeAEhEEskW2KHynbnZuBTsTl0O0npCfJF5Ggmsyt
	+rG7/fOKbFdjJStufmEOK2uRhdKSkOEq5pfSs2debitpGYCgDXUF6jVmuarSe1wVmF0xenbDR5Q
	==
X-Gm-Gg: Acq92OFOC7nVqkou5MoXIZWhzhIFZjB+yAq3Vx5LUPtX8SjGuJq6Q51Sn+WqLDtSZqG
	2v27dD7XtBpAhVn+cYeh8d5X0anUKjME9cKr8Om54YFUFA9c34cA2VaAuYEze7rSUZJw+b7e5H1
	jmbxlgUiuCvHGBmf0QUQw00NL7NBYmJGMLlMAu3k4xBd3Y3IGNuKlcl0MoJlV6ipQSprIxa4+8I
	aLi9nbYtFKgk4MAghVcIH1wyMPeBaAHPVSEzCOWyM/Zx3snwK7fkx/lHSRkcwF44gXWIlG+A8l9
	DjKMdhHEDYI4RS9dzDX5dFQ7Vn/yIlRFsjq04seE0AywclqrO5lhbVgtfwcEcbCoexzez9k6lGq
	sOORMgyXYkWxNo+DBka9iuukwsQ1TzXl+CGWSzT+waTGoHFNlcDgB4xu+k0JDgC3L8MxhTzvGnK
	YSsgUhM+/1Mb+EnibG9Wyzh9G32uL8LBVBeiqpAALTFvQmGw==
X-Received: by 2002:a05:622a:7d92:b0:517:b68a:8d8f with SMTP id d75a77b69052e-517b699d7d4mr24581201cf.19.1780868018460;
        Sun, 07 Jun 2026 14:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:7d92:b0:517:b68a:8d8f with SMTP id d75a77b69052e-517b699d7d4mr24580671cf.19.1780868017994;
        Sun, 07 Jun 2026 14:33:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:09 +0300
Subject: [PATCH v4 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Message-Id: <20260608-hpd-irq-events-v4-8-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3SjZ31inNFNocQI2RmpCu4Tw/qg0rtSCt0SZ5oE3dI8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQ0bhQoOsJj857BdAUiqH5pox278y0oAyGy
 RFMbu1dyjqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1adXB/9gLuR7QGRjAk+HXqf2b8R0PyE0WvdRPYlehmbvDdwTKUxzBuDzzuiV0kTay/bmwkqLoYP
 eSEgECp1mqSpjvxIbCTbpUNLT81GFFEDtjKOgp0EizyaOAmRWZF431B/LHJEqBNRywGDAMR6g28
 XBko5Ih990ex9CIhpqFhfLNy8a/OK0J8+WGQPmWoxwIt9PsO976mFy3iFyD5v4yPJ19GDBS9g1L
 mBGAh4TQw1r6fDBZ0z7VjlgWvcKT0EJs+3W6Mwh/6R/5YhL3raA9bpt8HLs1yUxKd/64FRiW39e
 4xRBwvcrgMfsxCVs47NwyImiptqBmFZy7rW5+/2YVxJAwuCc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25e3b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX+V6ch2wKk1vS
 JAPuCDnDwJUneTcFkTNhmXy7jWJZURRYWniw5y+rLjGJ7f33eExdGqH7e5uFX9CRNH7YN0EcsAU
 dly6aLM7+3WFlsN7/2ILgy3GLREra03E2wrS6u3kL/YaFZjmnggdhOQiTpyJRvpIa3Oj315WXei
 zIvKelKlXBdMTDHMVLtOnhFA8I95+i79bwZjIU/nZb9d5Bni0Vg8nMh3toDJ9OsqNiNjUFaCY+X
 lAqmLD0AuKJhThpU8yp11gLLPA99FAzIWHKHlp4E14UHVIT7I25fDVBruYIfyLCr6VUr8HLcCKM
 GplD5543VtYmO4/kQQsZt5/NTI6S3t16OmLy5Hhhu7tbmBI6gjQzhK1kgI4eRmwkAGNEmFAXDBN
 GnPoGga/mn1Sk4VtZ+erDRWdgF6nT1LnSVCi2RveI5WL35GSHi7rSg20CnI82+jOQLeEAMCyE0z
 VvarZ14ctGiEUv9G1VA==
X-Proofpoint-GUID: 7MRBdN-KCocTD9YczzoTNbG4J2BMJXpx
X-Proofpoint-ORIG-GUID: 7MRBdN-KCocTD9YczzoTNbG4J2BMJXpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_143340_297659_63ACBD64 
X-CRM114-Status: GOOD (  11.50  )
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

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

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
