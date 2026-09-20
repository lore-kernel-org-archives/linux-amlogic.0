Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C391BC982E1
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DepI3C/VrRbvc6DZ+X4QGrnF/3burd6q+yAImCYQFQ0=; b=amkTmn2ArMRo2g
	8Y100Q9yGC0EdeSNKwAmd7gnkXT8LidUFQmBWRhJE/dazJnxmzGtEODi8kRROOKuNHQIvWDjKtgIz
	4o+UPzYPY9819ksjnwLdGpAdo9yXVO260ZjMlbZCtrrkwE2hHMgGBwuySE1JHgmC2H8OWgApWEsUQ
	/ntQ6f2fNi1AbINVHbAjoULo2i7ufriQhcEGbDHhVcTMdudgRRUChl5rZTfXIWlhiz1Anik0lCS24
	7Hm8tme3jR6RbaFsVUSySKZjsZEqqIzOzmAmh9BKdvGs1jTK7xkI4V+R6Fvo7U+TGipkG5COZe7zG
	kXEPNEWHzLhL9uzhPOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J30-000000000wY-3oDF;
	Sun, 20 Sep 2026 15:01:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J2v-000000000t9-37Io
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:01:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnmsX2568986
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cFBw/9MveNooP76MRdC5+S
	4XLI9vlDs3jbwQiSM5tkM=; b=bEPQODQdVajwiKS7seZzZCY40NdK/hsGB8CCKY
	tfxlNyICqlYzvW+IeKuuNl2mqUw3jYhqMKW2Y9pZaE2SL6DYJT4KXDPpkDjLXdSp
	fH9j4kaj0/VBkpeQMa3CPinKZludEQs463RZuqlLCtLhBp2VXssCTk31aOamy08p
	g1Qdy7WcUkuVQ87mRpeJwrXCA1lpVf9IKgHBiInqtdgaBdeUODG+A1MJafHybP+q
	lAfvq/c8pzf3BelrfId9PquV4ApQCXfsbhrtODTE5fH+3+m4n4jwZTVV0Pv/Jv+R
	KOHbORGCx9al2dTYZOcqkL4Md9XW+4CMRjI/5662ZtldxXwA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfuk701-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7847917c402so2157029137.2
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916495; x=1790521295; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cFBw/9MveNooP76MRdC5+S4XLI9vlDs3jbwQiSM5tkM=;
        b=AkfevRQduj9McXnoOjbWzagyBcntjXxwuThS1Wc9riIDh3FVG0YQYcufk1iZB/vAvz
         pc+lsliTsCXmski7FyvVqBkw1M5Fs74elsk6SLuUwNVdU4BbpxgmKIxkDr8UihRhyBWl
         MI+cnzBQV7LOZRsKJ9H7plzqAc2aVEP+ArvfWms8OIFC0XrokLqUxIedIa6jXJr7PdIC
         Ci0iTuZS/x1Fm9rMaS0yIdyhMnN1yAjhBTQfIwxFTLDKKFTxl3oxxGrnU6mDAkbNVcEZ
         gxxX/9FIt/hKFOJnuoIzqBkSKFWIuxkaIS0w+jpoQe0u2dRam90xI4RhyOIy4DDGy47t
         97Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916495; x=1790521295;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cFBw/9MveNooP76MRdC5+S4XLI9vlDs3jbwQiSM5tkM=;
        b=jsVlXRk4p2WXfovk4lbR9Jafqw4qdAclRNK/xc7BAorxRpbTGFCDxc43TC1alGxm9z
         O7hUY5ZxgsFlxSCXiQrTHqSGJ5YQF6O/QTTWH60wyL0hr8WXhZTnEiDMV1sd6TghKdGg
         X1sOrFJLlGi9wg49fOcEs8cGCmrLRHrkG2dnm759LSGSHLq+WzjyZi6E4n2JiAf72mMp
         wRBn7VP/tZF4jK7/7uhb0kscn6nfhRYpXGXcp0TyU/rfjp/0qg8ZCtWk5lFsqfcWXmfm
         cHWA1tSL9kltjhtEG7MkUBumWw3SfCejbd2WZcWpuF5kh+Mjn8f+B6NJ3oNxcmpGfMvF
         Kcyw==
X-Forwarded-Encrypted: i=1; AKwUvBw938M4l7zJdmCXPrm3NGJqZMM52qvB75Vv8oSH3NJ+C9mt/eCT2ETtGYMYmb0wIMLSXHfiWKG5f0EA8fq6@lists.infradead.org
X-Gm-Message-State: AFuF++lBFIfqZQFcoaBAv/QGDupCfoAgHG3VQVMjhYKTBmZvzP6w9EZl
	xDLkPHvHyutDkzsILgVXqvcB5s7EUovhks2y4l0HERmvSMeuW2kGKViRGjvM+wa7u+cvD7WQuIp
	4srFMp8HX62WBiqB0+Q6z/r9sMeqD3pXnaJNCfzDCToiWE3+Y2u2nxs66O+q7vjDtNSGtGDtAgQ
	==
X-Gm-Gg: AYBFou3OY4vFLTdPEA8mzI+W+17/Mzae2x3tSeqmPnbcu067p4mUj6SuraU0bGPYTBa
	fxBbV3e+X0lZck6VOzcMOsPwbBmc6l8BpreSQTwtniTxSC1eD8OTgbs+I1YyG2OtNZxV0E8VVAq
	e8fFsh+hk0u061WdIjkkoYnRCw8FHEFu9adWe+/q/60aodT5+pkhcnLKEh7Hm5kE8YoCQfDYdTe
	FzJXZW7NZc8LSAx4Dm8tKZUWoMfPJSIY1vWeKyasvltyMQoni/5dG7oG/UWlQne6gcJU7qH+aY9
	Xznk6oFfZAJW8GMRIqt7YDzP7cRgi4dlEmdRwwZk6PCAiIWsywxNsl+TpNrtQISYbvxUc2U5OHN
	kOIChWdNdzNPJ/UQo9vWirB3FS8XLUP8yNRokS4NTlhA1LRU5eqER2bJusu0l3caAQI4iB5CXmi
	BaEtb995WmHMMQ
