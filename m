Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90263C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59059212F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQ0wUdYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59059212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VNuGWeeaHJwHKPCp2DyXDP4VRTDN4vocCKiZU6hBGQg=; b=lQ0wUdYDwkTTNZvl1/5FSgRRw4
	3igMO4rhh1ualXAPg8emOXtgxnaBYD1xeseUM9TmIjCjSCYnpJbV8Ep08gA1PaGbLKMoghhTm9I2v
	SxLYChC1LGkCK3Av5FafKR4apJQjUWs3QDx+rfHiRXxTInWtNRIa3WcEeHle0CUrW+J7Adr4tGkoM
	ryV8d34goVAXpPWMQk6wpu15aJvpMMjxaFeVr1e13+da1rBsk/WIGPFOzOgGxVyE62vNgrB0dx0Kf
	uKw2RW4nxpE9h4wX4YdHN1+G6CIYksXmI8I9NYo+nvEXU4Y7HsYUGKprHy5zvCy04PWP91c2++nep
	EGDm59DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpq-0001WN-CP; Sat, 27 Apr 2019 12:53:42 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpG-0000hX-Fe
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:11 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mspy4-1gVqbT38iO-00tCHb; Sat, 27 Apr 2019 14:52:51 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 21/41] drivers: tty: serial: cpm_uart: fix includes
Date: Sat, 27 Apr 2019 14:52:02 +0200
Message-Id: <1556369542-13247-22-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:xQq23jU9i9rUL2fNQuvkwl6eGPDVSQvpkDbQ/zveful4zboC1HW
 oNd3D0zOYk84zfCJ0Xuzpmh6YQ79oPwoYvw/oeAO14yaLEcslLKcMENViWN+rlXtE9vM1qv
 1jCwWuLOXgdLjw4fxAGT3BB8TcpKk2wNp9jWPWPgaYVVv0WEj/TEQ/U7sklnKXLuZSVuAgG
 ee5Mn3D1VCygJnSepJUyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xWgBbp/LG7s=:wi8MuLImVy2CGGeEYyoQB2
 KMmBNwIQx4fsztqkOwXtcxcWItI9eedJWvICvmKhOlHgaY8MtQ25FTCVmfHiYt3j9gS36aZaa
 q9Y5EIjEBd+qyl0GLPKh4hpFw2Y9xorJzSRbpppCWg9Lng+zZdTe/MiFG1F7kXNVSzq4lt2hL
 ezKmIOR+0ajJU88S0pj4Kvx7tgnm1+AxaE/XtB3sMY5Kc/X02sDkvp4m476q2eExmeEHf7yl3
 SS9ZDZappKf9esZiUUvzR4FWzO/lGAkyPEM5TbSsWcKPe4Hwz2W19UfQilH2TsF2+lwHqakd/
 0zYcoNC9JBhT5LyMi+bJ4ixLs9s35MALlLW9l9uhuIfzTde5AJ+qVyxmXzjZs7+sgMLLy16T8
 wQ26qYtWIfsOeVfD03mLnlq295RwRXRcppjT2NdxNgQCjA8w3sUfILoNLj9Dn8itEgJAMtfl7
 V8Cx1WCsQKAgggypWMvmWuYLBZW9OCxv/vxSRFHvIZxRwPaRxNeKsu+/Fbb3nzWRANHyooXV/
 DsfRL+yilOXWQavlpzHDrWwcLFWzf4Q6C/lHFEf1NO221QjdJBnEIHiVYjdfQrgI7DXvLr6y0
 OOEW7gT7Kv/C1gTmxJIHJCzbWkK13YeuK27LFOraKAE3hMCkeL/cdQE0Eb+TGViA6xDeL5nsA
 9JTsphma2cCsaVd+QVzhXQsK2WCBYwcJMcIA1O1vu+w/HuFJbyuBL4ArPqi6deE6sKSH4G7JK
 UZVfxUQPRjkUPT6CoClRC35MnUhRE+eqWHNnlA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055307_045128_6FBCAE36 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fixing checkpatch warning:

    WARNING: Use #include <linux/io.h> instead of <asm/io.h>
    #25: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:25:
    +#include <asm/io.h>

    WARNING: Use #include <linux/io.h> instead of <asm/io.h>
    +#include <asm/io.h>

    WARNING: Use #include <linux/delay.h> instead of <asm/delay.h>
    +#include <asm/delay.h>

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/cpm_uart/cpm_uart_core.c | 4 ++--
 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index 374b8bb..c831d31 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -33,10 +33,10 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/delay.h>
 
-#include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/delay.h>
 #include <asm/fs_pd.h>
 #include <asm/udbg.h>
 
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
index ef1ae08..40cfcf4 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
@@ -21,8 +21,8 @@
 #include <linux/device.h>
 #include <linux/memblock.h>
 #include <linux/dma-mapping.h>
+#include <linux/io.h>
 
-#include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/fs_pd.h>
 #include <asm/prom.h>
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
