Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4408CD8C9F
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxFt06s773+5eVX2vZY8w340a4Pzw5EhO1HykdqaPh8=; b=V9frhtIJ9aaoH7
	lhYxN+vNMQ2ojmPRHdy60TX654G71vD+KRW034cMyEUXoYq10JzDK96AKU514uv8Ke4Uus7dGR1ZU
	290OJH8HA5E6oSALpCs97XvZJb3YEufR2bhbHs8nSLnhnoBHLaCkFRIdMWtyVoJXeAcOdbi1kh2dv
	wO0AEshH1amj9YPwZKp2/nvPMSbdfz2dZIJnuGQa4e4ruD0CLyNfc1ScaNGoW09zGwMdzQGFTZlVO
	/Pc4mDSXcfMgnIA1mwa6BhDJUUZPGAtKnXYNPeTRI6nIyVLFwPjrbPVzId8r70ngOFM/POz6BgIcD
	XV/tun0kAKsGutGxpxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7f-00000002VdM-200v;
	Sun, 07 Jun 2026 21:33:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7c-00000002VZ5-0WlE
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:33:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JKmkw949236
	for <linux-amlogic@lists.infradead.org>; Sun, 7 Jun 2026 21:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=; b=hn5CUgbiAJuLHwDU
	XtFLBR9mpaeAH1nUby7GCEGjmehu4jV6xB59t/z094qPjswb9dx48zPy/HY6rVMW
	0Vml1KTght2Z/yv3jPYj97Mp2AiYhM0S1A1b5TbxkYEbvt52K/V9RlenZMZr5nQi
	R8l5kPczHLiQONmvQP1zKltG46qXolNQAkRCHYIacaeNO9p8//I8cHq70nlaPhqd
	nVGOLO/27EgaoQsTCStJQhIue2tZjfnt87dJ/LOorZg0HK69vQJdNpuUs79Ct3lf
	GHaadiTeIMTosYTqmCassoj+XIiTQ1+gFJliDbhm/rVhREHzCcPnDuFPk/e+XPxn
	2ICmag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrd429-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 21:33:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175aa1a54bso83213101cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868011; x=1781472811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=;
        b=Nh7jchwLYTXql7fOeS4QbgCKnNvM+OGBkEJxWfGLk0uHH6gptrp4UJaftTBXKoyqaq
         OZ4FJ0bXwix7uDe3rSp8K0JD3yZC2EPFwL+2OsBradYKfytBYGsr3PT4NWuok9uLQs4v
         n2sYl/GmfkjWXxdUM5bWyLMEMXRH5hRjnyPD5xsCye32u1bN++rN91fFPIQlwpAoda3I
         KcFIRHY4QvZO2OyjWd9jl/Z7b859/7jGDgskISMRY21vLZ1xNNlReHcO9wYCmstm/j4g
         04u0z+/k6mxDGiHouTep1m/duBWR7GSxWQpz0mHOhYVR9luZz8NIrG5R5d77G7VNcwss
         oDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868011; x=1781472811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=;
        b=A48tjjY+p0UOTEZ5DrVjaaxRyzxrBSaxJCehSU01cve4PcZ6V7uqqpEtXtxGOXVR30
         sHzOZSjBpn5zFCzhse1o7RCZ/ksHBij3hybdXDa4RkezzAsDhvQ/UodQeFSIB1jgb2B9
         0ppaSz+ooOV/XccVpbMoSRhVZl+taHwvW4n7GDapSBfWBq6dGK7byV9/thbe9UWEoUsQ
         qBxETbMYw9pLm6v945n5XZueClWg7RlbbiHow/Qih93HlPw37IQJ1EJuUJMYiY8u5hKH
         VUt4QMd6sG7imrubKZ5p0AUcTeKt/zLYLw19d6UjG28z2r6SwdR/3cCsfjTSMYuL9rGy
         DX1g==
X-Forwarded-Encrypted: i=1; AFNElJ8b3dvUKFoGpFz9iQ4CA15FKOafrM2bua33tzcII0/29kz20MznZII82XT6N6Yw4OpTbrchbJfNpSrWZTk0@lists.infradead.org
X-Gm-Message-State: AOJu0YwN9JC7tjbaVJ+dECy6n1gHNpr5niozElOUV+1pv2NrRc5mpms0
	w2bzJ3NgIZv6ZTq4Qw/v0q+SSd5I04r03b5Ftb6CmQ2PFxu4Y/iEiUDrUMo15OhaPacmmE04WI/
	03K82FVUgE2o6LsWNIdfctCQaNWUO+QyY4pfrKmPwX3ArQUGQacNGOzEQtnfD8Wqr2awZ1PzioA
	==
