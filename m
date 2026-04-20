Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A37F5A8D1
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RXFhyzohdwrV+9z4AT7/pfNPZa/8lyS5KbBkEUPnmb8=; b=rYi58MYBeXdiNH
	QJ1VvnPwnZ4uY6T+G6dZRFzrBsPY+BZ7Y6tB0nnWH99ajDRzJEBswD0sSZ2ZaUTqKr31hyH9R/yPm
	1L4nK4CtWdXbExRzzYgQBsaSqA2/JWidsCj+d3//F1SoalvOwdjQIJH3tCaJHxOHpIPY0vmzjOHmY
	vjyBvZFjLto6WyJftdDCmrNFndqdSMAI9I9KWIcT4recX2jlqru6qvsAm2CXqyFcEGM4VHEHA1XLJ
	M3qhWn6DQx1HGZgUvjJo+fVMjMBOHabrHlg5DQ+btzPtvSSxS6k59bInYnyLjNxKKs1HZhbKteePU
	2yG+vV/BImwBQrzlL7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7a-00000007ouo-0tDU;
	Mon, 20 Apr 2026 23:33:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7X-00000007ou2-3lTn
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 23:33:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KKSMLV3456412
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 23:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XQsfJtP1gB2TJ/00be02TM
	63V5nsoWhB0nnFNGctejU=; b=PFcxKqygGKhdobJN9o9FgmbwQc/TMPOi9rfgG+
	Q/NVPVsNdgjToRzVfKt/X2S6m/R7a235lTLXdfCcnxHv9vcCial2Ogh7IWsOHxgW
	ZzVwbLr831xV9YbwVAaxB4XHFz2IMY/WTQmr24UsVRfxjrfO9VxuHLfRPhJR4Qm/
	8bsQF5rCwsWIAyu6OPzwAdWNeQc1p4flIHWY3DZXKE+CPWFdgh7AWkA2fZskIfEr
	z6AmkscJQSyQnUa/dJE/raTS+UrYWX0GTJA1WczDTswpvskyzSl9hZWFdawpR5iP
	dpakKMTE8I0sFlbbiuIHQy315FxBNBDmi3u+sUZ812p8azBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjufdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 23:33:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so6561301cf.3
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 16:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728018; x=1777332818; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQsfJtP1gB2TJ/00be02TM63V5nsoWhB0nnFNGctejU=;
        b=cWq2Imlek7Sj88Dp2dt/S7M9PhxgsEBd9/9Pb95Y+8n0yvGe9GSQ/1Ld8MRFq5XFgh
         Q8IRofSJIzWNlVigcMIKW8tsRZUkT13zRTWSwPlNwU3TO8HYzMpCRr9SZ8ls/LY8wRnm
         3C7mpmEPdfVyHkINgKAZbg8ohAL+LUg2kS/rteQIUnP0rkyfaL2SLpiIhoBCil7Yjb+9
         wIUTBiqxgtmwcGIHOnhF1D3YkZzaAWt8Y6tE7lpD6JX09RDanal5TT9XgY41LOH8LcIv
         D7l3xZPHvEHaxWFf0OFICVrJhI8NlDRZsSq9LmMPLnloFODOvZGASXHnIuEEru9tR13X
         IYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728018; x=1777332818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQsfJtP1gB2TJ/00be02TM63V5nsoWhB0nnFNGctejU=;
        b=MFV6pkdVKQZhSRjXoDHDXeTM9LkzzK0n4SF88iRlxKOsPY0N5Y7wh5m9qxP0m3OKKz
         foV587/HOKd2eX0ZSRqCaXJX/EuK917bZoEMCf3Xm96MQMEe450MHoAX2kN5FSLO2R8F
         PLqbabIBHee8KIXFPrlHENQQs2YbegnOkQKiOW/hM21WE+A/kTnhvEYabSUAph28cYMr
         fMsvTJ2a2tBzhNbiPDXUdi9Lm5wJkP04UZ8id22wh68MCUmRuQYW1jx5Mbdll38ZqhsF
         gTnlHZipkpA8B6+wBNxAUkLnt0aMTBONpT3KSCgHUxBTaFT4lwWlL2U+bIE4810yfpZR
         OSGw==
X-Forwarded-Encrypted: i=1; AFNElJ9eflz3YCLLxe3fvCNFWL11PvnP0+XDLFODp7KIBrg3wyI7Uv3551QTU7Q4QIafFn4Vt+UenuqDigtU5UfW@lists.infradead.org
X-Gm-Message-State: AOJu0YwA4EAPL6VFYveAAW1DWrwIWh8/lcVwK+bUqjfUlav1AV5cRdOS
	OBewBTeSyUalk9GeNTkoFXqBl1kfd/s1v64mFDLWyU/V5Xw/M5eZCc+H+lk8egyVcnsDY0csQQO
	gbKK3vKj5xv4awp004i7AnOQWzq234qcwmBEI9v5Gw8p+SWknIzhtfp1HtbyVzd8MTKbNa0enJg
	==
