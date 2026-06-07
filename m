Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBCFCD8C8C
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izmQLgYAk7RqgPlKAZYXEGC3vsLTMItBXKTs8YpND1c=; b=0fpqW6yv6o05J8
	FEBwDyxdcEAFjBDoTb+csr0xmJwaeZ+0E0isFdUMJLV+qDnv1j0UgrjdpmGFJ0/RnwMjzHoXe8iOc
	C+cLBenrPnGMczO6eoZy/Wr9LIu6kD9VnOVCHWsLpeC2m2I3+5iOq7WKwt+sY2qeRYq5LwELuVhQW
	ga13/KFaF2tYhlV50DIUEw6XyKT+NSOA75T38JZ84ZsIq0+ASJQ6JEQ/g9HMc3WrgC2pUfZx2aYgz
	9wKWFbWUtfUsMR8xYehQPbM5yO5xK8Ubf313Vmyp61liPAR0PjJGo3bwDZ2rbviFkHwSpWjnFfwKw
	GDj3hEsX4cnmnjdxVoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7R-00000002VP8-1VPC;
	Sun, 07 Jun 2026 21:33:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7O-00000002VN5-1Rbt
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:33:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElCfO887536
	for <linux-amlogic@lists.infradead.org>; Sun, 7 Jun 2026 21:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=; b=lgf/vqiQvwidXX+J
	H3u0Hg+bm/YbqD90L3k8SZI/n3ibPQNlDNkNDvBLEr64+i6fWp/V5U5XpRMpQR2F
	odM24vycGfIYPw3s60L2/A+/3QKHA6fxU9wgzMQfRsitxyYxItsY2UySoJr2DnPU
	03QHC9EGoT8XIVoRj+k+Pg3hPud+QIt/ZW02lwQ1AAGV1uJLosZiP6kWv2qoaeCh
	De5+wRgj7FIMkfONdSCG6cls9Bsftkis27VLuwXgZ4gqr8+rI2CwFz+UzeSTkLGR
	DHHlFLjopbK8nfjbWPgBBvJKRiGuSEkT7lePsMNWxQIuoIv7E40uRIoTHGccEJCT
	P/HFdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w4u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 21:33:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175aa1a54bso83210731cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 14:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867997; x=1781472797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=;
        b=AVYKwsD8ybfCJyniI5Ektyx9IR3OX8oZqdwIz2ea2m0jle+fSAnCwL63k8LJNI+98f
         XA1JNFqwbC61L/r35oaY3SvgRQwEhhvS2wDskoFWEJ5aPJw+P7sCv2fhCDt8oM7v9qdJ
         8f8x/XS7y26YvlWbic6Ygb+KsyCrNJahmdUT25dsDrj5nA42pL/6Ut/Ze7Jt9CADY5pM
         GALlYfDxFgiujuI1jMAouw/2x7AMRwpTthHqqipcje3HJFOshqq/G7o+J1OCPgkUmZUU
         WTGwC2TJaeJh6GIzklh7JcDUZn+O+wbQHjH3u61RFAQ0ZI/U7Ws2D+TmOteoN/UJKmUg
         khAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867997; x=1781472797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=;
        b=aemxeOL5F74fZHR/HeM/MjvNNvqZkyNfyjZ8rn6fKaDo70YNQ3KugdTMBlug+OXtoP
         KtiGXPfGAvYV7fo0lAct9FpzuQ8J2acb0BZTVgGgIhps1lIumG9TfWsS5yqgK7BJWWLA
         Y9sKJTrdiBJSoC1Wjyu7xntaqRW9g7NDXu6fMwS0VU/+FMU2EToAGIw6JIHJrYQeN9Ks
         Gqkn5oZyVnHSrFpqxE6udMU6UdsuLRYV9W1YB1036VRt3KEw0Y+xtjXZj5NUOTxYrYrm
         at6jXxX4WBoEbHdiNpZaEIeBA/k3Kui4fxZiVpNf66p/TL72YQ5PTcNHu+tXKugsn2eI
         ESyw==
X-Forwarded-Encrypted: i=1; AFNElJ9NCfZn+bhopf/dDvO5UqJvMl+GHOHbERV60DI7qZ93xX6mxIlDwmJhne7tK5cNNl79kqfueoO1F8M+FMo6@lists.infradead.org
X-Gm-Message-State: AOJu0YzJcfegy+MQ+FVnd7wyVHN7qAqOAEfkq6l4Ail7k7/3B6vVpaJ6
	jOUnlPM53DaKS3EkXu+lqrb1Ty6zRRGNhFsabLYrRG5PzZ9xJ6wivumeeg85Anqq3VgIH+n6Euo
	w3d3yAUgxmVSvIAMuWjTl+fFWQAgRecE1BzqlR4gzQyObfR6wbN+3PWLzv0DinI0v60sS2xeE8w
	==
