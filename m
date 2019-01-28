Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C57C282CF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729572086C
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+flX62f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1d56z0i9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729572086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQoGeYTEiGYLQ5sHh1Iq5BMTSgvl/SBm7drQ3qVx8Rs=; b=G+flX62fsLDlNe
	tkBV5Zse38n/6OerfxJU2fBZIy5Q9z3K4Ltw+/k57vZUSBqY2rL+0Y/Bl5Q7/EeEkchvlKgtZ+Vor
	h8FJG0J6VKjT+qhPoMyxAF8XjPlbnUGQWyOJAYX90K8Gli2ax9lZWzpXfM8loDFmEBUPPvFA4K5dr
	3W0cwZBLf3FpmpLB1rYymRUBqd/ZGZLR/vqmCYPuLWGmWRM51ri7eIYTdkUGKr44ZOD99zVwkQ3Iz
	EI1HmwZVAZWuKtNicvGb2Tuy/pAhSQO3ykisINgj72O5Ugr0lfVwq+F7AeyF8wYIyJlfjq6VFRnLS
	kWk3m4h0eU69ZYZ1SiHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go9cG-0003ji-Uo; Mon, 28 Jan 2019 16:18:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9bh-0003Dq-7G
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 16:18:10 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EE842148E;
 Mon, 28 Jan 2019 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548692276;
 bh=rvPz+dJba1dF4HM67/B8ZSqfbRGKcZ4aA+pwbt/Bv5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1d56z0i9Z5KapvcwC7/DRDzzzkw/gcPmSeBgp7PbqFqC6ivpro6C407/XWYDviRO9
 3OAVI+pJTr8lgbIFAdQQ9f8NvPQiwVK5zUf435wp3hTcwBSrARx2kPuhiBZES21D5S
 fnHtjJMLN/xCjVhDeFfems6uI2pJu/q+ssHS+l5g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 136/170] pinctrl: meson: meson8b: fix the GPIO
 function for the GPIOAO pins
Date: Mon, 28 Jan 2019 11:11:26 -0500
Message-Id: <20190128161200.55107-136-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128161200.55107-1-sashal@kernel.org>
References: <20190128161200.55107-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_081757_424486_32BD07D3 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sasha Levin <sashal@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit 2b745ac3cceb8fc1d9985990c8241a821ea97e53 ]

The GPIOAO pins (as well as the two exotic GPIO_BSD_EN and GPIO_TEST_N)
only belong to the pin controller in the AO domain. With the current
definition these pins cannot be referred to in .dts files as group
(which is possible on GXBB and GXL for example).

Add a separate "gpio_aobus" function to fix the mapping between the pin
controller and the GPIO pins in the AO domain. This is similar to how
the GXBB and GXL drivers implement this functionality.

Fixes: 9dab1868ec0db4 ("pinctrl: amlogic: Make driver independent from two-domain configuration")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 71f216b5b0b9..a6fff215e60f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -649,16 +649,18 @@ static const char * const gpio_groups[] = {
 	"BOOT_10", "BOOT_11", "BOOT_12", "BOOT_13", "BOOT_14",
 	"BOOT_15", "BOOT_16", "BOOT_17", "BOOT_18",
 
-	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3",
-	"GPIOAO_4", "GPIOAO_5", "GPIOAO_6", "GPIOAO_7",
-	"GPIOAO_8", "GPIOAO_9", "GPIOAO_10", "GPIOAO_11",
-	"GPIOAO_12", "GPIOAO_13", "GPIO_BSD_EN", "GPIO_TEST_N",
-
 	"DIF_0_P", "DIF_0_N", "DIF_1_P", "DIF_1_N",
 	"DIF_2_P", "DIF_2_N", "DIF_3_P", "DIF_3_N",
 	"DIF_4_P", "DIF_4_N"
 };
 
+static const char * const gpio_aobus_groups[] = {
+	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3",
+	"GPIOAO_4", "GPIOAO_5", "GPIOAO_6", "GPIOAO_7",
+	"GPIOAO_8", "GPIOAO_9", "GPIOAO_10", "GPIOAO_11",
+	"GPIOAO_12", "GPIOAO_13", "GPIO_BSD_EN", "GPIO_TEST_N"
+};
+
 static const char * const sd_a_groups[] = {
 	"sd_d0_a", "sd_d1_a", "sd_d2_a", "sd_d3_a", "sd_clk_a",
 	"sd_cmd_a"
@@ -874,6 +876,7 @@ static struct meson_pmx_func meson8b_cbus_functions[] = {
 };
 
 static struct meson_pmx_func meson8b_aobus_functions[] = {
+	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao),
 	FUNCTION(uart_ao_b),
 	FUNCTION(i2c_slave_ao),
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
