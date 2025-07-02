Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93575C83F0B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7ZUQHHuwb8DPghfe/BsuGk+9OU3pLVSSbv4ZjwBaXU=; b=O0oDFkKlRJcVES
	O6aACxk4GvybNkgPBxLonRzAfbFgq4BYG9XuJsFYYvklCY05heC6NyH3A2ECciXEZZEGsdq4TAwnp
	PbmwTnIi/eNH8xeb8eia7+jOzGqnmQcmy1+JrD4NYemtKgJbwfd36z4vf3LlEJxNIA1TVG2Z7At12
	EdrlQ3pQgHRiIFGXHjME0x2yFGUgFoWcZNQq3zBk1qIClQtF087vvBWhG+5vbCMoXvSHQmUwUbdy8
	Ol2/YrKFl7S/XpLyr54irYj2yfK1f9tlRa7XTlbLRJEyZlpnIdwiA+1MYgKCFMdTbH7v+q73LtOhp
	32Yovu4VooUaOwKdrEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VC-00000008zIp-0kWA;
	Wed, 02 Jul 2025 16:40:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMv-00000008mve-3Bsf
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4537deebb01so24560465e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470048; x=1752074848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/rEMnGeD4qvZyBGNuDDr/e/nsVy27ZDZfCTdz4n+TQ=;
        b=p1L2rw+6gwCWMk9GZ2eugmQREvFq4gm0IOazArJC1NiejJZ7BxSu9nmTNmLhQ31EoL
         qmTYFWDAwvoxATzskktzXPPeBjLgS3PP5kWJbKsIP7C/br8iBfdkF/5e4UCC0rRfUp+3
         bI0JgHxdwBloHnfuo7vaEVQDwvKLJcrxmX17JpxWimA/8l9XJTwnrrzNWttXcVWcbfiM
         fqRpoarJC9XzAlbzm8xZQ5IEDgizrrmcucylp4FQbg2C7w/obKoQUk29VEASHqGRII/x
         bO21xvWcPEFXMlBt+5rF0pN2zCyShZsCAy69sXuCu4mNgTdpZD5RdJKGbU1AddylwzsL
         abcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470048; x=1752074848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/rEMnGeD4qvZyBGNuDDr/e/nsVy27ZDZfCTdz4n+TQ=;
        b=BUs5ZsAxylvwP0Ixe+nO8wu2YCWV9zcwwjJugi8SdwhRtdlAGXqthvyNxYoUN6heLv
         G7MV4LF6Jb6nRGxJEEdvmijIE+AxC5tHF8pE9SulG+6jjL8Ub/Za8oKF0fmfIcA7lm90
         wELvNZ0vzVqVJytAVuxmVxfhrBrKaZX6Ibh7+8/KwCCkw1XmQzkkfWmco1AkG8mvl3rE
         0cwQHDY6eln/Oci9mDPWaBla+Y9WNWUbs+mtAWcsdGBYqBwrZyT8tt4vBPCE1xg1idPM
         qo6hOeVNaaLozVe7OJFIJTeDj97VQG+jAdnSS2bJKqVS287fCGBFJMPbsgwgP3s9HA3t
         vKGw==
X-Gm-Message-State: AOJu0YzvwHY6TEoBltbeimP7DLMlLslsdjvRvleeKLm5yILAok5K9rQO
	8Gf56vTqj+SUnHky80XZ8YwhRf6yeQadjJ8I79xZRzIPkqJu+NQtY7FX1L7fAl67gBc=
X-Gm-Gg: ASbGncszmiBp8C1AECXtbrQHC6Pf1sdl/FAB464DrO2TbiyfbD88QRgkuysIYDZ8trb
	SfkPNPxzUv48kNGy+45KWoV5D5i2r+4/GQxc4OnxKl/b9eFt/gM+mLYKrsgbLYctd+M2+4mwgjt
	UckzjCG9sV3vFKbXsDOhMwG3OLDh5CO/yziTjKw7YUa8fe0LGPsOgASsbbIsbBOXorJHztJHukg
	aHte5FiOPSCD+DHc3XOe8Q9HYreDFlanK/iXXZhizQCv84C5qIZBTUCspuu1kiHJz/nqb/QeUmC
	K9+U9/TS5qsDwUrUNjXm4HchFQt7HBJ5dMo1LKGB7hmXTGluFwKtU1XCD4Wv9Ir7rEjMlEKqcmb
	y
X-Google-Smtp-Source: AGHT+IHahoxmKnDB02LYfoZM5uHtVJlqRyi8ul0wrW+Qb+0qZK32tlqLlnVRa8VTgImck9/poeHQlg==
X-Received: by 2002:a05:600c:4e90:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-454a373b017mr35366795e9.33.1751470048195;
        Wed, 02 Jul 2025 08:27:28 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:12 +0200
