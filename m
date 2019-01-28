Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0C3C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:05:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA3C2148E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rq8VP8Ao";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Zsbih5A0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA3C2148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQAPfeD4XsI0rnCa82PYFDskUrYklpOCDQ1wYMa9QBQ=; b=rq8VP8AovooG3J
	3cCb4yDmaxgMy3Q4KQw31e8aNx1soXoTE8EUr3pOMP3n7SjdUc+lekGuy+ISVo+lE4DdhCfSZCH8x
	clHVEa2UJBKPAJlein1b3zsOGREqdm0MlVO7PG2KQlTb2QXSmKFxBm7Q8LdyuUs10HCUoOqDwSFtm
	NWvN0AKC+6h7NwGwIhCrl12t2LDAdIQaEjtbi2BmPJDh0uia5Zs/rxnsNHoOiWQkIK2zhQPFR0Al0
	Bd5MmzDWmhVFi+IVJ4/YoS5psA7h36uDnjuWPkOsTrF36qxPvfvvT1qn3C7exHeVjxvg5Et8rOuMN
	kvv4J4zq+z0m41qoWESQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBHP-0004AF-SX; Mon, 28 Jan 2019 18:05:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBH4-0003fs-KZ
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:04:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id f7so19208907wrp.1
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SyqJ1ZNijojoTR5cd+qdscOqYrp/PnKLGRUwKnFmRlM=;
 b=Zsbih5A0XT1436LqD455eX3TwHSJgdMOs5dTyer3kSmE68pxW9N/15q6Wve7hhuO58
 4kNON7i+OYW7ZThzqCZtg8TaDJMY/Ytrp/CBCPR5GdEnv1gAsbPqnVVt7cHfFkXTST68
 3WB5Ol7LCzQeZeLHAZ2dksmfHJu9u75BOxP4I60de9Db00O7aiJVJmQNzthFYco4EAZR
 cM/fkxyoDEKmaLBOHxRCtoCxOk1WCUgkHdfgMh26S0iMES+syQ8ZMfjACKGGJytfg0TV
 tzuEE0kAv/jjkY7HQHcn4pJzuRQmlpH2mmuKf1BGaFIu9dUp/Xqh8QYDgW+wfOwJfpCn
 HUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SyqJ1ZNijojoTR5cd+qdscOqYrp/PnKLGRUwKnFmRlM=;
 b=CkIzp7R0BneqWmz2Sm1aEKRS2xej2taIJsW8xZOg8MNkDtPn17yO1iVxCuMeEuWKMV
 RmmHrsxIqPd4HHx2GSdfpdEu8YxdFP/L2tQogAnNKuKehCdF92omC5B6phe0+Rsr7CJi
 H5UC/SZZHZS6iF6H+QBF79O//Fvc/iF3XOU8hrODzZrbYMmPM8XVZ0T2ZKVwY2Bojgr7
 COTX/3zfNlOMiBRNS0YBGg8ZqeFiG1L7z+zUx3t6XrOhpXUBnk+iZ5lOHxLUj5qyAfto
 xeIqTTcTt5W3GbpNcG0gm94ciFKhRd3/y2ChZTrdiohVWPnvSx9NPreb6JYCdeB8OIOb
 w0sQ==
X-Gm-Message-State: AJcUukcGpDDcoFrkq7HHFeSqoH9m/AQ8krIZM/Wss5pclsx/3P5kKdDW
 bSFwaVDpEreW2xPVnGjhhykJNfDLJPA=
X-Google-Smtp-Source: ALg8bN70L5BosbEnf2iuiICAG9QvKNUPF80NJIk18dNZI4ftldt6y16V7XP2FO29oJ5/RvoO9VsXKg==
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr23743080wrq.133.1548698684743; 
 Mon, 28 Jan 2019 10:04:44 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:04:44 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 02/14] clk: meson: use CONFIG_ARCH_MESON to enter meson clk
 directory
Date: Mon, 28 Jan 2019 19:04:18 +0100
Message-Id: <20190128180430.28689-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128180430.28689-1-jbrunet@baylibre.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_100446_728096_D0935466 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use CONFIG_ARCH_MESON to let make enter the meson clock directory.
As part of a rework, CONFIG_COMMON_CLK_AMLOGIC is about to be removed.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 8a9440a97500..8d780c4390f1 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_ARCH_K3)			+= keystone/
 obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
 obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
 obj-y					+= mediatek/
-obj-$(CONFIG_COMMON_CLK_AMLOGIC)	+= meson/
+obj-$(CONFIG_ARCH_MESON)		+= meson/
 obj-$(CONFIG_MACH_PIC32)		+= microchip/
 ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_ARCH_MMP)			+= mmp/
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
