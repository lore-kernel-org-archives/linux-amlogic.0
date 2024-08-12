Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7812C52D7C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2024 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hRfmGOuaYtGrqW8rLfcWwMS8iFI8R8puXomXl3XYnHc=; b=W1f/2oJy9hGiBC
	iwqsNK7lEiZ9jQta2aTU962/nG38wXOdBC/L7OZjL8iWsZinczop3DVlLCr4cvoo2LuG3+BZ9bTxq
	BnMagOnY44gt8f9qtYGJMP3Grj2sEJoq1+5rRzCWSKjBHYPuJA/ypiSDgb7IGsdBq0sEt5h/qjT3s
	ix+z2vIEtPbHEwBNx08DOqJ+/y4OZDq7pEdOvpxkaEamEgQibzDAgXOIKQsN3OmmrKk32PfanhGA3
	wZHiB5/0MyckFObQpEF3fjSqgG+BJ2LZmAoCITaNA1rZaTkjE4gCte+Xx5RDX/aS7qR5xETqe6Rrt
	I/wmaGYmSLzQHoxznPag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTee-00000000BNH-0QW8;
	Mon, 12 Aug 2024 11:56:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTe2-00000000BGn-04oZ;
	Mon, 12 Aug 2024 11:55:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so31683425e9.3;
        Mon, 12 Aug 2024 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723463724; x=1724068524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGqwTPLmyEyMz26JbF1oTN1ZIomEQ9CX54wEGKF1mH0=;
        b=eiLYYGEMqoSF5loGLVV8cXmoeEaLd2NxQnSS3fCAY/6V7faKCry4hYYGeo/5fLuRIF
         jBYrMAvH6NaCpCvBEpBJSGE5XbB6Zu6j4L/nnVeQKN2mSBZOWMzVdrGk1dBUAS+zqv6W
         s8o35+uuTvN+S6QYZzkDt9YEATHDgCBJ5FJzIaHHRFAU/YcMEs0ZjsNctipv5GoG5JjT
         FuI2WWYoT3kUdHoRk/d+Uw6ZmHnFlEC5JT5VOozqdujtwZDhH76IYBPQYvMewjBL0/L3
         UjUxTw7ntvs9KB2s3QeOXsU1Gharr1zAa1cMCHA4hyQ7FajKpwEurOb+LHTLziKxTB8b
         alGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723463724; x=1724068524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGqwTPLmyEyMz26JbF1oTN1ZIomEQ9CX54wEGKF1mH0=;
        b=WsG/vMKijkpukOYxYc1H1x68fu51zh7l9l1wqldRUPPyen1f8EHbwWu4sEN5rMoqxI
         twE4SBgzcv6VSz2G/rEoaGKDLhs3Bal/LuBYJ24MOv8glQx/EzJ1fQ5cqTISp9WWie+G
         gWVgjsHCqtitJJe4gS4x1/eG4P8gUcsfyGA2Ep6GFnIZcbQeX6uy4O9hYYuJ0TR1uJ7p
         rIzBC2vdF+GbRDVic4PSLdcPiR7PLtSTbutSGVPCzi5IvUfMYDD/qvMN4/ic9tYWbWcZ
         VLQVFEEZp4zhaW7Z4ojqu2baz9rb3f52n6t2r6NiCQQgsv+HdLfZqH5uGP6NyZE9xlXE
         fgAA==
X-Forwarded-Encrypted: i=1; AJvYcCUprQS7O3aq0Y+Nl2YdSQFRGwg8CpEyPrbwwdC0OGyrf0ftknlb+GXUwbibcfD5JA+/ZowdFuQPHtpKc1Xca4pf5B463F4jyo7TbsB9MDk/nvxk3CBU7qIswwqfA6p4iqRo99wu1bI89uCv2gHRfhKhPZY+97qwZw==
X-Gm-Message-State: AOJu0YylF1GX96j+I5kn7CY1orvW7TEiohMO9DXDIQmupN5oNH+Cvh+e
	MMGIYRSjolv3aomsPUzgfeivE4Ak7kKAzcFsT9d1Ve0LZ7djQ80m
X-Google-Smtp-Source: AGHT+IEzjMxUddGepYwSs+gi2qqbMIT/TW4uXG/465a39anmmtS9nzyhnaPu4fhSF0pZShiTU2DVEw==
X-Received: by 2002:a05:600c:1d21:b0:428:3b5:816b with SMTP id 5b1f17b1804b1-429d47f19ffmr1249145e9.3.1723463723486;
        Mon, 12 Aug 2024 04:55:23 -0700 (PDT)
Received: from localhost.localdomain (host-79-52-250-20.retail.telecomitalia.it. [79.52.250.20])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36e4c937b23sm7261602f8f.35.2024.08.12.04.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 04:55:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mmc: meson-gx: fix wrong conversion of __bf_shf to __ffs
Date: Mon, 12 Aug 2024 13:55:10 +0200
Message-ID: <20240812115515.20158-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_045526_081269_89AEB960 
X-CRM114-Status: GOOD (  16.02  )
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

Commit 795c633f6093 ("mmc: meson-gx: fix __ffsdi2 undefined on arm32")
changed __bf_shf to __ffs to fix a compile error on 32bit arch that have
problems with __ffsdi2. This comes from the fact that __bf_shf use
__builtin_ffsll and on 32bit __ffsdi2 is missing.

Problem is that __bf_shf is defined as

  #define __bf_shf(x) (__builtin_ffsll(x) - 1)

but the patch doesn't account for the - 1.

Fix this by using the __builtin_ffs and add the - 1 to reflect the
original implementation.

The commit also converted other entry of __bf_shf in the code but those
got dropped in later patches.

Fixes: 795c633f6093 ("mmc: meson-gx: fix __ffsdi2 undefined on arm32")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org # see patch description, needs adjustements for < 5.2
---
 drivers/mmc/host/meson-gx-mmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c7c067b9415a..8f64083a08fa 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -464,7 +464,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	init.num_parents = MUX_CLK_NUM_PARENTS;
 
 	mux->reg = host->regs + SD_EMMC_CLOCK;
-	mux->shift = __ffs(CLK_SRC_MASK);
+	mux->shift = __builtin_ffs(CLK_SRC_MASK) - 1;
 	mux->mask = CLK_SRC_MASK >> mux->shift;
 	mux->hw.init = &init;
 
@@ -486,7 +486,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	init.num_parents = 1;
 
 	div->reg = host->regs + SD_EMMC_CLOCK;
-	div->shift = __ffs(CLK_DIV_MASK);
+	div->shift = __builtin_ffs(CLK_DIV_MASK) - 1;
 	div->width = __builtin_popcountl(CLK_DIV_MASK);
 	div->hw.init = &init;
 	div->flags = CLK_DIVIDER_ONE_BASED;
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
