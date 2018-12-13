Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781F2C65BAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 14:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4537E20849
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 14:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G6FsXzrY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ilGaf19N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4537E20849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27eJCXKUFBSOpmCItOymOhoKs7lVo1WYX4i5nCLKoew=; b=G6FsXzrYsIEVv7
	0bx7NM/ySJRZpevjiOCLr+9HMvtJh8VA/JWzFMfvEMS8WQO3bufJjUnaYC9jWxnf22+eqOcARSR6/
	YZjfW24ZgoYoXTj8s4TOeb9YxL3dCwyLyfoStkzoxlCxPrf7xsU0bmFDroCZaoeHtwDR8dfXJsjww
	oNeA7C6rjcV2yMpwEAL8c5eGuRCcXrgw8Uj8DSgL4K9enZ2gdhH0Rbs06voogsrzTmLvDecXHKEXD
	uFHPj8SkbVzipSr2uPbz68cI8NeQ0xJK98IIhPJVYiZ8jlVEyjY5SAgjYGe97nRCZTEjrpGY7TPiy
	6KvDP7xo6bvWCnUy6ZNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXS6j-0000aD-SV; Thu, 13 Dec 2018 14:36:57 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXS6e-0000L4-S1
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 14:36:55 +0000
Received: by mail-wm1-x342.google.com with SMTP id m22so2629636wml.3
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Dec 2018 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7K7iELG0a2tVDLk15ROsV+hZvPYF3VLaoJgK29DOxho=;
 b=ilGaf19Nu7tlQLV4OQA7w1uDuHvZimVvkJ/t3sxGQBQCSucMAJnGFWy1ED33ex2rKv
 n5yoti8eezGiuxKZMnxUkdiGhrVrLzopRcm63zTeo+K0xXmIauE2Gch+lFBw3bOcZYD4
 1+RcfBjwUgaN/TwaOP9tUl2dlC/OlLokE43BmkM9TzeSs1HijJJSIaiKFc0bUrb8Q+Gt
 l1DyD9RMYM0nMvP8TraspvrBgWobCuOl+kHwsC8BwkVO1W0Kpl5twfTWJVI2ltji7mKc
 2ws+HZlCNSqVe5SN/CLBXIjqkQQRwY4DEqYsBrX2PDiiCjAThMdDIaN71PKYBpvdRoiW
 StrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7K7iELG0a2tVDLk15ROsV+hZvPYF3VLaoJgK29DOxho=;
 b=uN9qs1CmOuHSaAoOi5C2UTcLs6eDDmYEyCS9Cxd0ZJjweHowrdeZGkEwa/Xzdq6Ooh
 G02nN86YUNPIkFhVJhIf7BCt9vIrskO+u31XRZ2ZyH/6qsttC7bceZzrJyjHawPyGwVU
 mWKJOzzejxiw25sN2q79hSZpkmcDzj2iEfvWCLXc93vfV/DL7wlwQwIZjrTN2OZrXgzH
 sJ9sRq595yi8GsO5jw134td0cxG79SSr5yZUm/0UrpC+HfF4hQAFL8MhjjO8nYvbgjKk
 E34uSiQ7qDFH2e4eN/Z/OQ3EPIMVOhWLe7VcSGgRgC30trGs+2uinuX4hpCb9nHCNkpl
 +hMg==
X-Gm-Message-State: AA+aEWZuwDO/o9/kobDSWLAfhYDbOjgTdpOaTnTSItR0mhOMd0BB0OVy
 HVA2RbVbIvemz7m+tdxOkVsO3A==
X-Google-Smtp-Source: AFSGD/Wq8TmdArWt+zEIO67LePsnCA/8WZZUshPb6x+qK77eFcIlnixs1Vjm09fqpZku6aSAHBz07Q==
X-Received: by 2002:a1c:848c:: with SMTP id g134mr9782244wmd.93.1544711804076; 
 Thu, 13 Dec 2018 06:36:44 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id e12sm4929930wmf.22.2018.12.13.06.36.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Dec 2018 06:36:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Subject: [PATCH 3/3] arm64: dts: meson-axg: s400: add spdifin to the sound card
Date: Thu, 13 Dec 2018 15:36:31 +0100
Message-Id: <20181213143631.19218-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213143631.19218-1-jbrunet@baylibre.com>
References: <20181213143631.19218-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_063653_338522_9F2E9B15 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable spdif input device on the S400 and add it to the card

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 2f622a0b599a..c8b531ce5c63 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -256,6 +256,9 @@
 				"TODDR_A IN 2", "TDMIN_C OUT",
 				"TODDR_B IN 2", "TDMIN_C OUT",
 				"TODDR_C IN 2", "TDMIN_C OUT",
+				"TODDR_A IN 3", "SPDIFIN Capture",
+				"TODDR_B IN 3", "SPDIFIN Capture",
+				"TODDR_C IN 3", "SPDIFIN Capture",
 				"TODDR_A IN 4", "PDM Capture",
 				"TODDR_B IN 4", "PDM Capture",
 				"TODDR_C IN 4", "PDM Capture",
@@ -333,6 +336,14 @@
 		};
 
 		dai-link-8 {
+			sound-dai = <&spdifin>;
+
+			codec {
+				sound-dai = <&spdif_dir>;
+			};
+		};
+
+		dai-link-9 {
 			sound-dai = <&pdm>;
 
 			codec {
@@ -489,6 +500,12 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
+&spdifin {
+	pinctrl-0 = <&spdif_in_a19_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &spdifout {
 	pinctrl-0 = <&spdif_out_a20_pins>;
 	pinctrl-names = "default";
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
