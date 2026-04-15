Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18BF433CD
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 23:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avzA03qFk9Y9kjuUm72npwg3iv05u1OC4YpPkfnproo=; b=f8Xw4fLOHZzjAk
	Z1Yvw+F4moD0x4xqUNPvatzFNHe0I5MgXZOpDa0Mg0JVpM4L2PuzrcHN7bx8VQz3tLsTlBOvz9IAV
	CLjDx7Ls6c/8hiSaql99UJGWjWAgA+Lp+6rVoSoI+X2DNqffGB9Ivv+AhH675jdok2tj9+obkEK0L
	JwL2qp9OoIrYarVrUYRpo02+HQgvd4ZtCaUWradlsI9JSbET02UJyr6ricePl/a1tmE+rVfQw43Wv
	mqJnMRsHJW6itFu8HIJ1YriHMEv/d/Et/+0LYE7wLqXNLR4ZPp+rvpDWkwzYRd4xHOrlt8FtEq57h
	QRuOpg/7GUgiTajVli8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9Zh-00000001k3X-2rOb;
	Wed, 15 Apr 2026 23:23:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZS-00000001jqz-24xK
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 23:23:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFQJa51702616
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TlTaPnDMsSjHelLBIYtNHmZZl9OCynI6YeLwhyIsxc=; b=bPaBuvxP/CTH3RFI
	DdDJB18yMTWJ5vbg2oW6dD6oPcLf8r3baGiH1RKX22NwrNJkhXudtwy2w14nHIQc
	IW+xHLBl+PAblH0/sNsPEZUK3kZWi5Pa0jb/bWtjdPNX9DMi/5zOm7YbUXklHcp0
	HczNEKwrvkLFURo9haQXFouBjQAq8h8/xqv7A+6cA7GX9GnnI1LL0tfqMvZrHe1A
	wir+iwaHENGIdo4dJisSlMUiu4F0H+twDs35X1K4H5NrOHhejFXbuooaVoXVXdTh
	+hjYzWVu1ocq7rUQIvj+O43EjHzj6Hslfljy3f/eYQuGCzyQnybAekIe/hwVP2QD
	xkgxlw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamhd22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acad256115so122820996d6.3
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 16:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295377; x=1776900177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TlTaPnDMsSjHelLBIYtNHmZZl9OCynI6YeLwhyIsxc=;
        b=d0/ZRmqOuDm7kbukckzTQcsCf3qjdUw3JxzlI5hE4hLlSA1/UGqOOa+Ai6SLWOMeoK
         IOQeUz4Ff2jpYKThWKzifqeOjAFfy/yPt/XLED2Q4CU6sUZ1Yv73pRdbRzkz7yRQ6qlY
         3vMd5ThoThpXtzmgrOQzutSI3R3JzDfPCX/cLi/1PEMc66cRoSDhIsCOm3/MrGZus/CP
         w83CvOwyRoQalPujLYe9wCmGjUddtYEar6F9uj2M7nDgrdo6PqlQGfc9K1Bu3pHAagfe
         tFdHi2Z5A+xHy7botthguhXA3/KHHbrE0WmB3UQrVnVnYq2YggvuXrAGwIKuCcrWxmEB
         dEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295377; x=1776900177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TlTaPnDMsSjHelLBIYtNHmZZl9OCynI6YeLwhyIsxc=;
        b=Nndhay0SmU2VS5HT+pQWCcmaVQa3LpNbciWSzfzQUpjVUiGzhoEiAiK0sOjYK7bn2q
         buaQgw/VMZRT7hr/PIwLN9DVudq8oFeTHR5DGgMpepwiDw3PkDRIilea0/9U3fOxo+so
         4ZTLV0PA3rAU6zt6UuafmxM8y3x1UfqfKggin0nmPMqy6DwD1BIYzEHkAg7X1Z9S0vwL
         4cFjrhVuhb4GSazKva+ZNWyWyvXnIBt6NGkHjKNwumMvntMrigBbbt0bVmKfjT99kcrA
         ku9ueFgNhWSb5zUwHRWfL9CeFbAJzAHxttgj/+HaofBU7jyR5nhEYPJ4y9J3ETSMSYCx
         ABoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/0+l6Si4wgped5qaGBKn4f9sJFsO5JKt1Pgf6gmEBn/Du+pjP6em1gBKTlAW3UCi/QdiSq+KgrkwPkva8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyw8gNCtJ1erm0V2RuPLfcHqntMiX4HkIXmPX8CEFWE8gY0T77
	TQfwOw/EZlRXSKSA5ESsbXgUSv7iEUd/WZZ2WNIk4d5nAub2gtGjlvGlvIa/C9+TCFEdgMwPSD9
	m//6SqZSHS/QM/00JrUPuIFPm2FYDvj80MIjbtriAqGVVl2xBPdQSa4/XuD/WcwS1pxMa25+Xvw
	==