X-Gm-Gg: Acq92OGiYIVjmEW1BOAbr7B7FNkXnvrcFsUcud7tUht22GEKlV2as1dbP5eb2njBCb0
	eKFACu3QZGSqnbf51gUHjbB8nU+B3VtAJQ5w+rbwwLqn2CAjJIpDiI5zvvLiojC5dg84Un6snpx
	/Cifdaf2ScI9jzPJrBS3GJDNjHW57nZZTSUkWvn/8sNxJ0VeHcd6lFIrRjWcOhjbv7ZD9JK0ojf
	Ly/T3cMmR9zgZJDryUTwfJ/BtgzS7dd45jjmD8+a/CXJDIEw52QcBbDgknovwpeSNUKnHyAWJBX
	gWozWdn1Z8Ui/bjYHjvdGyjRTPveF5eFvyT8OsdgzIZ0YrzLCYcYpCSxhLOK9FhvzIBvVU2AGgb
	xQ+O4KOJHmjPQRmiin/SORQOKi/TBH44Lx1IFcOmg+s+E4LskSDq277UWElZj4SQNhsCuKcWLZC
	qOO6sm7eVVJBZs3tbOBrmTPDPlSBxVnNKuDO9u/ZQoeasWmA==
X-Received: by 2002:a05:622a:190e:b0:517:7b6c:4459 with SMTP id d75a77b69052e-51795b8652fmr197935861cf.24.1780868010796;
        Sun, 07 Jun 2026 14:33:30 -0700 (PDT)
X-Received: by 2002:a05:622a:190e:b0:517:7b6c:4459 with SMTP id d75a77b69052e-51795b8652fmr197935631cf.24.1780868010370;
        Sun, 07 Jun 2026 14:33:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:07 +0300
Subject: [PATCH v4 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Message-Id: <20260608-hpd-irq-events-v4-6-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QU1zz0yugX4tikhrrDvaSfvgadApD+nFc1XuyjM+i64=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQkeAHjmwgf4TWmB+cq7J3apXFq4vK/4Y/t
 1PsK+1kRv+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1ViTB/9NfpVnjn43UETfojgpSwReE0dmwB3DsDHqHJqEU8ojNNa4kPpaiCJU81lltCqj5XgErdr
 rCaglIXukNpl6RYq2cnOGXZDBFtEgA1NT4vKlAyKuMYlmZz0pWVp+FHDFuLRJ8tRA9L8J190qw8
 BO+hYy1pXLBiA/M32oxz8e8bzTDXNSD3K8dG6Y4JaoJige6+C+SFHd0d05ZNIvHff21WqKgWR8K
 Jhgy/Dnewo698WJFRxsEqUx6F3RzyX08UbeMeFsVfwktU0USS/tH60kTsuxsPpyB5yREqjDzwQ4
 m7VCLAA3vhAoRAt4dZxK3oKdlRp2MTrv7zcL8DXzOeRsT3eX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX7coSL9e/zDHv
 GkfdYG4f5gGnjJsEs0Uiujq032TNFoS2LZwAUTxJmo8QJ/5DOO/t8wdTnb8qykFOntJLhJ/1KRv
 k172GuG9ibZR+VNMU7r60JHg1UTkWxifI35Y9CI48NHhxttwSA/veox5AAfhi8g8B/rh4HHjawk
 ZNGhYPNTX5XscQGP0CNlgFzsu3qjhfZ/Eqlii+315amBCkc9XwGm3n3dp/xxEda+2THpct2lkR3
 jbhpnL1fjfMBRIZgxNlUWyNexCzC+G+odqikf+JrSDKJdwk9KFD338whLZ9DBl1J2QloFlSNv+2
 9hgt3Ixd7/bUalTDq4KBMS1Kl6XQBorUwhLtuBEQ2QKXCnGMxITlrDGT/mvRStqiqpgG00l/HQt
 j2yOil9pgA/qE5slFkATksGTLpZzWVF5rOaLO7ThSG2rbzbCZ5F3U5zftTKHIwXmSaVEDd6tLX7
 Qh4mFFGryr9TjglciWQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a25e3ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9nARR8kybDXmbW9naSxD-BoLPO12b-5r
X-Proofpoint-GUID: 9nARR8kybDXmbW9naSxD-BoLPO12b-5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_143332_208073_8DFBFB5A 
X-CRM114-Status: GOOD (  13.02  )
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0f6a8ff9b99..743d8fa40dc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1533,11 +1533,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
+		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
