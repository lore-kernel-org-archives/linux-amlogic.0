Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056A1C87FCB
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Aug 2025 11:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UTDOM+aP3+T1AXxtJj8mDn8+F3zicW8unOdvf9rooTc=; b=bUXunHiJhSMnX/
	t0z1FhMIAvU1vl0+LVhKwFFKz/j0BJAcKDNug0C6KcNbuM0X6WPidk545/kULGRSZkGQbGLg7dQFm
	FFv7YSGhiDvB1Gq+W0N2wGizIK0aTbIu7dnH72LSaHWmxLU4/5llE3h9YaGMkUPPkWZjtH3+zn/O2
	258Uzd/Ua35nz9ZVl6Kwk3TsoI6PyaOoGt9DM6sOM3hB2UCBMNsZ3AcINoGrCOHCtny6xks9mmOTz
	Noo0lJIwC+sbIrXcnnhhylrGigz+NpilbSe8ybBI4qpKnAi/+EWGU93e56/YJZkGBMblKVAKmpfzj
	v6XA8ki0nZKKtCX+Grjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiXHy-00000008fmH-30wj;
	Sun, 03 Aug 2025 11:54:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiXHv-00000008fka-23eq
	for linux-amlogic@lists.infradead.org;
	Sun, 03 Aug 2025 11:54:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573ApsA9031426
	for <linux-amlogic@lists.infradead.org>; Sun, 3 Aug 2025 11:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=13kqIIhvX8G/h4Zyb4Bf0S
	syUcZjDX5f8XV6NFySlbc=; b=iQCEe4UBn+zhy5xKBcGEWlR2jONw9So3CdetpX
	BpfErIOkkwKR3hQkvFA+8niFS1/e73tzuV9Vv5XKDWEnXeM12hoo7HG9ME02InX+
	nrmvch2r0vlubkl96JzBpFqC5ACIvESypeZVz0nNhvjLQp/OQxqKNbFX9/vfWGSH
	vGzTsYCGY3yUN8mg2ZUSQIlIeFCZJkG7yFlYKCHv8UrOgixZah5tM0awNZL4CHzJ
	Hi6h3RlmCX52GZYMlEwaS2CGLcgMjWsb5lRLeR+lmcjWNg68J3xXZbjFZWdfJT/e
	CLr2V27/e1xHmODW/9iIWMjIKcHRfTywKdVxCRasguey/7iQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjjeyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 03 Aug 2025 11:53:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af117ffc70so31995331cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 03 Aug 2025 04:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754222039; x=1754826839;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=;
        b=o09Rr/3eq2EN4REtJRMDe/Hl7i51iibjquJaePa7p1yWFOrB8dcC/0yYiwcNh53gSw
         feThSNhaOI9vQy4e025ThSNpNDx9WeG5ZkdJFCPxykLJKuMFl1P9Go82hoolG0LwR5zu
         j1zhsg97MhbaEb3dhrldoO0KoDeBuRtg/dEETlzElhiiw3O362ebOcJvJIQKp3cwQgoN
         Tbbc0hk12OLVDboN8XCFsY4v94/qHJZjPqiVlfG5iUo6wTTwAEO3PPH3Z7fo4+lXHtsZ
         FOSAKB32X3I7x+a9YD+FQie6F5AxtsqDldiIZrSPg/Enw0D1wE6xErSUyO1sRsPQTLEi
         8xsA==
X-Forwarded-Encrypted: i=1; AJvYcCWNUC/ZNYeaD3EgExioFDPwzENsfhLYrTiHUmTDl0QW9iObPI1rw96F/D4qpuc/J2FmzjYegVBpN5vBjfcR@lists.infradead.org
X-Gm-Message-State: AOJu0YxY0NQbKvTV0ylcEmDkN0r5ybGyjlz/MyRLzCgcS527U7wSqOMO
	HcntWiPk8R7b0RCm91KFyD13+d1GTBuJ+wviE86OKQerRNC6C962w1tnWputRyL90rvGNQcOj8t
	nddM0QdbHst58xtGRYSmwGO/yur3ouUMPkXzGFTd1qfS7AvvrYBSUAex8zEFOQb24Hfx4FUnEBA
	==
