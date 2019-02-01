Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF747C282D8
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:59:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0243218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:59:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eWYDXpdY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ssacKsO3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0243218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmqoN1sHfBzQ7+FDFpQrbgpDrTTkdpHCvMI5u54mLFA=; b=eWYDXpdYbMR9Js
	0u6N1rcXjRc8RdMCSWmwnGc3FvcGoh7AjOdawbZ5HGU/sfqDRGKVD95/JE1zcpH4NUgZ8eVEseSEX
	JWdpkNKZrm22N7k4AdjTaxyLPR6bFHHBAeYKJoZ7qtCkXUcvO29kuXPC9w1hGfB+7ygrQlLSppZzB
	kDp1vgIciwuMHIkhaxBdNQ8fZTHqUYR/KdVZoG9CYS2ni3kepP+hUmswYsSUdL1brCYdPbg9tXaCV
	9rOaxv84evlu0RJrwGQIL+J72HqgETMef3iacg5DI3ICvhrxBscwVyp2zsjjkG7ThHG99DI5JOKo1
	bN2kJONP+QQ7kA2jB1zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpYPV-0005hx-JB; Fri, 01 Feb 2019 12:59:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpYPC-0005NU-2e
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:58:52 +0000
Received: by mail-wm1-x342.google.com with SMTP id p6so6115804wmc.1
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hmkxltlF7dcc/tNm5bkNIJRJUm+2VowEALm8V9t6Ca8=;
 b=ssacKsO3q9tzcUuoUi9VaWrdAZwzbfexbKYr81JP0GpitsTmAQwb1nPNDzZjv1NS3w
 63WGqfMWtkEWtiCO41gORVfFUKDYt/+KJyi/dpJ9h5nMdiUL1cTXR1wziIn6ZxB4DLkh
 kdzbwxXhObsLnRbJ5CcxbjgiKeJQ88hi4vSpbZTIGmP9IycFLB45rA5ChDvnQ5SZhDko
 iBcHr7yxHG16BitnViaLtvOTuicMKWrh3hCxtS/DGBcsA0QNgw1B8DkQOKK7//MgvYJS
 w7RU8gX5pR6/mL7CziTa8WD2oNUQTSPtzDCijziMTqIs3/LQ6ZwAO/dWENhB2qvLOmBQ
 MIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hmkxltlF7dcc/tNm5bkNIJRJUm+2VowEALm8V9t6Ca8=;
 b=kYe1qCH1N9G4d/llEYCfaFo1JOhb/TslcueXzpLJ1KSnb+OG/Hz0vvgg2Ee8y2lios
 z1q3XOVt7GDYP5WeL0U6zAWcZzqqe3at8A/C9zP9dqpRapEr0afG8hRdPBtU1Kw+/6Nk
 Qml84uRuOeLwrNT9RRqrKmDgdxtCmmzdqlTq99RnUG1QwNu1yfSeJ4nUaHfgKSfIzNAR
 n+FO389be7VnO6FmOvtV4mFs9hZqvE9+4IDM6vaCkFeuKSj2gM9zs1Y+QaboNaGLUqYg
 r+SK/BktrL04vju7UqOiOnEXi9ZjhV0BSEajIKffmbdBa53VItBRG6a8aCrs30SV6RYD
 FXtA==
X-Gm-Message-State: AHQUAuZfGY/i86ki3q7186ioH5RXyC3H7iYP/XcvYcZ23q/SuUi3m7Ff
 4yFggKwl3szouUeu24GK6tumIAy3htA=
X-Google-Smtp-Source: AHgI3Ib9FUGyo+Wb/YTZo6Pq2xG4N3LjYpjPce5rb6H1DhGWsmtem+5r1MCyDSRHTTHq0NhVIrD+OQ==
X-Received: by 2002:a1c:2804:: with SMTP id o4mr2469106wmo.150.1549025928566; 
 Fri, 01 Feb 2019 04:58:48 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id w16sm8709750wrp.1.2019.02.01.04.58.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Feb 2019 04:58:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 1/4] clk: export some clk_hw function symbols for module
 drivers
Date: Fri,  1 Feb 2019 13:58:38 +0100
Message-Id: <20190201125841.26785-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190201125841.26785-1-jbrunet@baylibre.com>
References: <20190201125841.26785-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_045850_112189_E25D2F86 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

clk-provider.h provides clk_hw_is_prepared(), clk_hw_is_enabled() and
clk_hw_is_prepared() but these symbols are not exported for the
modules which prevents a clock driver using them to be compiled as
a module. Export them to fix the problem.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6ccdbedb02f3..6d86dbb72602 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -394,16 +394,19 @@ bool clk_hw_is_prepared(const struct clk_hw *hw)
 {
 	return clk_core_is_prepared(hw->core);
 }
+EXPORT_SYMBOL_GPL(clk_hw_is_prepared);
 
 bool clk_hw_rate_is_protected(const struct clk_hw *hw)
 {
 	return clk_core_rate_is_protected(hw->core);
 }
+EXPORT_SYMBOL_GPL(clk_hw_rate_is_protected);
 
 bool clk_hw_is_enabled(const struct clk_hw *hw)
 {
 	return clk_core_is_enabled(hw->core);
 }
+EXPORT_SYMBOL_GPL(clk_hw_is_enabled);
 
 bool __clk_is_enabled(struct clk *clk)
 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