X-Gm-Gg: AeBDiet7ntrBNgL5Lougy6rZ2ZnMiZx1UNYtKnjycB4BnP/CbDCrfvhoZpSFf8LZQ9h
	YAXfLtR119sgn/p44TnSfW2AcBn5PslLT79qEl5Yz+DnW99h9X6vQWatByOKnPSX08xKq6+CgaR
	U/4D2F/Rjr9lrT/9zdjx8SZ5f0SwG7tbFy1dk4wxHJjADpiBwqXcddxYe2Xug59+27ctHyHn7rE
	Sjmh1IpcjsnTI1KFIRBuZuCkroZxjqiJ6uySAN9lDOwYB9qzMYPQklZpNonJaFJXKFJ7nDFii5P
	A+6ACOg5A0XDLUj+KWBXLWIU1NpmWp8HG9QQT59X73Nu9wFffOXgj4DaE//Vy2bxxq4ZqAR74iW
	2XDfRr03+tkId0g0L870e+z9/NOn1rCrDHuaCWqY56IvNB7C7mtSDBRFbmvAP572kkKYt5aHMu2
	6DhpZv8bkNC5vtdpC1W2ht8gR3ycOUXxKAW+Krb9AlZlWZMQ==
X-Received: by 2002:a05:622a:13c9:b0:509:1590:f5b3 with SMTP id d75a77b69052e-50dd5bcdc20mr342488091cf.35.1776295376974;
        Wed, 15 Apr 2026 16:22:56 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:509:1590:f5b3 with SMTP id d75a77b69052e-50dd5bcdc20mr342487371cf.35.1776295376486;
        Wed, 15 Apr 2026 16:22:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:37 +0300
Subject: [PATCH 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Message-Id: <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SEN/GR0hrR1a9DBG9m1Xo1QGkgnSMHduOhSuiYVFnL8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B269bBlbJtFKVMj9cfKSjxyfAMo/avZojzn9
 1S4hJysf3GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAdugAKCRCLPIo+Aiko
 1WirCACLulVg6ZpKOCltCebHzmh/eMf3t3bLRta2jkwQIXM8sIkvuLAXeTER8cd0ZDj5c+cGKqt
 mUZIMEpnhLP5RxelE1DCRtytDCjOETI4dg6Pehe9ONh0k8ZP94zzn2aZZgG1tNW1iqFGdHkTLSX
 +Q183rOGj4kJV8ubUk9o/0bRMn1QgmeITH9IJBYHAiKFDogK2LrgZigISt4W7j2RyjDn7rP6CMZ
 2eB2RZhtQHZG9yfT1RptN+ZXG68VayMJq7tV44jasBlZP0lR5KPlwE14F+15fCMJ6GRO4YmuwW+
 PDBdXKXcOpw3cco8JkjI2YgI3hWMdCYFYFYelO5aQ09670Q6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hOe2RhSo6qrjltG5X-EoQFJ97PXMgQqE
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e01dd1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: hOe2RhSo6qrjltG5X-EoQFJ97PXMgQqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX3I23sZHDYp0x
 deXP2voW9VRoAOZAqS+m+PpDtoTbcHZTkQWRl1xHMBg6yF7QaTMDYFySBQXyxfAhpPhoN6I0h5x
 CRkvOiE+jTOiKQ3+DDSyeeu/ojvG27c2xZHSzgU0bZrmGla8tAd1IGLpE7uAVEr8sFaQqcQWlMZ
 g7zz3dniyFrUvL3lXur08bI/nbZCRyWqmRspAhdlcHThVNBbdDfpDDAqn9GCq2d3UWaPPxV6P3g
 GsrWFdVliaJoVwe6dpotUXLacX0D/n/VM0g+nWwLSGwdtfkSKQ50oohPvWTACcZHUp9v0UvLONr
 u1sBhd03jtDmLOMst8uABzerOr1zgbuCDaIHQH7SmHO6dtug60ttHNDa7lrrgPOIuuhTRxZdj2R
 96gH4e7JXMbmUnpGOsRzkcfl4hMW3SLlo1zzMofxtXSSV9UNvL6mSeG9UMlwKsvbrXgO5RgyRfa
 oc/q+CViafD7w61695A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162258_855386_DDB27814 
X-CRM114-Status: GOOD (  10.58  )
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
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..328ba92e1b44 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,11 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_with_irq(&port->bridge->dev,
+						   port->hpd_state ?
+						   connector_status_connected :
+						   connector_status_disconnected,
+						   port->hpd_irq);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
