Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3BCC982EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q25YsFkrLN6h0bEDTQdTKrun6lu6fsnS0q9CzOD4qwo=; b=wZiN6gLBKH1rJ0
	XiRXv2spJtDodL+cXSsgwvhX+DqcoIBkCZOJLDT5Gf2dwbQpZeDX+neVQlq3KrI5hSKviFRhseAjX
	AeX5X4OvjfCxxvUy2HcHFrwfMJLC3DwUFeXzhTdXRmjyzbFpjx7zBGxxjdftmrdfZ1rbtvVU0gNzc
	m2doXZISRhP58yi+ZTZdz604UxETckhb+uitxcPE3HWQD4b3PSNiw8XMe2jFq5wu5ipjMCKnPbhWI
	i37TE9HaPi0iyCjyFldvKLknlFS8ETGFqF02A6NV7ULJ1RHuO3g7poI1JCUcm/Itxm2zZbHVN54X7
	ZALSSEOk/R1Ec7ottzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J30-000000000wS-3G9G;
	Sun, 20 Sep 2026 15:01:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J2x-000000000uE-3Y4W
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:01:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBp0Bp2571220
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=; b=gWyQcel5PQlGIvaF
	89v0J16W2kHow0eXcQk1Ikpk1UPb6+b0NyHDf73otBPE+HUejqvOV+/3rwcR+rSH
	U5tTdN0hyaMHO/toVhiJrQEwBx+XVWbhEdSdMFnrj2S7rZvfUiV3K34pTvOPkrVG
	5nBkaHu1g/PB7Psd/W5cXRb4uyvhcGZpEga5gmyBYNx5Sed3VcBk6L8s++B6t5Cd
	85Slr/CIGVr8XBZFhia0Aloy0DIF4rnnb+VN/6v70Ew/vV8ZvvP0ac/wL9F3pxTp
	Erf/PklqnDeZRWMiIPbxMQklb19aIVIxaiYql6XDrTCx4B6axyeKlqse+lhaYhR9
	DJO26g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfuk70e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53094ff7090so74500941cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916498; x=1790521298; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=;
        b=esDQxn+TneiRL7eYuSLgZfuuMlSkZJjdrI8KCMKbCQARzSBDegGEIebBf1vSoQn2rv
         7dPITWRywSAu9zyz1xjAMRhv66zlUO7vU3YSNBPWcdufx0H7Bl7T1547kFw1OqAHIBnl
         UXJPmTYYZZDt5L7WTWaMRzrHBsl+uMXqir4reIxHdmQVwoX3gVWryqIc8uwkNco++vbv
         UiJBsrSNfY0c76IJVpDTcQsGq8B75++WEaGT8Ix07snPxLMzHvAMYR/frVH9lrXwOFnM
         X1BeOtV5vAJlt1jWSC3YRJ6diH4piAULD+Z3bA6vY5CkOPhshKk7+4fnsi9OiMV7EnhJ
         eLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916498; x=1790521298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=;
        b=OeKH6f9Sj9dL0m9gulV48AH5FN264GDjcjSS/jLqV3JiEiNTS6re8hEExnhjSAcqla
         uGotEQiPqWHUXrlgWJbHXts8s2S26au2tfObBifdyc7n4sUWbv8V8D2F7tffsqjXTVXW
         t63XCvHKHb6p4z/8ktkkRnVVCxI6BCy940ofyr6iXzCP3xdoRCGnbp6hdC4YYVsp6gug
         gVXkLWU2yn8HgQInkT0akxFMHUaLaLcZLkZyL7jUi5+nmM9uLj5g3sAqUMBTF3holgu9
         p3nBz6uUjwy3bLDy3+trX3fBrthmMLVs7vSb7URZy98JrpoybNSTJU4OJqgq/wo4tsTk
         VVJg==
X-Forwarded-Encrypted: i=1; AKwUvBw+p0knDDZpYWbUVX+QWQDwMMrys4jVKVYglMGU+ou1GCp/sfhdeQ4+eSrn2WPL/RPPveNtCyiLDwI3k9vs@lists.infradead.org
X-Gm-Message-State: AFuF++lDXZNtSZCSmnUNn3DEc3Ah5FZ0S3RjM+XyPMZpvM0i4DRvMm6V
	IlB1mZhxOn46nbra1TKIrdN+u2Voe+lwY2pHTL1dmhnpT+ursdBvLp/hpeUKlhZHdKmNzMvsyGo
	62Hns+NwYYrvsOq64vdVDIzgDY4zb1jLDbfefzEaX9CKjh7KwamtgrToZ+0THig5WlHwhBtfhCQ
	==
