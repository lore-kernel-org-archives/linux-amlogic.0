Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916D9CD4F21
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 18:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EMG/D0vAHIl47yrUGbxs6DTxwpBKaxnVrAnrisFyDiY=; b=s/lWvgPuZIZRIQ
	w7cN2YpdvUO9eoTB0RvFrtnwoQx3/lbANnf8siBigpYLe7g/6z+dzuS8Rl9N2clXYEZ9IJN95l/xm
	Qz3usAkut+mNXYGXey0z8oHSIdfbutYnQAUKpkoDaBZmMXXp3fvs8lAUOQpFXJJxgdnwyrcbKSHdS
	43dSG1614ecolGSig1AjyihT1mk+swqnyfOHorpfPvNWWY6gChJf2/nILywa01bdkvEnFmrgykEh8
	jdABHAl9TsUQ/OwI/macpRS9jaI/1ous4YjreSTAOiypKbwj+oBqAGzzA8Vx4v53EtAFaEsz+YHbj
	r85VxZFpfv3jWGxJmMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFR-00000003SH1-1L33;
	Wed, 13 May 2026 18:23:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFN-00000003SDz-0yBV
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 18:23:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEnNSv4159621
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/8lnfbEOX7ej5tjeRNuBsa
	gcrk13r/0jAm1jfC+Xj3w=; b=mxb4eT351HYUVNlaFmZ0YbQdmIqO58P1ttDhsi
	LZ62cFmcw4jzMfy5sq7dc9VPZVpJ03HTiRQZxoOyvywpTsL8tUb0NvneP2g75+0c
	AJYFN0IkImN4tdEAR53mJY8D7NQMwAS24bgVMFzTC55s8cfgtOmKOmiIFMH9dbZ7
	G1BpMZ734vtj9Q4wXel4ZBn/sed0rmZQqLn/gZp7T87xxUpRadk/9H2XA51IXhD6
	+/p57z4p3ajZwI15QX4ktjBUUnvPvvp9FJ6hqHQTIvNopxrw2tpEH8DG1Tsmiesr
	ZDbcduU/D2tAtc4NCTUgz+eiI0U688wmj+nj3MV4sscwxGCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91t807-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 18:23:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0e3ad6so108334081cf.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 11:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696631; x=1779301431; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8lnfbEOX7ej5tjeRNuBsagcrk13r/0jAm1jfC+Xj3w=;
        b=XxIfEG1tXgbFPH9x3sG1XrchamAHm70PNnkmC/WgJi2fJmucCFOuYuqJtIXM35k8wb
         kl244XWg6Z/8vWwqn5JewekW+k1KmMi2bX3z/QNWWiqTSgICU2Xz1R16DxquJjo//L1J
         FDc6lPz4hC+s9lqGTA+9jqIbowaSa+SNHawjK/aFa9YXmkLdqwZDbdwyoMdJ+GmaJBeX
         W+LTRUaLKtI7VCkjsXa63QsCxkbsQmdia4i9OVfCsZpX7gIwIpQ/5V93YI7/pNQelgpu
         0nvUoC3ako+YOM/AI5gH7KkFSytc+PABm6olfrm+DvMRCTS7l26nnrHxUA1Rx0rGY9oT
         TLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696631; x=1779301431;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8lnfbEOX7ej5tjeRNuBsagcrk13r/0jAm1jfC+Xj3w=;
        b=J7HAcC25lFkAEwjw3MrFTYyZJiXy/3aJjfWg+dSSS9p1YIOnxvO5LMTRvKL9dbFTMP
         OwPLW6IpHdD1G9xR/E5LQziloexyUWVJ+UI9NDxppcgNprCI6rT4cMANR/CboZUXVlk0
         E7PAOz+AuJM6V1iewaipXz6JKtBJnaJMdfuTO8Ie1F46aUkXlT97UUBl01s0ylDTDyWS
         lVs07EMulbXhOT1YAPcheGlm8628MlYtZqDLcBOSFSfzCu8u8pTZNtAjtSjkFgz+cI9q
         kDs7zAdEGm4LqBAtdUNBo7TzCWtKPfWnx5bqCAe7eDUYBu9tazVovGb3z2PRjEX7tAb0
         6r9A==
X-Forwarded-Encrypted: i=1; AFNElJ8xtvPGrqiJlIn3ALa7qOrPHPop7sIcm+LrqVFxC+qC6U1R6EoyWxsLhr20sV67EnfuP2HkkPQoqwcjODh0@lists.infradead.org
X-Gm-Message-State: AOJu0YzNAsbkhFxEwpIBxcOa8f+/2pR3AYUxl9QV4eeR+di2/WRI37R3
	gc960YqLEJ9/4A38r3o4lLP2dSIb6inY8H5lfFMusUBef97ikMH4ZxUsUEfIklwMZko+AmCETy2
	Ca4V3udc2/Vz9nJvvBw9BFjUK/5I8ILLV21SJAC48oBzZJLoKEHh6IVNC10+wh0msj4W/Ozm8tA
	==
