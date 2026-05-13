Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135EACD4F3E
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 18:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZye0fx6YPdjH0kFvgAHvUxfnYoU0hcA/EeDnBwL2R8=; b=qkZ+VlRfpuO3UK
	0wxC27dKLHldKsHhqxDO/IV4NrU3M9vlVEw8XnnMC8iAl7bknHHdCDhb/8dridJz7uYTRKfaMSM4e
	ZZPCWDL6MYTujJCftodL6c7C00BeC6QsmeTAYJ7+o5x5gXbXPRdaToW6rc0v2Q9YPxhrr1KjWEFXD
	iQLOoICDAG+1D40LXxe6W2hkRLxrPWfrysGtg/qCq1qgDN+Tjke/MveUpAslkxxHTokgAXfF5lOzr
	uNLmmuNU39Y27/kQsUW93vVnGmjbaF5Wh2taDsJaPgfiKZAjKbES0ynI6JowG2TRmq05VFujDSaQC
	xnwep7t7saDdV4tfsZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFh-00000003SXi-2pgq;
	Wed, 13 May 2026 18:24:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFY-00000003SNu-0CSq
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 18:24:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBmUfS2965306
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=adOOFUnqD/cK+eQt
	lzJ7pMMU0fq91KwakaSBkYOagBIE6/8cH83nWlAgh3JSK+ZkPY4lAYueqom0Oa9f
	wc0pEl0e0UaS0c+Kynn1xjQhLjmV7cdGToDW1gWuSiqaiuWP4AmvLFddcO31vAPI
	WxptBTOrewx+2AHw1RuIc5ZHyq9RjarZWhCQo7wYpRN/X2Jy3TUYWOAnur1+AhRP
	8/4VE+NdttnJicMKGweDNaMHGF0o0bkdvpC0g0eExp34w0X2Tt7qclAjhSXjw2ih
	g1GEQyi5cDWpRFm3VROExFq1gsIisJCw1lhQn4ZCAxW+/hJapsL2ANbARxN8JZyS
	XyYgDA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5as1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:24:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63309595daeso5844714137.2
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696643; x=1779301443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=BMkcAdd6aTHoiWRFrQhmT8DPVsCykISGzicifRivpaPraLS2r519r0HXBFeW3JzJiJ
         fYfj5lKEoHtPOE8uIEFzq9sWrPMPTf0GtL+m/bLYqCfUKFMUeQocIgGPMnwoa/a6CFU4
         5o35EuPeFD0pvYS1i6kfuhXlU0YhxXLRLFc/evL5dLXixIobbgLOeGsEJyMS8saFqLrD
         dxuPk20tBoRO807D5D9BJLji/cbKr9zDbg+cZELPDVSVXxWatv5Kgnvyc5pwZ7WaiD7T
         vPVbaVSXPeyGQn0n7skDrEpj4HqUjKF4YpCJtu3QQKkT/4tRBBDrtX86vlP2l70GHJRI
         Q0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696643; x=1779301443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=KiGiME8WKz4bTaUBPjtfcNjB4rq6x9DlYVnd69n6DrNQNvwkLHK35AoxmdBj731W1w
         0e9/bF47MONgSStXqAGjU9kCiSsoTrAt4EB/GWnYiQ04Kowvk03zZMQUb2NzYeE36w+m
         nJG45esSg+4r+nfXZif0vrsivUOaBOa6Xi/pA6ahnwGd4zo7eoYCyNflPVps9/gEiJa6
         anOKGTNhxJoZJbsVmu7n3Eai3O9u55e5jQJverOpDr7OxA0RglJmhXsm1/u+ty1nxXxW
         jX9qmw1e8IYsEm6TsWoxUzOP69ksoL6IsijPpkidEot/bghWYLCk6+equhfmfKQi80Xn
         +R+A==
X-Forwarded-Encrypted: i=1; AFNElJ9egnFPGnYcPFQ0R/iOV9YiinpTTEDNQsqPsx9mPfzhgZJo7GyURZNi7AaZhrGfQH4JfcHozppRzJ8hXeJh@lists.infradead.org
X-Gm-Message-State: AOJu0YyI1HFGVAyDczgyqBrkYodoaCSPisczGGcJ1dKFWfAZ4XjFe1S2
	aYOzzIL+azTXti5yWxT9hMEYV1WAZKxKjamIlnuECtdWNhtBlrRjhEfJabfR4zTxJDaKPhyh2/l
	7U5ArY2NFVie0LGJ3wSgqO8jERzmvOwOd6r9GgLhSO907wjCgbyaQrvZR5D4w35Si6EB/Ko03WA
	==
