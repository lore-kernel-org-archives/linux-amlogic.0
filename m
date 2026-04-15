Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C26F433CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 23:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAr9mTo6z0g2a6bWGPth175DaY5TIKnm/DEoilNVowQ=; b=CntXwo6dMZm8xg
	Aeoq+0RoQKytpZsr2FguVRefFwuNIxzM4giHVscbn94UQdjeKWMNt0uXjYFCK+MUTswIqEILTumzR
	VKsYF9WOY2NSg6hxlZ7d1V64MDcjvpQrD2GPPln3D+Cjut7+jRYzsHxPRvA/NR0TK3fjQd6OpVq8l
	MPe9KB8uGezxelqDj8HLSv9awgRKuSSvuWO2vyWA4P1JWE9/BdzZ9hWUtEqsseCE5nNM291rb1OKN
	vbKJ69ggDYq7PN8f+AgWs7SubQhab842nuCSutN7/9vF5LJwbiRqV9MQ2KmuK3Dnc9wEeaAYhimeA
	1wAwzZMYpimYu06G6FHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZS-00000001jrY-2yFo;
	Wed, 15 Apr 2026 23:22:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZI-00000001jli-3jOs
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFFmqd1792421
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=; b=ecU/bmn9v1itzIBb
	68x+4zJohm4hFwl+P/1pO62Wz+JE+YbZGYSTfNve8Xf74w4ihxA5XEqHWqZedt57
	6LWs4oFYLn9iE/P7lv/E1xQD+ohk7jNq41w6g6hDkBB7WnUjESAoNJEftCtY7WET
	AV3Wx+itysbZUglZw/CJ5WTPnZfPumUjJ/nnLkE/PBtf4NWxHxkGhpiHN6TLx7HQ
	Dm2OLDmS9ZPFxfkY8gjXk+haWXqV8fejehk6KYMuplKf4k3envkRCXsUzF7fu9py
	7EpaSjl8qxAxQUYmoUSi2Mj1H/a5UWHwMFvzLR7ZhBsNfGQM0r42XIVbce5xFZUe
	6vx92g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd5pse40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso195385491cf.1
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 16:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295367; x=1776900167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=;
        b=RY9XhJmULbdwRtCtSTKJm22vBxQ+kLOGxPlx2SmxaPI318MTi/jmu6bXk3SNXYLCdL
         GhLNxW75JPUYH5nl/bbSGGqGN4dfdxzF7pvxlb9LcFFc7LKwPy+gGNep+bhrdNtEnOLm
         pX6dNBCXrEdgbTvKE6BgyqBs3sR9jXB9PfrUrGaRNFl+DupbmN5G2nGFkfZ+/tfa9bvH
         ebnO06bXSCXTI9rlmsiA5rHlP0m6Xa37e6IFnOEmyMKWfhvBRcITVryu771LzGrKSp4f
         t6oDnjl+DgsO2ro61SUaBMm9wf8FsOPmSDlSsJ0THZa6YRM8RxL6+vOGDdq9COYj5GLx
         wtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295367; x=1776900167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=;
        b=OOZD0G7URIAshTeu7G3HNZ6QYo6Xp3v8Bx57tTmuO/R5rMjkn7iQ7dWR0wrMDpDgHq
         /viv6vnRleEDHJAJqQo9Jc8ndybMHo8ZrFkcaq9e/K+5+c75sXyO7KZuaiHFMT72rs8n
         NlLKLu1qOw6sUAtlBgLeYUmuwAbsxIW4nYN5pcuD0a2hmOTiY/eMF63vUesWGTf3LsaI
         CEvCmPN3LLVuhN6N82TqyMmPTvPW4ceoKczzKPaykAEbTzeyIKgI9EsLElgE/r/5nnF2
         BwoS1l134zfM3sTh/AEqme5WiJDs6tZzTZybVFW0P5WORCJx4cGILA2oAHHzaVnxGdxQ
         2VQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ekSQo9Zj/YjebnHlTHU3Pogfj33Ga+cW47T0LNjEd6+bN+qiCTUqmF7AvTOPGsfr0hFkOmDi/Vq+ReTlC@lists.infradead.org
X-Gm-Message-State: AOJu0YxVZPOl9AvtpxeCs8BNl1wNvhfY9CfhqurITdnnVYc+H7bzS6Tt
	+A9fTziJwGXmR7Dx7AyYMalk4gv/Nw+LleLm1NuQI28PM+FZKvdT/xqPusYNpm8qRKVRZ+0q7l3
	lKCOx2mt9TRJlrfOi1hFeqV3rKbagSOQPKRYPiFdMQa8IOrHbNTcnr/GCQux8kDCL9jgo5zAzCw
	==
X-Gm-Gg: AeBDiet02bFqH82XWmrsLvQA3JdJMgzEdurcna+eb39Y84kjhRS+pW540tfEpJD48tj
	u5xCuFaI6EdcyiBuTZW+kMTi0vYPdiY4uXY8khCScWTOka+cEvcSqNhzfQBLmHxkHCfdxluRAj5
	hQxOSJQ1kmKlkFzFd7XvbWQ7yvuo5wmY8ajLY5xuPtRUHVhMWqLRLElnPjUTFSBBufn2OWcUDWS
	bR39AvweS5LEKZF2ixgkqDWBr7Barr0L3F8IytfS/ELTuJ4Gw+0gxaijB4NCgL0wOItDtWguSpu
	D6odPs4rd453Zhm0CLhP2c7k6Z8hhySSxUikboRDPPdiH3nFuRYE9L93EZ8c/XWE3w2cGfTWJGT
	vnI+/gO0MoZ/ielH9nFBnUzfhNDvACv4DyymMI+P4dywaw14ILdOm/wQWzEQ3NrCNeila4xHCnx
	4LF7gs182OCWbfu1RqlSqC0znpRpz6KLwe4v8i5m2nEnV4gg==
