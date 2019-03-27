Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600F6C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF9E2075C
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UEG+yuff";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Eb2kIHd8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF9E2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpGz+T3jnp446Ju0WqvnhPWOMMYwQ1HNvDlIbib8DHs=; b=UEG+yuffAK++5+
	AhuVYmLSamWWlvzcAPArstgGcY2hA5dxC5NaxYzH3W9M8qEdunKiuU7f8zNbbhpJ+472yEcSuSa/a
	vxSnTrShnImPLsygTfajmGnkjyGzTvjNKi5yiq9vwiBpUL+ADzoZKCZqnnv9i6RngOEeq7DmV/oNq
	scAXZI0TT5jptSLKZxVFPWQgI5UGL+bDAnGsnZmg3Z9XdAqv3donIKJ1p0BDw0QfnRrUpYhcn5DNc
	lWqMrubMgRRKK+tS45SW1l19KTgh8zc5R/CiJwXjdFz2YeVWtIn77l5L4goGg+7f5CBKZPvNoleP0
	7ADllNIPrX2Ul1uW3k8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h95sQ-0008KR-7n; Wed, 27 Mar 2019 10:33:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h95rv-0007g6-KG
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 10:33:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id k11so10486763wro.5
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 03:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ubZfmk1sd8SeT3S5sGdHmZqtBcThNhk+SkoC0cfDlwQ=;
 b=Eb2kIHd8bQAiebcsjvjIvPSAPqyFD/VmxeE6gFP/3pDGxjvUmbiTXlLOOoVHzKcE3p
 lulVBkSJznJHdRU6Brt5bTZ4kvAMOJv3WbNp9PPTEeRdB1nYzhuDRn3Pjm7KXYujQCMr
 WXOCjVuExnglIeC309C3DcygPJ2DTIbTveLyhwV4wkXa6beqgZJupFBh1Jmx6/m2v6hT
 z730pZPougYjqYh5sc5inJ92roXH/pwOGvEiL9zHJMqdhA/xF7zYhz78tD6+OPiUsJSr
 ioQEpidqez4qs/nX+US3bg1dAMqGVdyWSEDEwTg9e1FIjA7e/A/Auef8WVUuRXgrNr+K
 HBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ubZfmk1sd8SeT3S5sGdHmZqtBcThNhk+SkoC0cfDlwQ=;
 b=PGnk1IVu718BLC89Cvs8qGPhR3BgYikW7ZJJVWAlOqOGKHSEuGD4VNga1WHYPpVufR
 fs4EAy8Fof93b1M3Z0yEIMzCNQQ6cCKNYXO2qwmGCjgLX8p58vNbem+Ss5Dv909L9Ed9
 pIedcYTg/XooOmBh445ujyJnu2f+w6utTVVy/UEmOEky6V4ChN8qyswEE6TPuaIhoPV4
 Z0zouxHaH6ksdAG/TPMTmrKXn2q6IrsIUsJDhQ8Czbm9QZpK+LBXCQzRN/FuJFUbvwAD
 tJ5+zEPmAbI39dI85x891z5lQqBku4bhOg9Z4dt0RN4FD3SWbxaIzUOy+xFHKAg9gc+H
 mxhw==
X-Gm-Message-State: APjAAAW9KPHZDvcCTGarFpLCSwX37Z8fkpz41Jfv8J+J1Cj7Sy55mNcj
 LduoaYrNLbVk0tSgJOSXdcWNBg==
X-Google-Smtp-Source: APXvYqzsTSVA+XfDwV+e0odc9zE7X5ZrWgkR9jUQL4dULw4D9ARqPTu6xzAgi909+AkOGHIONqaHKw==
X-Received: by 2002:a5d:5192:: with SMTP id k18mr23223973wrv.171.1553682793977; 
 Wed, 27 Mar 2019 03:33:13 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a20sm27017513wmb.17.2019.03.27.03.33.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Mar 2019 03:33:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH RFC 3/6] clk: meson: g12a: mark fclk_div3 as critical
Date: Wed, 27 Mar 2019 11:33:05 +0100
Message-Id: <20190327103308.25058-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190327103308.25058-1-narmstrong@baylibre.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_033315_677752_8FA95CB0 
X-CRM114-Status: GOOD (  13.41  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
the system to operate correctly.

Disabling it cause the entire system to freeze, including peripherals.

This patch patch marks this clock as critical, fixing boot on G12b platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 03b4c78f558f..d62ebcd2162d 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1062,6 +1062,16 @@ static struct clk_fixed_factor g12a_fclk_div3_div = {
 		.ops = &clk_fixed_factor_ops,
 		.parent_names = (const char *[]){ "fixed_pll" },
 		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
