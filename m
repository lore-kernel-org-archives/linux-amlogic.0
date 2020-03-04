Return-Path: <SRS0=8tFv=4V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A227C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2020 09:47:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 281EC20848
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2020 09:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ujS1d587";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2SE/62ff"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 281EC20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLAdk/g61zcVbhzD1Y0+F/eVw01ioxck7phblWBi3OI=; b=ujS1d587k8Ac1d
	HIJBLjdLCbJ9jWtErljx8I+kECn8BKA/JEg7b0hEOc5KzdFkpnFK4Nnfkj7cQEV66OVx6TnQ5Xl21
	VKitfp3OajhQWZJTsypo20Nmo4zH0g2tMYMRppXWO/ABTth0wshTiw8yvu8N9WjRXd9QCb3xVUBJG
	HbEfETM8Q4Ag44UYpl1pC4PfKy4rCcutHyu/kgcABBOSFOxaAniZV7lX3YPXrj7QGhcRgPJffghzr
	aVfuoPsp4JlXZPTBLdzvVZEkt60wEeq/7j/09PWmWpqUqZUgip6kAsZ7+0QPhxvlccEP3VNykfAtN
	1KnTDWz+uLQh0oXZe9dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9QcV-0003mC-FK; Wed, 04 Mar 2020 09:47:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9Qbq-00038d-Gs
 for linux-amlogic@lists.infradead.org; Wed, 04 Mar 2020 09:46:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id r17so1523283wrj.7
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2020 01:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K5hjg1G3VFJLeuZ62RXxBnJp53DPSao1yCpZ+ZBtBN8=;
 b=2SE/62ffNoNovHiDs1k+u5cTld9gBWOVjpxlimiyMzuGDcXNO7DUxt9Y14hP9n3+eL
 NH+9A+7QJG3kGP10lLckXdEVA97WpRjF9zy0NHjXZmq7Jc4bmR3ep3dxqbaMwqx7CHRU
 usGM+s3jBF5hjJA11vy0AStb7wZVycGK89BWs8Pqqs0InWE3NVc5febUgjUoOo4lRCcj
 +LxhnmvycnOEXSWQf57tEgS0Q4nn8FMOhSDh4vwtVXySqWhzaS1mZB7NSDyea7/Q8+Yy
 6DIqNuLQwsNnqxuD0BT0LZWAZWKogGUIAS3hvuN0Daa6hf4lk0GPyxZygHBsYWv6GZrG
 VnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K5hjg1G3VFJLeuZ62RXxBnJp53DPSao1yCpZ+ZBtBN8=;
 b=b1POkVjNGzaJ5c0jhDPiV2B1NnA0OJbv5qSNNIbh43yqQNC/KPxE+Si6N1jZebIJ4Y
 qBonPUhFEnqNcq+OCdyKoiFX85Jq1nYpoKsqAqRWDyavpPEJdi3NtFQOypzgazL/GQ7A
 SMyLl4GN7mZyPipPB6fWWHd5ExsSuUMZUsGKkdduqR4c6MqZ8tFATMueVW9sAHWZ/qbU
 1t0+O/JZS7qNSrW6/IVl9Ll24E45uVyMfPsS40QkSyJOsY8UaDaLvtGxOKhBu/rzfy7X
 G2oZHN/S4X4BosMCLePBLCEe7KTrf0DFgjnEEXeeISNm/hD+dO8T+3pt04QEwooNQsTO
 Kk4g==
X-Gm-Message-State: ANhLgQ1l2bxRy/NprNEZGbNmPJbEtsq04WnnctdqAYOonnHcosaSTZuk
 uo4Fe39+gDvsdvQUphUhWAJM7A==
X-Google-Smtp-Source: ADFU+vsmHI8XwQXXfnDZR562BoFU7zrqmPglShefMhkAEPAr3dqW+fmq4C1hsmjfc+4oVh7WFI4DFQ==
X-Received: by 2002:adf:f604:: with SMTP id t4mr3308460wrp.96.1583315192881;
 Wed, 04 Mar 2020 01:46:32 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b10sm38696107wrw.61.2020.03.04.01.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 01:46:32 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v7 1/5] media: meson: vdec: align stride on 32 bytes
Date: Wed,  4 Mar 2020 10:46:21 +0100
Message-Id: <20200304094625.2257-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200304094625.2257-1-narmstrong@baylibre.com>
References: <20200304094625.2257-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_014634_558584_C71C33A1 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The HEVC/VP9 aligns the plane stride on 32, so align the planes stride
for all codecs to 32 to satisfy HEVC/VP9 decoding using the "HEVC" HW.

This fixes VP9 decoding of streams with following (not limited) widths:
- 264
 -288
- 350
- 352
- 472
- 480
- 528
- 600
- 720
- 800
- 848
- 1440

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c         | 10 +++++-----
 drivers/staging/media/meson/vdec/vdec_helpers.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 92f0258868b1..bfca4c82aa56 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -528,20 +528,20 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 		memset(pfmt[1].reserved, 0, sizeof(pfmt[1].reserved));
 		if (pixmp->pixelformat == V4L2_PIX_FMT_NV12M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 2;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32);
 			pixmp->num_planes = 2;
 		} else if (pixmp->pixelformat == V4L2_PIX_FMT_YUV420M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 4;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32) / 2;
 
 			pfmt[2].sizeimage = output_size / 2;
-			pfmt[2].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[2].bytesperline = ALIGN(pixmp->width, 32) / 2;
 			pixmp->num_planes = 3;
 		}
 	}
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index a4970ec1bf2e..3f7929c54dc6 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -154,8 +154,8 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 {
 	struct v4l2_m2m_buffer *buf;
 	u32 pixfmt = sess->pixfmt_cap;
-	u32 width = ALIGN(sess->width, 64);
-	u32 height = ALIGN(sess->height, 64);
+	u32 width = ALIGN(sess->width, 32);
+	u32 height = ALIGN(sess->height, 32);
 	u32 reg_cur = reg_base[0];
 	u32 reg_num_cur = 0;
 	u32 reg_base_cur = 0;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
