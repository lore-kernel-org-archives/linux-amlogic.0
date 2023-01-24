Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419CDC25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmFmQPTRGCSf6bBoi72b/izpKZmzIprcORE9tmIx0tc=; b=b9Lc6M1NbgTVay
	vMEUjCO8IgEaO5tNDWJQzW8txoa8wHzqrhpcgjgg9fZelFteQazwySGqLsjbAzRQyAJD0QipWUK0N
	nG0zFhRoXd9r+S+PmTCIsb6IR4fAmEQB7hSe16cmzw4lIKAsw8hhtfQMYcaxrmd3EtR0IjTBrLmKS
	9C7XDR9AszUTzvzotd92xNpS9q1/PEpS8Nby1OrNnL3zhSB13xNWo1vo29fXJruGDgAKsW/QTJMTz
	TJvloweqyDibDcQJKi4NssMaOOvHvLfIBDziEhRDlpar2feuiDoyVEppu3ECj9PGYCwnfQDoirObP
	rNhgEVUiBy3/QdQJydag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHm7-003X8j-8P; Tue, 24 Jan 2023 11:47:39 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdS-0039FK-12
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:40 +0000
Received: by mail-wm1-f47.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so10567085wmc.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRGHFQLQDSY4kA3CZGH3QBqjm8Lohx728brH65ifyNY=;
        b=gIEJmWyFkociHLRg71288pDixWBHgV80iYoPOcFh+MTJ6Axae38va10U1Gy5i7RDmZ
         bx3RHx4rDiVfxRReuBBDvKRcJqbd8kkt/4gSArHrsp7pzH1Rnknyo0b4PyfFCtjMhhZB
         mrBbBeTccRvUWgERRq6hBxaQugHm4o6NnjqpIrkwR1usyi2qs2OBNRoB86+1uBAjL3c+
         YPK9aAgl+S/h7uCPRgzGh50tgbQij++G/dBqVeiPIpTDsAbhGMH+wNQNTLFOvKSXx/9e
         iZjzC+PrnkzBZjCows0R7mLpPBkF5S55bdwVDko0l9z2UL1PE44KCctcd3acl234vzV7
         XcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRGHFQLQDSY4kA3CZGH3QBqjm8Lohx728brH65ifyNY=;
        b=d385l1qOtaE2T/cnQKGKZ7nxex9x6hxYaSqBxAtln39d/4tUaBZZAgsonpxPyYpYTW
         8zqJbsBXW9ZxYad//j0+/TSRxxQIHs9R9qYTelzLH61vFkVRuaCjFJbujxQwdxPqsVrO
         tmxjiqO2C50sIcNGGHX2TaeW9xuC76hdTatQHRBdfz/l5JovtKOtvow0UTrz0TBHfM/T
         tSAg2biMc0RJ0nNbtQa2cdk3oWYigKUTskiaxhIWUfcL1jhT9I/JLlPljhBH7JUeXTgR
         2zbOLYvfSiEpa/hZ+tNXO2cMDKrPEv7UxpjQEeIF5CiB0vP9qpCblKh90/tEqoZjNohc
         IZzQ==
X-Gm-Message-State: AFqh2kq3+9JVto0UxuYJUtul/6SRc6XW+W9FoabNg9TR/RdNX/N6727d
	LlobXh9p/pc5HXUuh40l9QKuug==
X-Google-Smtp-Source: AMrXdXsvVUdsRNQEKeCuPQawj5m7ECWveQhbDn1iE1UNrItfqlGvIpog/AuTT5kL97QJQxkceMU8aQ==
X-Received: by 2002:a1c:f607:0:b0:3d3:5027:89a4 with SMTP id w7-20020a1cf607000000b003d3502789a4mr35354000wmc.7.1674556475790;
        Tue, 24 Jan 2023 02:34:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:34 +0100
Subject: [PATCH 13/14] arm64: dts: amlogic: meson-gxbb-kii-pro: fix led
 node name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-13-44351528957e@linaro.org>
References: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
In-Reply-To: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_023438_104623_9CEAFB48 
X-CRM114-Status: GOOD (  10.40  )
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

Fixes:
leds: status: {...} is not of type 'array'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 6d8cc00fedc7..5f2d4317ecfb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -16,7 +16,7 @@ / {
 
 	leds {
 		compatible = "gpio-leds";
-		status {
+		led {
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 			color = <LED_COLOR_ID_RED>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
