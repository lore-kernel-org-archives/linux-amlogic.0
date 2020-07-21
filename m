Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23CDC433E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 01:40:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6DC2075B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 01:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wkEi5SKh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ex7BaeD/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6DC2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mh9U+FbRLqgxNuBeYNdvgkCdQTz8Y5XCOm1+ENXjdWw=; b=wkEi5SKhYkzZ6W8Etcyo9DqENu
	PzwbrYzttQYQ1+wxDT4pPXeK+AMoC3DLS7IprDyQsXtkL1Sgi1hfDnQj1ciTRn/2iITrsCo55xS6W
	ebsrq2EdR1x5bT4C4aNVO/ikl4WhwJogXScCGvzIXpBx15A5oxkjYzE/WHedvXvRMBYawnbwFbA/a
	r3pgsvER4aPN+4K7ItjEnVcxULzsJngNAwyG6CPI+IyiMVbj9Nkovelo9LD9VjEz5u/y5I7d74bdE
	JWSYJVjpU6Q7kvtq826J0gK+jcgDHE2SM1lC1qx77Hwn0pfZ2M+434AYBD7x7z0bmbx2icZmkAhzM
	LNRM2Iww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxhGE-0004u4-Ss; Tue, 21 Jul 2020 01:40:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxhGA-0004sn-4Y; Tue, 21 Jul 2020 01:39:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id a14so4715642wra.5;
 Mon, 20 Jul 2020 18:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wPyZFYbVGDNxKTbgFo2yBi3mdzvRIZTG/NUZ4iCEIoM=;
 b=ex7BaeD/uu8dok4zVyE184lob8aIx0yhHpHCc9FSqnYnTTJZAqQ5isKAu2UJ3JQdsE
 +NT6bC7GwAzUVglCzcg152ZBC4z2u8qFNKO7Goj2SmpvkyWatmQnk9HvbAKfEQvYuuDO
 cyZ3bWExks8tFBZe2Blxn2LJfl1jF+JoOC36OS+6dIfrQBqoCzkwDt65b8tG4g8zf9vR
 ZW15NMzBAavHm6e7ALqE9qOt/81x1swcZWHN1OOLadnRbs4DdQHyiOMSEcGts/Ofbt2h
 5bhRsJZqYclW6Qg/D5DJKrYEiBDE0jMu3GtVt+JAKOicTvm3tvGNMz2KCyl+NE3uiojv
 J0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wPyZFYbVGDNxKTbgFo2yBi3mdzvRIZTG/NUZ4iCEIoM=;
 b=ahFMGcruZrIvx/UPKZg7PnarntIF6J+zSGQoP1WoNlJGCIU3MAZ5i31+b1YjJJ4GEz
 kCO+VoEz1oV41riHjdo+I9w08iQ28pLNlLsbZ+ak5XSHO3x8gz5dnxK4Y0uG+YpRI2G0
 3M5nVRtS54Qb0c63duBwIOz1xPiwdMWzL99JE4s9qwZBd5ZxE/iQZNTd9EFWh3j2s9FT
 B8bdOfID/eWAf8vTc80BcqHzgKn+00EdyD/nYsspD3lUhJV8TpUp7XFaqDG5+tlTaHpS
 cjTNRJeSfmRZzViN8E2ZZHR3FF0EE7AiSB2D/NeAzzgSSI6uT4T1zmmrid+ibHawRajd
 2YqQ==
X-Gm-Message-State: AOAM530rhlBjggrdsdjwoxSG+9CFOuBpu4RIHVq8P9eT74jBbgyJigg0
 ngwylst8Zpyhvu8a/R5Vuw2Hy0BE
X-Google-Smtp-Source: ABdhPJzGP1hvdnHZXIa1OJMmJl9E7yAdXFAB7oEqJrS4WAgSymgIGQtKMlbuahr4B77r524ys+lTaA==
X-Received: by 2002:adf:9e8b:: with SMTP id a11mr2057699wrf.309.1595295597121; 
 Mon, 20 Jul 2020 18:39:57 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m4sm1355023wmi.48.2020.07.20.18.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 18:39:56 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson: misc fixups for w400 dtsi
Date: Tue, 21 Jul 2020 01:39:52 +0000
Message-Id: <20200721013952.11635-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_213958_186984_82E9788A 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Current devices using the W400 dtsi show mmc tuning errors:

[12483.917391] mmc0: tuning execution failed: -5
[30535.551221] mmc0: tuning execution failed: -5
[35359.953671] mmc0: tuning execution failed: -5
[35561.875332] mmc0: tuning execution failed: -5
[61733.348709] mmc0: tuning execution failed: -5

Removing "sd-uhs-sdr50" from the SDIO node prevents this. We also add
keep-power-in-suspend to the SDIO node and fix an indentation.

Fixes: 3cb74db9b256 ("arm64: dts: meson: convert ugoos-am6 to common w400 dtsi")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index 98b70d216a6f..2802ddbb83ac 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -336,9 +336,11 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	sd-uhs-sdr50;
 	max-frequency = <100000000>;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	non-removable;
 	disable-wp;
 
@@ -398,7 +400,7 @@
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		max-speed = <2000000>;
 		clocks = <&wifi32k>;
-	clock-names = "lpo";
+		clock-names = "lpo";
 	};
 };
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