X-Received: by 2002:a05:6102:41aa:b0:7a7:19aa:8a83 with SMTP id ada2fe7eead31-7a719aa90ccmr1489164137.30.1789916493888;
        Sun, 20 Sep 2026 08:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:41aa:b0:7a7:19aa:8a83 with SMTP id ada2fe7eead31-7a719aa90ccmr1488929137.30.1789916492529;
        Sun, 20 Sep 2026 08:01:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/8] drm: handle IRQ_HPD events correctly
Date: Sun, 20 Sep 2026 18:01:25 +0300
Message-Id: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEX1r2oC/3XOwW7CMAwG4FdBORPkOGkKO+09EIcmddYgaCEpE
 Qj13ZcwTUMrXCz90u/PvrNIwVNkH4s7C5R89EOfQ7VcMNs1/Rdx3+bMEFCDEop3p5b7cOaUqB8
 jpxqNhVo3lRMsL50COX99gNvdT44Xsyc7FqU0Oh/HIdweF5MovV9c/8eT4MBFY4QT1hk0+DnEu
 DpfmoMdjsdVHqzcSPikIMwUzIoCdI6wpg1t3ijyWREzRRZFtWicgtbZd7+oP0XDeqaorEgwGo2
 UlVrXL5Rpmr4BRq0de5cBAAA=
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
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
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5586;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T1aSMkDvUg9F4iAHgfR3ruSI6UlGC1w9a/0Vrd6WDtY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHrDBA6z2QkqCb4MlukXsy8f/Bwm2WbvbLS
 PGY3/CGZ3+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1bS6CACQo4YyOra9XHAUD9XHzteIJFP/nsaDjZ+koYADIdi0trNeItVnSKMahos3SM31s4f1c/q
 ceNCJ52X48MeITEomzforKgCxg0XK1ezaqRv6uG1aVV77k/9sF4E5Natyst5gWP5cOJTIFC/1Jp
 nHPhYixemqLOxMTjpoE5GtQe7ywIdmSpK/Xs/DV6vJHJEzuZ7mpIxx8qEsaAcsMgOJBF/5TWfC/
 kknru+qOu3skUf6igt4HV4diKuE7eR/iwW68hXcGO8SUV6XHphEWDwPdF+VX9tBvfOu+/pMxn1j
 TWEE2AtnruYKINyRc1QKY8wT/gDFZgCK8OkhhuEcReyWAO5m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX25jIdY9l/tMF
 F3AAePmdbdYx5b60peS9u+ZHi5dynLfD6jXxPYJxHhylRBci0JCGj9HncErEPRwTUvECM+TnWgQ
 fHD6ZszdCVT4ZNc5VS5KcESHwbSggsA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX1SBP7PWA8ST1
 V3ZIhozyquFuu9JAW+6ZCrHTAqdIW8cYZahOhM9BeJrv9JzwJu3G5HQ+Dsu30JX9I9gKBrFtPh1
 zVXHAYRXSi2R34MiZTgD4omT+T03SguJV0RhJoudO9tBQLoAP4Uuc2g/6/2ZdPapicWyLex4l6E
 lYb8hGEMbc975M3wUJB6uAnw+YD//PMrH+VWFYA37G68zELqnjyeuy8nAUqO8gaEE85vjjmq2QS
 9hZZT4V4PrpfJBOxT2G7dnx1u813bhUtW+NF6bqb1CIOPGH1uzEop/tjpe3XVRiBnjZt9/qtw47
 cXezzcjih9wKNWkfAwcWnujQV0hVPD+Uxf5YWqAO7cWFwPWV2yctTc9b1QBPb4T1H9uOjKil5nI
 +cTTkh9t+DyY3sQcMRUqmeXD++9BD0XJarfhY9LOXr45cdpzX3qLv6Dt8G9fs67CcTCJ0sxADIk
 zc9o1BsGruqhA0B2DuA==
X-Proofpoint-ORIG-GUID: MiXhhA9e1neoESOWEag1n7rXSYUQniTK
X-Proofpoint-GUID: MiXhhA9e1neoESOWEag1n7rXSYUQniTK
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaff550 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=eKQTCwoLd85be8zhlTQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22 a=3gWm3jAn84ENXaBijsEo:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
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
X-CRM114-CacheID: sfid-20260920_080137_908323_32AA8AB8 
X-CRM114-Status: GOOD (  15.70  )
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

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Renamed drm_connector_status_extra to drm_connector_dp_event (Maxime)
- Link to v4: https://patch.msgid.link/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

Changes in v4:
- Renamed drm_connector_oob_hotplug_event() to
  drm_connector_dp_oob_status() (Maxime)
- Reworked commit messages, explaining what it is about (Bjorn)
- Rearranged commits, making them a bit more logical.
- Link to v3: https://patch.msgid.link/20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com

Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Francesco Dolcini <francesco@dolcini.it>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Dmitry Baryshkov (8):
      drm/connector: report out-of-band IRQ_HPD events
      drm/connector: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/bridge: pass extra events to the HPD callback
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                | 22 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 10 +++++----
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 23 ++++++++++++-------
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 24 +++++++++++++++++---
 19 files changed, 152 insertions(+), 65 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
