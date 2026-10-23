Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D845660A380B
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ufbOV6hv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDJWPxkA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e+ZpP7yY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CK0ZiBDnutZ3XwwVcugCOxQKN0W1/s81q8pOInTLnXE=; b=ufbOV6hvDi/NwfMM/1e/CvCNpp
	O1xePfAnQlB+rkAvgRZIJQN16v3FnsiKUtSwzaSfmkVcn1MQzTlAe2c8IgQk32HJQ2kK87fncpbJa
	9iqf0FZsl9ow9IV+V0zQLcdDftu/wPbW/6JEk3WxiYymPOjUA7o2K5uFipa7icJDVCm0xWPL9xDrB
	q+iK8BmIV+3rViNquiIwZD1Y2NwDIGLez4inN7jWWn3NXE+BQnMJjdvBAw++E7kPIUedJ2nkv7bN5
	S+XNGpxieX9an/naAHaQ8/lWJQMrVaAgmTWRrJ64OmenrpTd6+NclZeg/0p5tiF5FRFq7k1yHIwRr
	R9EXxYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVQ-0000000GOyH-2Dmh;
	Fri, 23 Oct 2026 13:40:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVM-0000000GOtR-3rvC
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAEIG1597339
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=; b=hDJWPxkAKoIKlgAA
	SusW8uZE+xFL1P2FouiMwWxolVkIozu/GnoEgzBRpmbo6Ef0/cZx/32qBVjLkvCf
	26brYVJxMwDSTEAL3+TYnvgkQ/u+8hVCLYlIf8f60kpaiFVthfSVcWb9UjxJHaoG
	5Ccx7EpYaRdoJ4Psrtg/Wcke+AUfXNf4RjDbec49A9yBcJQzYJi923liHwrXtSkf
	2Dc2HcDIfd3DfjZCJcTA71jRGELd8gNpRoiAc6/sjwU03MNCmgWznSu8lEEcSCPF
	LQ7YnC5ZWc//ABmd8p+JWGXIZtUphaGL8b8dCB1/Kh4R0Px0reae5cm8FwtSu/yM
	d1qkzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso180059085a.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 06:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762819; x=1793367619; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=;
        b=e+ZpP7yYmHpSKuO3R9zEoaSbtqi2u0K7ekyewPwGuuwlTy5XdAvipoIzAXicq+2LD4
         IHeITcw0QbdtJSf8wudLZx8sWo5aksXTaJfE5MzpV4xgXHcHLT9sXRpAzsN+7X7DZ7J0
         +BxgCThPILrGam7Ww0jfsIVGNUsRN4+RyKDZfTycXKxUATWSWzJyrQuve3/2ql0Vap7T
         JNF6KL1APzX9BCGFeHkf8urEJKS1mgGUlyOxknQyp8WhFtA27VQd22INawFOU8bT0rfu
         bNj2zQ7vJh7sHNqXirwyx45RSYgxKS6t2K+P3msgiqxEHlQNPAQ4kDu12QGetccGvQuk
         JhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762819; x=1793367619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=;
        b=R33gej6r1aiss77IZjjfcLiHC3IX9IZr2ZtkDYulCMOcHRPo/x99l80+A0zcdOxSqv
         VtBSVIu/8ocZRtNCWLsEkjQKVGAOdm3rR1rHIdgc2WwYt2b8VqtOzRQUa0L9CfD9zoC4
         IsRMBRgmruXZu9K/XflCRLjxO8oyWmj4P1hNbLeYn5hxmOg+Z3vG58JLoPb8eP7IULTb
         BhXwxMtUEt5PIj040/33jfWSAPDtp5xPKaKOsUy4Mad3Zn526cnUKeFTaBgrwC/PjgxN
         RnW6xYAXHlQ9KyjxwhV0EADLYARO9+QkNJZQpf5QL0XvfxFZt6lz5XsaWQntT+LTyvJQ
         CM+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwx/kI0Bua1CPts0XZiCTVCDJMibIb0a5G1IsRbuQCaEyv+vxB5HxZy1jzL8CV1EVqwnEwfSZ9T8jsR08pd@lists.infradead.org
X-Gm-Message-State: AFq9FYLF3GgnCtHDdRcvqUgoFqJ+KWcVtLkFz8hDd/fPlyWT2AXJeVPf
	QaKGvIRvHVjH3NknSyuuiLvV4QhsBkl3QdkV+ge6HeLhverHjF3ZJUAR24EaBV7CXUDZtpG8LYB
	7B3fHur5Mrj0GOU0P1tsRy0LURrMiUJNYu7mtFKY0iZbLfh49/RLtq00QrsvQ/MZJzaTr6j7miQ
	==
