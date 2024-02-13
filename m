Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED16EC48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ek/lqpBl74zFeNB9etIKAxYZw5TSdcX3gH9IYTBYJn0=; b=tqaWgRcL7wn3Cz
	K8xfuKxjqdKbhPvUJhB9rfPyySZhuuK3p5yds6Gf26MvBy4bC/0lx4MquMeqnqYcMT9NTICfk65pw
	8STMQ/luymVjd8FZkMKh1u2FjNAAVpu/2d0JjNvslZIrjEiDUr/lmgB/T2cSP7hM8zqCki+AljudX
	q9mDyysCXgWHkAGuzmGbzLI6PZWO7gExrgDBNrwlK3zcqZDcQNe1zWv4lwh8OXBJcnyeAd2Xc/5A6
	X1FuxE347x4FA2oQNWXDmy60aLUdww0JcM1/sQQhwvet5OpbkzOzfGrI/jgcW5FQQO0dkOPv6mn7E
	ujEPLIRR/m5drRlAbgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZppp-00000008nMP-3XbX;
	Tue, 13 Feb 2024 10:16:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZppm-00000008nLY-45UR;
	Tue, 13 Feb 2024 10:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FD826132D;
	Tue, 13 Feb 2024 10:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59E7C433C7;
	Tue, 13 Feb 2024 10:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707819374;
	bh=k33CtS/Oue9+/X++3MgidqCmxeXWtvkicfBhbDgKtr0=;
	h=From:To:Cc:Subject:Date:From;
	b=JFhoOky3BG+Mf/sBqIr/THaRi7qZBEf2N3cS/D7dfxEInAfgUeO3VOTTkpu/um3He
	 1BYQgAsg+/jBAWldEkFTV9+pDw95l3iQWTmLAsrR+N6fwvkxI127MC2KzO3izhNpet
	 G6UlIo/7n660MGaesxrt3dIwn6oqOBgy/tvFhId1bpcXGXerTLVBVRdcLgOl/iCEvu
	 DUDCXx6cSRK24oxj9nnODLo8y2TliNZSs2Oyqr7WSJvhhqw3YEY+yaSp/VAcf3C7l5
	 6iUvhF0tpDcPmdUR+N9/NccYuUFb7v9YiuuDanaLoTkpEPIZQrAlZr/OfTc/Nno+og
	 69y0hZ5pg1oGw==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] nvmem: meson-efuse: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 11:15:47 +0100
Message-Id: <20240213101607.460930-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_021615_080736_25F675C7 
X-CRM114-Status: GOOD (  11.20  )
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

From: Arnd Bergmann <arnd@arndb.de>

clang-16 warns about casting functions to incompatible types, as is done
here to call clk_disable_unprepare:

drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
   78 |                                        (void(*)(void *))clk_disable_unprepare,

Address this with a trivial helper function that adjusts the return code.

Fixes: 611fbca1c861 ("nvmem: meson-efuse: add peripheral clock")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/nvmem/meson-efuse.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index b922df99f9bc..3b9e31d7d073 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -38,6 +38,11 @@ static const struct of_device_id meson_efuse_match[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_efuse_match);
 
+static void meson_efuse_clk_disable(void *clk)
+{
+	clk_disable_unprepare(clk);
+}
+
 static int meson_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -74,9 +79,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       clk);
+	ret = devm_add_action_or_reset(dev, meson_efuse_clk_disable, clk);
 	if (ret) {
 		dev_err(dev, "failed to add disable callback");
 		return ret;
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
