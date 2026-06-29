Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA97FC43602
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fJmeGMl1eJLQlNJ5X0Rq8tqXKGndHfTej5+s/yGzwtU=; b=i5mkeSZcGAc99A
	axPpL2gCHzzvmyAre7TII+k6A7nJIrKwcfDqu6ky5QfVQvinqBQhyiiXRgOxgmsjaDeF9jI0llYEV
	RdY7uy9zD0fwNsZY9LEmiUFBLfUZxFHCL1AJUO/ETRME6T42RgEs2g7DWO76qAcBv3/0mRJHiNj8M
	H1GQIXIvpKYR/Bu1b+7psXySvDSM47nW6fYt+SiGU6rTOdTUuqhxKwKUaWgzwHP+Nf9td93/3dcUQ
	vNz63BCEYVnyY2zKOzidEo1Xyjqb4oMDp7TFRlrp2/XHo9CvsACN+PJDT5lQo5PMAhAKhOSggP/P2
	/5QneE/scDvIh4CtO8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHc-0000000Evxe-2F9b;
	Mon, 29 Jun 2026 14:48:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHZ-0000000Evv8-2fWh
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5jV92729668
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1f/yR+lvP1s2Ul6gheXSvU
	VeiUwZxWmL1UGyP4EwcCw=; b=p54ouE/By938PV2i87guFfNFF5F9u48ybF9ryL
	ATYPO9X+Z//Xd5wTvNNfsYgrGNuYhTvYGrBDcRkrKZ/Xjosl2IrEa8s8eYYnsHLP
	MB6A5aOr0eq23gpF3OogMBPNiE3mVcYekBVWs9CaPtySulap4CymvBDn/ogm2DUN
	EnihVmyGz80yy7nWeRj3oYTiguQDteiex/eG+0PQ028KBVLFIGurODXNEONvynNd
	X6nWY+6V5mGJ4dQEatrVbN3wlVLJpNZ8E/eDhL+nbuWfpubsnqnGJLXPlv8AyiXN
	BtkDVZT/sXVngMWCbclUnjTQcbJhRciKnmlDrFXMDxfHI5Qw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha8v1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9203d077d77so627990285a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744499; x=1783349299; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1f/yR+lvP1s2Ul6gheXSvUVeiUwZxWmL1UGyP4EwcCw=;
        b=CjCSfOOtqHIhM5U83fEj1MiUh1FTAJjNyzPFIz08Zxo+pqV0a+FFYD9dzQ1uYS/SKQ
         3HXIivtGEg4aG1JbB/BgBWirqaVFUMtkB1slEIE7/A4iIpm5YUgvO3Q/uFv4dIk99d1D
         XH6BSW63ReEJVPI2YYeJCsdZzQzpTWNIWkrKJBEVb9N+Vd3tgddFXmIe11OvX7BVZBHr
         hgPKJQVuETJcw3SSxM7CI68P361HnLLwLVSw63GV8yP9e2M+AaG006Im7w6uHLd5hD1Q
         HU9DGGxmzqe3TLEqO2NYl0/sKuFDd6CieLqxgbnFewU3x8sHFtRsO7OnGKDntlj2Emhd
         dUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744499; x=1783349299;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f/yR+lvP1s2Ul6gheXSvUVeiUwZxWmL1UGyP4EwcCw=;
        b=ahLm54V6JXfuUdkVy3flohtmvjHHxVXau6PirFiq6dr0C49BE58WwnwtGoGFDuEngj
         S2oGMXiINPmiS0kTD8LmAZYXG6LaQoSSi3PJeRmjP10Jy4vZjoHQEkwl1hQgQq83DYRW
         vYgRhVrYw6xlpiwN8KcYxAKO1mKhzuBY1WULdRSMOxuqMhRs7i+5YEvEu3n9GG6P/2xz
         EmcQGghejiii9g4yIpcqVV65mOdC38KALtsG7uVr+pCOhl4WXOmUndgz64xbDynypMR+
         cYwFuEdJz+V8LUAAVCEd/PqVJNK/8BSy0256bKl5wbVNMBWaEz6igPYLqcgxD50xtlSu
         SBhg==
