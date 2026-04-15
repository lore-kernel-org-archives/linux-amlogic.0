Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D12F433D2
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 23:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4TLvqQRuI97w/9Lf95eFeXcT3BOlzPPMFmHaP3dkBgE=; b=J8NC2HMWEmtqbh
	ytAyNTfj/7IZnWBqrd5oyydzrEnBF26pf+T2efUcgr3+0LUyWCWVuQv+Jjsh+YDRGBEd8CV/S8TJz
	20caNFhF/infqsKE+ipnqJndl0KeB+MvUaZ5Stp1anPEjFtknn/Lqt3PRLepzhAQtiiiwl4ir3Ux6
	D1ogoT5lKR96YxQZxw36nfqwcY4Bm46Kg0QuqA+flTVyhjgtGn3wNTsyO1r3gswXQTRPd+mQ5fkc+
	pue/NXK0tA7DSL2Z+kqsbN+4rVZgehhE2GLhsKJLthTU9me9VG9yIbUnUEVdV2ipW0UMySc1xx8BB
	/9nD2eimc4Mo0+BwSTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZD-00000001jjH-2yEE;
	Wed, 15 Apr 2026 23:22:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZA-00000001jhx-1b9l
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFpKOc1565929
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QjrAezVeYmMM4Ps1ry3g2H
	LZr/7V5M12bVqxCDqfRuM=; b=m5D+Jlst7zIrpNFlkcMehTxcctR1022cEwiZvM
	OV/h3ebwTZAAhMMWwAJNnlFxcecuZp+eiZSj7bwThxGkGCjNkf434v8v7zRiq8dK
	V6sHHtJo4FYzSszeuAuUZvonwryKRYdoSzCO24iP/r3LpfzV/QUob/tDgY9gvTpK
	YGvfl1oHuys3HNQn4Ecwn630RdL8023nZ+9I4Y07yKbBHNBTi70yWrlXLo9cm3h9
	2Ow5JQpJMP8zFagj3jwRNsNR4SQ+csPvOS3o3X6BGSz0O3IgQtl5WkFSYek4Bpkv
	WysoB2M2xHJmkCDEBJ0WQ3haLX3EEMmTyWlt4hPLL1CTzaOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv2qrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e160d5fd3so48326901cf.1
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 16:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295357; x=1776900157; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=;
        b=XGtZbS2TZxUtT7R9brtMoVkCXCLclUMpD4dPdurWuyQesPXrAOCjewozkze4fVlW5q
         Ug4rzMHY0atMJKR0julwmmrIGPakyaQ96k0ZqQlSa4JD7iKjsV8VNJ0bQSG8cNK4MZIq
         d5V8iqI3IEdf7sujyG6hVzp/cHRU7Dy9GMmbpscnyMt3UleDOCw0EchFQ19lgWQNC/XR
         Bi7JIynmzD3d0qkWaH/+38up8Gl6Az0j8I8HxiAEwZkTZLBnogi+8ZDZsXw0yvlnxidJ
         l6s47gWp7Nb/3a+vM345g0yRSdm52p6spdcVGN+aS5+g//5+qHGGIKrxFLmBMFhj63kH
         uLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295357; x=1776900157;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=;
        b=JkT+2ZXhCZ1KHhWm2JvAPE4Pxew1NjohxigLEkcDahqkhWF4YUrVZzx2V7xnW7nmT3
         shtFu5AxbA14kkdl9wSq2NrNdybcXFu3GBDCXnR2ucW2bZDVm4AHZKlJnslXu/TVs76U
         c0rF9naqf50/1Z32pDYIo6SO/hlyfeTK2dADYRid55mq6kiaU7zeidkSCpxOldxwASYt
         btbKqbXDSDlVsAqQcb5ZkaqwToa82thyTIuOUJmGqddpqsqgPzcB9rcgOFSNY7rs2GSx
         UuI8FFxfMF6AGrPT4impkCrVIGXDmnUGENajuiUUN7FLhhUf9a6GRgNmXqLX/MeMlyS9
         E4Bg==
X-Forwarded-Encrypted: i=1; AFNElJ/pX+TwvetyLWnma9vKbYK4TM06r0u28sFdi1/asnc34pfQIbecRcB2puBE7aSSeIg00Nl5AR9wXu+/fK/a@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7lBx6dNRqv48eaU6JcZldIWUbsCFq5jxehZjYaD4QV3I8kg91
	x8hc0se3hE4bdKb2/mu0VRk9JG10It6Lhi2u2ECkGMsOY/9i4zlZFPtGZZKs3bm0SKbXRtXeza4
	jtM0X+5SuNjwfhhCXr+aDrWFWLSAO98WCOojsE7XWQz0rKNujkkLSCqcVazT1OV9d1Wea71bkjw
	==
