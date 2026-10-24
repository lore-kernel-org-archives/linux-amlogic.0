Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1755606A33E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z7wz+MOy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KxFtGX2t;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZZ0BzX5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SERqnOq50rHHwpMzLt+jmA5D9TttlOOel0B3OANTvvI=; b=Z7wz+MOyr5PZro9Js9eG61bQSV
	Aq2ZyAfFl/kb3VBybTJXkrF1yYk1ASnGs/KC+jKTjS0GxpoPWlJT/OhbQRMCzVB0rEt70KiDOO3ES
	7bzl9QqHPugSSCNtoR6JPkc9gi2khBMseEc6w84WQOhd8ynfQsOtFX7SFfXCCvfqf7z73SbWpQrlo
	HZBdqS4IPuc/NjBPyTSK2r9nudl0KKEHoSJ/Z5Poti3cTbx1Rqnj/YQJchH2YEo3ozaSywyvBYtJi
	3hBpjqtDnHY3hEL3FWisQ00F7ihOsv+KGfPYrHKHGPeNx2QV6JWpd2tSvSRdhm13upmz2iE1/zZEB
	ryyALB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjv-0000000HGDJ-2EwT;
	Sat, 24 Oct 2026 00:36:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjp-0000000HG6z-21qY
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 00:35:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvB3G371933
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=; b=KxFtGX2txNqcAgvt
	1G8J7te40dcLokdUz2l4aGylFpgWC6H+zgi4zNq59N58wsOY6ZBDcpa3224WozqE
	pLK3pirOwO+tVyQyu1yIYXj1Moo7i3sXx0guc4Ow0KzKEIKTpF0Z2M7XBVrmKzLD
	EExzQAPK2eYzhnmoK/OKhCO/iGjgiK+b6CyzFWKO4dkViza2euTtjdv7fouja2A1
	DWb35mGdYT0mC1ZzPVG/1cIZdPimAHjKVh/g71NSvLEPOhLde/EheYGTpsaeGM0W
	uoWz0FdUQGfICahavsboKykM6fu5mEAkVvVNcTuLKDL90ncZjEbo9dxzd6xjp2ad
	49UJmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas89h8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:35:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso279238385a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 17:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802156; x=1793406956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=;
        b=ZZZ0BzX5oZPBQ0sFXoPW8fGpyhtbTvTeD11cwifHChW4cEShjZIHlu5E7ZIIFCTRhn
         IYxhaUVClt7U1//RHYQFAcV3L9AXCrkbte3Db+vDYseuxXe0xLVQGTDduhzeYgCMJnze
         4DoI7o2uULQ1viRRT6e3qCRGmbS0/y+vNOb5MpBeAzFr0PbO7EQ6RquSK4KUW0DfTQLv
         bPxtHGWG3/4PiHDnToE+kWBJ+QnKJ8CitqBu5WrWk6zsTkmKU2wL8zYHYhghP0yN8a68
         9DI7UyBU+jD18GDRQvjAPAW02KciLjyWzfndhsp3csZMFGTlFXrYK/O0nREA1xl8h7Mx
         QIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802156; x=1793406956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=;
        b=Z/us31ux9CQsGmKeo0Rk2Y4gSYpb4dOehFq4wiT6hRIh0A+j/xZ9qC/U7sCVYxiVqF
         8T7Bupof31MSvCfScIa8sDuwwzzT5uUzJ0wLaTdbyfa8m1+TBRyio9Nnx06PrjFKKXnr
         yzGCQ2Q6GSHli0+2bidqbl16RqXhb7nuZSyTOg+7Q2aHGgnjJEflVFXqksa0+tFICDoj
         hFZUj30rmXxnhXHnXZqx/zxYFwA5QhVEGbWXaCi8dWt6kGXJAUoNcSCSzLgP5N+aAgum
         ZP4VzpgjUQ1xo8Bg9FzZNuisHa2N9i1sida5yJb4VbOtg7P0s4a/EEXOHfEGu9s08gcg
         Dlug==
X-Forwarded-Encrypted: i=1; AKwUvBynZKs+AG77MNZ9Xegj0rvcvoamg9kbDjLHiYmBJGq2UwTYAts+N759kcaxglOPj0GOZXlw9Ax9pFfShT6/@lists.infradead.org
X-Gm-Message-State: AFq9FYJw8xWMreUCj4izyncHA0nRfhr4Em3YPkRPbctlCt/57T1vihcd
	z3R3L+H42y26v8rewFCfcHN6WaB5ATrFLpo4eAaGL6aEsw2Z26iPicqf3G7qY66WworhEUpHogW
	uVwh1swhg6QrObXVJq5FjHV/sT7U5Q4PGfjRbNK6NxAY0vu1L7wTNO6cmBWBmm1lpFwHcTRs3og
	==