X-Gm-Gg: Acq92OGDnNOy18iKPB4O7bve0fCOZ8sKD1DtSviLMCCt7gLR8cbE4ISdLysoUJY6l+y
	Z9gs5gM3iOs+KI0iGpkQsyb9xi5SwmH2daPW4/c+X4bG/PC/kM/M9aBcpa4P1ItmQTNGrAkE4XW
	gAbs+ABw07yGamDUmvE+dIuCyJiUk2RiHD+UEsdZlEISAUy34QJ32lKMT2cWeCQy9U6v0AvbHkZ
	o25eE2CR5IS9QMsDz2TocRBkgmGq6MGrNDRuNzManGS+Q/4C9f8uRqtGS0S1eSOomKP6VaRXC6e
	YWcdZoNZ49/BP/WdkHl4gASVJMxT/+iZIOMDN/KnJLtrSpV/feTdbpX0R05OZLr6VdHRG9Juwv+
	TvUZ+hQyvzoqWp/LHbXSAnnSdDEaePGpxr7AGpOMya+9d+Rc0/mTbU8h52AYDDUyuAxvapcOJv/
	QiDHZpYKDo1thG26DLv+wrcOPYf6lnMtIzDwc=
X-Received: by 2002:a05:622a:8d09:b0:514:cf96:7638 with SMTP id d75a77b69052e-516415a239cmr8445931cf.15.1778696631213;
        Wed, 13 May 2026 11:23:51 -0700 (PDT)
X-Received: by 2002:a05:622a:8d09:b0:514:cf96:7638 with SMTP id d75a77b69052e-516415a239cmr8445451cf.15.1778696630558;
        Wed, 13 May 2026 11:23:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND v3 0/6] drm: handle IRQ_HPD events correctly
Date: Wed, 13 May 2026 21:23:20 +0300
Message-Id: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
MIME-Version: 1.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3154;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CP/Usd5SOY/V4EM+27lYpiqg54wFGw4ZjWsp+w6ne5I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMGzqxLK1D79sW3iq4HpOWxquvyKBFjpVcB34
 h7vCOrJ4kmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBswAKCRCLPIo+Aiko
 1XrACACZbqw9UPGnc0Rq1LLAPf/snNnVdTZVsXFY41YM+aZS+S0oinCBEk2sFDi6DoOvzVrXO4f
 lZkJKpaBOfQOOmh/eVRIl26g1+GDmKlBT8Wt+DTKHGPFZBELRDHOxm2htwzcF6vWOt0NMqOgYnL
 KgXpWk1I6X5nYD6PVbvE7LO37A8PZZqnrIzMeZjE0SiiJvP6x4poYkeeQp+iJ6tSO4ifjQnsjq6
 6DfAK+vsWVwkacAZjGeYCM74uqTOs0Sj+5EgbpmRcyvFZ+k7YC4lcoQHZSF8SE6h/IpU7aL9nlN
 4WIucg9m4eEPgQevK++Tmqs5JqKyrxqXDLUu4aSLWOCxV60V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: v4LN_sMdZQNSaS5u0HnDNDyyEYszt3q6
X-Proofpoint-GUID: v4LN_sMdZQNSaS5u0HnDNDyyEYszt3q6
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04c1b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=52TPwIQhNpV4Ze06EwUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfXyJ16YNDSc1IR
 VOnXlyUgVsHOc9ZQyEVP1mjiQl9BQ7PEVEoplZBPPPhCuZIye0qLspBDRKFnZAMYfZjOmVUFoVw
 CQ/8/5JRHfPJPy7BalTITCSd7bYjw3MG81U4PfvpchfEsRD1ieGMI4PEs37oiOFtRVFesGCvUAi
 2GN9k4C7SS5JI6PSy8itfzG/NhripOwtQTDiPDiYc7Fv/dJsuqi0NVbnTQmTXBE6RRFFuLB7MND
 HVbv3yLNZ8dA7epDz3sDJqlQCcZCNWpYIeB8J80G4KaYe6bcJz072QV485vkGRYt0HmnolHj2pT
 +oNR03BAOX0S9YUBkdlL/swqCxqguALmZ54VXNlmu+8+WgjsivcmPHG4Km7RxdQmxbZ/5MiMfQj
 o4pXnXShr4rFy8kNX9l7edokBiKEwUB/3yJYpy6NbjqZWbV8CRlwLhbv2qO/K/EQPaxyLtnzkO/
 g/SoMManRMIWXigQneA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112353_282907_475418F8 
X-CRM114-Status: GOOD (  14.17  )
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
Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

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
-- 
With best wishes
Dmitry


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
