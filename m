Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18D4CD98E4
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YAXQwnPDXiIjjbaG2Ll9wIpGn6/fTSssBBcByrkTEI=; b=AUF6vJIE1L/vNn
	bT9oHeWjswBbVrYrqAaJRsimm2lMQxLfcB2BOcAgQvoirriQtJdQhyMtLZSD5kzHqZVNpkgGPebhk
	CDS+o/6JJSWJHtuJ37q7hWtRsSYQziWUyA1jfuZiA6OxUJ84H2Dtngb260/djB6gqAau3lZeGxU9V
	4kEg2Md+w9Ku0VARQTCoz+lsstEEzmQwXjlNHR6bxdYWTbPvRgeyhIraBRFr1Zwf8YYIx7opNsr4t
	8UrytT3BkKXbaulKT+vpy0ckkpk8sHpCqdoZaLC0gGKVi+lKdVJgO+PiCsDpVtyf2siE7L7ue1Lyk
	zck1m6OwXg93yQJ4U8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlYG-0000000GsEp-3hdS;
	Wed, 17 Jun 2026 08:23:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlYE-0000000GsDD-2Gv2
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 08:23:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c6ab886da6so8162965ad.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684590; x=1782289390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=AP+iMre+3eZK99gGrxhICZXu2/93rO8wMfi+VhxczdbuSD64FCOVsCgVGTVOAIVO9a
         LgtnEWS4MoNUbPgH6VG1CHFMVd0VRXe04eBuZGlQ28+WPctB9zskX+ZWkwxsuGkMFaFj
         lM3Z2b6EZZvdOq2GeY+GKxYADuAmCi6XLrZgPqlI+jvWGI3RhsWzuUdshc3p2d6qohzN
         IGfDmgY8vs+yDoTV/cdIeurGfz41CWqV3OsE5Y8aNxgd2jYmbtZppA2BuAGj/aoaUQ0Q
         3UVwcgdeGC9xl6okCPDUxZs60smb0Q8VIPiJIEVim9dmY7Ko/UP9qcoWavlko2exUZL9
         TKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684590; x=1782289390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=pOcUsoZWqDORp6TJlgRQTNEajKPjS4+5kNXewuk9MtX+V7oNJT4b86FIs4uqxtq0hQ
         7gMPV5MB+aAV3A2caI5M9HjMURNxao4HDFKg8wzwNvBWPHqSdEn/OC5qLosULe0RzpFh
         WFjlC5b5fe0yc8lSDa6ptWUFf3CHf0W+vSJXERG6UJSumPAhdXhx1fCDaAxss0p/Q0tY
         MilFs3JFD3ox4e4xeWhZ7ysIqeaR+kx6H8B5b1mOMDUSpy0psYFiTDwbEoIzv4r/rEnO
         0TCDtLuVZ71zrour2GCfzcR+cf/3shtqnRehcFZzLGqOwLOvZzlJgXJbYQWyLfxlkXer
         QCEA==
X-Forwarded-Encrypted: i=1; AFNElJ82n1XgfkIxeKcqvLBlMR2EeTOxu6vEAjDCPsVlI3BhiqaDPf+R8dQcFLYe2BRPp2giVeTX4q8GpxXjj2VX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4OaDnLaCaSvJFZbS7j+euBbmHpTTGB1Fard59qudH2fFJmY97
	suhxncFfCludPHYMj5YZuDUs2yRRHD1Zw2mnGn0moB8gb3b88tkC0y2D
X-Gm-Gg: AfdE7ckgHeiFT3PP+F7Xd16wdhSs+BwuC1rULB5E91PjOPFQEyaLyvQb61fvZ6W3cIf
	7M8sdrVwUf2PLR9TWdlm6c7u8X+DMQHxBOyq++7uklW00ybN2R1PmNzOBvp3oBk0rLQJEN0It4X
	GpYfcQcITYM4nm2eEj1ms3BSmt6+PD/+J/y5xfcaPWip4VGaC4moBuXnD1qTH22nRy3VVAxBLpv
	ZvNnWmzpVcW3JnBHCm17EVhMFKCzbFRG/Of7EFjMLJRmwJtB9XApetluZbhAuECTvmhfsFjUdb9
	zpyJYUNEoYm9N79JyAazx1VAD9Od5EL3eCgGhnTyROtr6u4SKyHK1vlXGKA9O61pdtp+BR7sTDH
	cPKmBScYZnwfL/R6+DJ1Ro9hA8zBioAFlGkN3akTI0T2fgFfchoDti9jkJ5FKIbpy/UMOxg7WYg
	jVbqsSbcjMoQ==
X-Received: by 2002:a17:902:ecc1:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c6bbfa1958mr27798855ad.8.1781684589730;
        Wed, 17 Jun 2026 01:23:09 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:09 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 17 Jun 2026 16:22:33 +0800
Message-ID: <20260617082239.645562-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012310_599850_C0E3F83E 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6457667d974e..8ca3ac09b306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
