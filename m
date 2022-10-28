Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6419ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Oct 2022 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mvLQCBIlb2aAtTWx+em9DpmSJ0LrHgWLz5pwDyD2O5U=; b=NYM0Kdg6DCEzwa
	R5ORcXmUw4OYd4ABLVNtL6BXDEPnn7jae5LeGcmUpk7Q4w3J0idIJGKHjk6l9M5cWtmHC9TjlmGJl
	WUj7kkpJvxDYAjlbGgh0oE9BtTXSw0Z7u0t0YHEvhXjSca7pbBv0lI5MOThD2OTCmgCK/fOvVdelj
	LK1TM55YGfrJgSY+6dwH+47+6GKCX6ey/q92uXyvMtvSalSNIUaIBEeZotqD92guIG+DTiZC35pqM
	wnzW+k0yHcyKVHs8I31mX7qrAUrJxVBFR1Nx/regfFixpo0bQZwLtzDIZ4XZX0ZQ+JJ7v0Ii47o1C
	BRSSBQVf3HejHg77b8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPcn-00HPmC-Tu; Fri, 28 Oct 2022 13:42:17 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPcl-00HPkb-2y; Fri, 28 Oct 2022 13:42:16 +0000
X-QQ-mid: bizesmtp79t1666964523t4hfihhr
Received: from localhost.localdomain ( [182.148.13.81])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Oct 2022 21:42:02 +0800 (CST)
X-QQ-SSF: 01000000000000F0J000000A0000000
X-QQ-FEAT: hEgsg0a1R29entsb7H0r/VDA8PcvuIJllYztK3wMsF2TUFT2YFz9FY1aa2M+7
	/5uef3/SNmZQL53GGGYGzfn5sZ79oJ6ooHD2F0gn13xFVf8aT7qDRy4cW0fLbMKErqd/RT9
	IcJJ4MD6ul8y59fWDdF9DHZAmjioqNy5YRGMc5dkn/E23TABHKew855bGmCgsMLsTFvgK1C
	Iv3XaAZ2XgWaM+hXwWuf0H73ysx9U+x0hOYiuh4lMZLs0eLsWu+TJaMOF9siP4ha3kUvHcv
	+GJ26b+Q2pJrXWl82GOAMssNDhs5J754WPg4PGD96YFdoMlWQbLCa0XL9ZZSFw2eB3RjWO+
	wRiZnW5sEHylcnpn6uXdGrpfPvl+As0YN97dJqE/9ULqjildYhg9ZkOr1bjhw==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] clk: meson: fix repeated words in comments
Date: Fri, 28 Oct 2022 21:41:56 +0800
Message-Id: <20221028134156.64042-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_064215_447515_3D02A5F7 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Delete the redundant word 'of'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/clk/meson/clk-regmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index e365312da54e..e08a9fa0cc36 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -18,7 +18,7 @@
  * @data:	data specific to the clock type
  *
  * Clock which is controlled by regmap backed registers. The actual type of
- * of the clock is controlled by the clock_ops and data.
+ * the clock is controlled by the clock_ops and data.
  */
 struct clk_regmap {
 	struct clk_hw	hw;
-- 
2.36.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
