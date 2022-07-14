Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C661C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Jul 2022 02:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=go8TjSOvPKgRDwCENDOMaap0TBJJWH/KYWu6f2JSwjQ=; b=EeQKjuWQBw/97U
	9KXfCnRjPx6oiOdN+p+BwBNUh/r/Ql+R03uq2e76WKSysmCnKFets8E2xES4MJ8p3GMjB6ocKRBQx
	eP1I4nIYDzeZfUBHK7UuI0fwcuV0yqAUP2zF6u7sShRMo9TXRbVqR0uKAdgenWSFyhpE1QA3mNf3+
	JaM3OpCbkJa85eEgUNX15j/42v5Rx/VbByMuYVFMk0R1FDdfiQWnr32KtecBb2E0JOWj7QhnXPZZF
	xnIy4V+aaaHTUizkwcqr2GC4bBvUqhBwDgiSi/2IsS6e0+8gt0urRpm9rK3WrsntC4qu02+QcT8xE
	IGv1tWeBAPtTHLqm13JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoGB-009wRc-V9; Thu, 14 Jul 2022 02:07:23 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoG8-009wNZ-Gj
	for linux-amlogic@lists.infradead.org; Thu, 14 Jul 2022 02:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1657764429; bh=+gYyvxHNbObLPcAXZSXrtcj9bqiriLYMDuJgdglFBeM=;
	h=From:To:Cc:Subject:Date;
	b=GrA/aiKC6QePlf2W0pqcRTn0LKeQ7ldttSi1ekF4D2Xv5daNN50cMDGPJvE9gsMc8
	 mR1c5TqC9S9YrMxGxk/kM5SoDfPYGSf9yqeiPkk17kY/F/nv5tdfvJ5z65+yqQOBx/
	 W+bEEvnNyyzLWnp17+CLITnpP21heB2cf4HR8+JU=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id 1C7274EB; Thu, 14 Jul 2022 10:07:07 +0800
X-QQ-mid: xmsmtpt1657764427tkkznxky5
Message-ID: <tencent_CE3C171C6300ED12361ED2B813BF0D5A0608@qq.com>
X-QQ-XMAILINFO: MzYTHVlhOHw4DJwv9Q9PXKYRGIYY/j6mPVhvq/M4RogE9JNeknqGqkVQ2rJMZQ
	 mvFP2SbYl9NQssaknqaDXG/Qc/9RUC+nhKkXUCAu3nsAMc8RNsKCu/Mv6x0jb5m8tLRbm/Sk8apy
	 8uzK/XiyDy8DX8u67Ys6HSCz/0x4YBFIPTekudfbhDxHXHdunfBvj6bOTtypT9g4+NMkI1Cr3A7v
	 TKf4fC6gv3E86loCguo0Ni/7L5hUQ5HLJ8wymPM6PK3eMkgIgmUB7+zhhIFsGbVmvM9Rq3LnVnNV
	 NRleVfa0VZlNz2+nA8vUa4aB38XiwuX5vYWMwr22DRxRui1uSLQggoxXzpzMw+lTnNfmZj/94M4f
	 ltNKxNpiZJ/N2dBQVu7uq9oq62SQleHbkUBxWY2J89l92DUv32AGms7x8rEeAzyg6vU+/8OzaNZz
	 KVmUyv8hvXunhK3sgPSYyZn1oVe1e5/t5wPH7T8Cq34aK7bNf0rchZX7GP3Bxtow1V3HozKX6kyC
	 r6wZS6KVmOA9WPQICuabdRW5rzumooy5p9sCxvlyrhhqadNLTuSXUVfPLnhMH92WyLbDCGqNB6nB
	 NgORuDfeMEGEOB+q9AVjCMeRXs177KZkO0jm3PVe4ofmqaRL4eUZhf+XUR3KSWYoXU+HS21nYjw1
	 djhaeDeG/Iq3EDI7D5jHDFOviJvE0Rnmzi4wYw0/90SPaxg4llstPsb+WpwRFjw3/rW4a+136v53
	 V9D1ey9qXyMIjEDs5I3VpNpSmScIbBnOezs2NaMcE783PCNSxpfoBMo4XqHuQsf2xmv/6t4wtVRW
	 CzNULmIyQEE+YHyGoUkz5GI+0K9bx8d2/V0MgvUhuKn1sGXCq4NXoe6ri4ltW63PcidSK0fBmhvc
	 gUVqBzJhmp0lVhVaGZzpwN+4NYYh+6qg==
From: Zhang Ning <zhangn1985@qq.com>
To: narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [PATCH] Ask a question about why can't use GPIOAO: GPIO_TEST_N
Date: Thu, 14 Jul 2022 10:07:05 +0800
X-OQ-MSGID: <20220714020705.39740-1-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_190720_919663_8EA87469 
X-CRM114-Status: GOOD (  11.75  )
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

first this is not a code review, just ask a question.

I started to enable MagicBox M16S, and sent patches for review.

but leds are not enabled.

I have tried, and found gpioao: GPIO_TEST_N can control led on off.

thus I add it to dts:

        leds {
                compatible = "gpio-leds";

                led-white {
                        color = <LED_COLOR_ID_WHITE>;
                        function = LED_FUNCTION_POWER;
                        gpios = <&gpio_ao GPIO_TEST_N GPIO_ACTIVE_HIGH>;
                        default-state = "keep";
                };
        };

but failed with error -22.

and simply change GPIO_TEST_N to GPIOAO_2, no error.

thus find pinctrl driver doesn't allow to use this gpio.

why?

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 51408996255b..fb5fa88b30c7 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -820,7 +820,7 @@ static struct meson_bank meson_gxl_periphs_banks[] = {
 
 static struct meson_bank meson_gxl_aobus_banks[] = {
 	/*   name    first      last      irq	pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
+	BANK("AO",   GPIOAO_0,  GPIO_TEST_N, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
