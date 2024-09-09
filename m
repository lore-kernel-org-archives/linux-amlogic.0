Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C540ECE579
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7NPpDHpH53qi2wwANcEADCmtEm3lW4ZTvnbjKCcm2Y=; b=TCMVq9cB4xHimd
	rnl1a1Pgc3VYh1DtT3zYuDSsOK4N/sMPu6VwO9HLZww/kWsItoh0oFIKzq7PDvX+htX/WCxG574Wh
	w/imluEVTDIT79fejMsHMJeg31GZBg0s6wmfn4EZY6rDTKje4WXut+pzVS1zR3hFIvItfJOhR3HZ4
	2iBfmWuAZiQ2wULqM8VXD9xlok6M/4r+zix9KaA88bGR0hE3u0M2UgxADg3VCUa+AoRu2BDCngmKz
	LW3pyDXrY24fMwsUyohhVnCRrlhbFKhXWj60nvOJWnbIJf5Z5NaX0cXS4VVQf+mWqV0XFjJj+0VIQ
	knE4caSd2A7H4jT/xswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbLj-00000001SDP-2KGY;
	Mon, 09 Sep 2024 10:10:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbKg-00000001Rt5-3r5A;
	Mon, 09 Sep 2024 10:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E39E5C068E;
	Mon,  9 Sep 2024 10:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A638C4CECB;
	Mon,  9 Sep 2024 10:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725876557;
	bh=wNROTOGwTrtcI0H20f0EmINCmCNdwFiZLjQMJFcLHU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gpiYI1LEY/2NHjn7vKGGHqTn5IIYP40L/Emxy8Ltkz1ktpF9M83Xausz4RkMPJ3nk
	 7wm/RhYdoooo4Uposni120xm+xloKvICJbyJ3IOVzixIvtbe2LKRKOnK3o9/VVTHFX
	 cFZKliUsKLg/q5aSHymagdVrWm70X6btCPpbm9LrkhXJmlzqQHmvCV3JWt5twrpyCh
	 8JrgcFM7DTgo8y++L3LP0cIlYTNVFVp7ErJvXODUMPHrVggdeC6BPsxm0N0hCQgqqM
	 SJ71RUlfjPFw5sEMpy2QorM+NUxjBZaXBtrfNrjOCniWW3DXjG9Ewwm3freOhHdcsv
	 qjWRQNgnKfXEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE36ECE57A;
	Mon,  9 Sep 2024 10:09:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 09 Sep 2024 18:08:57 +0800
Subject: [PATCH v3 2/3] clk: meson: c3: pll: fix frac maximum value for
 hifi_pll
MIME-Version: 1.0
Message-Id: <20240909-fix_clk-v3-2-a6d8f6333c04@amlogic.com>
References: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
In-Reply-To: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725876555; l=770;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=I33Vhd+oqJKtNl4x++Y8xPKvaKodnZowE3DBu//z/PA=;
 b=sUDSMpQF9WTheM2ifxOy7eEX8CY4oBwIkOs0u9IEtYYRpSvEcQ5GG9sxdrCKUWqGbm9QBL96f
 zfj8XzUBaAOC1ifMGVa+iIc+WFvmq83fhWx6zjlCWHOclqLVsF5v7WT
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_030919_028447_2986F65A 
X-CRM114-Status: UNSURE (   9.50  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The fractional denominator of C3's hifi_pll fractional multiplier is
fixed to 100000.

Fixes: 8a9a129dc565 ("clk: meson: c3: add support for the C3 SoC PLL clock")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/c3-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 32bd2ed9d304..35fda31a19e2 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -361,6 +361,7 @@ static struct clk_regmap hifi_pll_dco = {
 		.range = &c3_gp0_pll_mult_range,
 		.init_regs = c3_hifi_init_regs,
 		.init_count = ARRAY_SIZE(c3_hifi_init_regs),
+		.frac_max = 100000,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "hifi_pll_dco",

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
