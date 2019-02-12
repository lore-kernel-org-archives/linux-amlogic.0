Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55D2C282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:24:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CF8B2075B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bx9YtvzU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y7DPX8z+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CF8B2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6m774dGGRVKhOm+/s8ljQfCo/nO6yAQDugkCVwry5o=; b=bx9YtvzUR2t5N7
	+E3BdxSDE2PCS72IjYWU09upOlSnZIQ9ZjseuVZKs0lyT60yQCCpeRJ4KPx6SNSrZcqNZO30DW5zl
	/kEd3doW1PwqoWon+73HxFJIU3ZwzrAB+7Gt/bXVlZc+CooXku4QZRgTaHIvEV4yRBYEqibyG4hZ+
	brFXtDWKp1WOloPuZP0eVHwLcdtuB6EELWTs/5CznTz6KyIc4pGySxnDw/6p95KmS7zthN54urCFR
	7yc075KpFxkDDXOGF7YN6oolVfhl/CUhV5tlGLdowVxvjpLEZ9dfOJkWn83YohCEnreXxbrIV5kCA
	XdgzY8M8bY0/ZzUXS5zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtYyg-0003Hp-A1; Tue, 12 Feb 2019 14:24:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYyT-00035a-1Q
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 14:23:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id t18so2908579wrx.2
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3rdNZIUpTTqTQJmw0LRepuQplSBP1o3fYoThoCVA3M=;
 b=Y7DPX8z+KSEDDT7YCfLN+nnGHpJzPsrMBVUlwFLxOcwv3FlKjD6E4pV9aQbgaZ4QAe
 l7YtGT8biMJ4GgrNuTCxAssqCcUGnr5tNIdWV/XSBORJdB4aHLHJVTiPEt2VQY2g4WWv
 2sbWnb2hRTuLarcmYkeBtD3xZtF49lSVEE4+BaHv/V1CgnlGyETKoiw8VCrs/8TCAuPa
 2QgIijs/YkUmiK+lh2JJ4060gB8LVM+SzFxwetPadWYppNyKFIzHh7PIGuu3hFmZQpui
 VUFT9HaRHyyVgOZhBH7hCxf55AUWMDBN/jSvlOZ9MvaIEltapnlTyEbj+SiLLcozaZMP
 HNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3rdNZIUpTTqTQJmw0LRepuQplSBP1o3fYoThoCVA3M=;
 b=YNO7Im0i2wUy9GAkuT7mrQWp6jRRwJ9p3FwsEl/NPZ0RCWn3SYepjMyTiOBIflD8id
 2HJ6Kxp8v2xShwV2l6FGtXMmW5aYicOJox+jOCtw+/MAH+iErmoufPVjXiQPCvxijcDb
 kBIWWw3bgZzY+LGIobr15s474QxsHC0irQz7lriNJ1ZGnpAvUxDkO8BFrrBK5GhbJ9XZ
 +Q0uwSTPF/RbEHgysw+FkWNNg9ksP66ML7j7rrgH1FltOMgCUy7dmPXioYIcVQa2Bu0x
 zNvOuko5a6g9W6itEXRN1BNOfSFMYUnuuDX0Jsyt1Rs7A9pINcdSA5LglyaP43iFWGYe
 otDA==
X-Gm-Message-State: AHQUAuYl295LNkZ4R7w6lYJNGqv5M9W3k8VBrtzYL+G4NJAJHRK0MlC8
 3IKhYA1RyddTgRdgudb9VW7Luw==
X-Google-Smtp-Source: AHgI3IavBHTgXxoo+RIaWqjfOzvXI7q16+p1nhFsnXsyGUVNyVuK8Tes91OHmpKZPsZ+jZxYJ9Zkgw==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr3142559wro.283.1549981427197; 
 Tue, 12 Feb 2019 06:23:47 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y22sm39043216wrd.45.2019.02.12.06.23.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 06:23:46 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/3] soc: amlogic: gx-socinfo: Add mask for each SoC packages
