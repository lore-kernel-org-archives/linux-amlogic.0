Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E782F433CD
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 23:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMDAy/CrZjPEaaEA3HX67b69gxKt8vjMhT0jzCkm/OA=; b=0w2aFeUME5tfVL
	QbYzVWS1fy4kt1vUWts8JzZNoS6raR5r298HJek8xTMRjPYK7/TUMeoTsLZnhZ+22WL2ywBEtwxHl
	utmxV5O6M2wouer5bnItk/vzqPqikL8PO9Au+uMv4DHl7f9GTi50RBA4OxgeW6jr7Wf6oW+ZjhWVE
	2JWbfkFY3E256GIU+U+FNna0Qj+dZSL619hZyEJCNw0VkaaEVq/KopqFO4g2c8nQCTZaGGHVGXGYl
	DOCvKL9MfvsNeg0uCbAIKthYcKPkyEuRf+13HKuMrWAHeL+U+7rnxwMQ4xqc1iUzMH0YBg3+vYpFc
	r1H5EuHfxzbTKFpxArlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9Zc-00000001jxu-0ACZ;
	Wed, 15 Apr 2026 23:23:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZM-00000001jnN-0V9Y
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FF4YRo862281
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=; b=p39owSCcXynLz3bQ
	0sXd2/RZo42YgF4RdkeoB5+bVJ3PHFhmYxYJYrmL6t2MRSnKCo/rGSlP6ZMFJ4Wq
	LsUAeJv6XqrXETI/QujxoW8J9kPmLgs5xoWCjQ+kO9IWKnLqTzPLEHd5TPZUd75I
	BXehNMtw98TF2e5SZcuHaSnRiXT2gq3zk9lWEDIZMPKJBY6R28qx73IYfjDKdA7K
	r8thAcaDUyAuVKzEQGsOP57jdvxX16et6Eyt8jhjGh3LwZcT6VCdewRMT3SUJfPi
	MofNygE6++CzV2U+8HRHdpJBjEABISEt1dZjkP0ATswnidAjP4dKQPUYontB1AOg
	PKlhQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0e9f4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfc1634e43so859728885a.0
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 16:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295370; x=1776900170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=;
        b=NQvzVebbel23WwmcHtlBJkXEWob0SFcyd8eBmXPOgj0Ym/IodtPMsotxZSbDlnhlyf
         EeLHlYmhhurUo8LZB/UoNYQMHdxCChp04EHOVMGwIvAGCUwVL6QVdSln4LcrUk3uvcNq
         bGyEDqy6ZftOrrwxkRvkYbsHgO3VUknTQ7onC/mGIcE93xhvAxJZLjDqoa+Kp6M3Rd4X
         wQSfTM0NgdQFkVNyPIBvLs6rQ0G4L6Ng4k2JPIgoFqUecHEbSsJj4Jxkg80Z/9aKZ6+K
         4DcbFagHHQpZKfbVnXekg7NszD/L4cc8i87vgOHewwHUFJfeaTazY1hpsKzzfzqRRXAC
         IftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295370; x=1776900170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=;
        b=JwEzvui1pRLzgvn5lctmNUm98c6910QpyBIMkjvkh6EElvSlPYKTuz8BPNOWUJfvg/
         kD2XTt6iMgVZ1DOdQzBKlX0pj8W0BGeLD12A+kyYVES6Xx6wo9nJE9VAB3OlS/gVD3KN
         lvd0jcjNP2I8eplUO0MTDoVK3vX17OSRFQ4oHPuysmTba7adhgwLEcGNOPanDlZ03hqA
         xirr9rNJszZMcq4LxRrlqkeUcjtpKnhHP/aDjcv9JwgN8kQGjmhrr1lNO9WzSgtPPaYp
         QJblDuz+T1Pa0o7OtC4sAy7sBaUFm7vmwcbepXTdLY8amAEFA9zyvBkrWfH2foMy3x7g
         P63w==
X-Forwarded-Encrypted: i=1; AFNElJ87P93ucnpoJzugYQHFk5HWyrplS/JNIi/8Os8LQGUlz7uPde+n8fvL9M0mA3XPS3Eq9zb7HIs/vIWyulqM@lists.infradead.org
X-Gm-Message-State: AOJu0YxeinfNjikZaa4qstXYtEu/SKGjOELPiHAU1FIXfN0Up9UdFU62
	hgLje3Vqv5bLkFeVY/oUKfzYMKdCbNlDWG45qIIg8Q4hJYSM4CutORwurkbkj6rqFqh79x1yLUd
	XI1X4Qmnf6FoMEZt7GNGpMHYCjoD4JaKxDdDtZNyeLd5pK3IzCFSHFDfyA7WfecZscYeosiKtgQ
	WG94Doqw==
