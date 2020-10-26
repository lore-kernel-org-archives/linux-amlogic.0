Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E798BC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:14:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F5D22284
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tnDuB8H1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJ6Zob69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F5D22284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=91yJ36U2J27Ml5vSig3CIyyu1HC60ct6UF3UygtrCas=; b=tnDuB8H1vcHxF+7D2akvZ+xraG
	dLpxENQaj8+LRLRxr05dY1Vyy9WxMezqciwEDcTA79A8N5zZU7pVrTdTXRuDINJnTIAyPt3xVIDba
	MN3rW8JWrMTV+6eNt39fgQBd8187VL879W8heqpUGaW2FRK3VMcjFkKqlIq/hzfTYV1DEmulb2pSz
	7D1lHj5/gMVqkauJGdDyDJDBI3Qlkf9qHIFNQxnEwCdF3e9+OyIB+v83FTg3/V4RQXK4QVdNlj2G4
	tmXshKtEujwzTxegTJjJri1hpAw3LD+kFbECOGK9kVnvEKC2Zu8z4VZzVO2+SrSMTlJ9RkJSokDOh
	u9j40UKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX58j-0005Gj-KX; Mon, 26 Oct 2020 16:14:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX58W-0005Bs-Ni; Mon, 26 Oct 2020 16:14:21 +0000
Received: from localhost.localdomain (unknown [192.30.34.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5F462085B;
 Mon, 26 Oct 2020 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603728859;
 bh=bUpCBioorowGbrQ/fVCAdi1u2Xy+hKlP2gtMWRIPUWg=;
 h=From:To:Cc:Subject:Date:From;
 b=dJ6Zob691AmODEKOGoDqDZeFgi9koU3ieIucOk5+l7f5r8bqVOhGneRhKdkYuD+Z8
 D4G07KviSW9kFoFObqYKUaXsc0TnPgZ8NM/tnkFaXQtMRY9XHfAR/+07ODe2q1CwnX
 rEeZZCNUG5BFAlIQUxzQDLjrgwv2O+AAhwqqSSko=
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mike Turquette <mturquette@linaro.org>
Subject: [PATCH] clk: define to_clk_regmap() as inline function
Date: Mon, 26 Oct 2020 17:13:57 +0100
Message-Id: <20201026161411.3708639-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_121420_970502_B4E0C060 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Nesting container_of() causes warnings with W=2, which is
annoying if it happens in headers and fills the build log
like:

In file included from drivers/clk/qcom/clk-alpha-pll.c:6:
drivers/clk/qcom/clk-alpha-pll.c: In function 'clk_alpha_pll_hwfsm_enable':
include/linux/kernel.h:852:8: warning: declaration of '__mptr' shadows a previous local [-Wshadow]
  852 |  void *__mptr = (void *)(ptr);     \
      |        ^~~~~~
drivers/clk/qcom/clk-alpha-pll.c:155:31: note: in expansion of macro 'container_of'
  155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
      |                               ^~~~~~~~~~~~
drivers/clk/qcom/clk-regmap.h:27:28: note: in expansion of macro 'container_of'
   27 | #define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
      |                            ^~~~~~~~~~~~
drivers/clk/qcom/clk-alpha-pll.c:155:44: note: in expansion of macro 'to_clk_regmap'
  155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
      |                                            ^~~~~~~~~~~~~
drivers/clk/qcom/clk-alpha-pll.c:254:30: note: in expansion of macro 'to_clk_alpha_pll'
  254 |  struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
      |                              ^~~~~~~~~~~~~~~~
include/linux/kernel.h:852:8: note: shadowed declaration is here
  852 |  void *__mptr = (void *)(ptr);     \
      |        ^~~~~~

Redefine two copies of the to_clk_regmap() macro as inline functions
to avoid a lot of these.

Fixes: ea11dda9e091 ("clk: meson: add regmap clocks")
Fixes: 085d7a455444 ("clk: qcom: Add a regmap type clock struct")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/meson/clk-regmap.h | 5 ++++-
 drivers/clk/qcom/clk-regmap.h  | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index c4a39604cffd..e365312da54e 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -26,7 +26,10 @@ struct clk_regmap {
 	void		*data;
 };
 
-#define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
+static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_regmap, hw);
+}
 
 /**
  * struct clk_regmap_gate_data - regmap backed gate specific data
diff --git a/drivers/clk/qcom/clk-regmap.h b/drivers/clk/qcom/clk-regmap.h
index 6cfc1bccb255..14ec659a3a77 100644
--- a/drivers/clk/qcom/clk-regmap.h
+++ b/drivers/clk/qcom/clk-regmap.h
@@ -24,7 +24,11 @@ struct clk_regmap {
 	unsigned int enable_mask;
 	bool enable_is_inverted;
 };
-#define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
+
+static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_regmap, hw);
+}
 
 int clk_is_enabled_regmap(struct clk_hw *hw);
 int clk_enable_regmap(struct clk_hw *hw);
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
