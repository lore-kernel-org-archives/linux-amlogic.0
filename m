Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FE1C7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 12:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3I9CMWFDH4qcWCEk2JKsNhq1h2/cZTKBZvhR7+WljqY=; b=MT3kx/FWlOStD4
	zbHBTuGFr+ypldEjO3fpZUlzl5AEXaRiW/mUQHpdhauWnQ+/qhIXWG1Qs6jc/mV7rphr+9/1Jg9qO
	/jXMU/RjITsHKWMiMXejmwsdMXrIaSZrRXLwKZRX25veIUpRRWJoHjR7TKY18PpqdXNSGDlcGum8A
	dGa5KlliPxv3ukK5uCOU9WGJLH2GhahJXhvd8lDVxOWyq+fA306JvdKOP8jIXEL80PHyVDxn1WwOY
	MZZ5KLh/HFxDljp+lqFCx/peSCaLh62t8zn0u6ASRKP4z9KNBNKwZxbW++MKaJwpMyW39kCZJogf/
	dyFnfhTJVeDc6B4EtlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglnu-00AtzF-1t;
	Mon, 27 Mar 2023 12:18:26 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglmS-00AsqP-0y;
	Mon, 27 Mar 2023 12:17:01 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 46B1821093;
	Mon, 27 Mar 2023 14:11:16 +0200 (CEST)
Received: from venus.iliad.local (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 346B621081;
	Mon, 27 Mar 2023 14:11:16 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>,
	Pierre-Hugues Husson <phh@phh.me>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] perf/amlogic: adjust register offsets
Date: Mon, 27 Mar 2023 14:09:32 +0200
Message-Id: <20230327120932.2158389-4-mgonzalez@freebox.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327120932.2158389-1-mgonzalez@freebox.fr>
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051656_522283_BD549604 
X-CRM114-Status: UNSURE (   8.01  )
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

Commit "perf/amlogic: resolve conflict between canvas & pmu"
changed the base address.

Fixes: 2016e2113d35 ("perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver")
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/perf/amlogic/meson_g12_ddr_pmu.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
index a78fdb15e26c2..8b643888d5036 100644
--- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
+++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
@@ -21,23 +21,23 @@
 #define DMC_QOS_IRQ		BIT(30)
 
 /* DMC bandwidth monitor register address offset */
-#define DMC_MON_G12_CTRL0		(0x20  << 2)
-#define DMC_MON_G12_CTRL1		(0x21  << 2)
-#define DMC_MON_G12_CTRL2		(0x22  << 2)
-#define DMC_MON_G12_CTRL3		(0x23  << 2)
-#define DMC_MON_G12_CTRL4		(0x24  << 2)
-#define DMC_MON_G12_CTRL5		(0x25  << 2)
-#define DMC_MON_G12_CTRL6		(0x26  << 2)
-#define DMC_MON_G12_CTRL7		(0x27  << 2)
-#define DMC_MON_G12_CTRL8		(0x28  << 2)
-
-#define DMC_MON_G12_ALL_REQ_CNT		(0x29  << 2)
-#define DMC_MON_G12_ALL_GRANT_CNT	(0x2a  << 2)
-#define DMC_MON_G12_ONE_GRANT_CNT	(0x2b  << 2)
-#define DMC_MON_G12_SEC_GRANT_CNT	(0x2c  << 2)
-#define DMC_MON_G12_THD_GRANT_CNT	(0x2d  << 2)
-#define DMC_MON_G12_FOR_GRANT_CNT	(0x2e  << 2)
-#define DMC_MON_G12_TIMER		(0x2f  << 2)
+#define DMC_MON_G12_CTRL0		(0x0  << 2)
+#define DMC_MON_G12_CTRL1		(0x1  << 2)
+#define DMC_MON_G12_CTRL2		(0x2  << 2)
+#define DMC_MON_G12_CTRL3		(0x3  << 2)
+#define DMC_MON_G12_CTRL4		(0x4  << 2)
+#define DMC_MON_G12_CTRL5		(0x5  << 2)
+#define DMC_MON_G12_CTRL6		(0x6  << 2)
+#define DMC_MON_G12_CTRL7		(0x7  << 2)
+#define DMC_MON_G12_CTRL8		(0x8  << 2)
+
+#define DMC_MON_G12_ALL_REQ_CNT		(0x9  << 2)
+#define DMC_MON_G12_ALL_GRANT_CNT	(0xa  << 2)
+#define DMC_MON_G12_ONE_GRANT_CNT	(0xb  << 2)
+#define DMC_MON_G12_SEC_GRANT_CNT	(0xc  << 2)
+#define DMC_MON_G12_THD_GRANT_CNT	(0xd  << 2)
+#define DMC_MON_G12_FOR_GRANT_CNT	(0xe  << 2)
+#define DMC_MON_G12_TIMER		(0xf  << 2)
 
 /* Each bit represent a axi line */
 PMU_FORMAT_ATTR(event, "config:0-7");
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
