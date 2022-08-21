Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AF2C00140
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Aug 2022 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0z8+zALwln+WZQY7d/Zj2x4Zho11y47lOCbWOIHiYzk=; b=Rb8+SqWGIZ4FjT
	RoqOnRXV3FYEwm7SeeaMzv3Dow1BUBz6TA82MK3hEO3YcyYq43W3stxQIkiYm2uToIlo5DIZrczzT
	eIbLdDbezZq9yUW51oFMjFH7qwrNDszfLp5saq4UQeXfQ3Vrml0zSCO7VayFxd4PhB0qBYOIGg0Kx
	n9BT7BlsimNb0J1HZqr06uxTHKE2cyyQrzQf77+0WpUe2BwFlsP2kEV00YmhLnv4a5CdJqQ0aQ6De
	BUhTcCH7joowlCMfudekNL28oJkrN2jys5ScqLM/Wyv6ZT4IbfpXo02N+uolahaU6nAyjq4xKy5ij
	LKudoFEyUVGHZw9u5IXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPn0C-00Btf8-US; Sun, 21 Aug 2022 15:36:40 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPn09-00BtWl-2Y; Sun, 21 Aug 2022 15:36:39 +0000
X-QQ-mid: bizesmtp90t1661096165t374baa6
Received: from localhost.localdomain ( [182.148.14.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 21 Aug 2022 23:36:03 +0800 (CST)
X-QQ-SSF: 0100000000200020B000B00A0000000
X-QQ-FEAT: DCPPvtqe8IzjFnN8vSMSGBUwANjnMiqsqhv9KSe9/xAj/mxepGoZuYvIWSMWS
	4d1ypT1J91f6T7xsvIZpMyzvsz8jQ7HD9XhhtJKw8qtJ1qmZm9P/mMQ2bM5RTszDD0vBfSR
	AaRrVkFzh/NWpLFn5rymWFvEcnfEq3XcdqwAnZ2BijNGUHiEHAodluCXCwdSj2k+WWj2VTA
	mquAI/IiaeoweCAk4DRLFzIzfJBt8ZmZSzFDkfLMBdnPnixSzRq3foExNseKy/pNKVVReOr
	iMr5EtKv9etj/PlXyWwNuu1Te4nFZ+pEoy8rNFVRRO2HdRmXav7og6yAksY8hPc6Gu7ZMms
	19s5WGRwU78EUujABoNp34yPtxHAyr+JcaYxKGRmtXcL0XmP1FA4zX+MB6ZZA==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] clk/meson: fix repeated words in comments
Date: Sun, 21 Aug 2022 23:35:46 +0800
Message-Id: <20220821153546.7358-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_083637_347905_15628F9B 
X-CRM114-Status: GOOD (  12.53  )
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

 Delete the redundant word 'by'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 arch/x86/tools/relocs.c        | 2 +-
 drivers/clk/meson/clk-regmap.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index e2c5b296120d..3f8ab8efb674 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -764,7 +764,7 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
  *	to the start of the per_cpu area that does not change).
  *
  *	Relocations that apply to the per_cpu area need to have their
- *	offset adjusted by by the value of __per_cpu_load to make them
+ *	offset adjusted by the value of __per_cpu_load to make them
  *	point to the correct place in the loaded image (because the
  *	virtual address of .data..percpu is 0).
  *
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
