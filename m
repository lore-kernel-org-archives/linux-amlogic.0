Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01835C11D32
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA1112082F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mDrrEzRp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lcWN9cUq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA1112082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kepxY3h0GzByNBJtz4ZjMujx/em0MebreJ/phupXOmU=; b=mDrrEzRpvcxXZ6
	izX1JWxzwL/EajCDCJYJNux/p2v++10kwAzBnovDozq3TOpImlvh3K0DCQLhWfi6tineSTHplTvwZ
	TT2/zsQo0yCUiydBRBjvf9POusHB6t2eVt0WxdLTB4Z8hfj4hZYAuXTgvOZ/JT27tqW2urAG2Y7lJ
	dvyyBOZixDgDDYXWRyW8VFrJqvxiozUsZw33PKrx8Eigih225XyEVF4MjCZYEuOWO+HyGEwQyuOH0
	hgIJg/501wyrbiGEPHeUIumchpCjQO4gl/f9sJzcTxV92Sb6upmyyzK77jcWjICIbYTl8QGD94el5
	9M3gcCTkui43Dqm7/g1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6FBo-0003vj-Dz; Mon, 24 Feb 2020 14:58:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6FBi-0003sC-Pe
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 14:58:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id y17so1932765wrn.6
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2020 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eR8sRZ0eNtaE7U9M/Ye9eF8UlxBXj3WB9fmrHU+msXI=;
 b=lcWN9cUqpNnTBKxLL1DcDeE96TbfbhNrt4m4Zx+HhxEUh4/4IfxF+6fPGTklNwHtBV
 jNbp8eSsTC1LMdNWtEMJF6cwYJ0LM8mGwpEyzrNbUxd/RKJPZaWX1tNhbIvtJqZU6AHK
 im1JpjWuiJRALN2PkArUCotAgTMzlxnXW/1C4IrXSz6IRS4m3BmJ62w8DChEng86uLVO
 KmoB9kUfLuVae0i7qIM7uOfcV+h2J5yye52aLZZJ9Mrhl0hqq0szE3IUNRhhuOd3MWFy
 RBdNpRUZIhVY5ImD4FlGsQniP5+y8xIpyPGLN9iAoTm6DvQzkuJwKWfwBf3Fxnx9baYK
 gAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eR8sRZ0eNtaE7U9M/Ye9eF8UlxBXj3WB9fmrHU+msXI=;
 b=toyZMZzLGYvyKFfCD7OXASf+B8FmAapf4g4RvjF4v4AbqWKuo8nwXxlo1BbC8gWPt+
 iCsIqyC06obdwwODdOkGox4HVcgK8Buu3y/2tuHvSv3RWUm4wFU82obAkrLAcIIZB5sT
 0VzBeJQKJXaSxt8rnMyl+bFwGZgjg/Im9PjkDm/wNG2A8bTlowghTN4vCP/KQ9pQ/V8i
 vag5EHY3N+hcSQjbxoOhKDY4XJKJSSo7lngO7X7Q5k2bJnSl9etPEYN/cLKRBSpF9B9p
 UGVG1UJNnpLb9iHmiF44TW+PKxsQnjM7BQ4jmCnBTresqXgNn4ZFDiBV8iaUmV4Lsn5u
 Bfig==
X-Gm-Message-State: APjAAAWnCkBJFl1uyGKjcuT7L/QAN9Xha9NfNhTmM0Jb9iu0mGAl8M0+
 yLrY8ncwSOOpkP9Z9WOlIaI14g==
X-Google-Smtp-Source: APXvYqyY/zCmUw3P89UUJMhoBFx2AFHF7hUSFeRrBu9pIR4glCF3WbIF9YxgUdR8YOokcfi9ViiMYg==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr14887981wrw.252.1582556305282; 
 Mon, 24 Feb 2020 06:58:25 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/9] ASoC: meson: gx-card: fix sound-dai dt schema
Date: Mon, 24 Feb 2020 15:58:13 +0100
Message-Id: <20200224145821.262873-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_065826_829266_CC241876 
X-CRM114-Status: GOOD (  10.55  )
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

There is a fair amount of warnings when running 'make dtbs_check' with
amlogic,gx-sound-card.yaml.

Ex:
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:1: missing phandle tag in 0
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:2: missing phandle tag in 0
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0: [66, 0, 0] is too long

The reason is that the sound-dai phandle provided has cells, and in such
case the schema should use 'phandle-array' instead of 'phandle', even if
the property expects a single phandle.

Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Hi Mark,

 The statement above is based on this LKML discussion I found:
 https://lkml.org/lkml/2019/9/30/382

 To be honest, I don't really get why the consumer should know whether
 the phandle will have cells or not. AFAIK, the consumer does not care
 about this ...

 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index fb374c659be1..a48222e8cd08 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -57,7 +57,7 @@ patternProperties:
           rate
 
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle
+        $ref: /schemas/types.yaml#/definitions/phandle-array
         description: phandle of the CPU DAI
 
     patternProperties:
@@ -71,7 +71,7 @@ patternProperties:
 
         properties:
           sound-dai:
-            $ref: /schemas/types.yaml#/definitions/phandle
+            $ref: /schemas/types.yaml#/definitions/phandle-array
             description: phandle of the codec DAI
 
         required:
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