X-Gm-Gg: AYBFou2YoN/gBeDLIQv3jjF4zyXMlGiXuvrqhFZo9SJiGeEi1eSX9BZ1a4buuy80p5+
	YvyMLYXoDBHgGlyxad/EIhCJ0P5wprWj1ipN+n6cYpcUydwPqp5b1njXXN3asC+62G+kkwdSzwx
	o+5fx1a5RMeQrxPlKSMMBJmsu1351We8buS5SziDoh0E9oPBhc0XfzAboY+T1z68+d4HJLU8UHh
	p+xVKJFmPu8QFzoQPS2+pM0WgLBgldgfyVtm1FARrOABEiwJSW3L4iUlX/JQwhi0nULLmFTPXvu
	2gqeqcyddJFToGMhG5qlPtplM3lnEhx4+Xeai49klvAw6i/d895D858clboCEFp8uGx5a3ar3zT
	8uA10MDnh1YmeQUHfPbfhhW5wijSSOctdfMGqxdMQA+UaJ3yDFpPqWrP7sJh0OC5ydZLnTO211R
	eRpwsUK0KsK9su
X-Received: by 2002:a05:620a:4556:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-940ef9a7ceemr108252985a.64.1792802155575;
        Fri, 23 Oct 2026 17:35:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-940ef9a7ceemr108248285a.64.1792802155059;
        Fri, 23 Oct 2026 17:35:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:20 +0300
Subject: [PATCH v8 4/9] drm/bridge: pass extra events to the HPD callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261024-hpd-irq-events-v8-4-6ee949e7a384@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7777;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TPnvnv7OKu+5AobeMrUefT0VwzBWz9C4rL+GJ1Fgj3I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1QTA1GoNRKRIDZ+eKJO7nQL4+WziHskbhmB
 ZyxtOGps4iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UAAKCRCLPIo+Aiko
 1RDFB/oD6bSL6OUG9X5TkiAe15ip5MWUFVLEw+FNoNsqT6gI5K1bULm5YhBekLTQswcesqmdacw
 JSZMMvtxtyQrzgMNAOIhwtz8DoTe+YkhE6BF0fiMKY79L1KB2/JMkVuTOAEAJ/6v0LC6sxlOyw7
 6Rl9B6ahLnWNtPZA2PAh5kQLWCCLARoqPq1j/8hrD62DumHAR8SY5Ss1FgqUss+HB23YUy96Djz
 T/PmTj67jtzA/fjl+otthz4T+z5uL0xr3SfBmqkkQJaWr99xUgPz62FYXkTZrErw201SB+PmgYH
 oqqdp/YPyocpaWOJxT8n511CTvNFWWskEgoRIQpWWb3njGQ+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX0XaMIOHVYYPm
 vzUqdFXYvfWBXW4xQgPybiMT8MyxyPReRoSfCKPa7cxPxvzbYvoPcH5tHZ6pgBbgMhRyG4+9oM5
 yKqK/EzrRerkKQR4PbZpHhGVqVgKMsI=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adbfd6c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=UL_CVLMTin8KOx8HHrUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX7diu6KdPDrOh
 EgsSTmRmdKU+8sAsA4d+MQTlHgpSZmQIV6Q0qBX0Xc+oilSsByoNNGdP9T0yhCEfzeGebidScRu
 A6D9+WlNB5mQeEEifg3vbS9/Y2wDYtmHKvnzFej5IiQ1kqoAFiTg44ZKI3XoSMCdP+hMa8hG2Wz
 Ec0UfC3qUXOQ7dBYpY+JQ4xwGZqPvjva2kbQS6v+8zCDWoe9hNot2M4ZRMVt9pHBrRj6RWRxTmM
 CzI1FxBOSE580C6RMXE/qBzBhLm8/76eg7kqWcDC9Wljk1JXXIKhbXSiLgTUet3XlZ65i/ij597
 dx873u6qB+y8je1T1E6jkzHZF30q0PzdFt09LdsVzv/JO+YeBMxFdiL5o0il6Tl4p+QqCFTznC0
 oNk0rpCDdCMsNainXVZpRzjyaqsLUMSTLAfuQK20Oac0OJBAD+KIWkOm126D3e55A6tEsInKwI8
 HZlSBlLYXZpwQG+a1CA==
X-Proofpoint-GUID: _RflclABFMDxzJmlVyIFyIJpEG-H6oi5
X-Proofpoint-ORIG-GUID: _RflclABFMDxzJmlVyIFyIJpEG-H6oi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_173557_655699_2C4A2092 
X-CRM114-Status: GOOD (  18.62  )
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
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
 include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
 6 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 4bc64b2885f7..deb5d510a616 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_dp_event event)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e347d04b7b2d..82f5232b4205 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -506,7 +506,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 629ff7095e87..03dbb449e0a7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_dp_event event)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1b0a1a00d8eb..4ade63306653 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -172,9 +172,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, event);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..2bc54131e58b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1553,7 +1553,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1611,25 +1612,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @event: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6382ef5f1ea2..c839a6993a83 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1208,7 +1208,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1517,11 +1518,30 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
