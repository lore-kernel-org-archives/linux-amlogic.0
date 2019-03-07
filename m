Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438DDC43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F013720840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VCct8B95";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bpGg0R5l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F013720840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlT7m/qTm09nTyixdE9xu5/L4pG9eEPYRikmAm85Syw=; b=VCct8B959L47Xf
	xjeS5LMsG8S357HgkSmErtBE1dUZqBH4Coaw+98LWQZRnAe9KHawXyl3Kx0WUzVbGN3kz016GF/p5
	DwqObvs362QArTBXlld319ex3mN+pyAOlWER2YB8ok2A/ir1j0sC6RO6VUFau6+MqYXgbRkzelXs2
	nMSmgtOV9ac0kjEyGHsNcGLvxCRXAOeHg9SJf7PYwvxFnoctnsCfsOpDbr2Bfrh7qDMEe39iJ/LWV
	YL/pFRxKthKHwuOO4h6iu8jWtWlo86kRY8Aglf9tPEcD+bmEx7gSWOPqD7TNM5FfphX+Q2ype9YZL
	UcBUtV+86GKWKOyt/yWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1ujB-0004T9-Fr; Thu, 07 Mar 2019 15:14:33 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiT-0003Rp-4G
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:13:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id l12so1399243wrp.6
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bf1+mf6QfF0AsCLbNkZ8mPUtWVYO9Du/N5n2zl8nGt8=;
 b=bpGg0R5lH1fa5WfXHk0KkF12jcH5G5qkJgiPhF857EkVXitlkhzOPKOsAa7cshICu7
 wS7rO0HpWnBXmKYUOxvl6+9qgi94yAvvO4LXSH9IIlS+9EWghEtrszyfs2B4JIDcvD+6
 x72M1dQBfERvWxk6pmdry/RnK8SIMBuYxQ1XSR+RyZtiyJCpyRXC7eSy3DmMYdQPcyWU
 sklEgjyP5x7+FnkpqWgPa/Z+jqOtLnYegVH8jLvDtv1MJ3NvSNfEiC/S3nZpF450QPor
 uCkZzQk3szbY8a9USEDH0JJKai2zT0Dx0XTyPYWg5ErW2+e4QaDNLNFvWebCwaL42SmL
 8NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bf1+mf6QfF0AsCLbNkZ8mPUtWVYO9Du/N5n2zl8nGt8=;
 b=AWBmhMSPT8ofedgk8LVY1UT7Crz5HsKpt9dlK7GWh6ejWfIz/tgL3NTkSka/Xdadfs
 /898hq0/uc5CdAI6FUejn8SD196NkQPokq1YqpEeTCmszrIICUOt8y5YTYgLjoVlumMF
 6EIJXZE+FnE9NwcqqtyQJC65IbNl081uiUByTqUYUrq0pacwBIuMiy7CntEw4CcUlGM+
 NQvCJUUvHt9EGSiTneaYuAKPKi7PUVvqLAZ/GzZRFeSIXRymliUj2SE5XJ3y2JAlSN54
 0GhvG5ncPyrApWcFz2Tcybu8g7BlHBTsxqG4RSvLk+kTFuvQeixA6XyCKTfCuQ0eVesX
 jbmg==
X-Gm-Message-State: APjAAAWQ4C3MKStNIlkHTsykwrVOzUgCKNo9M3NRhthjfdg91IoK3ocX
 XZRBsIHJ74xxjW208O0Q5Uv7eg==
X-Google-Smtp-Source: APXvYqwmQzpfl9/1mNwGo7zgz2jQGPTPZYva7ziWJYqeIKewiGh2ykoHTRFEoLay4q7YqEW/kL6QOQ==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr7018237wrm.291.1551971627761; 
 Thu, 07 Mar 2019 07:13:47 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:47 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 5/9] arm64: dts: meson: g12a: add reset controller
Date: Thu,  7 Mar 2019 16:13:37 +0100
Message-Id: <20190307151342.7381-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071349_165116_770E66ED 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add the reset controller device of g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index f8f055c49f9a..2a700bb45d04 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -245,6 +245,13 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
 
+			reset: reset-controller@1004 {
+				compatible = "amlogic,meson-g12a-reset",
+					     "amlogic,meson-axg-reset";
+				reg = <0x0 0x1004 0x0 0x9c>;
+				#reset-cells = <1>;
+			};
+
 			clk_msr: clock-measure@18000 {
 				compatible = "amlogic,meson-g12a-clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
