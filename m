Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D35860A263D
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VIv7fvb2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=a+BxUwVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yaIjBKnYH2LOGB5ItzFqbRdFYD3mzQgRfW8xKzxIx+w=; b=VIv7fvb2ojBOcat/MVoDTfloPV
	75dmmUO1NYxflxc5MNyxLcKuHbEtOdATBffvGGyI4e0Oeo9noVRGz0L2K/0cEJAuBC270H5h9kbYh
	pJkz2BST7VzQYeAUpF8l5hcnZLFTIfiCwlXsAzwihRBlv9+h1LDRrzjgPpFqewnVtIAmG1SJKdf8d
	g3/MIMtTefoZH1DhO2XG7s+J2X2Xpl2anxbFhg9Hr3VM5RCp9JOwrH4C5Kb+WV7meQTZstKAyJv/Q
	bu77S3siynaiV/+1qrFLTWMQ8ZYaRbmUytmO0huD5QgQThhS5KE4IE7aab1f2oW5xOMElWokeF0Bp
	qy4XO94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOy-0000000F3ka-0s3z;
	Fri, 20 Nov 2026 13:11:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOm-0000000F3bo-3fHS
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Nov 2026 13:11:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so6797295e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2026 05:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180287; x=1795785087; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txuU+BiDG8UpQO0tFx7oAN1Lq5ffpuqfgammyKAXItw=;
        b=a+BxUwVFiLLfGK8G5pEmPPDfWPXzaMrfhfy5t0/Dz2frsMod2rX6cZ3vRMESGtaF8z
         BUSkuzmBk5o4ZWBznYnSfSc9/NvEO6lbWTrSOQiS+0PgZQmbVONQqeC/p0zDbzS/pQXu
         wnRiURVhKA7lmLenV/GxCNcnNQKBUNexi2o/nbtUgJqi5VmxeKaJnBCsLLg6phaO3zOq
         ry6BUoL6ZVoQjA/LzvDanZAvz5zb63bGmO2kHgizwyCY+T5pNt9XapWzCK4XI+29m659
         urMgeQBi278DG/8YpaAWKuFYxVg9VnU+sR500EQePDZO57LMu69vqOiEVx32Jim9yCdM
         KrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180287; x=1795785087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txuU+BiDG8UpQO0tFx7oAN1Lq5ffpuqfgammyKAXItw=;
        b=eQOS6I3ceOp+77nK0DJMETScLgxKgWIdZx9nMFx76qBG4dXAMiBJK7aTftjGMT6WYB
         r0OPNHw3xP7UEbSbjbJkI/q9BXu5OeFQXTw1BV+TW+rcGFjSrXNkQE2p5q46h5vuojxJ
         yymtgZm5wQARqJoca7Ju+jYxx79tc2gUN54XQp7FfSHXhNx8syoA0koqcBF2ywk4lw4O
         L+B3DmtMbHVLxG93VukXvejAdMIn66aILGchTZR13LuLHflYvvHqtDVdw/9Xavjv0NFB
         wCWTnGUtzINCN4aV3o9qxaybMVf6wUYmRMAE0lUrI7Qk+LQrHpXGwXQdFYDoNbew9KYN
         wlAQ==
X-Forwarded-Encrypted: i=1; AL+hErH194a2AeYYYOI2X9yhLBBZHxs66jWleFMRM0bjOyirXwPO3+mN/dLTFhn1XSZynhqk3KRpP1Ik3uwuThrT@lists.infradead.org
X-Gm-Message-State: APuU4Z8hlPHRU39c6QiaQtyydziUyw95kDAMqMnvqMqyXNuZVLemppMM
	dc+fJHm/676SRYPpx90ag1Ep1vZC61AIOx8GrUz+QxoJXubC7RnRb6IEs48Nzd9x2oA=
X-Gm-Gg: AYBFou2PBvAVbMXJs3O7QYwpehI4vHML4ev6ReATYK/kkkd384A2w/jnKawVK9e7kg6
	cIzLnL8kqq3J9fxV+vsQCrk/+aM4RO50QRUNnik6titZ6BaqYF3TkGWC2R8ZXL3QzX+h+el27bc
	swKQYPo1LE/gWKSuQwKokGOOUOWFQwgDRRtFNGvyDScwawjj98vGbXfOW8IvCGw2l3EZunKm2x9
	mhtncCH9ZuPYepMyOz9KbMm6rC2/fWW/9thJ/Z25c52SgynUIgKs4hIv0h8jdU6btRptfzWU5A8
	uuI/JpCLdj3jA5bi7nwgTk39Ro9xqt1JHeXqh74D0UqALSrN4FejCn08NiGlMvA4sPi/D0+lqSs
	ZKQMK4+ZqOaUME1bjpleJjpx9b0szUialyttTzXLKqy2BU+kZ/un5D+Vh0MfShrPknoMoe5kmwb
	wp1fNmUadPzQN7kNqpmfBKlPzckEz8Ue0/pf50nVg81pGWI1eiKOMRRFvuIiZoTCdrHv6Vue7Sq
	nfA0p/c8s5h9d5b6LXEhEfV3q+BixiT3dbLie0ow63ehqos3LJtCA+SuJG6Dt6QCAe/RKceL8Ft
	kmKGiMa4KWnQaQsgtXo/JLOTwrhTijgZXFmi/ot1TGUTeTSfSWk982hxoUnsrBqSwqeaErvN8dR
	UE7GIdIr1DvLEKkmyTBU5ZtrB5tigJFype1DWvRCA2Zr+ThjZpG9ic8VlJfy2BrmnjkY=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr71341305e9.20.1795180286969;
        Fri, 20 Nov 2026 05:11:26 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:26 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:05 +0100
Subject: [PATCH v2 2/6] clk: meson: pll: Support active-low resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-upstream-s7-clk-v2-2-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
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
X-CRM114-CacheID: sfid-20261120_051128_997386_051E3DE2 
X-CRM114-Status: GOOD (  15.50  )
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

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 42 ++++++++++++++++++++++++++++++------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 44b33051405f..29b5222983df 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -293,13 +293,36 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
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
+	return !!rst ^ !!(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW);
+}
+
+static void meson_clk_pll_reset(struct clk_regmap *clk,
+				struct meson_clk_pll_data *pll, bool reset)
+{
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return;
+
+	reset ^= !!(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW);
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
@@ -328,14 +351,12 @@ static int meson_clk_pll_init(struct clk_hw *hw)
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
@@ -365,15 +386,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
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
@@ -406,8 +425,7 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
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
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