X-Gm-Gg: AYBFou2anVGdg3xAQUYmaOvuOoOpx0s7H6Uqr3uTCXVl2JpfACjOUIJUxmzYADV/3GK
	UcmqZhjlXFZqlu5BLclfgf2yjiUjtZ/fBlWUhBPKCuE8SWMlDqA+iVoqePBLWvZNG2SBySqChTx
	a2nZqPHXqIs2fhaDfrNLuZGqu0kbKEcSSIBDYqz2HeLRQQ5Vhrz5+EuSWGu31YFUsFME7AD/1+x
	cS3GM5rQw3h2CwF6tnD5qkhAXbnEIXF6beqVkarIASd1vbqSdYEv7vAzYMqlX86WeImA5Dp82zo
	QVV9l0JYVOO8Jxf0kyasT3FwN1K/XEhdJZ7bolaSxwM3Y+2tX4lys9Xb6vS4U0zxWZZMrMV/Loe
	qqb5hHv7AvUBgDDzDJVltn/Q58PCNtEFfN3w29u6BosHu0aVtXHYb+9k7jdaPD+jhiognU76iqw
	fxpCOPH70zlpd4
X-Received: by 2002:a05:620a:711b:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f6f7e7050mr447539285a.43.1792762819169;
        Fri, 23 Oct 2026 06:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f6f7e7050mr447532385a.43.1792762818611;
        Fri, 23 Oct 2026 06:40:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:43 +0300
Subject: [PATCH v7 3/9] drm/bridge: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-hpd-irq-events-v7-3-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KMVFy4RL34DmdlhxPX5tz7BpH8GKfVJsVv1QEc03rr4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22Ondx3gq8X6yduxIREyCDV85YYpkIg3G2DLz
 s1gri8a0W6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpwAKCRCLPIo+Aiko
 1T+lB/9bA/2MncyaM38hRnnIf4AbnFXT/EXnYTkG2+JVmd8BpfAxBlQP17JAf9zGdkwA0pE890H
 AvogyzPKNNYjAaS8HXV6tkF8XY/fwx9SCziwRW2uM5bPBYtlV2QsCUJCYZ6fx6otzqXI3onW13e
 s+d6EThrjsDLr4hyuRYceEdkKfH5lpPfPlXoisHOi2Y26QjFfwJ5DDDFHmGOK5Qj+Bcs9cU+jAe
 WnGX6wFayiY1QqTrAnralEeCjIbTE3J/S2aT4y3IicatdzxoQjv6yky88cu0NBiqqyDFWDl/sau
 hm3FOA9WnlEpouexSGHNPLOZ+1F+MFK5BWPfYXIA1+48Pehl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX+Ew1PVe0QX8k
 iZrM4SvsQy00CF1Q/AP629p0FwzV8NxyyyB3UeoRHNF23Eky82KcWUD2RIufylXCZ4jOxv+mvK6
 kYDMGUcxV4TN/BFtru55ISsl3WileH4D5yHuArILwfu6IcAvezMjm4kwkVLHYJ94COU7AmLtjPI
 zR3WLXbR8i19fCIcxTamrNYQLEUuf9Jkzq/0iQuWEKQryqUXGFayQJXdlJJ1L7ekxO3uQfBw5NQ
 Gs1RfQxSMjf91eklG+BPpwPlJpvApS5ewbPTZNiujz65LP7IH6TyW7eUs0+vp7eCSEA7dRfZVSJ
 duqoo+sfalJ1Mu8FFWPWpOe0JPOFT/9xHy55VucnC+M+X88Jd4xwMFMnTllJt1OI4iAVL4vMy48
 JJZMe9uEZauCeOgJNIUV/zzjVvo7ReC6pbJngmEq9QChyeETl1hPLuHwZ/sXDoDYZyBehrDVQ5b
 nSLzq63DGM7zkyX/wfg==
X-Proofpoint-GUID: VOWxObqWlQ5THCIXhIbcnqnB86yquvzU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX6z0MsVh7U9sB
 Cjn96wlFb4yA3Lz2Sj/RL1yRloAaYeU1XxxqEtl8XsBsfb6Re6dVUKY9xlNVYoPcNueQPv/yjUA
 QE5VOKsk6ZvnSdNrNhwQThB5yMEUt00=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63c4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: VOWxObqWlQ5THCIXhIbcnqnB86yquvzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064020_981027_9E13967D 
X-CRM114-Status: GOOD (  14.88  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 898273f60cf6..1b0a1a00d8eb 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -151,7 +151,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6abe30bdff12..fa8942922b53 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1541,7 +1541,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index bd6c4d2dcdc8..72972a6fe989 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..6382ef5f1ea2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