X-Received: by 2002:a05:622a:1822:b0:50d:736a:6248 with SMTP id d75a77b69052e-50dd5b30c24mr373453831cf.11.1776295367294;
        Wed, 15 Apr 2026 16:22:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1822:b0:50d:736a:6248 with SMTP id d75a77b69052e-50dd5b30c24mr373453501cf.11.1776295366820;
        Wed, 15 Apr 2026 16:22:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:34 +0300
Subject: [PATCH 3/6] drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
MIME-Version: 1.0
Message-Id: <20260416-hpd-irq-events-v1-3-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6722;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mz8dmJX1o7L+LkFDzvBa1x8iVPv9TimP8vXBvzsNNxA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25wq4mEi/132w7NqLGejQ6ZJBdwpIzHMQlR
 CgdKQu+o1uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1bnDB/0SNFEv411ScvEko1SCNGqXnGoqWBUVGwV489aKOY+PT5D4wMY3kl7mN6JyZQ5TDhpESNT
 XszzIh45Q6TdckQtvLV5BndM4pjBHB7Ifftp9Tr0LenZqp6LO2HhtKbsoxtyCdt+2teeemdUWwo
 NFD+rY4+gIcP16wKtPP0HqVTpJirb+ndjoDatTbsb9xXrVGvE8MhxxPMjH3kf627kp+9Bt8S0f0
 PXmX19LnBxkToLnq88pT8puI2CDZOca59+RijyQKFm385Ek4yP7xaYt3ImCB4DZPwj4eR/tYKl+
 92hStNtdLrmfLDIhFNjTci/g+IN7G4qgHoQZ/l2MzP+1pKAm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: bwvj1PJRiAO0rGBqwXOs--47Tvh-prDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX1R7k6+WMsm7l
 fine8+7grMrOAqaAZVR5ItK41n/zN9tyqLwune12479+CmUn42382ieV/twQ2R/5AMisWN6ABaS
 HaKj1KvhhZCYA+vChfXFXSvU/eOQeXbtQL1CvFcJqLKsCgZKYaOcJ3KVb3XhbzuZcp6M5YMfxG2
 4GwycNHflCNQliv1czFRCy5dOj/NxwW4ZZocK6jDLmiQFbRpNCbgTaK6xmrV59spESR1Zry+QZv
 4/sjVPEeOv+tMP9+XOUaFeGHcXiMtu8rT0aLnxfemM2GJ62DnuBgxOsYZo/dWM5txm8KK7ZQkQq
 KRDvitI2fFMJ7yvemQaBaRgtDq4aejWq+3UXw7jlzJr4Ievhnm7vcmuK1FjfdknnDqiyFQj3Mbv
 +0xFrTxQBmgPEhOZVWOYrcZI2+GrD+eyyrFEgWaaa0Jt2dCAmpDoGSO2Ytp+Z/Q+niTjB9QAvgR
 FLtjbekYh8UjXGA8e8A==
X-Authority-Analysis: v=2.4 cv=AcmB2XXG c=1 sm=1 tr=0 ts=69e01dc7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zEMOeRQCFk_hQCPR_I0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: bwvj1PJRiAO0rGBqwXOs--47Tvh-prDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162249_064470_606D24C0 
X-CRM114-Status: GOOD (  19.27  )
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
 drivers/gpu/drm/bridge/aux-hpd-bridge.c |  9 ++++++---
 drivers/gpu/drm/drm_bridge.c            | 15 +++++++++------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..74d606b27dc6 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_with_irq - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @irq_hpd: recorded IRQ_HPD status
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+					enum drm_connector_status status,
+					bool irq_hpd)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -155,7 +158,7 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 
 	drm_bridge_hpd_notify(&data->bridge, status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_with_irq);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9c44e9b6c638..5a3dd4f92fbc 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_with_irq - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @irq_hpd: recorded IRQ_HPD status
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
+ * detect a change in the output status or when the sink has reported the IRQ
+ * event (usually delivered as IRQ_HPD pulse), when hot plug detection has been
  * enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_with_irq(struct drm_bridge *bridge,
+				    enum drm_connector_status status,
+				    bool irq_hpd)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status, false);
+		bridge->hpd_cb(bridge->hpd_data, status, irq_hpd);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_with_irq);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..6f837df90b2f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+					enum drm_connector_status status,
+					bool irq_hpd);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+						      enum drm_connector_status status,
+						      bool irq_hpd)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_with_irq(dev, status, false);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4eea124c7eb7..c3bb30133925 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1555,8 +1555,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      bool irq_hpd),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_with_irq(struct drm_bridge *bridge,
+				    enum drm_connector_status status,
+				    bool irq_hpd);
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
+	drm_bridge_hpd_notify_with_irq(bridge, status, false);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
