Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADFF606A31D
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 00:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EKTLvs17;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSvT0cdV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAPCNdWd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=33h1t3D2E6YR6+yWJADfrU6MrMXd8jjaFQHj6AUG8G0=; b=EKTLvs17/z10uAyJLBNHTahMgn
	FH+/KikCA2er5gTwoOnOsYYFcAA9IPpV0n7/3/sXtFm227w/YOvAG8QlFoZb39xchZ/8jaMVreAnp
	oz/B7YQusuDDy7e1U3BaCQkPZFwSaYEl/U9/w1pvQEG6odYtd7f06lpEkO2HaHKjbLPfYpnSYwgUG
	6jeS6JMwk62JjvIAEaZZdwAGzPbFrEezA0CWy+GGc57N5OJ2+jWM4hyZXGxSh4xBo5sbFN5PzWqKj
	waXtS7eyBE4SBBHpsDjSWxhfbnBcbGL3yMu9yOUxpatwyEgXhrGDeRhJITNGAv4MwbRT6+UxuGxBz
	SeXol2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjo-0000000HG5y-1Fh6;
	Sat, 24 Oct 2026 00:35:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjl-0000000HG3N-2CnB
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 00:35:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvBeP297028
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=; b=iSvT0cdVgJ0EsrL3
	VeUXDYlR1oe5zbT2nm0wBC4FnO8cxqsNKwrwDhJmAvn9i5lSih2nc5iErX0a+Gtq
	roodXLvWOdppJmPElzGeOnCQjpDETl5gVeLhlfLW6qTCKqh7FYr6Un9Ie4R6i1en
	ls/82xYkae/pNdhQ08MGuYtbltS9LJFdjhEqtuCte+ZEKzudj1kxIWYc54coJZyL
	Z76e/G6Kw/js6zM/zMJplDPRmv2FwKk1DAt+Mo/E5NoN7jKYVgNkBSBsmpL9q8fq
	Bs7VnL+R9stFWJhrI1Wa/UP95RCplurVhAX07Iu+ZwjBfLUvaemJpEA6LyttJ7En
	Yr0Txw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhh9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:35:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso178722585a.2
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 17:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802152; x=1793406952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
        b=SAPCNdWdvFmZg3swLRFT/yUsUSGQTDhbCG9rVJMjGIozxTEJm/embpEhl2BGAeLDEz
         Odo59YJuXrsfEJ0HXMV7h+Q6fY6YSA9sxMBmz3Z9CxDUeAHgXZMFa2W3C7BWgcDvBmu2
         srpKm/oBtR40LnTVbwqT5pjJQhYy/jYTT4K9J3pbg07GxYJjZjtUkpievODcuDOnZ0Fs
         vqWvgUILR69sArGNY8pT/VGuHejvrVLN+VRpGYSlqkPFkbO9kCgcx8OoJBC6DXastRpr
         6/C/qytl5O+LeNipyhhUVDwEn/oeJbIisgYrAtvJeKps6GYVN3/nWWcf71+kyHcujX28
         arRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802152; x=1793406952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
        b=D2/Hiy8wSmbG9cMWuvgm+3Nld2iRZ7wNQ+thSEiM6XzEDri+qj3Izr5JrU/bTkER1i
         7Z/4Un6KB6bvFMSCyKmZrPM0GMWNOb0YlnhjfivzoUVtGZKjn7m09KjeAW2akHrejhBE
         pSRrk+RhlE+GsbgJoIxuQbEOPlvbabDHj+IArmpRNHVrjM8VbpaaYfL072fFiWFxDY/N
         1xxitqsvXlYn/j/PHVht222MAt+RsfM7qskxmphsZLyrNQzEIatOd14vL44skRFtd6Gr
         NQ6jwppwXdZ9Fck/WDmGg865Q3oR6gOzA2ij1v6HCez/iOobXdY7d+HzdbENQP3SWytj
         XOKg==
X-Forwarded-Encrypted: i=1; AKwUvBwUUl5luIAhmwW2CX5CY7xjg8UFb2ETnil3k1PH/hBvlZJ5YGmErDXnnu3wUjrXecvRYBpKI9MsnEwZRRuc@lists.infradead.org
X-Gm-Message-State: AFq9FYLrEQbEhglf0NfJ2GEzSHy3WmryjgSqG28GlT4rrOv7HcVhAXdk
	M8Ub7Wpx58FqThr2GT/hZo7GdYeHWXcUwvk5wW3zQh90ZMXlAfTQLiieJCjxXg0rIDzhA9yEXow
	WBHbD5IKy2H8Tii/c0GyQD8kNWXdWoGJNzwPGR4KP7eaMnyaSCVjGsU0+O6ZkR7aEwZYtQSFgVA
	==
