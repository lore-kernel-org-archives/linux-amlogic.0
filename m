Return-Path: <SRS0=So4j=32=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12419C2D0B1
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 08:42:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C085720838
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 08:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BhljEotV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SFFTkXTT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C085720838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3WsXzuOiqa6RIgAsQNWGjigOu2WNm8vHscvBcb3KrU=; b=BhljEotVHfNmo6
	f02XeM+67jVFMZA42CEZrUmu8poM6hXYgwTZUgOmEK3VNc02pHwRcNsIGZc5sW4zHyYmYGHW8PzhK
	QZhRrgCwBznYi5xUWzjTD26F41ehSQrYZ00ZQiy5JwfWiLeCbXSX7Q3fNCFvLZWyB9p0nr2qAhSHs
	wl3Jv3FUEU+4Z8evQK7u/ZUxWwBJsxkpvZ4XH0C6HKVvVcneAU8l0jNbOiTbOy4SQf81FjZ/uLS4+
	apSm9EhYsY5VqzghyxDEsjTFdsC361ubymw9XP9emlhuORTI7ZXWBPiqkMK7kaO7k+jryDNsKuzIN
	i9FLUPywZtNFCu0Ak9OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izck7-0002Dk-MK; Thu, 06 Feb 2020 08:42:35 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izcjV-0001Zp-IS
 for linux-amlogic@lists.infradead.org; Thu, 06 Feb 2020 08:42:00 +0000
Received: by mail-wm1-x344.google.com with SMTP id q9so5286447wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Feb 2020 00:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RVrXPTZwBbLcZaQ9fhou/L2fbd5WchWNhoBm0tMKEHc=;
 b=SFFTkXTTEiDnMlPKJAzWLq/nNnpS7HQIdFI28w1/sAg7yGlzOJloJXPWZyNNuLpwm9
 USZhZzUFxkFa42WfURrziQ9+AUwUwtSsNg4qRn7ESVwkWypWvSgBHhnnCADtewlhwc18
 xCnGQWlHP+DQLwz5X2lBgGxG3BdYyuWH6yJmm/qxzFonQEUUXMeXL242pG9YTHomyIXb
 aR65hbpgC+PvVrX13IT32AUOVIFN9HmixY+cmRqCk/RBVXj0pZ9WUvvwVCs8iJKfY9vn
 CHAiUqerclFKC4wYpOnXJDPWy1O/qmSgjKW+X1duTTI/ra2hmC26/2y3EEHhEloETAk2
 Tg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RVrXPTZwBbLcZaQ9fhou/L2fbd5WchWNhoBm0tMKEHc=;
 b=Sqc6roQduDDaVieO74RKLnN9Y4XrkcO5N2DncFnUfmOuGyxruphvLkfuuymvXVUMPc
 n7iwn2UbsxwycZwsvLtpsCMaqVrVpPTXw9QoxIQnziK0PDt/YTId8DSI+7ovGp1UOMkt
 QJWtfv2hkmWAiP6Zh9kVOLjTRsBmibM2Jtmlo+5oopXajzp649tskwwlN1+uJKoXQh2q
 pB3o1VJr7t9jkDh3VcGJKdY+AcC+XihgHpXCf7N2w9oY2v1qPGmR0xWCo7uNXd45m0ip
 LZyG5pgzaCdKu8llsYK3G8xEx+6uQ/oCURO3dTj89BGg45JtkJMHp1x43b+QDcbkR7gq
 UzTQ==
X-Gm-Message-State: APjAAAWDbxA67vWWLgF2v5aUITl7ID5bEst/t8zVuQCVPuvacQ4dbISW
 jllLrlMQm/nyBj0PF4zqjak2aw==
X-Google-Smtp-Source: APXvYqyGtvBkTfc2Fo3xdRf91CNgY5XZEKQwvp42qZD27vyq2iDB/4kPzt8N1bZqs61WYmgorXSwcA==
X-Received: by 2002:a05:600c:2409:: with SMTP id
 9mr3120720wmp.109.1580978515842; 
 Thu, 06 Feb 2020 00:41:55 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id r1sm3222760wrx.11.2020.02.06.00.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:41:55 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v4 1/5] media: meson: vdec: align stride on 32 bytes
Date: Thu,  6 Feb 2020 09:41:48 +0100
Message-Id: <20200206084152.7070-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206084152.7070-1-narmstrong@baylibre.com>
References: <20200206084152.7070-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_004157_618283_9D6B27D8 
X-CRM114-Status: UNSURE (   9.74  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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
