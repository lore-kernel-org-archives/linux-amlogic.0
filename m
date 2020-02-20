Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1D4C11D04
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 13:15:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DECE20722
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 13:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JB+jPC5c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cL9Qls0r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DECE20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=M4W2z1RKR5Jcfz+b42IRdxbl31Z69R5LwmAio+4oD6Q=; b=JB+
	jPC5cPnxUaY/6KCZ20ONBxe5NqY9fmg4Xc8/EoOcTK4tQkQnltf6U5eahTLDpNzxpB5fYKq8oYLeI
	5CEmLrHIxDMLl/LHO/ZySNicIms0ExcJGh8lthLYPKzCGNdhwwfv/hM49UvzP7oPjEnhGwYoUd4Mr
	8mtGu5h3vtpJIaJVAvEUlzoYwL16+qpltRSFsZlfGOVKW4OcXmzS1LZGUUJMNj46/FKe/6xeI/NkZ
	VBmySEgqykiVGx4OW0lobuLf0tF13L6rJNgTsR9Emic8yXW/SNYP4QHIwaNOGTG2e1GLjn2YWu3Oq
	08fbtZ0Pas/bzfSMk++w3ifQHvR2/JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4lg5-0000sY-9y; Thu, 20 Feb 2020 13:15:41 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4lg1-0000lK-I8
 for linux-amlogic@lists.infradead.org; Thu, 20 Feb 2020 13:15:40 +0000
Received: by mail-wm1-x342.google.com with SMTP id m10so2789129wmc.0
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Feb 2020 05:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=XbSocyvlHYbidOLh4UOVd5RVPSZd3HbLsAjRlUOFqzE=;
 b=cL9Qls0rrY+UzGeBw0dqcz5IcrwkrepfPyKpcfyhixITUM1d5/ShOLtYyv9e2ht9re
 vNF4EHS1lout8tWKpDNYeE1wRWJUB1sne2NqK/Fp8QN4MgqLCzv/LyFVKSl2MdP7TfsB
 jFYPfRkh6ytqAY8bNihNOxsftGETYTp9skzjC6gCf6wScN7+DVr3ntlwNTnbiS/vsVrq
 RW6sXB8KpGLV3EjfZJLIAAN+AZLCNu9ksf6Vt5nE4aSeDTxWlB0KqxTWvlA1uAqcXnQm
 31OCyhy4DJ6uyFnqeGplku3fQIs7GQi4AbO0uQU83nieE6vYGS8SxvvzL18IuhEZ+PGC
 aTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XbSocyvlHYbidOLh4UOVd5RVPSZd3HbLsAjRlUOFqzE=;
 b=SDJwjm21//8AT1aHnRHqRPalxUgX315uz2s+EV3RYbMbFk88uKyfifIJjeESa4UsV7
 9BJ44bgRh0Ra1Ly1Zr21AvMy707A9PUSl3r+rAn+yclISMyvmMLdtoXKtA+JF8zZCMyS
 kY92Y7vwQ+a0xkkkoIyzA7UbmnG8C68HqABPE3/s4sVspjXl32SCpl/BpKoDj1DXeyAd
 Ae/5Q1W9Kvz5AtwG5XMyH/DDP2lu5LTV5oBmQU6I/hW+aDrQeyVpIQBhPYtzuXDsf17U
 JiUUI1Mu2YWDaKIZv6cOyIQrrNucKbA0AOszDthHw1HtJo7GmQvPGhpGJ26eooCqyxDg
 b5Hg==
X-Gm-Message-State: APjAAAV8QaUZUhxrYKCUShvd+dbLJdAI5VmFwKuqoHgEaX5mrpfIQJQD
 KOAlMkAVgkLuiNHjOSCJgbZBFA==
X-Google-Smtp-Source: APXvYqxJi6xwPPsEIzGnzgqipWlqaAxHhHMEH+ezeWOrFPemY21Bt4/b8HeNAvszDL/6lNpuF+oXFQ==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr4468157wml.71.1582204535329; 
 Thu, 20 Feb 2020 05:15:35 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d204sm4382774wmd.30.2020.02.20.05.15.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 05:15:34 -0800 (PST)
From: Nicolas Belin <nbelin@baylibre.com>
To: linus.walleij@linaro.org
Subject: [PATCH RESEND] pinctrl: meson-gxl: fix GPIOX sdio pins
Date: Thu, 20 Feb 2020 14:15:12 +0100
Message-Id: <1582204512-7582-1-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_051537_600678_D18F1052 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-gpio@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In the gxl driver, the sdio cmd and clk pins are inverted. It has not caused
any issue so far because devices using these pins always take both pins
so the resulting configuration is OK.

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---

Hi Linus,

Sorry for the the bad formatting of the first patch, this one should be fine.

Thanks

Nicolas

 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 1b6e8646700f..2ac921c83da9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -147,8 +147,8 @@ static const unsigned int sdio_d0_pins[]	= { GPIOX_0 };
 static const unsigned int sdio_d1_pins[]	= { GPIOX_1 };
 static const unsigned int sdio_d2_pins[]	= { GPIOX_2 };
 static const unsigned int sdio_d3_pins[]	= { GPIOX_3 };
-static const unsigned int sdio_cmd_pins[]	= { GPIOX_4 };
-static const unsigned int sdio_clk_pins[]	= { GPIOX_5 };
+static const unsigned int sdio_clk_pins[]	= { GPIOX_4 };
+static const unsigned int sdio_cmd_pins[]	= { GPIOX_5 };
 static const unsigned int sdio_irq_pins[]	= { GPIOX_7 };
 
 static const unsigned int nand_ce0_pins[]	= { BOOT_8 };
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