X-Gm-Gg: AYBFou3hPXiDtcGBIQOn9g0+aIfUgc/BPuJ5lCwZttjaClKDTAoBKQJpb+rSLRq0KFR
	AkzzaGBzSG/PvNN4SJR6HOZBLf/jSh5iOM1Ajee2m1szug628L/elMEC46SDNccqBsYoqsYHhCF
	i9ozUS8tj6lSf/JqPgdx0bkQGB9tat9GrCd7EwtdUXXlAJHz0DAKprto/Z7kuvCqyNb0EML9wWN
	eHHHmUTrblRHh+xfrPkDJvkJx3hsHUJh5X0zPpuUZMMkvTLS/AXgUJSJdxo2GggBYD7PRlQNj0Z
	wcIsv6hD6u1a9+xlIQNfDlrWPrp+E5bAiCX9nFCmAkgR0oXxR57Q1czlCtK15+f28sVZ0StAYES
	B9Vuwppo12/Wkep2nEkwIS6rjg92327b4L9QAc0fk56DvYs+Eg8zgzm8wYNTeLa7H0nlBAXhaR0
	MRoKL8lKH6PuTe
X-Received: by 2002:a05:622a:cc:b0:530:d1d6:792d with SMTP id d75a77b69052e-532b71fbcbamr62544961cf.15.1789916497791;
        Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:530:d1d6:792d with SMTP id d75a77b69052e-532b71fbcbamr62544181cf.15.1789916497205;
        Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:27 +0300
Subject: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
MIME-Version: 1.0
Message-Id: <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5324;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=97+qg8LHxoBgWChDxeF1jYc+0/ONjYDkNYGaAee/3lk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHQAEbomyPgJF1i4+z0xHxN/ABd0NoA/dTW
 k3gDKnMyFWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1fO3CACx3dvdjG5tUF5UKYmmZ3WVKr4NAbrSZvIxkHvDE9/UakP/s3iNZdimLdvdIJmyErbvKAc
 S1zzrVX1hO69AUkpbXVIMN3d/sEEz5VB2QrnashFbT+beRo23VpkXG5VqybBKszC8RLy3gqDW6I
 CEvj5tEOZoICbtxS2dkMl3QqN1BcQbFmflrOwuxr8iygJH+izfFEgK6YmP/X4ZwfCAP3ElB8brx
 l8DTFq8cR0O0ZoQ6f7ZvfJpWTvHQmyh3DPIBjN2QBDGJRLKebNuT0Tu5qO2D75RK9Xtr2aYHXV4
 zQ/+vgcDu31BgxRbPGWxvuc4+l+OUlusdfRuL7TSjKIyn1Qs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX7+U7cOF2qzvu
 cklIpzhaVQqkGWyQD8IY+Vid3VeS/K+azgKelTUdfafVwSrGsJrgT+F/pWtWqMn0l9UhdJbbrbc
 XHuan2PtdofObB+hBW76lYnrSJe7taU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX7d8SS6TciDhX
 19HLzyGKNbcmnAGWRefkwUQc5q1KxO+b0qHrVVV1xDjiOGXlLh/lc8FY25bC6na/CBCJ+Qjj/jG
 Y3bPDvs9f1POKm5r3EdZ8byrY3R5bePuML+7UsmxhE27TxQF4sOFuUtfhMoh2a3u0jLrr+6rePk
 Ryn9fhtSpfBZL69hBGadkp099PTjYDKA2QanV5cHWcnpDiN62QZnn0rQBd05iPtebLuae9v6IfD
 1ioHViHJN+deRbpc441sMi9adNIQEJu9bGSaoI/hPiWJ82oBfiHc7rdnceIkwd8YnVqZOeH9Lri
 1UyXH25rYSweTP4SPX63D+9wX2AgfCPuylr/Lv/C6HpZfBAUhkKk7VlG/RuLWpFpXXQQJNhRnKD
 VgbvxVj5SKMyafdpf+NN+jZwwc8iXZm+MCLBtiPNvOfV3i+E1Vx63yVDOrKQyflc6/EDzdzHPNG
 9qNM4Pija2Ngo7+3LLw==
X-Proofpoint-ORIG-GUID: DVs7eTqPcGtpB-4JnJXB-4pEF9sUxG0y
X-Proofpoint-GUID: DVs7eTqPcGtpB-4JnJXB-4pEF9sUxG0y
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaff552 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Uld_eVi5zExU9UbbJsYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080140_007261_7572A43D 
X-CRM114-Status: GOOD (  16.68  )
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 00feb73e63d7..a51567d19550 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,7 +165,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -171,16 +173,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -223,7 +226,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5d4945ea1e95..f0facccb7859 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3698,7 +3698,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 50ed615cf0f6..a2acff240b45 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6800,7 +6800,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 906aaefca7e1..c3374cd2598e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1884,7 +1884,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
