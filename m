Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA84EC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F2F22243
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C95trIs4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXYzdP7A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F2F22243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1bBXV9hMoIFjfsdo9k+hzJmtrfZ3dkVl2Cq1t5lM6E=; b=C95trIs4dAvrGy
	cH/ZwbYE+ksnF/MhlYg5cVmkf7RmPn6f59v5WSZUDvNDR9ZSPzEfeIoTm3+uTaPajIkFfthQk+qRP
	PIy66DS4fDl7FD2yNXqbVMahzq5BmaeGtqqSH0A8VHf0oDBsYYi2tD2q8asuaz4MLQ2ML9gyDD+4z
	XUvywbB50PkAAHhmvNRwi22ZbVxobVWPB/jBdtM27EuW1cVf+dewYA7P34sxgOpOeyqOwKxtyC19x
	6rU62xPy8slyeZdc8VWG8qFDY+TWfZrrXqViBN+5CcytTHCsNV/Rgbqr4+qg/jywuYheWbmXEAbAW
	pWF1UrqRWNrDJokumpxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jljbv-0000a6-F4; Thu, 18 Jun 2020 01:44:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jljCp-0000xT-Ev; Thu, 18 Jun 2020 01:19:05 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA45F21D79;
 Thu, 18 Jun 2020 01:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443142;
 bh=P2jbJjxLRXB01Y0XRWzTB55HTTcQubhBALt0qZ/Wd8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OXYzdP7AqUB58nQih0OC4C9401qCFz2JAiJW+z7V8ITvDEpRnmKmJBckMo3W7DHAE
 5Iq6L0wUH2wyVMWu0RZVKE5IitM/OG6IoK/5JvGQpUFIwiWY+xBnQTDMlKi4F9oP7A
 M2bkYq85w71oIB+ONAPTV7vHQod++cqaMSgEZCcw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 112/266] clk: meson: meson8b: Don't rely on u-boot
 to init all GP_PLL registers
Date: Wed, 17 Jun 2020 21:13:57 -0400
Message-Id: <20200618011631.604574-112-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_181903_668384_011ADB18 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit a29ae8600d50ece1856b062a39ed296b8b952259 ]

Not all u-boot versions initialize the HHI_GP_PLL_CNTL[2-5] registers.
In that case all HHI_GPLL_PLL_CNTL[1-5] registers are 0x0 and when
booting Linux the PLL fails to lock.
The initialization sequence from u-boot is:
- put the PLL into reset
- write 0x59C88000 to HHI_GP_PLL_CNTL2
- write 0xCA463823 to HHI_GP_PLL_CNTL3
- write 0x0286A027 to HHI_GP_PLL_CNTL4
- write 0x00003000 to HHI_GP_PLL_CNTL5
- set M, N, OD and the enable bit
- take the PLL out of reset
- check if it has locked
- disable the PLL

In Linux we already initialize M, N, OD, the enable and the reset bits.
Also the HHI_GP_PLL_CNTL[2-5] registers with these magic values (the
exact meaning is unknown) so the PLL can lock when the vendor u-boot did
not initialize these registers yet.

Fixes: b882964b376f21 ("clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200501215717.735393-1-martin.blumenstingl@googlemail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/meson8b.c | 9 +++++++++
 drivers/clk/meson/meson8b.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 4f9b79ed79d7..082178a0f41a 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1910,6 +1910,13 @@ static struct clk_regmap meson8b_mali = {
 	},
 };
 
+static const struct reg_sequence meson8m2_gp_pll_init_regs[] = {
+	{ .reg = HHI_GP_PLL_CNTL2,	.def = 0x59c88000 },
+	{ .reg = HHI_GP_PLL_CNTL3,	.def = 0xca463823 },
+	{ .reg = HHI_GP_PLL_CNTL4,	.def = 0x0286a027 },
+	{ .reg = HHI_GP_PLL_CNTL5,	.def = 0x00003000 },
+};
+
 static const struct pll_params_table meson8m2_gp_pll_params_table[] = {
 	PLL_PARAMS(182, 3),
 	{ /* sentinel */ },
@@ -1943,6 +1950,8 @@ static struct clk_regmap meson8m2_gp_pll_dco = {
 			.width   = 1,
 		},
 		.table = meson8m2_gp_pll_params_table,
+		.init_regs = meson8m2_gp_pll_init_regs,
+		.init_count = ARRAY_SIZE(meson8m2_gp_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gp_pll_dco",
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index c889fbeec30f..c91fb07fcb65 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -20,6 +20,10 @@
  * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
  */
 #define HHI_GP_PLL_CNTL			0x40  /* 0x10 offset in data sheet */
+#define HHI_GP_PLL_CNTL2		0x44  /* 0x11 offset in data sheet */
+#define HHI_GP_PLL_CNTL3		0x48  /* 0x12 offset in data sheet */
+#define HHI_GP_PLL_CNTL4		0x4C  /* 0x13 offset in data sheet */
+#define HHI_GP_PLL_CNTL5		0x50  /* 0x14 offset in data sheet */
 #define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
 #define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
 #define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
