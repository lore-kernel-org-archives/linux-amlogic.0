Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CE1C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 23:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb6duv0GBwjqF4YS3FKq0npHHZxxq6FdxVyr4YmqZ+4=; b=xmAdml/26Xyfl4
	OTVFvbKsjyNmTEMdy+uO6frdRbRqcaLxOBzK1pyWNVD4YI672D9kSf8nv1d77tkjKuYCyTzF4fiur
	l+VsOG6zGeEkbi7EtTO4ATRBoeWZeuCQbSAMHJ3VARS8a6SymrAJ9iEmNliEtx1rXMfdfP6px8LRS
	99CzC3ILGbGvXC8t25696G8MZYC0bpJe4M+3/+Ak59lsKzEi+IVgXfQlk/1iT010CTPaE60MvkFua
	DEJn7HjviKVSqIA81fvUGCwRW9GLD6VYfVAfFLYawfGOpGDe+UM8xC4iAn8++TQt8pden4C1zZQdN
	C9NxPBdvfsIYJOo4aWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0t1S-00Bhbf-5T; Thu, 01 Dec 2022 23:31:18 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sUy-00BSVQ-Fy; Thu, 01 Dec 2022 22:57:47 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1B0C85FD0E;
	Fri,  2 Dec 2022 01:57:32 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669935452;
	bh=XU1bxoWrykCIxVdFR9T9KlwOWfuXOxPytqzRPXwAy18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ryfu3zlINlnEg5WtnhdYY0DhdKbMmieEI0hBQdTdjkPCeBQGMTCQbRzdCw+AZu06m
	 QDiDgyC5NOf7a3jWRg1ENQGdvZIWexoDUcWWhqt0FeqRfEUTlgBHSGTKJDkhDLbitn
	 b/ud1RDW3kZ13VMn1UxArrRtr/uQz/F7X5QvkaWn5bryeOPrrQh01iCBKDid4ul+l8
	 D4m6mT7WfYLYQ6vKaHOcGhHsJ0hPYZPdciLqQID7aBCpKC3wIBTUZGm82Ldp72ZQll
	 xUVvBSvU3PDpZy6H44F/6Ay51Xq9aIin49Xh08FSJ331eJDqR1ALInjZt84MGePpna
	 QlTzsFFVq4D6g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 01:57:32 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v8 05/11] clk: meson: pll: export meson_clk_pll_wait_lock symbol
Date: Fri, 2 Dec 2022 01:56:57 +0300
Message-ID: <20221201225703.6507-6-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/01 20:49:00 #20634374
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_145744_979662_ABE35A07 
X-CRM114-Status: GOOD (  13.73  )
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

Modern meson PLL IPs are a little bit different from early known PLLs.
The main difference is located in the init/enable/disable sequences; the
rate logic is the same. So drivers for the new PLLs can be inherited
from the clk-pll driver and redefine init/enable/disable routines only.
For that purpose we need to have meson_clk_pll_wait_lock() in the export
symbols list, because each lock operation should be ended with wait
cycles.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/clk/meson/clk-pll.c | 3 ++-
 drivers/clk/meson/clk-pll.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 9e55617bc3b4..81c810d57a48 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -273,7 +273,7 @@ static int meson_clk_pll_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int meson_clk_pll_wait_lock(struct clk_hw *hw)
+int meson_clk_pll_wait_lock(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
@@ -289,6 +289,7 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 
 	return -ETIMEDOUT;
 }
+EXPORT_SYMBOL_GPL(meson_clk_pll_wait_lock);
 
 static int meson_clk_pll_init(struct clk_hw *hw)
 {
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 367efd0f6410..85fec18c4b8a 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -47,4 +47,6 @@ extern const struct clk_ops meson_clk_pll_ro_ops;
 extern const struct clk_ops meson_clk_pll_ops;
 extern const struct clk_ops meson_clk_pcie_pll_ops;
 
+int meson_clk_pll_wait_lock(struct clk_hw *hw);
+
 #endif /* __MESON_CLK_PLL_H */
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
