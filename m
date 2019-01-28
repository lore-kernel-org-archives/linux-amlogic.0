Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8D3C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E77921783
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGqISsUJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSjMYJQ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E77921783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Lanuk2GP21InRCtiFbPIVLnAW4RJSBITAGZ70H4Y3g=; b=LGqISsUJrAQlkK
	o4d7aPznd0JySxsoSR52f7Gz82+lr4mPbH0SCE6SfXMS20K4GlLihptsIpBs373Q+sTUZJqG27Alh
	2pqHjvvVAUe/kYx4zl9hxVXmdqE3MMCJxjImPjqQQpwMD5xhzQjUg+cDCAGMefQxwHAIjoc6utIiW
	qUD4T+VA5uW7Ia+05L61ba1/Tswc6v7IjrPsMaEUE/mkqQV7lPrKehCqhl2+1+38U4TAGBjog9JHI
	Lv4d4Z4QBDef6L/tUqPKaD+DaIOgsa3HdScheh5hHOOT3dKG19JO5limhHjt3YhRPRLOBv6PWcacg
	CCujs//zsA3gUR7tNqfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go9Gu-0007aR-CW; Mon, 28 Jan 2019 15:56:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9Gr-0007Zo-Tz
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 15:56:27 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DAA621848;
 Mon, 28 Jan 2019 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548690985;
 bh=Mpyhe8qTaIus1fIsKC5CIORoBVb834a3TFJUdNtqIq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fSjMYJQ3cZPjrvdMxfcm+eOArMFvo27icnU9i2GTnTkYFBuyldphjJ2ICxzXBgn/V
 IzV8R/wxGjUuICdWDzC1DI2joT2F82Vpqxx4kIyCU21VWqEgUKIsuWSO9c4L6MvuHr
 l2TJehjwlpMmxNq57l92tR3Cc7/a1cXRL94P4xAM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 255/304] pinctrl: meson: meson8: fix the GPIO
 function for the GPIOAO pins
Date: Mon, 28 Jan 2019 10:42:52 -0500
Message-Id: <20190128154341.47195-255-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_075625_980859_412B998A 
X-CRM114-Status: GOOD (  10.42  )
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

[ Upstream commit 42f9b48cc5402be11d2364275eb18c257d2a79e8 ]

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
 drivers/pinctrl/meson/pinctrl-meson8.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 86466173114d..e482672e833a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -807,7 +807,9 @@ static const char * const gpio_groups[] = {
 	"BOOT_5", "BOOT_6", "BOOT_7", "BOOT_8", "BOOT_9",
 	"BOOT_10", "BOOT_11", "BOOT_12", "BOOT_13", "BOOT_14",
 	"BOOT_15", "BOOT_16", "BOOT_17", "BOOT_18",
+};
 
+static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3",
 	"GPIOAO_4", "GPIOAO_5", "GPIOAO_6", "GPIOAO_7",
 	"GPIOAO_8", "GPIOAO_9", "GPIOAO_10", "GPIOAO_11",
@@ -1030,6 +1032,7 @@ static struct meson_pmx_func meson8_cbus_functions[] = {
 };
 
 static struct meson_pmx_func meson8_aobus_functions[] = {
+	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao),
 	FUNCTION(remote),
 	FUNCTION(i2c_slave_ao),
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
