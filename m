Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287C1C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED34D20863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WwE9nkn4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HLJdfe4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED34D20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4msddlzpiXZ06vfPhpJselgeZec9jOGX8CJoNY0DeL0=; b=WwE9nkn4y0wSrm
	vzSIqQy4a57vLQWWYYdrCgbQMLOz1RiVM0vdaIZQQehWav+rrJ6X31ea1nYtQub/2z46BccyCmrdU
	8VDgOhcqSq4g0urjyjVhxkHUx1sqcR6jxCsuq83lYABV7ZRp/R/ng9H8ZqQ91VkJBRCNosE579lmo
	wPfhJ9IS+dd/tO3L4cuxnMA2uvnT4WYFFfWf40bRWcfpJHxrCHs3a64FVf6ZR2CiWPFsjkuNXpghn
	zZl/8XGBvZTZk+xxVOTzN0QsiypwD8jaFi0/tNglZv3C7gHQHn//kzMZQMJy06tYuMGY7XaSpCkIi
	mQg4EzZyWIae6PSGsy0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8NWq-00076o-0c; Mon, 25 Mar 2019 11:12:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8NWb-0006wp-TM
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 11:12:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id g3so6120301wrx.9
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 04:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fKq0Xmw2ntAqrTVNaEz/XqYkib9vFynLezQDvMrUHDU=;
 b=HLJdfe4usokrPovRQReXb3u4/AX4uD/nG1dOjRXM6qMGCuiE5XhVyoMWmgp32yaGTl
 kEu0Zh5L1k0o/ERmTU8U4rscsJj0nWj/V8kyY7/Bt8NiBAJZwpypz4lHJDmu7veLelcC
 XFrn4pOXj2r+UCdQ63gUljC2h3SYDRx4RIzmUHYMAwr3oppJcj7pTt1Ikg+9OVQvPZ5j
 12nBK8Y+Lk+jVhREudTFRTbR0LmKuV/FaWQ3jzZNNIOI9e1jYSt9Fp6qhik5niLFfWxP
 RI2/3IbJD+kOC/TGr6o3PqhrD8VcUs1GmsRyOeyJov2zDMq9j2mjxDABZe8u2bfXWS7z
 OpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fKq0Xmw2ntAqrTVNaEz/XqYkib9vFynLezQDvMrUHDU=;
 b=QNx58aCnKoCUaOwoRPJFvBjKm0zI8AxEAiewgyyIqI8rbNvRmQUkMFcW1dHWBaC4BK
 c3/ezlARn4tGGJ2pbOXrw8aWUUieX+6ip3Ts6QZtGtKiLXuGtkzWbQwLccEgAZaGPbGO
 /kFi2754zktFkvkexZAbefi7morR/8QM367tz/6CaTgL/4Nbc+v47WbJOlVV8TYuI2jW
 9+sc5W+7whZ7Fy4eowAKHkRcP6Vmk3rWPpHQuh/jfboI0F0lYXbH84xsSTvRIHyM2HtQ
 nBtvwyBN3D27dx59PKgiWjwEfyl5Tcfq5JyBxq60Hx14KqqfwkD2jrUuOxRLc5oQ8Nx4
 r4CA==
X-Gm-Message-State: APjAAAUiHuGRm5bg+2tSIBqvkInkrBKTVo849VOa/KAaU4CEH64AWgD5
 VvA+6G5HnnEG7SNkH2U097V+Jw==
X-Google-Smtp-Source: APXvYqzuscNSf995R6bIjyFx5XSYb8F+ngHC5dvyb/ItWnCgkc4V1XJlyCosXz1frjAulr1d0+N0lg==
X-Received: by 2002:adf:dcca:: with SMTP id x10mr15173526wrm.57.1553512332252; 
 Mon, 25 Mar 2019 04:12:12 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 n188sm15134301wme.13.2019.03.25.04.12.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 04:12:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/4] clk: meson: eeclk: add init regs
Date: Mon, 25 Mar 2019 12:11:59 +0100
Message-Id: <20190325111200.15940-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190325111200.15940-1-jbrunet@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_041217_995251_8EA57A80 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Like the PLL and MPLL, the controller may require some magic setting to
be applied on startup.

This is needed when the initial setting is not applied by the boot ROM.
The controller need to do it when the setting applies to several clock,
like all the MPLLs in the case of g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-eeclk.c | 3 +++
 drivers/clk/meson/meson-eeclk.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 37a34c9c3885..6ba2094be257 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -34,6 +34,9 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 		return PTR_ERR(map);
 	}
 
+	if (data->init_count)
+		regmap_multi_reg_write(map, data->init_regs, data->init_count);
+
 	input = meson_clk_hw_register_input(dev, "xtal", IN_PREFIX "xtal", 0);
 	if (IS_ERR(input)) {
 		ret = PTR_ERR(input);
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
index 1b809b1419fe..9ab5d6fa7ccb 100644
--- a/drivers/clk/meson/meson-eeclk.h
+++ b/drivers/clk/meson/meson-eeclk.h
@@ -17,6 +17,8 @@ struct platform_device;
 struct meson_eeclkc_data {
 	struct clk_regmap *const	*regmap_clks;
 	unsigned int			regmap_clk_num;
+	const struct reg_sequence	*init_regs;
+	unsigned int			init_count;
 	struct clk_hw_onecell_data	*hw_onecell_data;
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
