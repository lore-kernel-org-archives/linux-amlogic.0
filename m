Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE13BC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF002146E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gzdgOfXx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Aq11DQQz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF002146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCfPAiksC2qbCsuH0qIccfHEgjL83zJPQrGfiDOgtLA=; b=gzdgOfXxWpmsal
	WQWIyjTYj9hLQmuAQaWQ662GP12N1iMYH+XUOLUCeH1VrPbnLuy5tl9Mwsqb9Jriam3PkQN1U1VSF
	boh2qWmP0DOwqgr6DIwEFHoRxnk6FET+SdTVmPtOW1UOlRmLaqK8dob67g0wH55GI1+LJMxeV3qbm
	799yiuv5Co8IX6k/b4mLSxlEU5diTEWf+fQvtK/b4OQDsCt/SnMCRvM/RAwCSJr2L9VuyObpZYvuP
	lgapYdJOaKVNadg6x2E7UjBwPfPG/8vCek18/9Bv3Spq0zjGx8aTpGHAWt9bbeexcNYwakToL30IL
	CBUP3h0b9eQdtELg1rjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihd3s-0008Ms-7r; Wed, 18 Dec 2019 17:24:36 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihd3m-0008Hf-S6
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 17:24:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id j42so3133397wrj.12
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 09:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSV0U+WsxMuhIA7h8z+p35tUgb5H1eC3kU9lrnCcoSE=;
 b=Aq11DQQzGzUVMcpWF0JLC2YC8sZjcaX3sfuiLmMCNRh+4c7+JI34s4KpbzVuBJAHhU
 h5+qSCTuVinAqS2kS5fTfta1r86RCr1OoBFcIbsSOYGA4dTisxrZ67amFumwgvYNMu6i
 PNay5IKLqsKRt2sGA5KLjCcDNArAXPXSwVMKRQXPVctl7oH0fH08hM2qFAQUmhE4ycgT
 8gScSfV2FbRmb5BcHVFOFtO0xdqNAM46Z9Uyz4CjV38JT4PmakxTTk5RfsutAf472msv
 9d6kV3z6w/sM6/o1V7cJsXSmXmAmxw6tLaFTekzis8EWAKgU8DoTZVv+vU52P4vvqOh5
 L9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSV0U+WsxMuhIA7h8z+p35tUgb5H1eC3kU9lrnCcoSE=;
 b=N8ndpfeUPAgioAC2lgbTWsCr5Pze7yEiqreR09MVrEZPjQP5U+5E7iHGtJLvuU9zRn
 VD46FBTl+yU+F2bjCUZpw8WmRMlCrZUCn7VGnYv8sG0SCkstfaH+UiO2U+M2/44eyid/
 7wcz0jyrprcKcBX61BYcUTm/10+lIlv+ldNcnz9OvAz6qtp36BWxigCWiKhl1+6WKV8B
 WNTc01uAUL7WylX7t6AnWNyn8pI7LolsJModRNfOoVkx/MkPU581dh71xqIU6O3TXUtZ
 lzBsrNS1yy9l8grjgjg1TtBW5VOnU6LHoi9Ne8U1obnjaDUKcq0Q3GOYBDVwziVut035
 9aHw==
X-Gm-Message-State: APjAAAXeLPGOzfgnyBUHdR6zTHQaNOJQOj3ry8mAb9K9ox+dM0/8svJZ
 nEDaBt3AXqGVf2AU2c0aU0/anr2CzK8=
X-Google-Smtp-Source: APXvYqzR3OHiC1qb2gmKaVTY+JWZnRqg1+/NxiFB3m8W82gVRRtbYJi73MwFBkCdV+TgNGVWs/ce9Q==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr4149822wrn.50.1576689869279; 
 Wed, 18 Dec 2019 09:24:29 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:24:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/4] ASoC: meson: axg-fifo: add fifo depth to the bindings
 documentation
Date: Wed, 18 Dec 2019 18:24:18 +0100
Message-Id: <20191218172420.1199117-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218172420.1199117-1-jbrunet@baylibre.com>
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_092430_947416_F540A75C 
X-CRM114-Status: UNSURE (   8.61  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a new property with the depth of the fifo in bytes. This is useful
since some instance of the fifo, even on the same SoC, may have different
depth. The depth is useful is set some parameters of the fifo.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 3080979350a0..fa4545ed81ca 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -17,6 +17,9 @@ Required properties:
   * "arb" : memory ARB line (required)
   * "rst" : dedicated device reset line (optional)
 - #sound-dai-cells: must be 0.
+- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
+  		      is useful for determining certain configuration such
+		      as the flush threshold of the fifo
 
 Example of FRDDR A on the A113 SoC:
 
@@ -27,4 +30,5 @@ frddr_a: audio-controller@1c0 {
 	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
 	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
 	resets = <&arb AXG_ARB_FRDDR_A>;
+	fifo-depth = <512>;
 };
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
