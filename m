Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31CFCA6015
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8KumuN0aOeAPieLT+MkXDqKvTJLezhvy61e0e3Jfl0=; b=kXv5XlSGsYzoLs
	0Sji1Y4BJ6MbEuTmaE6c8hGnqG2C0//Jy5kcnaA6U6L+td6SRx1D0S7ZQino6P3fDnqJaxkxgLvJS
	FA9SER3OyAPgMdij8c6PcGnWVThz4NXYKe3NdWLNUYp5dQXxpWqMtSQwRrf/jaFMSte1/76xveTUy
	qtRN//m77IE1DOLBvtSQdn2qbRGUT4IpJDqxmfGLGASkCsklSlRg4hEZx55j5UhNT4+I0KAVJQaPU
	rzqRWqzGpGoze78r2s8cfzPbJDF19XIFUPhJBdab7T82S3+L9HJGfQTbg/N4GEfY4FdU5xRGREvv3
	/WXQFtL/XB8+UrZmgDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF17N-00000005KAB-20nQ;
	Fri, 09 Oct 2026 03:17:57 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF17I-00000005K2E-09Q1
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:17:56 +0000
X-QQ-mid: zesmtpip2t1791515838t472c8b42
X-QQ-Originating-IP: MKR7kzW7HAK+NrS0wgFqsGbBRp/tfPe9KB5QgOo6rjo=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16529762743812786716
EX-QQ-RecipientCnt: 30
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:56 +0800
Subject: [PATCH v2 04/20] drm/msm/dp: Accept a const SDP header when
 packing
MIME-Version: 1.0
Message-Id: <20261009-msm-dp-hdr10-v2-4-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=sophon@radxa.com;
 h=from:subject:message-id; bh=w0FWwQh+BArzLEg40xbIVHgfENw/S8iO3UHo5I+Bfm4=;
 b=kA0DAAoWMsMVZ62eMk4ByyZiAGrIXKijETSs3rt6JIAJ8bXCJKivjITsO1dXNj8lydUN4XW4T
 Yh1BAAWCgAdFiEEIF8AnQd5bdblFnUuMsMVZ62eMk4FAmrIXKgACgkQMsMVZ62eMk5+NQEAnfcl
 sZ3qoQ57XjQN4azidHE4kJrQ/Mmm0rbt37WuTOAA/jg8pZJgWaNaE/wWRj5tblS+RXKhQ34hIsp
 H125BnrYA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NDgMZBR9sMma4BI5GuTg8bvc8sUP0NELq8ilDBR+WxobToU7DSpLm3Ec
	/DZqqa/oQg8+dVRSpaPfkyi1tSqFqEajBs/DitbwbA0Ja0ItxG7hbTHMBUNR/zTkSAX75Pc
	e9vajL+Y/rYD9uPLU1m64ZfaXwXcS8bChQRR60V+4LfDTjlx7ni6yWAPX1uUPxv8P6Yw9gL
	Ts4vw4bx+0om6+dyzkY5ynHwbIl9W93IVe2L9MCysCCdzEQnzgx++ykCLd4Y5ivkfON7UOj
	befyOYDAwIsS+IRAlBDcEFrwdVEqQQT5VbkElpacd1una3SHcyqjC1RqlkwW0imck73V0wn
	8tcfxxvmsA9XvPGGHFYe7l7n/I4Fo3j2plrpXIxrFfHCUTDHWrlpsV2V+XgWj0ocbudghCp
	bgNCgxPDj7G2KWkdbDtOJpPU4aFUcYY0WP7txCeUW6U3Rz5ZMKLHlhe67Gm+SVCulxkxSE8
	qXenb9lHXWjM5g0RCPUas5aDdBwSeUUnKXxxsdl1NYgN7eLH5LkkTzYYlw4UhorYqnfQd+G
	Itg6ziNbadE/G4sbJyU14zO0BoK/MbVueSJQBOdFDntWfFzl0afWZywmRVq2jCsRkVugg4A
	AMDLDpNA9jd9Q14xiozonqhttH6Xx8mb+nC5TfJcuPsf0QWXf9uiR1NVasIclr405KryKL4
	GfIGlUqb86hBhvRlCYqZURf3NHlR2IsRxxouuFG1noVWksIg96TnOxZAbE5QZdEKtobXYwJ
	kFC0qCJ7Q4bMM5YG+Bl04e38P4wTzzSO5Ovkct0pkPZF1AbbSI1Cwbo2DkYLNTlqQ/b/VT1
	slAFJJzkB115nZFDrmchepgobuGsMuJb5cC2L7ngj5AOKfxzcDCk/ZuhpLHpoLEdMnZYMZF
	iUhEsiLtGW/YK30YNfJSV0cFvGPZigzZ4evgIU4gLOW+F47gX20uhXKslQbbq07TIQ9XJp+
	qhNhQt+ZqDOKCeA1F0YVkDXwI7MX+xb3uY9IGFUNk3U4kD0slpHg2PFI9qz6hNcy3QX6h3S
	Ldd7+Bi2hWqw9zXJMgzb1hC55vDsBV5y6R8BZUIEVsR+sPPT5LDvNGXdfChmo=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201752_614642_06F1284E 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

The SDP header packing helper only reads the header. Mark its input const
so callers can pack headers from read-only SDP packets without discarding
the qualifier. This prepares for the generic SDP writer accepting const
packets without changing the packed header bytes.

Assisted-by: LLM
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_utils.c | 3 ++-
 drivers/gpu/drm/msm/dp/dp_utils.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 4a5ebb0c33b8..226b370ce8fe 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -74,7 +74,8 @@ u8 msm_dp_utils_calculate_parity(u32 data)
 	return parity_byte;
 }
 
-void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2])
+void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
+				  u32 header_buff[2])
 {
 	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
 		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 2e4f98a863c4..2fdb89efc57c 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -31,6 +31,7 @@
 u8 msm_dp_utils_get_g0_value(u8 data);
 u8 msm_dp_utils_get_g1_value(u8 data);
 u8 msm_dp_utils_calculate_parity(u32 data);
-void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2]);
+void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
+				  u32 header_buff[2]);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
