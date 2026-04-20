Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF65DF588E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bWq40XTYUQWXRyKlacfgwsvSgo95ff9hCq3wPV3h7D4=; b=xZ0/qMIpXD2u/S
	dRyejXDDHXgtNane8t28FcNTi3/Gn04iDukwqPb7Nmrf7dr8cjy3lfOVERkRRk9hzm6dMKD+BHO1P
	2YZpv7Q2Ne4kMU9taJ9p93FdTHgkhgVMCsnXoIZpffr0vyigG5fEZnrx5Zg14vmLazrJ5NomSOcYT
	q1WNAcc4MXCU5J7gt7HjlC8fkte/vI2uXiPzSPIGXP+J30MPIx14xFPL56Axtlw19+6xVLa8r9MlZ
	nqsQP3TBh9G3yTzw2o7u9DwKYC3vThd1fxsWluFZzWJDyeKnlPDTsHpn3isz6onzdgC0E+y78SwE3
	5JGbGm5CmuEENXvx9IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbE-00000007I1z-0s21;
	Mon, 20 Apr 2026 15:31:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbB-00000007I0j-1R8q
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 15:31:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFVgqV2755817
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 15:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KPq2KWyVdJ/QThETfa/aj4
	GaL3KGHo2jIAgQ+4vtHSY=; b=mQrhyNSO1d4bVUQ2uy3chP70enO+iO9b/9x8wF
	WYVeBNBsgGl5uk4Wx5ZzJTsJhSP7twcpbRlFk0X9cqLO49FDjXuQQDyu7ku849d0
	vEHn2zSLkdnK3Mb3Lb9KzkMJUxxx7/FhupOQWNn6WjtpzDLPGEdbhqxOiFeqoO6s
	L+TSM41pvZdc6c2Tt6/aTaQUX+nYtUgVVuRtnBXRzpAw0+LqFLs3uSHAv9yKD5R9
	bhi8oehMmdD3XNG+jt2bnnKEF9c5BEbpCXtOe40u6L9kE7UFgokFbkUJXdlmP+pJ
	VTMWDGRx46hXqjtEbW4BamBkdAyE4xLqZfkxMPDXeu0aghPQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xhcmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 15:31:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-475f6d0de69so4239762b6e.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699103; x=1777303903; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPq2KWyVdJ/QThETfa/aj4GaL3KGHo2jIAgQ+4vtHSY=;
        b=Tn+oOlOUYnXrLKxBrNQjvIyTvO7N3cbbidbK0yPHiSOe8heINDqzYDrGzCvNQlI0T4
         ieSx7s/2MfAGyTsXkB+n621Cb5Pk2WQS1ooRSPe/H4rJn0Io+yegBeLacGCCF8wv0dsB
         d3VMl8vah5jRHpH0Wps0OAdg7J7ayUvDxNUcckoK9vs6AU4hpXNxQY494IpY21kvs9Vp
         Fjto4R+/QBIHqodRS6dl5KdGX836JWPUZo4Zb5T+Isn1YwpPvnFzAoht06LT/Re2mdZ3
         o1x4zcO+1C+MPop+YijJw0EeuOMiBs4gYdtju23oTHfdOY9a4b6Fz63+RKhdUdutgzRy
         +jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699103; x=1777303903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPq2KWyVdJ/QThETfa/aj4GaL3KGHo2jIAgQ+4vtHSY=;
        b=mGuHFq87DCWVWMjv98efbEzBHQ6DszoyTuO3l00oT4UgWCVFOBbkMjUBbJgHSskQ45
         w913gHJVq+t+GAhS7AY6jG7oAZvPdPUO5llkL0zU6435e3MovegRgtMdLLgGVK56hfnC
         IeuuKLe/ZmL9WWYUHrtZ+hM/Hmm2SKi0QxDwfsp3EwvS0qoZvTF2Tw4TsR0981HLesqR
         JadSKLceNZHuYyQ2RaTijjXxJlQV4+6Sd0uNwN8/31WBGGac2cCGoD6ZLmjl1p/qZVbj
         R13ZSIbpkMjip4ISJ78Vt9c5pQiOBSpD2A0uguX8HO8lo1vFyCVPXEGmNhier0L7ZHX7
         eJxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nzR0S18uoHK0x5r6+Ama2lZIQt9QkodXE3B0FEXXwS2kvKro3pK0fQs5ahdBnBYFefTiWjVZAtmMoEpPf@lists.infradead.org
X-Gm-Message-State: AOJu0YxUjBtTvQuW846CFC8A1G0RCID8q6eYPEUv7qDGNRV5KzQDTwz3
	MZy6hbh9xzQz4R0S5M1W3xju/4X8onLHgcHrkWIHWnRBOgC21cvdKuJ5gtRkX+gQd1FM9vWg11O
	bqzkMQTzAZQnSIlEMMDR7RQcGoM73IL5PkIPjWowdrq/WkLt8Qgo6bW3C88NkH7m6kIXmh3lM9A
	==
