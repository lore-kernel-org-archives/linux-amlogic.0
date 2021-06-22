Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E283C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 04:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0B161153
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 04:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0B161153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAcWYEDLYciUqIo/sU1qErazqwwr31QJQg7L4B2l9A8=; b=jkqaLet1Z5HNhq
	zA2lbY6SdpQDa3CzYrAw58H4GdDuLr6BxsEnbUvP5eQGjR9uA+Nu8b2KyfMOu2E8F2G0XpHLMp2RB
	uKJPGuoSyyIfkQxv1SX+osGi4WtNaorf+Ew8OfzIvaUtv+DDassL0S/R7GVsVn7Za9yS5D5dawjr3
	DiUt5B6Jco3uSLNoVkpOieBtCDZOz3ak2H6Xqsg7kzVNwvqzUWxLF5MUIUVpdcun4ZjQxQSP/wLBZ
	VRyF3zgHCmJZsIrn6DxUfpPbeQYpdcub16WtfXgfkz0RrO7tBFB24E0CkEkbzklMkbL2++QNGxdFV
	P9jW6Ubj1zuzdS+S5mIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvYGj-005ddK-37; Tue, 22 Jun 2021 04:44:13 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvYGO-005daW-S6; Tue, 22 Jun 2021 04:43:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id v12so9787413plo.10;
 Mon, 21 Jun 2021 21:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=caIQJ1mUw/Qq9RPSpDxrIHGCVaQe3qBahSzrBXQocF8=;
 b=c69jBUXPH5lSnMFPSZ5QtjVkOFfoGLO8g/NWjmEelanP4ibDUGn+jSqsroEJYY/Qhs
 Y59eNY1NqkJkZT/28WGjOdpDkq0bcK2GzCeMdopf8dKGlRT+QivU2rXT5NJyMf74G+Vp
 txh4hs0fD0Om5jC2rTqswlTxrbkpgxPNmO6fklMcd5Dez4QP45awQ83ABmwIujAKQe4n
 0RNop3pp2jxZK/Iaxnp96ABBalq15M0uB0onZDNCtDYuIYaULlSXItszFz4ic4YWiJN0
 UrIgus6i5KmV73rZF5Vnt+ah9JNU1HBszWDC7sWzEGTNFm8nqZJMeopD7MgwQ0dUUE6I
 xDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=caIQJ1mUw/Qq9RPSpDxrIHGCVaQe3qBahSzrBXQocF8=;
 b=UG8/J8bSoqZFvNEgSECg31vOUS0GdwviY8kWAh4DrepwHucyWmR/NebSNXdHCwmTdk
 mibCwjTslJOZk5yExHMAFNuvVd8B+7tqurm+CUy9EqwpIP2ijX40Kv248k3wqX05rHh7
 RYBBTq/XY2njMshnGTyBIjQSbE/zTwMhrjDESylTHYCbvfr9ct7AjTHCwcYsZIZgidRS
 U1m5DfH1hXjnp3KZeUBwam5OI31opyAa1K44NXAj3HSK8X4fATsNGp7+DNdtvyx1LmZV
 XhTH67lu/IOpquQGnMWWsJod27a9yKALRgyWeteVH9r0eUQ4hPx8TmNxF1o7247ITTpc
 GA/A==
X-Gm-Message-State: AOAM532XB1m/szXJ34AedwiIkwE+qiSxx7vuQOL+2wDK2Rvw0mnzn2zV
 NTb4rTUkHunGok8zqR4wrRvh6f8LBlW87kLq
X-Google-Smtp-Source: ABdhPJwpqKeV1sZnIB2l/74DjTgWY6b5ubBtObEhV4nqB0CGPBqdzBr+reFoiW+7mBQeMDudq9qLIA==
X-Received: by 2002:a17:90a:66cc:: with SMTP id
 z12mr1940520pjl.93.1624337032080; 
 Mon, 21 Jun 2021 21:43:52 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id v129sm8686909pfc.31.2021.06.21.21.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 21:43:51 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: khilman@baylibre.com, robh+dt@kernel.org, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 2/2] arm64: dts: meson: improve gxm-khadas-vim2 wifi
Date: Tue, 22 Jun 2021 12:43:34 +0800
Message-Id: <20210622044334.769791-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622044334.769791-1-art@khadas.com>
References: <20210622044334.769791-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_214352_952792_513F1538 
X-CRM114-Status: GOOD (  10.03  )
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

Improve gxm-khadas-vim2 wifi performance
* change freq from 60Mhz to 100Mhz
* add cap-sd-highspeed param

100Mhz works well same as in meson-khadas-vim3.dtsi

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 18a4b7a6c5df..86bdc0baf032 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -307,7 +307,8 @@ &sd_emmc_a {
 	#size-cells = <0>;
 
 	bus-width = <4>;
-	max-frequency = <60000000>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
 
 	non-removable;
 	disable-wp;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