X-Forwarded-Encrypted: i=1; AFNElJ/vhms1diZse0bRw3N1HCpvr4EgkGtgzlQLcsBfqvhPNXW6N42utDRPB6BfRo9Wsi0KJNXqp0WZ/OBNZtbD@lists.infradead.org
X-Gm-Message-State: AOJu0YwiWBSA/vobi/XbPj8lkBFYQZ6QvHi9KnKQ1MHMmkMuYO91RtCB
	5P9CLaoDrXXXtXsAwMH+TUsVUiIpmWjnkcb6AUV/zJgui+Y8VLfEbSJnfCN1AFbq94Vj0yWjjKQ
	+tnbFNiacjaqrJQvbEoJREfLDePU0JA7DEuy0iQoO67KcE6LOcpxNLobTW2mbjXbxHGyTS0Zrew
	==
X-Gm-Gg: AfdE7cmZfAqScFssTw0zUcATYWkLqtrbgNVmxP194s6tRMhJSW5d0rAk74b7SVNlWeD
	70ufu2CqVRZm1pivFdCPsMVeKFHxVnUHXNh30q3rHvzl2weK032MToESRAv9MXeuLBVF1sEueTo
	dOxSx4ZmmjsSd+HHL0U/PNiyfP+PLHSkT2Ptq0ipCrFqec9bzlXwf0wBzWoj4qKOtA9ckd7r5T4
	ZBhzlimg4u1/MOKEBJ3yzhGEkcEQ3UHagh+bRaLZGEgDeMcjJhTbbO1MTygsiufsSAEO2I3nCSc
	RpRihdiKbOwyksKeShlI1MltUD3OmzkDX05m+y/Crrt3vALUBsohyqnlA1O4HZq3n7hJwM/cGrF
	b0xGdXBsDmRGcFY9pwSgMkt8Ipg9nmHxgZpspwtig1KEbOUWfrC1yzAeP5WoJleD+yB2K3eizaQ
	==
X-Received: by 2002:a05:620a:460f:b0:92e:4687:b84c with SMTP id af79cd13be357-92e4687c54fmr947130785a.25.1782744498246;
        Mon, 29 Jun 2026 07:48:18 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:92e:4687:b84c with SMTP id af79cd13be357-92e4687c54fmr947116785a.25.1782744497096;
        Mon, 29 Jun 2026 07:48:17 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:16 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm/dp: Add MSM Type-C MST support
Date: Mon, 29 Jun 2026 22:48:02 +0800
Message-Id: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKOFQmoC/22Oy2rDMBBFf8Vo3Ql6WZJFKf2PEooe40YQP+WYl
 pB/r2xvsshmhjvMPffeScY5YSa2upMZ15TT0BfB3ioSLq7/QUixaMIpV1TxBrrcQRzLWpa/EQN
 4yWlsdXS10aS4xhnb9LsTv86HnnG6FfByHEmHObsdbKv3g0sNXMYIaZ4AV+yXDKsECoJ6xb0Qt
 TT6c8j5NN3cNQxddyrjgzx3tNVOkow+NQRRs42Bxhtp13pzvEpvyv93+Q9XdD2sukSjKywm0HA
 hXkd7lxG2S1pshTpqSpHJRkhUpjVKCBNqxWhouUOtdGO8UoKcH49/Jbfnn3QBAAA=
X-Change-ID: 20260629-msm-dp-msttypec-b420df7da587
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=7157;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=63mgR/WEomQ97sw6tki5aEhX2JKiHSdLLZ99/CxweX8=;
 b=wjq7YIex0kYDekGaGwDyjO7xnuaglLiq/ijsioGq6BUUDhn9QXcIYwvIeaMWwX0DgTUSZ0PmK
 6L9D4PmILs+Apo317L/mQssy07FLxfaFm/NSWKQqHJ26zQ07yIHX/QD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: ich8r6jrws3w_OeIkeeS3D7p4oMsXPaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX/2bpI7tPrix0
 rRfqdRMP9j7zf6dIj9qedwcVT2QL6elMS105WhiVeqOA6W1ks6O0AyFOv5R8ABFJzkFnKDISg2W
 XWU46usW9XRtHstAQILuAH47NvrJX70PEq75iIJtREcj8Ao4FFk6A4q2lmg0tnAGSL/J1NCFuwh
 mbEa/bdjA2MRtlCvBfzUNHfL6xo+Q01ec14IrkGHPgUujYJFYc5X3jWwADVWE7wxiIoUn6fyHfT
 TUsFJFxR8cFVoIKrQGoHJb3ETrggPz69F/hPSA9m9NqwMl/rmKMWbHKhm4qnL0KKsbD7n2+Ad53
 jqITza7dqT7fC8tIFuwYyIi1x82tp7oM5bhjHojIMk7piZMhf3qXwGq7bmMd/GG9BUevxt2PszU
 MPjjNeE/Cg+3t1vyAW289g6cdBRufZ7pJ6Cic/0GCdl04XFm1E8gGW0BNzLsvupr4moqjm9kL+2
 H9okoRaSWJr8rgJWhXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX4vBEyWp/kox9
 wrliTl/0cORWz/y1oc9t4YjP+LAWgJ9NLgNznTm1zeRYTck1JiL4XBrC+X3l/j9vKshZBdz7Z7A
 ejY3MTiFOt2cLyFijc1W5onwKMFKXg8=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a4285b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=GNgVbCztR01TI7U4TXAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ich8r6jrws3w_OeIkeeS3D7p4oMsXPaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074821_790689_D76D21BE 