X-Gm-Gg: AeBDievnpl6un+QdsUj2+JU9zcpx5YcYR4OPsbpoPUOKDQc6Q9RKqf4T1eI+kwZhnUq
	fBMI1NghIGb7VQCq+tB4gMxp6hR4JXYtR+QHLn0Al/uBNEIMZA9l92Z04XDbFIkdFEPWSKFJ3yH
	Fcjx11PwIKcDx4O5SjsDWwsZxcTVjYzJaQSVtE8IpOyeg5svlnVKmb+xNThc7PKnZXay2xy3zDT
	IrsqCeTJUBKswbcUc6PaVqak6lbY32MqxrhIcDhti5lc0jh52P6ECFPXnoZxK72lnzOgen1homb
	ba8KLUXSvmRsED6kqOt/HafZt81yGxh2UcjMZrPrnCK3j3OJ7sDGrhy4lgX5ODoEyMJVIkoRYg0
	nI2kRIjKThG7X41Tz381A4UgaH/+j9X62MCNau2nrzsd0E8/aW0zKVy8dVExWZ819DKe2Abrv/0
	wFjBuUdwbi7AVE/6NSxFBkiQjeEBfUsqxWunuG+6nFz25PCw==
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr341629851cf.20.1776295357604;
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr341629291cf.20.1776295357086;
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/6] drm: handle IRQ_HPD events correctly
Date: Thu, 16 Apr 2026 02:22:31 +0300
Message-Id: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALcd4GkC/yXMQQqDMBBG4avIrB1IglXoVcSFxt86XaSaURHEu
 5vq8lu8d5AiCpTe2UERm6j8QoLNM/JjGz5g6ZPJGVeawhY8Tj1LnBkbwqKMynXeVGX7GiylaIo
 YZL+HdfNY1+4Lv/wvdJ4XXIgi2XIAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DGTBlD7qs9HNM7qsl6CaN+vK2gHbwUw1l1hWZUAKoYg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25snfl3bH76DEACoBeVZy/UCHClRy8lnyw3
 uY/zfPUoHSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1aaaB/9c9WKgA+3medunIFAl2CwuoCesh2/joS8gvRUa71/vNjPKRaDwhbLm5jO6MCbLgig4onY
 jF3bCfXqoO2RrZ9cTVrg1MKZqpXlRdW3BQyhT/DOIKfGPRMdoNyCFz/rU3cI4D0WrGSbVX+yC5V
 51IV2z4RVS6XNUX1aZNn+vG1dHT6XeZoCywbYQUMUEG0OJuZotdNHy1CPjDAGr2m/227RZM/vVV
 hlvH8a3N6EX4o+ASH2W4NGzsOS2dg3yKZKRR4CWR8ReMTZqXsj/7qZfOV2nj/S66/Dj+GQzrheb
 QBGq4goO9Y68lpQRcQm999ISp8uPQr9FshsCDN5JCmNeMCo+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nvziN79yRK4-QxC-L6u4afrlV5U19zS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX9Nju+HebSXfN
 pOBIF8Ym7uRkMxsBlXjqa8NtXTTVPlhsFzhwXbdGk//lOkAmvRsmlALkwl36M/tqoyfcAdfr7UT
 cFXDJqUjD+i12om4NUrQ70BPSZZT00TwlWxnRqMwFjO5tdtfXJys8AJkRfI3zslypxFn8taGnNr
 IOpdj0reSzoC6FrJKO7wVyG972VNOLFjtSU6040XGRqDHWa1C0X6rR9mSQzOsf+TkpoMCR2YdPF
 HeEOeVd2wp0a8YUzvIbImx1ThADoSrd/74RVYxWJTAmf2d4xc2koZKeBfl5BwJSB7IzCjC1TVHw
 nBA70kH6Sub/wKPH9pnBCtiS5X+q5Jdc26wQyLR3SP6pfW/xVwD4lPojwkV0GoXZma/Cw0gGiS1
 7RHt3NgrMfOhCaQHok8Iv4/DJv0PeThdLrTqsaS4p3pfdFC+3iCHUEcAdG0pKOCk7tXn/wEVF4T
 y6MRhQ3dciOxdQSu78g==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69e01dbe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ST8Y6Hw29dmLQzsKkX8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: nvziN79yRK4-QxC-L6u4afrlV5U19zS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162240_580860_1852FC87 
X-CRM114-Status: GOOD (  13.60  )
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
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        |  9 +++++---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 21 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 18 ++++++++++------
 drivers/gpu/drm/drm_connector.c                |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 +++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  4 +++-
 drivers/usb/typec/altmodes/displayport.c       | 12 +++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    |  9 ++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 30 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    |  6 ++++--
 19 files changed, 107 insertions(+), 48 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