Date: Tue, 12 Feb 2019 15:23:42 +0100
Message-Id: <20190212142344.13634-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212142344.13634-1-narmstrong@baylibre.com>
References: <20190212142344.13634-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_062349_134361_63893EFB 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When updated IDs on f842c41adc04 ("amlogic: meson-gx-socinfo: Update soc ids")
we introduced packages ids using the full 8bit value, but in the function
socinfo_to_package_id() the id was filtered with the 0xf0 mask.

While the 0xf0 mask is valid for most board, it filters out the lower
4 bits which encodes some characteristics of the chip.

This patch moves the mask into the meson_gx_package_id table to be applied
on each package name independently and add the correct mask for some
specific entries.

An example is the S905, in the vendor code the S905 is package_id
different from 0x20, and S905M is exactly 0x20.

Another example are the The Wetek Hub & Play2 boards using a S905-H
variant, which is the S905 SoC with some licence bits enabled.
These licence bits are encoded in the lower 4bits, so to detect
the -H variant, we must detect the id == 0x3 with the 0xf mask.

Fixes: f842c41adc04 ("amlogic: meson-gx-socinfo: Update soc ids")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 32 ++++++++++++++------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 37ea0a1c24c8..1ae339f5eadb 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -43,20 +43,21 @@ static const struct meson_gx_package_id {
 	const char *name;
 	unsigned int major_id;
 	unsigned int pack_id;
+	unsigned int pack_mask;
 } soc_packages[] = {
-	{ "S905", 0x1f, 0 },
-	{ "S905H", 0x1f, 0x13 },
-	{ "S905M", 0x1f, 0x20 },
-	{ "S905D", 0x21, 0 },
-	{ "S905X", 0x21, 0x80 },
-	{ "S905W", 0x21, 0xa0 },
-	{ "S905L", 0x21, 0xc0 },
-	{ "S905M2", 0x21, 0xe0 },
-	{ "S912", 0x22, 0 },
-	{ "962X", 0x24, 0x10 },
-	{ "962E", 0x24, 0x20 },
-	{ "A113X", 0x25, 0x37 },
-	{ "A113D", 0x25, 0x22 },
+	{ "S905", 0x1f, 0, 0x20 }, /* pack_id != 0x20 */
+	{ "S905H", 0x1f, 0x3, 0xf }, /* pack_id & 0xf == 0x3 */
+	{ "S905M", 0x1f, 0x20, 0xf0 }, /* pack_id == 0x20 */
+	{ "S905D", 0x21, 0, 0xf0 },
+	{ "S905X", 0x21, 0x80, 0xf0 },
+	{ "S905W", 0x21, 0xa0, 0xf0 },
+	{ "S905L", 0x21, 0xc0, 0xf0 },
+	{ "S905M2", 0x21, 0xe0, 0xf0 },
+	{ "S912", 0x22, 0, 0x0 }, /* Only S912 is known for GXM */
+	{ "962X", 0x24, 0x10, 0xf0 },
+	{ "962E", 0x24, 0x20, 0xf0 },
+	{ "A113X", 0x25, 0x37, 0xff },
+	{ "A113D", 0x25, 0x22, 0xff },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)
@@ -81,13 +82,14 @@ static inline unsigned int socinfo_to_misc(u32 socinfo)
 
 static const char *socinfo_to_package_id(u32 socinfo)
 {
-	unsigned int pack = socinfo_to_pack(socinfo) & 0xf0;
+	unsigned int pack = socinfo_to_pack(socinfo);
 	unsigned int major = socinfo_to_major(socinfo);
 	int i;
 
 	for (i = 0 ; i < ARRAY_SIZE(soc_packages) ; ++i) {
 		if (soc_packages[i].major_id == major &&
-		    soc_packages[i].pack_id == pack)
+		    soc_packages[i].pack_id ==
+				(pack & soc_packages[i].pack_mask))
 			return soc_packages[i].name;
 	}
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
