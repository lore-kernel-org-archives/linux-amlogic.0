Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A98C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 22:00:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEA42085A
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 22:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NzAQL9zN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZxUKT2TS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DEA42085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+ESqpVdKI8Ni8Mbvwo9Ns/0+f9zbJ8OeKn4A+1zXys=; b=NzAQL9zNXRFQ9t
	28OVkUpYZy8NYu5FudFmqDV80RbLaH+omJ2Qqu7VLYkQiQjwW9UezwlQxq399rAIio8uNIqQHPn7Z
	JLL0PzO/xp8FukvDGMENsbSwnJcvz7Jmc9CbIUkhthNaUZM766mhFNNPK4K0rkRfkvmwJS4JT4qVe
	2WvSaFivDyZjCsslnJZKMsxZdLVpdJ6ZgJy+1AQqHHZqTJBWnwXC24KZ4x6MjH6SQtXIYQrvcvpZI
	/VC3SbwZN+EmWYgSgPYKDc5IVp4CkbSsmj6j8IELh75PlNjOR3FkNYVE5GVCoRnUS7fUuc5KPsaIb
	2JyaNE/spoh23v9oNGjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Mme-00053J-U0; Tue, 19 Mar 2019 22:00:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6MmR-0004lW-Ny; Tue, 19 Mar 2019 22:00:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id d17so516903wre.10;
 Tue, 19 Mar 2019 15:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HPJWUCkniYvFY+imhTP05E2QTQFEXxZDTbw3Sd6sRqw=;
 b=ZxUKT2TSevAgrqWAeyDkL7kMnPgX9wG76QY78B/j1EFVaRVoqp/cIhSXZp7ObYXR83
 hmjVm5rLdROjVoNWpFWljkxYe2FOli92vg4kXGFlfkiRzmWI/G0sVf+Me4bVrFp/rMzg
 sTuZz4Xl8qIaPutzTiyDK2Ei1+3eW6hwisAbSyIlfG/Hafnf6H2PWA/lfqz5BvQrzLnf
 Hda+HR9mCkFwvS8e0np25pX5vtbJErS0qCejHZ/j8nccgqbNGPMh+2JmV3sZ0t192lPJ
 WtSPVdz/ndMzxI6XQXIPOEiv75da3aPh8y5XHlJif+BfeYkoVMbEDSD3R5RhdDmly1BB
 GV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HPJWUCkniYvFY+imhTP05E2QTQFEXxZDTbw3Sd6sRqw=;
 b=IsVco9I+do+AgTHn0/FuU4y5S603T75UoOZysPyMnrQLuf2mAln5FQq83pP/7mzy3r
 /qyVcD47SAtFrb4ZGg3WWrxFzGWO4NEHSpJ23/Gswg0IxY6iW1nGgeSA3wiCap8vJQjm
 nFGHVSSLypEQr5jaJ1LCxUQGCScZ/sWFmkDrht2B7XrHBILmU2i8MD4BI4p8dGfJgytM
 DJEpBU8kGuvxE/QiEhKBHj7SP7BNZdsbeTf1G6D/WDXHX3RKwfDRZNfSViLLTSViiReN
 vHEg0Rk+EdJtx6ztXHzETL3Z9GwFZNFmlQq8FpdBPTm6f1yGW4e3UuKePaBGEnc3l8pT
 CuBQ==
X-Gm-Message-State: APjAAAXk341MgDfp+1pMiR4Qb0gkmL9AVCzvC/nYzMFLQiML1iccuD/m
 sjeuhFxt+M8wuGccTQFcTbe2cGC0
X-Google-Smtp-Source: APXvYqzK2qpxgoN6tORX1kKcVUX1G2I4S1haicPGoTAukPQWgW24KWlMGBtWNuc1He4Ymqd907E2cw==
X-Received: by 2002:adf:fecb:: with SMTP id q11mr18099730wrs.252.1553032818090; 
 Tue, 19 Mar 2019 15:00:18 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:39ee:7385:1514:9d3e])
 by smtp.googlemail.com with ESMTPSA id t2sm188762wra.9.2019.03.19.15.00.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 15:00:17 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, mjourdan@baylibre.com
Subject: [PATCH 1/2] dt-bindings: clock: meson8b: export the video decoder
 clocks
Date: Tue, 19 Mar 2019 23:00:11 +0100
Message-Id: <20190319220012.31065-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
References: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_150019_780819_3D3050C2 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Export the four video decoder clocks so they can be used by the video
decoder driver:
- VDEC_1
- VDEC_HCODEC
- VDEC_2
- VDEC_HEVC

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 2ac9469a1c27..47556539f0ee 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -108,5 +108,9 @@
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
 #define CLKID_VPU		190
+#define CLKID_VDEC_1		196
+#define CLKID_VDEC_HCODEC	199
+#define CLKID_VDEC_2		202
+#define CLKID_VDEC_HEVC		206
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