X-Gm-Gg: AeBDievOMe6JDCgJlcyj6eJT4Zst/9rIrRyeLwzlVX3ciz/CaIJrsHwz4c2Yvm1S/Gq
	KHWGVs05EYTIKko8B/kTvipho1WhCKTQPeVHfOOwhHs+Hwy3iXbpxQ8+QP7XvAzo8+NzN5cQKy6
	M8a+QjEeO4Mpv8E71CyKq8WzHmK9ka/2Kh1GQTv6P2Cjcp6c+QF1ydSsIjpfsqBnFxNmTx8oAzk
	bPKXv7eN/zlkxMaG9qohNrFtLVLV/XND0HwpIhYFhrxSM/vxdNFXRkLDjc41JWng9+D3uSb6xiX
	n7vAHYwUS8Roqb9mV36kHpqwT81lDEsa0jP4GXlyl/qy+YCf6Cip4JJZD2Xg+FmU9h7dlMUFcl3
	HX8cY0dAGNBdmJL/LyhOF6i3hzAWPvMngnzCxAX9uJBt2qw/iirIVml4o3+tBHw39OmNzHWpRji
	yVDhtIkVeNlv7D+h05+Qn8YLESDCPkbo5ztiX31lbXTxeqxA==
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr350845671cf.8.1776295370088;
        Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr350845381cf.8.1776295369619;
        Wed, 15 Apr 2026 16:22:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:35 +0300
Subject: [PATCH 4/6] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Message-Id: <20260416-hpd-irq-events-v1-4-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HBn2IVrDryFscwmmHLMRDSDtMBdYMWmMptzpyjE6O38=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B252fbaBj4KSv5jQsAVOrf3j/7BJx59z+n3I
 2IJBSzoVheJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1WgwB/sEuMF29EEIY8rUMvncti+cVVAyI6rgeZiDtGdvlblf3XLLbOaC9cejNALy1z2TbL7VrWh
 96BGbQvXZrHw8bhWepW+KvH6Ejb7YLEoIpTanNPUNrpqbDTi81/xL+Ym7GTB92LnzaGwYKFozsl
 EGu3ok8Wfu3ICWI1jxGzO576N4RtHf6XrFxeyMxQkoAXIuzMFlfFN/yI7+5rs4bwUXRuhj3uBgI
 aJtwdV+Mh4sT4Xny0ZWfjQKfu2V8F2wrGSAvwLpTVcuT+LTQ2bmX19aFpZSE2qOVk1NtRId069g
 qbZxCfPnkPai+rrXVEEsa0rYtqISVnMD87C00uxhQTT6mlPP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WhqKHqrMfCMwD7sgxkU5bNmNtmo_QT2y
X-Proofpoint-ORIG-GUID: WhqKHqrMfCMwD7sgxkU5bNmNtmo_QT2y
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e01dcb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfXyEiWFycwGX7q
 qyvPla0DNOV+mRHJZrB3sNlvQ4t94HjBrdHP8fGob07NG88kC8M0zF2oz8K9Kj/rF1H83iLXIPw
 Vyh4ojlfoKinvTYZha4/uWoxI6E2Tw//xvuOXUDDiE6rgrs+Ju8jxB1SNYycZIGxLJD6+NlBNDS
 MemlYt/FGOVNGBGd9jpxyhgysScI4dkfqzgSs2wG4Ts8OZuSxsfaRsewye+GOxNdQsvWW+OuU/b
 DiX/IeUroWaO9rid0fbQ5E9eX4tbp4wNyqa+AHQYlg42DkEPv9/KpidVf1oVh0mK+TdpNquSfoz
 kTKi2WYXvcg44PFR7i4r6C4XDmnrd2pBkcp/X/33lZucoWA6P1ydKykg7eJR5wwF0kCaTrbhfQO
 04PLm/qUxvL/cicwMvXl24GLeZ4UXDlzCWVwkJYk+6t4Gg+BjsbDogBxlrC5O6XBRjcMgbKyp99
 x1jGftVNtPN/WZRZpmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162255_220962_6DFF5501 
X-CRM114-Status: GOOD (  11.48  )
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
index 45e14a0010c2..390a967a53f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (irq_hpd)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