X-Gm-Gg: AYBFou0ggDquMqf2WHiTg7Olj3P5cBrJ+bghZvgm9qkGqGHRpyTWxcI5d2zYWNokB69
	BQqD6FoOt6afZC7KLy+mpL9qCZiKzOWhtl3yMFk42rxUlOub4Ma3t0Zjon54NMIU67wuNyalV6E
	9GDv5B5pgSV8wbMDv+AXVSY6uhqVPIGj5wFjG/5eebK4ehf3DDqW26n8P7rZvoocXsWscdqCeB0
	924o0FXyM6ddFLg7TZ4rhBhSINbOMPGewIs9BdUhVTj2/qJlmTgkprUFVwLZkAsVh9d/X8nODxX
	LT4M88myrcddsQcKMt7PSuwwszsKNT4sg9QA4vV9fXbJOft6l+gJrhW9fDQDUTIlMUYdISQ2AAs
	FPz4T0/GgP9Y40MkwD27f2Gn2jOW0qsb3g5FRrObHy6Ye90KBSBOuHVRGRfcAoYq3cktOdQF70p
	eR/CLKEJ67Vq+Q
X-Received: by 2002:a05:620a:31a1:b0:93e:7ddb:5098 with SMTP id af79cd13be357-940ef914055mr112226085a.25.1792802151704;
        Fri, 23 Oct 2026 17:35:51 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93e:7ddb:5098 with SMTP id af79cd13be357-940ef914055mr112220485a.25.1792802151133;
        Fri, 23 Oct 2026 17:35:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:19 +0300
Subject: [PATCH v8 3/9] drm/bridge: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261024-hpd-irq-events-v8-3-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cbl9yZWv2wcwZMEJm5DgazWObDlawl+w/YpgLor6f/M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Q5qq94RDFJmqbrbH7//o5wMxn1txHfn78s
 w49BIQASi2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UAAKCRCLPIo+Aiko
 1YYQB/4gOy8ZDd8HxSiS0ermuGBCe/hOc4/eCJhGWEwmzSzxuGvDIciQZHmqatS3ReVi/3StJvU
 dENoSV2zGwvHZbVEK9yPEFib63ePlwc1i7cPZX6HPCVQrHd6Rvt1g3wi93xkccFMUAB/UVKqRue
 F+JA0xVmUayRO2ZgrXX19jyiXe4PvtTcRqKj39KHj/eiPb5tSnL7HvlFBeX0X53be9aycR81pt7
 MR9fdS8Pw5smA9t3HMU14UDhj3PAWAH9VrtqZ2vBYeoDM+EewOEhEpgSnop27oIv+UXDHEaY5R1
 RHAazD8SmCrw7qew6GgxaS9/2xv7WvNkSnfWeWfwgp3Wc/xu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX2EwbU1Y93iI7
 Y6N643pykSaGnuVtz8NVZaKqyqpr5ydiNXEb+PL3MKAuJdYyDYRqetks1xVLNcKK5XL9WRxBK49
 Lfv9BkpYWRMYcbQi9tidl+H2YFDJbQ0=
X-Proofpoint-GUID: GAsdAxgRmzdWNS0yZz87_qVfLwxWI_Qz
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbfd68 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: GAsdAxgRmzdWNS0yZz87_qVfLwxWI_Qz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX/j9IneYAtKpx
 kwLbl5EM1JHfa/FXlvvAotewiqgBXqJsgn8iAgqDqdF8iHxm3nS78kxUMYY6WBBgW7Vpf6xn90i
 1d1rpFePpkRJl7hwcIPIe2RyB3IW/sNUlOyP8AwnAHnshhz2QrQXMUk4jBz5gtdWnysXBEHcAtD
 bxV2KS8gjG/0192YZSqVRTNUFyCASaY7karDI0cA5MNoPlJWIGz7HiPFjeuKgM0rp3+3zYwX1V1
 CdZaeU+JlaJBMsgxji/wr30I/nQjlNzh4oZ5ykW6hB3VykMOei4igpIx0nDUTcQqEeFyoMfNWYH
 wy6P6DUYnuzl07c3wTPEJniy9chX1AcPFaqYER0+pG6g+ILWCfDOQ0HX6+JU9INLrlKeKhYg44B
 gAZA0NWfqz1id6HGSKojoagegPIPFQrB4GCGE7J2Nd9QasK4YmjMZN6ptSCuljLShsLbHx6uh1i
 Z0zo2ZWmmPlaXTa1n6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_173554_200186_A8CF6CDB 
X-CRM114-Status: GOOD (  14.97  )
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
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 8 files changed, 15 insertions(+), 8 deletions(-)

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
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c542ba6ce7d3..a21f9355594c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
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