X-Gm-Gg: ASbGncvf7oItYLPZ+hRSYDlj6XtfwalYxLEl52IjsfYPofELdpVGfq8G0pLj1bz7BmH
	Sy7Zk6besy17U/8AeCOQdgbfpSOpEAx4ZZ9qtaGdP5Ww3BuqD2ReI8yd6V20XUQDS2XkwZBG1GG
	3BwSF9mf8wbDvc9QB7ZpjEjZrxUiZR0NmF8v7OpvpgjTm1kfhmohPTtTrTO5FIajDjZbPUp+i9L
	5J3WdH2BW5YEJJsyS2FcWv1p4NgNOfGumoOea6ePEg0NweRTfq+apy8CpAqsyehl1c2r39ZJIkL
	tMTuFL4umSN15QhhD7lKS3BNh7m9m9/pWNtTJxW0H1GQZAlcJGfdS6JT4lAMAC8xfPyh1Y5H4Yr
	VLYtxedf8+FkWzJKH0XNzaoyGnoVbtoPEb+Zocmk3C9mGJ4Wy+mRD
X-Received: by 2002:ac8:7c50:0:b0:4ab:63f7:9a80 with SMTP id d75a77b69052e-4af1098c10cmr109506461cf.13.1754222038595;
        Sun, 03 Aug 2025 04:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6F1gC3i9qNqPGQ2+U8UnWuUnVr8S0dL9Kp9yI/T0GmDv1re8BD8ymDZkfYLJgECcFcEOVzg==
X-Received: by 2002:ac8:7c50:0:b0:4ab:63f7:9a80 with SMTP id d75a77b69052e-4af1098c10cmr109505841cf.13.1754222037990;
        Sun, 03 Aug 2025 04:53:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a6f74sm13281731fa.20.2025.08.03.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 04:53:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Date: Sun, 03 Aug 2025 14:53:50 +0300
Message-Id: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
MIME-Version: 1.0
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0a/76XO+afzL5QKXQqM/OCzeVVFxIPW+vrJ85d3iq3S2
 mJucD20k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT2e/PwTDZzds4TCJ3dd13
 K9typZKPcnseh78q7kk6VPCsvHrdXva/obn74nxnev78YTf/W9lKiT7Z061Olr38F3aqXL098ep
 pZcXG5eau1/hnKbfeyjl9dIlqhfsHjisb7SvunUiT7pSwm3e7b4afq/J88xIu2+Aeqy9hscq/Kh
 7JX2LNrvM7wf7rYP5pWX6HM3tdNaclzvMIa9S6brW/+Nu73a9+83ewOyybL1ywbbVSiKq24sk2m
 Y9VXCsP5ptdvmrka7avfYLBe+9HRxZOqeQ+umZ228ME37N6ApLPWtL/KPEpb0pvVug+7nae3fJP
 e5O6RbHJtFSzH5GqLmuzovrMw2bVFT6wunHexnRnlqceAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=688f4dd8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=viR3P9R_XIStfHs_oGYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: e7y9HKMGLoXCjzvl1CcHDZXSxzbf29CP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA4MCBTYWx0ZWRfX+N1wV0OSJ48Y
 pyPhT4yyfokg8Wk6eeiEQ2NI5FBhMElCmRSCRe4mMrorShStnF3Dax65sFoF0fIaA+xJR87EjkX
 QYxeI9q0KfpS9MlF+3pQkF/aShzSgR+JUqgTplNJv6YbJDKEU1vsqQRnKm77VJgNM+XDg+8btZR
 tSuL8pexYX4E1bh7oQ8yEBpvpUi+jEkLZ59+n6gzz3g51CxBUiYmBOqhCGQhUcYeI/4888xGLah
 UTomOmJmjAMaPV8kpaL2yafl9gkKZrsHpgHGI6l7+K+/TzZwgFQgDfvfIdGXBDL9kDIE2010buY
 0p5So2j/CVV4n2pS2wfVeXNC+qaLOOuW0RR3wU0s3wHZGYQSEFA7G948YZNr7zMoryecTz3zNsv
 jkDrr2h36x6GF+IDTdc5uPxBnOVGsDAiGLXu7YxoRSoY07Ahmu/BUWpx/dUEknah7ayW7wYI
X-Proofpoint-GUID: e7y9HKMGLoXCjzvl1CcHDZXSxzbf29CP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_045403_523268_0B826053 
X-CRM114-Status: GOOD (  11.06  )
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

Use DRM HDMI audio helpers in order to implement HDMI audio support for
Lontium LT9611UXC bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
 drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
 include/drm/drm_bridge.h                       |   1 +
 7 files changed, 57 insertions(+), 79 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff

Best regards,
-- 
With best wishes
Dmitry


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
