Return-Path: <SRS0=re6n=PR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26C7C43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 14:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BDD4206B7
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 14:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XislJjhK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Uqyu6yeV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1qVaedeW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BDD4206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cjeVHEDdXrBKmidZ6d47mjdR6eEHNv2j20y7DypHS70=; b=Xis
	lJjhKY6kBB6uMCEQS/1nVmQBd2tfaqjm+5AtcVF9oE6ohcpGKuiS2mOTP8f/ADt+URv5edMlihaV6
	hGBPZq8owRiykaj6P9x1UXw1GdPregSudUCbyF9Bbx7MS+8VBfSNmjB4tYp/gMZdJRzke3IQRpPEy
	TnE91+9R50sXJTJQMPMJTWPhGqHFrTkbp7hEKMMYAnhZk+by5QWQQDl9POxUT387cut9G+3A2NF8b
	l3DL+S0v+Pv68TJXNlc9gMR+TPzlqflAVLrR75abKShpU/jJTKXGYro/3CJSTw4lpJ/U0jO68gohC
	cWe9PorMvpO3ohLa4/FWiBXsLeiGedQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghEPC-0000Ef-CC; Wed, 09 Jan 2019 14:00:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghEPA-0006q8-PR
 for linux-amlogic@bombadil.infradead.org; Wed, 09 Jan 2019 14:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JEBXqUpS/wGintq8ltKUFwHDispDsI/Kg8/rpJ3o2s4=; b=Uqyu6yeVfpOo2wApg86qfdM4P
 bb77aZBXHbetgOMXu2KN9LwdiR2KulIFqYPNpA6/Csx0OnniF1ptusLnc4Q/1y/lohHONISNWChkb
 fCwwFFjIC6aaSvneATPnmCzhdC5JXihuf9BYVlBtXkAkBv6B7uPLQdhQuMlQ4XUvOop7Ty+du0RAM
 biDQssLJON0i8utyVInRGp7rUXLXW7M4aNBE6z7ZNXn/hTzpEftVIX3CM4lvsIxALuvE3bVFUtbdZ
 GZar6TAXHg4qsG4DUWOiZOH0yLWNWLTzW0AnDw6uadBAHm6JH4Se/Y63wXigVVWndsc1Duaw5R+dL
 1lVkrjUOQ==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghE9s-0004mY-GU
 for linux-amlogic@lists.infradead.org; Wed, 09 Jan 2019 13:44:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id p6so8265693wmc.1
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jan 2019 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=JEBXqUpS/wGintq8ltKUFwHDispDsI/Kg8/rpJ3o2s4=;
 b=1qVaedeWtoHf5peQQnwniSJkL43QfYVuevm6yDv3d6l+p3LB6IKjneffXHSLE80+/v
 IFqG+mRBUHUqzDatF/sPoGPT2P2AZTZct+7wYZAGiwFoav+7ts+OWfKqBzjSlrEb3Awx
 nS+N/HOdsZb0zy9aUvG8y7CyNb7WYjawtomHmfs5ogwOivo4EnXQ71pBpLMvwfyvBfaN
 RHTBG+pojqrg70N9fFldIQMhoAdZg8xIKTjtbLVf00wR62MSx6jSuh4UxW8VQ8BSqknY
 V27hQxo0huw0RI7X3tk5DQR2Mbwc3RIrFCKPU6d2AAJoe2I2ms3KVnoqbXdfsi5TG1NF
 nz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JEBXqUpS/wGintq8ltKUFwHDispDsI/Kg8/rpJ3o2s4=;
 b=clJ7gEwuwDHJoNqToV/O74+qsugzPr68Cz3SaLdJQS59nf40iQ9tVjSmkzh2/75YnB
 BmXhyt4k8wnjfQPDr5YQjqihz4hk5ZBc0gOTONyv4R4rnRYRiE0zYXmjl9ftJFlfmehY
 hXXMLU4ZD4dyFEiYVG0viDYNE2vaiH/73nBE+W0WW5QDSmBgkDim6eU862TqqgQeiLrX
 TlXwXozM77wKK52cSjOiwz05CiMGOACCAgBYWqGUpshztz7zZAMJLaaivhmte3SH4YFl
 gNsPI3S4CemmwiDIwDFnK7iYwODL2gY7xhbzoiH/0aAo7mtvEyx5fpIHyPz9Bt9xun0h
 13tA==
X-Gm-Message-State: AJcUukeLzPam6GW2xc6+z1o8nizINcI//04exMQH+P5qVSYcdQRJySfs
 4MvyPUQiusZALkVQySszrVKI3A==
X-Google-Smtp-Source: ALg8bN5OBEGcZHAMzBi/GVcdHBBDTlrUkgd1hTGXS6ztTdsFcra8IX8ppbTjO1mSQOxrnFngXPJs6g==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr5740452wmc.0.1547041474447;
 Wed, 09 Jan 2019 05:44:34 -0800 (PST)
Received: from loys-ubuntu-BY1835A49200471.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 y34sm161053815wrd.68.2019.01.09.05.44.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 09 Jan 2019 05:44:33 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: meson: Fix mmc cd-gpio polarity
Date: Wed,  9 Jan 2019 14:44:30 +0100
Message-Id: <1547041470-6422-1-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_134436_562274_B19F50BF 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Loys Ollivier <lollivier@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
changed the behavior of "cd-inverted" to follow the device tree bindings
specification.
Lines specifying "cd-inverted" are now "acitve high".

Fix the SD card for meson by setting the cd-gpio as "active low" according
to the boards specifications.

Fixes: 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts           | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts         | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts            | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts   | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts          | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts            | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts             | 3 +--
 9 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 8cd50b75171d..ade2ee09ae96 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -305,8 +305,7 @@
 	max-frequency = <200000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vddio_ao3v3>;
 	vqmmc-supply = <&vddio_tf>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 4cf7f6e80c6a..25105ac96d55 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -238,8 +238,7 @@
 	max-frequency = <100000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_card>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 2e1cd5e3a246..1cc9dc68ef00 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -258,8 +258,7 @@
 	max-frequency = <100000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&tflash_vdd>;
 	vqmmc-supply = <&tf_io>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
index f1c410e2da2b..796baea7a0bf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
@@ -131,8 +131,7 @@
 	max-frequency = <100000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_card>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index db293440e4ca..255cede7b447 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -238,8 +238,7 @@
 	max-frequency = <100000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vcc_3v3>;
 	vqmmc-supply = <&vcc_card>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index 6739697be1de..9cbdb85fb591 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -183,8 +183,7 @@
 	max-frequency = <100000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_card>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 3c3a667a8df8..3f086ed7de05 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -356,8 +356,7 @@
 	max-frequency = <100000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index f7a1cffab4a8..8acfd40090d2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -147,8 +147,7 @@
 	max-frequency = <100000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 7212dc4531e4..7fa20a8ede17 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -170,8 +170,7 @@
 	max-frequency = <100000000>;
 	disable-wp;
 
-	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
