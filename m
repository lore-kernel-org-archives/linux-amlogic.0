Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B40C9833A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8B8tqZsBiA18nsKfne5S69pvgQ6Kq2O06fY+QeRK3o=; b=NYJQihqnzwQkdx
	e6zx8nR4Y/TcdyKaWdQ8QjFBa5fAhQiWzoHZKQlGpRCdQNYbEud7Ljtbysu1hz9+6b+4KEw6K3GMw
	ATOwGbJm5ZXdYPH9LjNT0cMS8NEOo1OQsJ1oQ9HnpYAxYFLie8VrfT8IWHCxS/YH8G1n3fM5sDShB
	o1C9l72HPgV4uyM0KW7WUrQBrBkNDfBnlL5OudiYdh2k74jNRvJwbjr4hsbwMmXefq/6vIcQogNEb
	F5rHKgLP7xODvdwkaww2RA9pWgu173vXrMHGINamK+U1JLqjUAbexxF8f62gzdHuv/bgq7Iiw7PTI
	punqPgEBCoyiavnbFvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUJ-0000000C4Rn-2xbD;
	Mon, 05 Jan 2026 20:47:39 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUH-0000000C4Pb-0SaU
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 20:47:38 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so568353a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 12:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646055; x=1768250855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P8LBmvGnTOHrkGqJNJYNGnVf7vFIplFOGVmqZklygM=;
        b=Zm9zIceL8BIWeJtRgWF6R12DV1wOsQaRbu4d0q9Y1aCXRfNaftTmvUKrF9STf/B628
         5/66Ywb4RomPviZ5C/CWn1+3Hyz4f0QWJkpDAXXGS8MsK1p5TKAA+ecaBsNqN3XGu9rG
         OQVDQvcN3aGPgPZhQP5TkbZ+nGc+7lgQA9Ty3uPySB+zxOcWw3RU9i6OVg4CZPvWr8eG
         HFfiM4GB110Bjknuo7F3ANgJhONq7OYlJRuILpiXW7vAVDiwQLVCsoDVnXsd4QAe0ZsZ
         cNSlv90//e7f1xLoi+iQ/0lU1ogsRSte4Q7qd6TiGV4THlLXdEjjZZedCeLnBSjPaxM3
         0RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646055; x=1768250855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6P8LBmvGnTOHrkGqJNJYNGnVf7vFIplFOGVmqZklygM=;
        b=kWtdV72G+blztEAqNxZt4gZfIQQZVhq7/8VFsMDZhGidde8KQAxPpcOaDJRbidfIyt
         P73AYYSDF0RUnOdmKNknyVis1Bs4BfUhNmUIODvRtfWflxw79gyxmupppPwe+ZrX0AYV
         uu8BF/wRPlyNfmoi17nCM20zupyOO/bh2oQFbDnRXqD7ZhDeS1mok1aJb/6Ia6sAIXsN
         nr5J4Ldmi4oSPdpmDKOqaI8kkQTt0AdGQNWkPIzGqKjyqUXAd/Oe4+GAvbplvT3RCbxw
         XnUr93azFe9DIi39dNc4ivrGRy3Og/+jqxzSJMZYVpUaK0IC/Jo+zhPDJ241ZI7L7lMP
         cclw==
X-Gm-Message-State: AOJu0YxxWP6Hn3zlwBE5qGLJZz49HAI5sdLtRAFe1L+VherqM0VveN0t
	vcqi5orfDJXuLrCaLc00phW70nyzsJMhK7kY0B2B1Vqsi8DlZqGCAg5JCw8hMg==
X-Gm-Gg: AY/fxX5TKuhNyrtpsL66LQ4COcSG0/cxX4yR+PLYBfQYI5J0qVPm3QPz5SnOpQ6Xg2o
	5D1AXEmt8AsMPwaIbNzGbzsCZEIUsSy2dDcsRwOzVpTG04jV/EzpaLZegON1rF4e8eRxOV26tRS
	zDQuzbuwbmeOmrNtFn8zR1TItCc/VE4/VdKpKqhhGUAtJxigimOmn0axpDzkcmKKNoi0huLsBtG
	+zEtYX+v93d/hRDiVTm1fz/2ivSwUPltq4XgUBF1rQjwl+JYOdcmsa3sixKtjyt1ZLNHmmnAgeW
	i3Rd+CIjZF6v3R+12KezCcUrFMp0YJuiKwa6N812tjBMfq6X3eW+1f/yVgL3gfZVFZUEVQcHg9i
	fyuc6o16FP5SgVTvsmOe40ISAV9prT0koyfFmHPrgcoZOt/RupQDcoGJqGGFy9wp56l2mtJOME3
	6eUnnP+vWSrY67qpZvVpoR1u2Bcwmx50YhJHhrP5Sh32BywmYPdwAbcD7EIBYCJnKxWov4xLL0o
	Z4PB+8UsP2M6XsUkbezkeMvc30fm1QutkDMkHj9hg==
X-Google-Smtp-Source: AGHT+IGG1LQBfEPmFlrxpYd8DB9+gcGLWD908SEefSfmMK/DBGdhRfme546/4V60Eq3pmIsZOVk88A==
X-Received: by 2002:a17:907:944f:b0:b83:13c3:d495 with SMTP id a640c23a62f3a-b8426bb91abmr96266166b.37.1767646054735;
        Mon, 05 Jan 2026 12:47:34 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/3] clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
Date: Mon,  5 Jan 2026 21:47:08 +0100
Message-ID: <20260105204710.447779-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124737_190492_1D80F971 
X-CRM114-Status: GOOD (  13.80  )
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

GXBB has the HDMI PLL OD in the HHI_HDMI_PLL_CNTL2 register while for
GXL/GXM the OD has moved to HHI_HDMI_PLL_CNTL3. At first glance the rest
of the OD setup seems identical.

However, looking at the downstream kernel sources as well as testing
shows that GXL only supports three OD values:
- register value 0 means: divide by 1
- register value 1 means: divide by 2
- register value 2 means: divide by 4

Using register value 3 (which on GXBB means: divide by 8) still divides
by 4 as verified using meson-clk-measure. Downstream sources are also
only using OD register values 0, 1 and 2 for GXL (while for GXBB the
downstream kernel sources are also using value 3).

Add clk_div_table and have it replace the CLK_DIVIDER_POWER_OF_TWO flag
to make the kernel's view of this register match with how the hardware
actually works.

Fixes: 69d92293274b ("clk: meson: add the gxl hdmi pll")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 5a229c4ffae1..0788b9b1ed21 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -349,12 +349,19 @@ static struct clk_regmap gxbb_hdmi_pll = {
 	},
 };
 
+static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap gxl_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 21,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od",
@@ -372,7 +379,7 @@ static struct clk_regmap gxl_hdmi_pll_od2 = {
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 23,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od2",
@@ -390,7 +397,7 @@ static struct clk_regmap gxl_hdmi_pll = {
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 19,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll",
-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
