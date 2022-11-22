Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8843FC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PW0htqRkKoOnhJMXg35owpNr2VQk3y+R4KNnV0jZWcU=; b=xgSFrZtkzmOa8u
	3Ddb1cXNaSVJm/U1l9MUnRes1o/qArq/KXVy6DjCM7m4HCREpEcUlQx1f0Lb6QM4PmDyvX3MFH7M/
	g0gpi34aOcokLeDwnz89W7hQZ9yiORlmi+Yc+PJOlwv9JV/EocLjZLYvJlMRgDbWVw8Sbs4kaE4CW
	xOZjo7PS5uVa+mXGJ2MMe600V/O1hH1XhJ3hIt33Ev2KwwLVtgjQGl1qBMzfmBeQkL8EHf6IvXg09
	vBsAjgoKi7RiHNw6LIkfIaj5uMzBxewz0HQPj2g9M6MNRDoMrMvR8llzPLjnaeyzOCzZHVNBe2Zw+
	JWj+PbnAQcdMLyOJVs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOpe-006NHy-MH; Tue, 22 Nov 2022 08:40:42 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOpc-006NEo-I4; Tue, 22 Nov 2022 08:40:41 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 22 Nov 2022
 16:40:36 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Jianxin Pan <jianxin.pan@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, Chris Healy <cphealy@gmail.com>, Chris Healy
	<healych@amazon.com>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] perf/amlogic: Fix build error for x86_64 allmodconfig
Date: Tue, 22 Nov 2022 16:40:28 +0800
Message-ID: <20221122084028.572494-1-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_004040_626235_79869CDA 
X-CRM114-Status: UNSURE (   7.30  )
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

The driver misses including <linux/io.h>. It causes
compiling error "implicit declaration of function
'readl' and 'writel'" when make X86_64 allmodconfig.

Fixs: '2016e2113d35b ("perf/amlogic: Add support for
Amlogic meson G12 SoC DDR PMU driver")'
Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes v1 -> v2:
  - Add the "Reviewed-by" tag
---
 drivers/perf/amlogic/meson_g12_ddr_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
index c07c34f03cce..932802abd18c 100644
--- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
+++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