X-CRM114-Status: GOOD (  11.57  )
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

The bridge connector framework currently treats every HPD notification
as a connector state update and emits a userspace hotplug event.
Once MST is enabled, however, connector creation, removal and hotplug
handling are already managed by the DRM DP MST topology manager.

As a result:

  - the SST connector may transiently transition between connected and
    disconnected during MST initialization

  - MST IRQ notifications may generate duplicate userspace hotplug
    events, once from the bridge connector layer and once from the MST
    topology manager

Introduce explicit support for IRQ-only HPD notifications in the bridge
connector framework and allow bridge drivers to suppress connector
hotplug events when those events are already handled elsewhere.

MSM DP uses these mechanisms to integrate Type-C MST hubs without
generating duplicate or spurious userspace hotplug notifications.

Testing
-------
Tested on Hamoa-EVK with a Type-C MST hub and dual-monitor setup.
Both fbcon and Weston were exercised. No duplicate hotplug events,
connector state oscillation or display flickering were observed after
hub attachment.

Dependencies
------------
This patch series was made on top of:

[1] drm: handle IRQ_HPD events correctly (v4)
    https://lore.kernel.org/r/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

[2] drm/msm/dp: Add MST support for MSM chipsets (v5)
    https://patchwork.freedesktop.org/series/142207/#rev5

[3] drm/msm/dp: Prerequisite cleanup for upcoming MST support (v7)
    https://lore.kernel.org/r/20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Yongxing Mou (5):
      drm/bridge: allow hpd_notify() to suppress connector hotplug events
      drm/bridge_connector: preserve connector status for IRQ-only HPD events
      drm/msm/dp: suppress bridge hotplug events during MST operation
      drm/msm/dp: report IRQ_HPD as an IRQ-only notification
      drm/msm/dp: mark the SST connector disconnected when MST is enabled

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 31 ++++++++++++++++-----
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c            | 38 +++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 +-
 drivers/soc/qcom/pmic_glink_altmode.c          | 14 ++++++----
 include/drm/drm_bridge.h                       |  3 +-
 8 files changed, 65 insertions(+), 33 deletions(-)
