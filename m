Return-Path: <SRS0=97z3=VA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AC7C0650E
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 12:08:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49452218A4
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 12:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q0+JRsbf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BWYV3U42"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49452218A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yzQI1n1FD956wwV0tC0FvK1SvS8Qtbi/xufpMg2QeI=; b=Q0+JRsbfTY4hR2
	eBbKZCB/hqCa6lVzk64jQ5LBvk+uv7l/H+1dIkGDgTkdtHtHxt4HW5tebsT4BE4H752ELphscOGZS
	cc2o+ve7LRPkJwZAoh1VC7Ulav75VWGaw2KP6Hal3AeuelyBwCI+N33JfKU8ruG5huo4cL6Lq3fnK
	+kY/53gTQLcXWJsHRca7tJ6heTIigXBqIfjBfmX1G/As6xzZZU32GFPY2+bvNdCec4giq6FZ2D4QM
	ggqVIV0Qiqvv1YXQ6oZVcS0E76pAzlL2cjMngfSYWinLZNSlW5jCENyMlyvgyrEBGl+VhG7vaSvSn
	uiH66LOATydUHni/grDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hie3M-0004L8-8w; Wed, 03 Jul 2019 12:08:00 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hie3H-0004JR-Ua
 for linux-amlogic@lists.infradead.org; Wed, 03 Jul 2019 12:07:57 +0000
Received: by mail-wm1-x343.google.com with SMTP id u8so2122038wmm.1
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2019 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nDWpJDfpOQfXawVusespJk2SyBgud3JYRZ5ZXC0wU4=;
 b=BWYV3U428Gc8QR7aKZY4nWtDDgoYNuQo2A3i0xocI7A1OdX/bXOHlzZbpoM9HpZmu5
 w2eYh3sthQswiY9VQBzBrJA/+2OlKshkF9G/8p28Jf9knhlhOXiQd6jE/8WJgbvP5mzO
 8jyDCL1dq/c999yNYGKrDCJssPk/zSlvY4AQrzN68K3tX50+QFWAfb6I+LneNIxK1CVp
 75CXk6f1JvxnxN6ria/lK5C9QmHE3C1pGG2a+/8V7UjhZ7VtfjD2HVJp8v3+ICLd3189
 6Ocyz1v/BB5Zms/+78h+0r1N4ckL3eh/r0S3CTS9XS8F6LUiDwoZSOUpilo/CwiEA7JP
 C7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nDWpJDfpOQfXawVusespJk2SyBgud3JYRZ5ZXC0wU4=;
 b=ejEaUzCWlymTXQ4xJjPj1uAfnfGH1Pc60aAVujVUSfaT1K8b9R/IBvD3a+WyEejKs1
 1ztuUOnp2aaK43P7JZUPmtmqj2R6c7l9r7f6ee1mEAyz1O4vwbpdbuB6VPlTVqmywcPZ
 SwFn54o+uxX3VALHbLQylMtpXazEcX6ooyZLj7G4UbBcmH0plsdCBfs6B/v+M1P/V65M
 WkAaCFqmaA5I/So/8kgz0vhhvjUHn/KsXXS2+AWFzFsUpCBqIR02ahnfjUr7aRYQjtyG
 iCIZGA+KNpSNVeDOKAbvLV8KQC+6p7ucDyAtYYN8aj8q9jIQR6JUNWVv2Ad9shiSOErP
 G+TA==
X-Gm-Message-State: APjAAAUPloPCqapqLV9KGssYJ71C2eF3wCVMWxCqXB7TxvEGYUnGCqAX
 qz1noFw6EpzAcMGIEAcrQaMjhQ==
X-Google-Smtp-Source: APXvYqzol6Ot5n5vTIYz4kULwGeZdgCKUF/deXcHiE+/rQ3Rb/Lb4EzxU0wc9AZz6JzdmHnS4EQ/7g==
X-Received: by 2002:a1c:4041:: with SMTP id n62mr8190423wma.100.1562155674760; 
 Wed, 03 Jul 2019 05:07:54 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z126sm2767638wmb.32.2019.07.03.05.07.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:07:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] ASoC: meson: axg-tdm-formatter: add reset to the bindings
 documentation
Date: Wed,  3 Jul 2019 14:07:48 +0200
Message-Id: <20190703120749.32341-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703120749.32341-1-jbrunet@baylibre.com>
References: <20190703120749.32341-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_050755_983457_DDDC8F33 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add an optional reset property to the tdm formatter bindings. The
dedicated reset line is present on some SoC families, such as the g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-tdm-formatters.txt           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 3b94a715a0b9..8835a43edfbb 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -15,11 +15,15 @@ Required properties:
   * "lrclk"    : sample clock
   * "lrclk_sel": sample clock input multiplexer
 
-Example of TDMOUT_A on the A113 SoC:
+Optional property:
+- resets: phandle to the dedicated reset line of the tdm formatter.
+
+Example of TDMOUT_A on the S905X2 SoC:
 
 tdmout_a: audio-controller@500 {
 	compatible = "amlogic,axg-tdmout";
 	reg = <0x0 0x500 0x0 0x40>;
+	resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
 	clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
 		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
 		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
