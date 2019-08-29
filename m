Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DF4C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:26:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6BE2166E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X2HK6LYX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fbztu1Qr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6BE2166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gtQHdnU/VXPiZLiTJe4dxnuGCRNXMnst1wp1J/S2JE=; b=X2HK6LYXm7kHdR
	vrUl3A2Nv9kH2Xw/bt2QJqNnvMItmxEcyT8yAlxup+7bikna/cVN8FPv/pzEyk+2Q9Hq8D7WbWheE
	fbKRMtxutA9NI+qr4FGDdknPNMEVWaqW2DLLkPQYn4u/NCEbe6AcVMlbkIdzSvedMMJIY6xkLwUMN
	AsGLQ19LlZWeuT81xd0Br336M/GFh9tobnn9fglCccvgEj4Jsa61Hy3coW+KeBkCmFTf28F60mw37
	CYzkyZyRkHNbTBHoaNzY5NUR3cttAC+ySLXbXOwcG8curFSPIegV9IIAHInOkBpnNk6asdxQfvEYQ
	GR+qXkhi1C+CdqmyHjUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MK1-00011o-F3; Thu, 29 Aug 2019 15:26:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MH6-0007Q8-Bl
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id p13so4315252wmh.1
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tYP9GFJZ0QFKzqxWJbg4GUUkUmcZCZkrYKJIkvHiNWk=;
 b=Fbztu1QrcR5B3nPkxILJF/td8lbixGBXFQcrN2ejlLKJwYhvY7u+cqiw9cOtcamT4T
 FEOsOl1ssHSc+4Z4HGmWWG/vrJbliAUSAq5H5A9p8VGYi2Ov6cN7Reurg/BPYAfB8hnG
 FblMIm20VEUPX7bzpp78oGqTUReqVFr0Ucx8bgBIRpGbVP6ZhphES1E4noOfv97pTbUC
 PntIXhknVINUqZDfU0u4sh0d5sbcvuAOhWXTXwFVvgcjtk+lI/0031f6sfpUe7HCR5iT
 KsdFLGC7EsjbpD4swscN/sNTwQ8wVBkhID4sgl/OeYTX0cUKD1AIz+i4VEvkfoUCzvMf
 ypWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tYP9GFJZ0QFKzqxWJbg4GUUkUmcZCZkrYKJIkvHiNWk=;
 b=aTiX5V+V+7n52/yWPDKW2MZexF7pAfCnGH6lEC0PfyMmHQWa3STGLv7wftIC3Kmi4s
 tqg5ODY6FRmKIXHkf9/M6qSpfWXFaNCJdURDi2tru0gp0SMF5lDYHzjFAO2XBZEHdwDR
 SXUyKT/a+b7tw8Y6zJGAs2RgrnZ0r0BdTlQcZ7ltB7/EF0FV5GXPcogeqVc1YfURQbCk
 nUljlcOlBtMgzYg4n/ewQyHkid/khVBvLJ+igQidcghfzIUkKETtSKkUF3Iwo9fVAWrG
 1+e46YSryQIrBJozCD4j7nQRJDF68Axi1UnAphBhxB3qmFVchfqVU0wCKsVpUTt4+omQ
 3I2w==
X-Gm-Message-State: APjAAAVhAb/7l8Las5DS8481+SJs4hnkMUwaEBO+RQbwYkLYnwGWX9uM
 9dU8cT0Mp4xbyIe/ZWY+JlYWug==
X-Google-Smtp-Source: APXvYqxN5V7NJodBKWG/AvkjSt+uzMe3XdB0D2IodxjvrLvBBQ9uzK+GDDMvesObgwhQRev+LGSArg==
X-Received: by 2002:a05:600c:292:: with SMTP id
 18mr12560799wmk.51.1567092225839; 
 Thu, 29 Aug 2019 08:23:45 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:45 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 01/15] arm64: dts: meson-g12a-sei510: add
 keep-power-in-suspend property in SDIO node
Date: Thu, 29 Aug 2019 17:23:28 +0200
Message-Id: <20190829152342.27794-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082348_723663_B1C4AE61 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 35d2ebbd6d4e..b31502727d4a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -508,6 +508,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddao_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