---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260629-msm-dp-msttypec-b420df7da587
prerequisite-message-id: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
prerequisite-patch-id: adc6d802a2f71d23c077a5cdb9a257809e9db50e
prerequisite-patch-id: bbd956a3b65a90c1fe9e884bc32c49bd83fd3129
prerequisite-patch-id: 014460a25c380d089764ab4e1a58577ebc1b9e71
prerequisite-patch-id: fc03fb9435b8c60321f9ae28e396a6bff2f347ae
prerequisite-patch-id: cd4cd57a72c798fc95afdfdeb9b81cc7a2dbd25d
prerequisite-patch-id: fe431fb614383eb6444f6bfb928e7e40c2de951e
prerequisite-patch-id: 2a058aa8309016f424b1d4ca19a9b20e92f4d8b6
prerequisite-patch-id: 64c3616bb979b663a01342d1f217588b347ae8bb
prerequisite-change-id: 20260410-msm-dp-mst-35130b6e8b84:v5
prerequisite-patch-id: 1d440cb9fed2bdd66d8de0e1e20475f0fe166973
prerequisite-patch-id: be0f4b80697df7224c80362b161b8a9f0a542184
prerequisite-patch-id: eefa6e6353df301420feae1da704a9db2c2155f2
prerequisite-patch-id: 9e9095f82dd6c131c9f3c1de4fdb8a62bd65ca24
prerequisite-patch-id: 3e635f008f9b56823101abd9253905f078fcb3b5
prerequisite-patch-id: e39e0dc124ed043c7a419610ebe03ad105da27db
prerequisite-patch-id: 945af39213cd4241e1a5929fada04a9286aeb5db
prerequisite-patch-id: 898ae7e4582a6b31492c223e7dd167fb9ce78096
prerequisite-patch-id: 3887553893357c1ffbda99eb010801bc2166cbad
prerequisite-patch-id: 7ccd961fa3c6f925659dee7d7a5bd167c8e7331b
prerequisite-patch-id: be2bf918e0e87ec2ea999927f36bd172c498748e
prerequisite-patch-id: 6aacdabb2dd0536dc04da04f8419ae39e35f8b19
prerequisite-patch-id: a9f27eff8f643ff445810b17d670891928f5b416
prerequisite-patch-id: efd300a2b52715153b8c1c7407db696eb331594b
prerequisite-patch-id: 950abefc4862050ef606404977fd27c5dd2cbb2b
prerequisite-patch-id: c6a9aaba753b5538864f7f6e065d910833baec21
prerequisite-patch-id: c73c1f6eb16b2a6ff11b20495fa0981683bdaaee
prerequisite-patch-id: 94957394b3870ec63ab766d682df592da978dd19
prerequisite-patch-id: f27cba0cf5f08d21f59f29a0c9ed7f197ddfa2c7
prerequisite-patch-id: 683855949a9ed37bc0cc4d1899373e55eac4ddc3
prerequisite-patch-id: 9b3a2b526476c32c8a859824e551e23412674766
prerequisite-patch-id: be866cf2acd4960f31f0dbd05e21f0722dcb70ab
prerequisite-patch-id: 58bd115be590c0d892a72e06794f5b244dbdb7f8
prerequisite-patch-id: 87435a0f6827516f4e2b5d8471a2b289bb73a88c
prerequisite-patch-id: 1064db7111fc77377dbf246eb0fdef90c18c46ee
prerequisite-patch-id: e112aaf6088f2bfa90bc67feaac86a4fc1ad23ca
prerequisite-patch-id: fcc0f2ee6dc0358d62593c1295d26a013fa11223
prerequisite-patch-id: 66364b8806fc6abeabe1a0b871e4e8c841ce2aa7
prerequisite-patch-id: 243046f52a14b416caead3469d580ea5b029f9bb
prerequisite-patch-id: efd8014f647a6aa5fadc9d62a6e1920d76a6c80f
prerequisite-patch-id: f4dbd5ae84a01ea89c7d00ca39fd76cd247bc353
prerequisite-patch-id: 30a16a45edefc8769b10d90a7807b6522cd31f15
prerequisite-patch-id: e12fd2908ca33de1f1265fd40190eaad8637e569
prerequisite-patch-id: 3baac076fdda664d00aa9a83481f76ec38c07e8a
prerequisite-patch-id: ee6a93ffa2d5461ee7b07929ff21626a14773b7a
prerequisite-patch-id: c8d444e2a6512f106da2675d4a42a92208d5c6f1
prerequisite-patch-id: 0491a69feb036cfa2e75401e093ebad387cf2846
prerequisite-patch-id: 707e7a3e5114c86f5bcc0b36e7cc8beb0c957780
prerequisite-patch-id: b1ae90d73bd7c3d19cfe4371b5dc9a816f1316a6
prerequisite-patch-id: 4c183b8ffd599169c8d3c5f3aad5ecc467b150f2
prerequisite-message-id: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
prerequisite-patch-id: 1d440cb9fed2bdd66d8de0e1e20475f0fe166973
prerequisite-patch-id: be0f4b80697df7224c80362b161b8a9f0a542184
prerequisite-patch-id: eefa6e6353df301420feae1da704a9db2c2155f2
prerequisite-patch-id: 9e9095f82dd6c131c9f3c1de4fdb8a62bd65ca24
prerequisite-patch-id: 3e635f008f9b56823101abd9253905f078fcb3b5
prerequisite-patch-id: e39e0dc124ed043c7a419610ebe03ad105da27db
prerequisite-patch-id: 945af39213cd4241e1a5929fada04a9286aeb5db
prerequisite-patch-id: 898ae7e4582a6b31492c223e7dd167fb9ce78096
prerequisite-patch-id: 3887553893357c1ffbda99eb010801bc2166cbad
prerequisite-patch-id: 7ccd961fa3c6f925659dee7d7a5bd167c8e7331b
prerequisite-patch-id: be2bf918e0e87ec2ea999927f36bd172c498748e
prerequisite-patch-id: 6aacdabb2dd0536dc04da04f8419ae39e35f8b19
prerequisite-patch-id: a9f27eff8f643ff445810b17d670891928f5b416
prerequisite-patch-id: efd300a2b52715153b8c1c7407db696eb331594b
prerequisite-patch-id: 950abefc4862050ef606404977fd27c5dd2cbb2b

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
