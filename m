Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29C0C4360C
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 15:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9870820665
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 15:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gNt9sSgZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IwL+hTlR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9870820665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+yQeVMd5dLu5qz5juV3KDEsFMEks3rMczDKA1mXrpk=; b=gNt9sSgZR0w9RA
	mVldPBr5khgvBWNMwSDYASO/8wlFuD4iCiw8UbLcKarZZuT/9EA1goThxwCdrutrhBG8wztjTcVVz
	ONt31ohStUJc3AktrEBjNB30pcaq5cgTrpJ+wMLKMUd6RvD2SLRXpPWFbbnskV8BdsqUeGF/gNgLD
	w7A8L9oZ8LmbNTQ55GOg2c1ZLwCvJ/5vjsLKurv09WzHXKYAIaPNk8KhWrp9iU+1DlGwjafQ6KAL7
	4ooQKexUP7KgaWeFKwlRnmD311gGHmVUWoO1g+N3yJqIwm5F0Yb0ahUXT8KA2mXBYcUElCkIkfF9E
	41PmLoF/lkCvQ8cX+Wgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCmpN-0001h8-4n; Tue, 24 Sep 2019 15:34:09 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCmpH-0001ec-4L
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 15:34:04 +0000
Received: by mail-wm1-x343.google.com with SMTP id x2so674560wmj.2
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwFyXGBqFYuC/YIQ48LJbHRdAjX7P5PZkteQ+2xVhOw=;
 b=IwL+hTlRWqUjdAXdcuQwYePG18rcM/tDvvnrZiseWHuBOGL1ziNS5lPODy1pd0AIKd
 Re1CE5+HhGzrPRRCDiXbGKnvZNz7d2F2COSpFwxTp2rW/AS59ZKtxtj++NWpS/kv5P20
 gF30NCWIrE5aM9IipkS26V0RuWHriDXgF+wXeumjxADKxYPa8lv9kUfM3aJezJxEXaNG
 /CWf5UW5CNC/DoxriBzwI2YnxJWnJu8NC10mzqYUiDKi2RuofyIECfHx0/Tsh1f7s3Yt
 hsK4484mZfZz39MsAaPLf5YYr0wGNVlLDworXDOnLTqYYwWfifmVZQJdytpn2RPnunhk
 ZDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwFyXGBqFYuC/YIQ48LJbHRdAjX7P5PZkteQ+2xVhOw=;
 b=gcrUZe0Gk+brE27UCU05nAujIjtrxC15BECVgjHtPZ4y5S3ORU4dUVcU+mZqrWOJWA
 1FznWKJqIUV7WH/iaRKv0jDItZBi3R80gzbmlZUh6qDARhQWM6U0IAm9qt9u6PV1U3Av
 IDM4vWpVAY0T6e0BElsYbApY8StZC6HNeB3MeaIbNw7GQmNgfiQarjtfOSht1kzc5D2N
 iz/J3i9zPhNKhYvWDsDLXk1JJ/rv48w696tm/D3McgwYhmNt+1spb7lTJge/gdPisvnJ
 /+csByBFFr6jaGWFy8hZk5N+bRb7XdJDq3FS7T9qvTudb+6fh9nt65BdvtHIw51JtrrH
 1NSw==
X-Gm-Message-State: APjAAAUoPKdDHVULRSXHh/MS5oYh92CYuVgGRCI5kLW2LmZTAJWAwztH
 xsah/LtXQL//Rt35rGo3A00bMw==
X-Google-Smtp-Source: APXvYqwKFyuwn8czPB//lYXxUKAhousEX+yuI/rd1uOvk1eQoXayPQmUcJGYjHQv1woPvN4u/0mjsA==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr655496wmi.61.1569339241629;
 Tue, 24 Sep 2019 08:34:01 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id d10sm144240wma.42.2019.09.24.08.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 08:34:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/7] dt-bindings: clk: axg-audio: add sm1 bindings
Date: Tue, 24 Sep 2019 17:33:50 +0200
Message-Id: <20190924153356.24103-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924153356.24103-1-jbrunet@baylibre.com>
References: <20190924153356.24103-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_083403_169944_F6DF938D 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the compatible and clock ids of the sm1 audio clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.txt          |  3 ++-
 include/dt-bindings/clock/axg-audio-clkc.h             | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
index b3957d10d241..3a8948c04bc9 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
@@ -7,7 +7,8 @@ devices.
 Required Properties:
 
 - compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
-		  "amlogic,g12a-audio-clkc" for G12A.
+		  "amlogic,g12a-audio-clkc" for G12A,
+		  "amlogic,sm1-audio-clkc" for S905X3.
 - reg		: physical base address of the clock controller and length of
 		  memory mapped region.
 - clocks	: a list of phandle + clock-specifier pairs for the clocks listed
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index 75901c636893..f561f5c5ef8f 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -80,5 +80,15 @@
 #define AUD_CLKID_TDM_SCLK_PAD0		160
 #define AUD_CLKID_TDM_SCLK_PAD1		161
 #define AUD_CLKID_TDM_SCLK_PAD2		162
+#define AUD_CLKID_TOP			163
+#define AUD_CLKID_TORAM			164
+#define AUD_CLKID_EQDRC			165
+#define AUD_CLKID_RESAMPLE_B		166
+#define AUD_CLKID_TOVAD			167
+#define AUD_CLKID_LOCKER		168
+#define AUD_CLKID_SPDIFIN_LB		169
+#define AUD_CLKID_FRDDR_D		170
+#define AUD_CLKID_TODDR_D		171
+#define AUD_CLKID_LOOPBACK_B		172
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
