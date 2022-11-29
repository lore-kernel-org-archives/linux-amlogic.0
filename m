Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C9FC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 03:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dG2/7xHmd+PNmxeh3/txJXghHV3hp3ZSGhlqa/FDpKI=; b=eqAXgslmdnObQk
	gg3lHZXXmb//VjS0UWfvNe6/hZ/5eBbfypr2OeT/H2yt3YHODEVsxqeMLectJaSZxF5hsnZeNKK1W
	USSIbP4+z6I7yabTxMsecLRrpM4AFdQbQBBzRklfn+2bTG7FR0yMRZlWUQcFF7Vos1fhEAro95Vqx
	e4GtNd7Jl4uFZBljHuPTuCBR4x9QRNUbeYB+DLdYJbkgCIPLCXBeuCuZP/YgVsHgl1Yv/jgzMuo5f
	BV6/LwPp+ZmnOqVfyJZx+Qv5dtNy+22MiEPyBzOXCzB4+ZU5NP+DoGsLpK+QPkcFqtU5lYn0v9/Ix
	axzZEqge60C0ltJTtY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrBb-005fSI-Sv; Tue, 29 Nov 2022 03:21:31 +0000
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrBY-005fOu-5o; Tue, 29 Nov 2022 03:21:30 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0VVyd4Es_1669692070;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VVyd4Es_1669692070)
          by smtp.aliyun-inc.com;
          Tue, 29 Nov 2022 11:21:21 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: jiucheng.xu@amlogic.com
Cc: will@kernel.org,
	mark.rutland@arm.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH 2/2] perf/amlogic: Remove unused including <linux/version.h>
Date: Tue, 29 Nov 2022 11:21:07 +0800
Message-Id: <20221129032108.119661-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_192128_465318_536AF663 
X-CRM114-Status: UNSURE (   6.22  )
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

./drivers/perf/amlogic/meson_ddr_pmu_core.c: 19 linux/version.h not needed.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3282
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/perf/amlogic/meson_ddr_pmu_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
index 0ff7c0449ac2..b84346dbac2c 100644
--- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
+++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
@@ -16,7 +16,6 @@
 #include <linux/printk.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
-#include <linux/version.h>
 
 #include <soc/amlogic/meson_ddr_pmu.h>
 
-- 
2.20.1.7.g153144c


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