X-Gm-Gg: AeBDieseIkgnPYM2BI21ksOWcYkEqYLnVPHupwEYn6WjpglJkcg7k8CLZQhjoK8uqvt
	r8C/aWVoeWMMdZ+iN5drHTx2ZfYIhEm0efb0ZhqVjSY/HYdeEHFpaYDM5Vi+3UBr6drFb5ZEEoj
	J1Y/gG9aBrb95fly6ASvvoDCY6fCBgYaf7m3IA4WHn5C2fjg/Id3N9zcL8ZOYUOLQbrMpBlbc4t
	pdE7k0f6iZjQhKj1x67Vxt97iwq6bkQlF/sphqUSeXPlR4AaJx29dBjpRiQtnS6l4+iz8WyzydU
	cWQeQpYFTFufHqoGz8Cn1fgweoZMOvF8cPP6u8NfZajtfYL4DqOE7VudcxYtXxNhyRq5tQqjun2
	S5ca7ALNbGHqAyUhFwsM22Hi888WbVCkdKKN7panNxAnzZ2+8MX4k/qU+bGisp3IM2rp5yYFmAV
	IJ+icOBcTOCGNYarQp9e+kpAhasGGt9pORTX78gjQR4WEtRg==
X-Received: by 2002:a05:6808:8888:b0:479:ca20:2904 with SMTP id 5614622812f47-479ca2031a6mr1688406b6e.40.1776699103467;
        Mon, 20 Apr 2026 08:31:43 -0700 (PDT)
X-Received: by 2002:a05:6808:8888:b0:479:ca20:2904 with SMTP id 5614622812f47-479ca2031a6mr1688353b6e.40.1776699102944;
        Mon, 20 Apr 2026 08:31:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/6] drm: handle IRQ_HPD events correctly
Date: Mon, 20 Apr 2026 18:31:38 +0300
Message-Id: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANpG5mkC/12NQQqDMBREryJ/3UgSrEJXvUdxkcSfmlKN5sfQI
 t690dJNNwMPZt6sQBgcElyKFQImR86PGeSpANOr8Y7MdZlBclnzSlSsnzrmwsww4RiJYSO14U2
 tzlZAHk0BrXsdwlv7ZVr0A03cLXujdxR9eB+PSey9n7z+lyfBOBNKCyuM1VLLqycq50U9jR+GM
 ge027Z9AAYPTRzFAAAA
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UvPqtcBs6t12Cb50UIargyyrmizVDFL3lnz93lf5dTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbcZbi/KWXeOsOVKc0R63XrtFjzk27ElCmXg
 o1hqq0c2AiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1crcCACcPmDWi1VRXcgFtEXlo+5T/J8Fo1YheczB5Yf/UcL5kzeG1wYdBh80oB6i8rpfl3PAIqI
 OtE0Vs3/R3OyrKQWM6mUEfbofHykn/tlnQdokPu98hSVlATQyeKrtfLI5o40Nrdwxz7PWCEhc/d
 CcHkRkkhNxWNDiQjJQATtm7QgXgteXtJVp0OkDMB3NWa4Mif6sOwMvfCWxGS0VsfgmopA14BWm8
 iMV8J2GhiPTLlcAWNcpW0UCaRV9Las5xLHFCFyX4DkL0yvG7qFApbn/YIQtAUQ9wVya89ZSPODt
 cAE6lzXZZ0TY8jCDbiqtMt2ZWZkXJLv9TxbTNBit8UHk4MZH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX1pLJ70guJtlj
 C1LLRNDCZK2zhgozRLbI3CaEmq8cGk1lDz801EdpBSuWjwxOb9aIB75khKGcIxWk+X72xyMKbRL
 R51TVN2YTFz3W5bQkjuvp23babWwJ4geu6cAweYcsmuSq9KavyZ2sKsejYBwSgRb5gc+JXB0WbR
 vyK6ROhzjq/jNwH1hJZ1jNg81SYEXWaT5X/VppGbxSOxpEhnc8joVUXq44S7tdNH4l431KCGxwd
 cZRMmA//XrNkh5u2gU8x1idE2NjEmHScVc8BZzAuc17Kv31Xp2efJ1Mjd6mgtQMLeJhqFEezPnt
 9TwjgTYQWKKPgi+2mwoTlWgUGDk//NmUOGVqQXp/OMtzVEJdbrsUoqVOP4obdK1AKkTifIqLTYy
 u2ekvsKHSOG192Gcsnkc4ZweqiQGaPAwWUvqwnkn70/TOGCSRe4Mt0MT0HQAkg62Z3knQIcszCP
 JA/A3YrEFNtjTlxOXcg==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e646e0 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=ST8Y6Hw29dmLQzsKkX8A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: FfO3KD8wPuzDPM7uuqqa8v5uYHeqpRw2
X-Proofpoint-GUID: FfO3KD8wPuzDPM7uuqqa8v5uYHeqpRw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083145_390815_F0920630 
X-CRM114-Status: GOOD (  13.78  )
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
Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

---
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  4 ++--
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  7 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 ++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 15 +++++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 22 ++++++++++++++++--
 19 files changed, 138 insertions(+), 51 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
