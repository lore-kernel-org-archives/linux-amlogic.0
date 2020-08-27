Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4268C433E6
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 21:44:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B722075B
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 21:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aa5upQt6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="S+DqJmoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1B722075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aWfI5739DWOp+m0foyar7fReICqLbTHtGceJsxDt8vk=; b=Aa5upQt6YIusvkXvy9f8hl9a1S
	qB5U8jcF+G8dXchsKYCeEL1cvjOAJqpqAEeyGj4cKzC+UfOSg1msyAXJpCIidZ9RBE4G19WQ7Qb7Q
	O1fmCLQQ+jVMF+pkdrkOqFDjx4y8BCDYbpJLSz4W4m7Syx4IZqLwMLCwZVwkK3FoEfqaTHj4UKGLv
	B31oUccdJqP1LLYV6iNz3X4yYGGMFT89591gmfbhFUoWOnYyOtEa723iwWc+1Ubr+ZKXQC6b2k6gY
	SUMAXYnht2CtQsAlY46ritCfP8UWSO/6UhPVnHfeD5LNE6dd3Yqjh37L8Obdd3wlj96L+OEU8Gbbz
	DSzFgtEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBPgY-00062s-E5; Thu, 27 Aug 2020 21:43:54 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBPgW-00062Q-A2; Thu, 27 Aug 2020 21:43:53 +0000
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5::4db])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 450AF5C246D;
 Thu, 27 Aug 2020 23:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1598564628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=9JtOjhabbWIc8Ze4vQoeOAqSEJ2W24d6AiC6SaHT6FY=;
 b=S+DqJmoUOw7rynz3V6Z/5czgjniVBUNcFlPi9jafL5jRjc2WRXzbdRaf4SkRnbtDE3c14f
 YRqnqepPP0QVd3V3FnftbWaYEtkh412UyU4ikzbs6nWz98e4sPV715EabbDRfuiLyXCJa5
 8E+2iIb5yGAfJ5wpwwgVzsearP2GpF8=
From: Stefan Agner <stefan@agner.ch>
To: narmstrong@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH] clk: meson: g12a: mark fclk_div2 as critical
Date: Thu, 27 Aug 2020 23:43:44 +0200
Message-Id: <c33df0ebe8be16b56741ce7f873221ab9087a0a6.1598564619.git.stefan@agner.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_174352_586493_1744B944 
X-CRM114-Status: GOOD (  16.53  )
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
Cc: sboyd@kernel.org, khilman@baylibre.com, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Amlogic Meson G12b platform, similar to fclk_div3, the fclk_div2
seems to be necessary for the system to operate correctly as well.

Typically, the clock also gets chosen by the eMMC peripheral. This
probably masked the problem so far. However, when booting from a SD
card the clock seems to get disabled which leads to a system freeze.

Let's mark this clock as critical, fixing boot from SD card on G12b
platforms.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/clk/meson/g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index fad616cac01e..2214b974f748 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -298,6 +298,7 @@ static struct clk_regmap g12a_fclk_div2 = {
 			&g12a_fclk_div2_div.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
