Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FECEB64D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jun 2023 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PzZx1PAiTr65Z28IgwiXYvNeo+J1bWnGIEDuu3Pvbn4=; b=3MO0UBMu4RiDfF
	abfUdxbGNtNUXaC64bDQNVPZkbFPm6Vh98i3dzZVKfCaJ1+5plkfGh5gRtpo3PkzXXCBvYTOD+yz9
	x8ji5+1XSAQV0NDC5s2tVkIuGToxIeIHJ0IupZToE8plJwhT7dcn+zOzWUYPk0XK+9bRiPRpVwto4
	DppsHJsqqaqWK+NqPbxxQcJSErJYyR2Z0C9J7Kfd2o8A12BGbGCEcF40rUy+8x+2P8D41pm/9eCaD
	Gdi8B4mWUcboGmGQI+PxJDOmYAvBXtxCZs4FQZpxfl1Sstd8riIg77P/9Wz3Q8PA8ia14YvmPDDn1
	vgOCchmYIfzLlBVZWl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9MB2-00Awwn-1z;
	Wed, 14 Jun 2023 08:48:28 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9MAz-00Awvt-1s;
	Wed, 14 Jun 2023 08:48:27 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0Vl6-e6E_1686732490;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Vl6-e6E_1686732490)
          by smtp.aliyun-inc.com;
          Wed, 14 Jun 2023 16:48:17 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: neil.armstrong@linaro.org
Cc: jbrunet@baylibre.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] clk: meson: pll: remove unneeded semicolon
Date: Wed, 14 Jun 2023 16:48:08 +0800
Message-Id: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_014825_814571_3F1E881F 
X-CRM114-Status: UNSURE (   6.89  )
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

No functional modification involved.

./drivers/clk/meson/clk-pll.c:373:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5533
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 56ec2210f1ad..8fef90bf962f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -370,7 +370,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		usleep_range(10, 20);
 		meson_parm_write(clk->map, &pll->current_en, 1);
 		usleep_range(40, 50);
-	};
+	}
 
 	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
 		meson_parm_write(clk->map, &pll->l_detect, 1);
-- 
2.20.1.7.g153144c


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
