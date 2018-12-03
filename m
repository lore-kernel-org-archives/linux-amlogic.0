Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45C4C07E85
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97993206B7
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VML7DGGI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vNGt/j06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97993206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmTOIIEFZcHYqOp7IDTPdph/ua6sOJgPBy29GhRFrqo=; b=VML7DGGI63tSIo
	zYOQ8lVRoddNZl1IYYEszaXbfvV2nDsbixS9oBgLSDSZutpPKBgcF+Og2HKhJmoCi1GbDFYWaSdHK
	oE9AIxqrjXEnI1BN5eZjEwjp9T8unsWKnOL5COGYdZP+OqH3NeTIOd7YRYA5wqCM3uJPneG0LSnc3
	7JXrP2CNRukGcfZDbJLpRjZtEnZ4Ee9/Bba/SSwaIhJZoJlP2YgdUdua+YgAVd9BomMHkwYZYoL/g
	L76wu7LKKsrbVZIDMAOrZP8R9yV/sRgTt46k63D6Y59r2HVF7wiO9D3uF0Tvsj3UNG/KK8ANvYUQX
	e2NlBOCdsenI6O8P5jwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTo89-0007NN-MP; Mon, 03 Dec 2018 13:19:21 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTo81-0007Gh-BM
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 13:19:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id 96so12164442wrb.2
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 05:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPWsn16HihaqS/gJnLipzT9xenTcdp/r8TBEXkQVJFg=;
 b=vNGt/j06zioXmLqN7+O4N2/xxw43bBG4RDIvXHM2l8hwHjcgsiyfFjcgxdVmM9AbJF
 O6852rDf0+btUzp5XwE8v3NvXqInWQ0AfKxsEd1z/fzCpCRrnVuew/BjKbMUJd2z4tsb
 Lr1LDICFBuD6zyevW9g1GRkcgq+8WLXSSMptI0l9epPExeNKy0fnDDW+fRI3fCazaAm8
 tYjDio8gdOZtMq8vM4i4riSDM1LA7CDZO0bsyJwTRCk3tezk3vNGWuAiYF5fLMOdXw4y
 oUxltE6KXRuMY+sNTkbI4OiQgWD6ImmyyAWjVawAtbljC20OVD+SPnC0B9mDLkBDnMUT
 m2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nPWsn16HihaqS/gJnLipzT9xenTcdp/r8TBEXkQVJFg=;
 b=FLEumd7m7lKBx7wGLl1KeApQ6vHiVydOmg4gZp34xk0vIHlX1OhQJi/DgF3Gykk6Fj
 xMXQWK7i3l07SctkZJjH1q8m+mshBBVmWsBTUkuaJXoGYwyqt6dW97tMjaWdjP9TI3n+
 cZGK/46R7FCck5Lz5qzHa6ubBB187LvUJrHRT+Sa+6I/C9FsUXpDHkvXhltKvowI/OPX
 uD6nRVkS4FK0Is3L7ifGRnDRmMJ8QTM4QwiGd53oV5qbo6d097Yzfj97ul/q3D53PKJT
 Y9J+ZkZ23gmAceeVML0pc6i16WwMNfeXPsvdq2g+sKzxwSx+2O2u9wEtiaiAVQVyUljB
 YzOw==
X-Gm-Message-State: AA+aEWZCZuu18kak2mPoAxn4QX5VriZfphV+stYFmzFeAIzLkj06gYdH
 t18Gs3wmM0W1YF0DONCFUdSykg==
X-Google-Smtp-Source: AFSGD/Wr2vfY+7XmL4gftuGy4Mnt/MoiOvt8Vtp1ZtW1fAJh4B9fvGvZYtjugzQeaakwGff/x3XOhA==
X-Received: by 2002:a5d:5208:: with SMTP id j8mr14566353wrv.188.1543843141765; 
 Mon, 03 Dec 2018 05:19:01 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id n19sm6371063wmh.26.2018.12.03.05.19.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 05:19:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/3] dt-bindings: clk: meson: add ao controller clock inputs
Date: Mon,  3 Dec 2018 14:18:48 +0100
Message-Id: <20181203131850.31388-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181203131850.31388-1-jbrunet@baylibre.com>
References: <20181203131850.31388-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_051913_383472_023B62C2 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock inputs of amlogic AO clock controller

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
index 3a880528030e..c480db8f4793 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
@@ -11,6 +11,11 @@ Required Properties:
 	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
 	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
 	followed by the common "amlogic,meson-gx-aoclkc"
+- clocks: list of clock phandle, one for each entry clock-names.
+- clock-names: should contain the following:
+  * "xtal"     : the platform xtal
+  * "mpeg-clk" : the main clock controller mother clock (aka clk81)
+  * "ext-32k"  : external 32kHz reference if any (optional)
 
 - #clock-cells: should be 1.
 
@@ -40,8 +45,9 @@ ao_sysctrl: sys-ctrl@0 {
 		compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+		clocks = <&xtal>, <&clkc CLKID_CLK81>;
+		clock-names = "xtal", "mpeg-clk";
 	};
-};
 
 Example: UART controller node that consumes the clock and reset generated
   by the clock controller:
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
