Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DAE606D821
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pQnKXfro;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TZaJjITw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cfzzs51SrCVmds0K+ZyaJ+zZli9p7pafXCjc5+Whzjc=; b=pQnKXfrom6VPYYSeCLFHnP+NUk
	ak7Mpvurph6+wxW7q74snzNFmqbYGiWUNyd6r/osTP+iUuo5Nq5jmnbCQKebD5XDdBYV4MtiAUmx4
	pUW4kyD+9NzT79z8Uqi4ROyPxswoiaW7lHE7y1ywkOPyv73DoFD9ZetZaDbvtv22VC53bKjK5HseW
	1ULE7L7g2YEj16EP2RnijYa0bZFaEZwZVZnGHHT+PKHlNKVNRsnWf8ugIU3NMBCfIy/WhMFiQE9Yn
	c9b/LvJSFjakWSLcNJE08+jV9IvpkJwI7grNHres4hT9rlVNJxRvzLDVCRpYG2ALVb+6+gCMiatTz
	8szIpO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLP-0000000BZo5-4Bap;
	Fri, 06 Nov 2026 08:30:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLJ-0000000BZen-3NY9
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-49231763f81so193424f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 00:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953836; x=1794558636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=TZaJjITwT/fujtiax5HqxslbxQ6chHl6ICQayE+EHbD/Og0Vmi6uaGC2m1BgbIsLeW
         rWTcYf9S4883c40QhwjaOwBoIQU87q91jN9XGzUXuLOcRN+49YdhK8dmrX/bhJkrz7jL
         2GxReI98P1k5xB67mbdPZ1/qi+XTcYR4neFg2B7HbuskFz0J1fZWmIxVNRVzP8prfoGj
         3857GaVyWCgvA5MtAAA/G1q22zmGM8s36wneAGzErLKEVczQF0X+ljLrICyNvo97koiJ
         y6CHKC9h82mRUCmtohhyVSIpzCfc5cayufuTgN+RJxU386QfADAl2UqAyaNXgbC/alvr
         UEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953836; x=1794558636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=LnXf4h666bCLax9AKxwrTUOae02CHHnck9MexKl/cFGzyOQ0f5wxNaOH/eHffuWK6+
         tjPyB99Fdn1A7Hoih2gtn4RGDiMyN/jmMr8r08bbQaSwVLRZQpkzVGmdm8Raz6Tq6mSh
         qwFmaxmpcrajvttTV3thbdw1IRIUpTUttoroV1La2gCy8+WZSjAuOjVUTeLD5l4F3O99
         MFKvEfMtR90z4dVAgdZo2kYT92M7YBp2GCqTXgN50zUHNXQEojjwclTzCOH2o7OR6Adk
         PsopaPJ5BcyUoRrMbAjjb1VmWhaGyfUwGH+GHlgcTgywWHd/ijgiLcOsk2fTo3X9XoPg
         sJRQ==
X-Forwarded-Encrypted: i=1; AL+hErEOux31c/IAvBjMaVjd8p0lISguOqWZMwIg+YqD0w9MTMrbaO/IqcMlfW4K/fIwkWTOBHVjU8bhaT3M127G@lists.infradead.org
X-Gm-Message-State: APuU4Z+Wmk8lQ87IbP7EB8bPNWj56ptK90aXgBnNgSyVzIRy+Ukd1QWi
	V1lg9dNTPFyqmD7xmEf2ZtWXPZoqpo7PoIEPWlcSLKXzR5jaacW4M0WrEtyckRlPZ6E=
X-Gm-Gg: AYBFou2AABSdhCWPYyFX/lrAcZKSd4JO8w8YtqL9/HQFDPtP23WOhZr3bb50I0KzoBx
	70wlD/Tl5BRz0xBxJT5ai14Js/SMrWcXA7qfYyba1oJ2uxDgyWd0G/TkifA1O95IpnFViuFCXMt
	2HkSzeHYs7LBlFSpa/8KRbEkFv1iDNn9I3uTfPgFWBqqdCRn1Rzbd6CUSmrZs+lunq7WmuOzUrv
	lTSecbHkOMr2/LrJoNRO4HY8fBK59evqQKHZi9MVfDeqkONN22Hv+yYHb+zaDmA6PUyhU3QULpd
	LP+H/VRUxPVe86bzxm8pp/TaSNyaWBLDwRsltA7DID6Smio2oqAanz8tA3b6kpU8LC5G6bw4EOW
	ATQ+CwHuuHB7+Z/Cy5dbPZo0FhcH2PGnRfhrNALUYikNAqP7WMCqeoFkBkH/oCQATytHUssXI+Z
	qbTmSiGJTCDKOWa0kqakQbsaBuo7hKJ/Xwf+XKhnECSKjuOTrbzSfz5PoSEPGBUyT/tMutzbJlK
	Z2ANwTc1wboBKpdbwN9JMksOFGdNuUFxRelUkqpKBXPODMbPURaAG8t6ZJy+JO5qAhHROw45KmR
	r7CXJDsxXekY8g6Z0MlhTsCS6NvwUBZx79KDYQLD08/cQ8RB6ywRzFAAkexG9iOu4FLpjhVz6AD
	x62qxkyslNcp8nNgSMDZmc4nXLOoctZxd5BnXLAYu6r/4qg==
X-Received: by 2002:a05:6000:1882:b0:487:27f9:834 with SMTP id ffacd0b85a97d-492778d1739mr3822099f8f.41.1793953835726;
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:26 +0100
Subject: [PATCH 3/7] clk: meson: pll: Support active-low resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003037_875738_3CFD3F7A 
X-CRM114-Status: GOOD (  15.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common PLL code assumes that the reset of a PLL is active high. The
S7 HDMI PLL has an active-low reset, and its lock flag only rises
reliably when the PLL goes through it.

Add a flag for PLLs with an active-low reset so this PLL can use the
common implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 44b33051405f..4ac5e45c1e9b 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 	return -ETIMEDOUT;
 }
 
+static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
+				   struct meson_clk_pll_data *pll)
+{
+	unsigned int rst;
+
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return false;
+
+	rst = meson_parm_read(clk->map, &pll->rst);
+
+	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;
+}
+
+static void meson_clk_pll_reset(struct clk_regmap *clk,
+				struct meson_clk_pll_data *pll, bool reset)
+{
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return;
+
+	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+		reset = !reset;
+
+	meson_parm_write(clk->map, &pll->rst, reset);
+}
+
 static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
-	if (MESON_PARM_APPLICABLE(&pll->rst) &&
-	    meson_parm_read(clk->map, &pll->rst))
+	if (meson_clk_pll_in_reset(clk, pll))
 		return 0;
 
 	if (!meson_parm_read(clk->map, &pll->en) ||
@@ -328,14 +352,12 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 		return 0;
 
 	if (pll->init_count) {
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 1);
+		meson_clk_pll_reset(clk, pll, true);
 
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
 
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 0);
+		meson_clk_pll_reset(clk, pll, false);
 	}
 
 	return 0;
@@ -365,15 +387,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 0);
+	meson_clk_pll_reset(clk, pll, false);
 
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
@@ -406,8 +426,7 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	/* Put the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..8384b75ae38d 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,7 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