Subject: [PATCH 14/26] clk: amlogic: meson8-ddr: naming consistency
 alignment
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-14-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3620; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=GoRUGsUnjViszPLATa2jyFADH3UQuWxdu+h4Qd6gJsw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/DPxkoHZIJ97lDN9ytfXkN1hQtyq0tH90Ab
 EBAvpbwlL6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPwwAKCRDm/A8cN/La
 hQmxD/45yEiAXoag5hm097lT1KWnHb/uEVW0SgXHcEbpGveuEqrnsPx7DgMWESiWGwtINokytBJ
 RUvOsuMELTM8XbSiYKbspLcj0MSah1NyPrl+e8F9nvwEMmIgfXFsk8fkGJpvLpnwuq7zYIZpsDx
 Frm7J5ZkCN0Tq1aPuMvPcEQAKG7b1Oc+L/MhXR6Gat/RY/rnmFywkvshMBHFNp/A9d8iKQAe2TS
 ZRTuErqcQxBIShHvjeQTJC0jquA8RuvwcMj3Ozq6n8OuphQrXBvSTzp9BNnfR0lu6KyrvkbGtOx
 f6EW56HQ0mscED3PdVyTrJOuihA/qUfGi9pnL92d8iKmE2WKeYGue2AibpCQzt9mvJT4Ic0UrVB
 tlW2OcG8/gshyciD5gOrsEQ1XqZfij1tn4XMcZyTOmqt0vweD/eqdJnp+faLPFSYG/Y+9UtGLSB
 /g8BzAtZr1SRfKIMp4eO+qk1iT4LRgyHmxWbnvnYbpbwDNQ25tHW9jPamX0NtQS4CZUaQidYs6b
 7r/839QzdtFV+iasInyGTKRt6g08z0mqxxd+yCu/3gT0v7eLCBzyfeIDqkp+HhK0jjFv9dTWz7T
 a0Gd/C3BxqceA01Uc4O2770E4SLjmZhvci2CSnO17G01/SggnjOcRxuwMLBPSsvZ50UA2ejhT4W
 K0FmExSB5zCEZSA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082729_817795_969AF529 
X-CRM114-Status: GOOD (  16.88  )
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

Amlogic clock controller drivers are all doing the same thing, more or
less. Yet, over the years, tiny (and often pointless) differences have
emerged.

This makes reviews more difficult, allows some errors to slip through and
make it more difficult to exploit SoC commonalities, leading to code
duplication.

This change enforce, wherever possible, a consistent and predictable scheme
when it comes to code organisation and naming, The scheme chosen is what
was used the most already, to try and minimise the size of the ugly
resulting diff. Here are some of the rules applied:
- Aligning clock names, variable names and IDs.
  - ID cannot change (used in DT)
  - Variable names w/ SoC name prefixes
  - Clock names w/o SoC name prefixes, except pclks for historic reasons
- Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
- Parent table systematically named with the same name as the clock and
  a '_parents' suffix
- Group various tables next to the related clock
- etc ...

Doing so removes what would otherwise show up as unrelated diff in
following changes. It will allow to introduce common definitions for
peripheral clocks, probe helpers, composite clocks, etc ... making further
review and maintenance easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson8-ddr.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/meson8-ddr.c b/drivers/clk/meson/meson8-ddr.c
index 1975fc3987e2cb28823ffd69a5e2aa7b33f4853e..6a9efde9b570d8a2609c118d7d38334a3b4a5dcc 100644
--- a/drivers/clk/meson/meson8-ddr.c
+++ b/drivers/clk/meson/meson8-ddr.c
@@ -12,6 +12,7 @@
 
 #include "clk-regmap.h"
 #include "clk-pll.h"
+#include "meson-clkc-utils.h"
 
 #define AM_DDR_PLL_CNTL			0x00
 #define AM_DDR_PLL_CNTL1		0x04
@@ -77,15 +78,17 @@ static struct clk_regmap meson8_ddr_pll = {
 	},
 };
 
-static struct clk_hw_onecell_data meson8_ddr_clk_hw_onecell_data = {
-	.hws = {
-		[DDR_CLKID_DDR_PLL_DCO]		= &meson8_ddr_pll_dco.hw,
-		[DDR_CLKID_DDR_PLL]		= &meson8_ddr_pll.hw,
-	},
-	.num = 2,
+static struct clk_hw *meson8_ddr_hw_clks[] = {
+	[DDR_CLKID_DDR_PLL_DCO]		= &meson8_ddr_pll_dco.hw,
+	[DDR_CLKID_DDR_PLL]		= &meson8_ddr_pll.hw,
+};
+
+static struct meson_clk_hw_data meson8_ddr_clks = {
+	.hws = meson8_ddr_hw_clks,
+	.num = ARRAY_SIZE(meson8_ddr_hw_clks),
 };
 
-static const struct regmap_config meson8_ddr_clkc_regmap_config = {
+static const struct regmap_config meson8_ddr_regmap_cfg = {
 	.reg_bits = 8,
 	.val_bits = 32,
 	.reg_stride = 4,
@@ -104,13 +107,13 @@ static int meson8_ddr_clkc_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	regmap = devm_regmap_init_mmio(&pdev->dev, base,
-				       &meson8_ddr_clkc_regmap_config);
+				       &meson8_ddr_regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
 	/* Register all clks */
-	for (i = 0; i < meson8_ddr_clk_hw_onecell_data.num; i++) {
-		hw = meson8_ddr_clk_hw_onecell_data.hws[i];
+	for (i = 0; i < meson8_ddr_clks.num; i++) {
+		hw = meson8_ddr_clks.hws[i];
 
 		ret = devm_clk_hw_register(&pdev->dev, hw);
 		if (ret) {
@@ -119,8 +122,8 @@ static int meson8_ddr_clkc_probe(struct platform_device *pdev)
 		}
 	}
 
-	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
-					   &meson8_ddr_clk_hw_onecell_data);
+	return devm_of_clk_add_hw_provider(&pdev->dev, meson_clk_hw_get,
+					   &meson8_ddr_clks);
 }
 
 static const struct of_device_id meson8_ddr_clkc_match_table[] = {

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