X-Gm-Gg: Acq92OHl4T9revPoXvmPyMoy29/rIeajrAQRpko/qKynaWLk/6wr2oMRifFdsPlB8vE
	ZFeQD9AfXYOF4OC+RCD+OSzpQfumgF24LQdm6MZf7JC2rKX8CHhIz+cyrvaGdBGVeWm/e0jdrVx
	7KLZMUS1UuZXy6CjtrJNg6rEK62uFUJrwVtYh9li5KZOF2AnGFGPIe8dQzVx+qIURXm4x4eljs3
	t2n7TkckrHLHSkq6ddHgZouvslTmMOkXhp5AOgV0+MWBEABE63YB4NdfKtd1tgfRIBAENtjgs0f
	wMBs+N/jZjUYNPL50CIlCTc9+CZ4gW6l9UvtXSCDxGzsyQp0ypPnuDukP0Hkp2AiD7NqzpqqNqf
	ISxxCAmnTXHlMkExaH9tqgDdaDIvyxIKvQs3j2mOXbGJIYIwfMA8DhZLR1lmOIefOkAqZ9u5K6U
	rZ5Si0oavb+/Q6y9TZNqrm3wJklTprw/ND6qUaMeUQuizBRw==
X-Received: by 2002:ac8:6109:0:b0:517:8a19:a461 with SMTP id d75a77b69052e-51795c56d21mr173338561cf.42.1780867996752;
        Sun, 07 Jun 2026 14:33:16 -0700 (PDT)
X-Received: by 2002:ac8:6109:0:b0:517:8a19:a461 with SMTP id d75a77b69052e-51795c56d21mr173338131cf.42.1780867996264;
        Sun, 07 Jun 2026 14:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:03 +0300
Subject: [PATCH v4 2/8] drm/connector: pass down IRQ_HPD to the drivers
MIME-Version: 1.0
Message-Id: <20260608-hpd-irq-events-v4-2-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
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
        Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A2PPAf8RIZIumN5Va/to+GsP1RDHctHNlwnN5DWn79k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOPllDTwWwMp1vESqk1j4UB0AHP5j7B5bL5X
 uq2IPLISouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjjwAKCRCLPIo+Aiko
 1VlqB/sGaQ+sksjZm1e69F9eT9jxsXnLzH5/YZqYUPV74YSWdt5FApSzNf7tmIphhpE0fUE4LWH
 YozHAGahdOxwneinArqneGoOTQvp1aS5h+di+zQZRzeWHqayX0N7EXOGpaohwBQ4lC+hoBv/c8U
 YLVwGvblsq7oFWaEfoE8yeFhSDBDDkIGhIPAeyPRq5ZThVvChLMwD6AbWU6i+EtF/dr6t42Lvhz
 mHngSlPxsh/S1AoVsH3HstphanM+aA+WlDkXPZdW7t2CKF4cAZX7QfbWK3QPNP/frLMhRl0ND6W
 xAWtiViB82XxNOvQFNCDI+lH9MaGzXCY3tiEVgH4V2bJFjLa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3vGYkhN50uN42nKKx0LZHYL6pkt2nG9D
X-Proofpoint-GUID: 3vGYkhN50uN42nKKx0LZHYL6pkt2nG9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNiBTYWx0ZWRfX7S3CAEOWZAi4
 ZfbeCTHULg8qCOwzruUIG/9sGRxN7LBmKnlH7VGrUAGTJQe6kjd3XkoMshZBe0pp8k99XXVvLWx
 AaH0wcoUySpFe/cTJnIjxfHRXGPyOWx13OiytjmRsHwCpJZna3XQ5lUE+rYZcU0UYnNQ3JSVvsZ
 liP3/Tk7STeZCCyzzjCYdM9sQTz4zeV94VBjuGiZWUeW829Qp1adfqomISWkH2ryRB4+QQ2xJgO
 Lt2vfeD6U1zSeVd31+jddCz++4zpKtiGCfLQhgOdEIUDoYLRTQUm7zdVdWG2kkqBmXaI7oxegw1
 nu0cKRfJdviorObG6hoKevG0LHaLzxxgKzUyUezcbAgEBqpkI8zDXfZFi0/qSP5S2fqydTuO0pq
 3BxAQqFQDmUp1SN17s3dVuQ4yLe5agbEgpN+qSRKreCa69EAG5tZ9rxVd5Z2sinRsiz5WIo/sO5
 CuR+pBBs+IuSAwXd1lg==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25e39d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Uld_eVi5zExU9UbbJsYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_143318_503711_00F8EF0C 
X-CRM114-Status: GOOD (  16.89  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 649969fca141..046efd913064 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_status_extra extra_status)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,7 +165,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, extra_status);
 
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
+						   enum drm_connector_status_extra extra_status)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, extra_status);
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
index bb128dd0263a..d99019fdea9c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3528,7 +3528,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, extra_status);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 85d3aa3b9894..31acb3129723 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6990,7 +6990,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_status_extra extra_status)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 105da7c94910..5784bb9c4021 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1720,7 +1720,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_status_extra extra_status);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