X-Gm-Gg: AeBDieuF5wPX4PkJk2f01P8XNAHYZ9jQLE47SNXomVnJ3A6ThizjcxRtC/nIsI0zoTk
	l77GoghuaC/DnxaVipZA+55IVHmYCWQdwBuqj9LUV3j/UAbAmMThc6fPisc7YH83uiEVqapzZfy
	nJvW+C+8XzKFjzVFe8s4N2DC+efcsSW52oiJnrn94sGB73CMie9bSuFUsFBY0otgAjWsjvhqTKr
	t/odkfKiQsFf+0KIg/+qsoRx3COkQBvTnvE8FlImYzWv8yq5ycBvWU2jD8bmn5vW/WCPTiMbtC+
	TGQJ9qQE8+mBK1eZoyxKCCUSAMESEPQgjLdakPmoxQQexkiJrOx0j/GSlAWX0rGKZCWDRgq+mm/
	NIFRDZS79ICdSi+/Xd2poynci7+3A0uW3jkzvLDnQVYoSdLnKZ9q9j7dwvF3eRo+PvZdxalmD6l
	3tbEPvvYuayrnPsD9JbCGc+2BbATd7++PmlYumRJduag2bwg==
X-Received: by 2002:ac8:5895:0:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e36eba371mr227233561cf.42.1776728017635;
        Mon, 20 Apr 2026 16:33:37 -0700 (PDT)
X-Received: by 2002:ac8:5895:0:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e36eba371mr227233141cf.42.1776728016992;
        Mon, 20 Apr 2026 16:33:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/6] drm: handle IRQ_HPD events correctly
Date: Tue, 21 Apr 2026 02:33:30 +0300
Message-Id: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMq35mkC/23N0QqCMBQG4FeRXTfZTqbYVe8RXWzzLBfldNNRi
 O/eZgRR3Rz44T/fPxOPzqAn+2wmDoPxxnYxbDcZUa3ozkhNEzMBBiUreEHbvqHGDRQDdqOnWIF
 UrCrFTnMSn3qH2txX8Hh6ZT/JC6oxKanRGj9a91gXA0+9N15+44FTRrmQXHOlJUg4WO/zYRJXZ
 W+3PB6SNgJ8KMB+FIhKwUBrhAprrP8oy7I8AT+kHYcLAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YINjf9ePwOc1LBKz011yyCdv56U3Vxqxsj8hcJeg9A8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfM+HhKIJwr7zvWAAoLigezFercScFRQkcYR
 +GxFkPgEfiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zAAKCRCLPIo+Aiko
 1Ud/CACAR7O1rCWEq1Pc6b+zxeRIfcw7Z3DbjXG9qUEQJnR3Rn066wXoAYd+w7DM0pHAGlXwFM+
 uExom09rZXGybkuk8RMUF9BhFvGeoU+/wz7IQcuu+xNpMoRGwVhH1/Y9hFL8/HTg11Loub3hs8s
 zN6hj/tAQ8eOiW87C8joLay9NhNFTWFRWzDW8vkYckf8QkrsIVzQ7NGKujxaHDwVim7lqB6GMpY
 261dlrExN9eHCDfui4VtxbRB1ghcBss4hsGTG6LNDCvIPYH9L2Z/+yxgVs/eLAKPcJUXhqTVTu4
 009eiMwIy2t28uElKLaLguILuo04eghoPAfPDh1EnKmz4ns/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gtLFRz7VLpHcDxeqC8K-ACTHGjGZR8t-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX7fW7OrK465Y7
 WNXbre1bRVGF8Dph8b28OU+93BUez7OfYynHSIKy+4oZtavLnylESg+U5SjzrhNxrP3plbqF/UL
 EGhywzhuyfM1vTIy8ZoUCm+KsxeKrtfKQ7w8tVb4iWuf3fNpgmWcanX2L4rT1hzS1GSxchxSILq
 RjPsP/LmkRZdLQm+Ls6pm0FVh8cRdMYqmxOWQy3fex2d2e2BIbh+46sgnB278+aXajZMsjdr2ed
 wBE7LidrSFk+xJsKUg3l0F9+wxPeuSmtAEIC+/O11+M2oBJd2SP4siZGaL2xddO1oqcvAHsTgbW
 HYG5bqWQhjXv77eyh2+FLTBd/RJmHEii+pCM0JAQnoF439hpc9/PDjR1uk8JJKe3m6b0IKxqJZ5
 cU/d9HKaKKFf1QkJ0necegCdGje20kkBGV0UX8HHqenYxbjiFfSqMRF49/ZC5mPp3DDLgF7qLAR
 45IrXqE/bDBvGJg8ezg==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e6b7d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=52TPwIQhNpV4Ze06EwUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: gtLFRz7VLpHcDxeqC8K-ACTHGjGZR8t-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_163340_045878_EF707DD8 
X-CRM114-Status: GOOD (  14.12  )
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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