X-Gm-Gg: Acq92OHavrLbRXNLjJemRd0WrM7xxuQj1p3+SRiACojezEyk7hSI0zzVOlQqMR9cYkP
	3jntPmOWP2jD0HPvuLHZpKYhUpT4uPNY/P1rgvNvdeYFlBAAo4I7dMyOn1zUC3IIAka66bmDR04
	s6S6msrsj29g021Ilq/gxbKH7ufJsPXa4LVRyTsZnX27Aicn+SQbDyho1AgtAqp0ssOumsJ89Mf
	68ZNKNBWNmqhPaF0nXF/zJgaMZT/oHCU/kNFtKkZ0hQGC7ln7PXshNLgZksAADsTRrsVwAvPVvS
	CC/teyxvLZHY4Gag+adKQk8jgrMRlpg3o5nuB64fgvILecfZE3sYcZeP6Y0bdK24JymyWlAzUnt
	gqTDqON5dTb8uMFtwhqNeXmkPSwwabfvXLnNOis0/pw0nuRaP7lqEw0g5JphnigTbohbec5dmfO
	jUNyABLC//e8II03ovuQcerFzVGNMJ75AqyuU=
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-637754eace2mr2861805137.17.1778696642571;
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-637754eace2mr2861750137.17.1778696642033;
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:24:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:25 +0300
Subject: [PATCH RESEND v3 5/6] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
MIME-Version: 1.0
Message-Id: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0drlwCbTuEWcWCuHk7pQDuuarVA3oztNqH
 T7Bd2hVw3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1RL7B/4jgrhGIEZynL+WT5KesqjMHxOK4WlzF0fcjJVPHChMLdUytHaxmufdMqTgSy0mcUbDBn9
 6q+vvyQ6qYt0ElA3eZFhzZswAyCgcR8e4VTK8o8hpdhNHHqN0OnWTYPFN2SHs8+2VNdnQpl3rl6
 nMO0qA5XZZ0N0MW59OPPIDbL7bNNmFqUKmIe2WCRfvquF0In8ReMbRiQJj7LkMVsU4X/WUHvw1c
 D8V8E3vb27NV4op4UtcX7LQjtY/tpC3kuvEBz1k0eDC+LlEa/A9pzrNHGsDflhVd9anRh7OF2dP
 6y+RL8SzW1ovqNGn+6AgKDUbs46tJjRUUkfsmEfNEOEnsmEN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX7patqHOwJPHx
 Fc2NPmUPiZsKO2o01q/Qw5E6WynFUKn5O56Y7zIseDBLmn9Oe1wFjqCr7zLh4zds5jopkAlGvVS
 D3rRE0rhenlcZem4IxKoCLyYhdHx/gzg7RbS2lJ7BOX/BgnLCR/LMVx5fHSZZngpnlLIUox1+HE
 JVjzOIsUNktb+StW6GQEgFGji5FIL0toS3rHX5lLVJBCt3gV3wkgT1OJEWNqvQSSzOopOLw8Pe+
 k3APmhUxImNpJjy1WzCehK7yv90r94QrCAiyJhqyVUy5umAcQvFWE95bM1Tvj5A2reCTAX8pr+G
 fpW/BLSDmn6SR+ac1w5hYZxeV58iZynvtblKT2Ng5iYNOdnOCM6P9I9dUyHGO3NNdKjsdI/RQ1p
 KUjSvQP6YeJyc//NDUbbGTb5PC0s7WzY4qX+0mcBpzyexfM7FQ6b7ZMH9QScXLTs34sTbm0XQYQ
 hCH+eaQc5JJoSDSZDYw==
X-Proofpoint-ORIG-GUID: bF0UBcGax2_I7EMKmqdHPXZDR-pTS4_M
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04c1c3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: bF0UBcGax2_I7EMKmqdHPXZDR-pTS4_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112404_109534_D9BC930C 
X-CRM114-Status: GOOD (  12.01  )
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
