Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CCAC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 23:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zL0eLnMfuJtS42fg9Fhs7gL+xPb3IciaMERYRHcJUgY=; b=q+tcu/NE9xi6FL
	767dXjClDSsTxa0t/5UbZbifExaCpUislKs+/PGWsSKtpzRZ+0GL/u2g4SYZaHOm3ma5HYRph08o6
	31zkaw7SOuv4X/rBktgavaVfd8B3tPnFaFqlCmPnBBnreXfcblj0ZaAyrvj653LiQ/ozYH4XLioOW
	MY6hJXZOKCe487YJv9/WdgUzMy0QzfcePc4oX1umTTYeurS22SFg7sd0qHBRwigL+7CXWM5fihZNb
	p/Y972iORC4EgmaQ5LvRvoXh+OfmDVwyz/0Kw9Dg7hhNHLJbmN6bQYl88Suv+8bU20gGaP32xG5H1
	AFX4kCX9cEOsr5wGmqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCrxE-00DlQd-5c; Wed, 26 Jan 2022 23:43:56 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCrx1-00DlPl-Jo; Wed, 26 Jan 2022 23:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643240616;
 s=strato-dkim-0002; d=ko-hh.de;
 h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=rUwf4V6VfjCh/Tz0lFpBY98CSKOMaoI/ZlA6KjECeLc=;
 b=Gyt0I8d1vrwyVdd9BPP+goGYbnc0j8x6TKG1RRT1FSae8MCKMpCgt4ICPViamIWx/B
 7fZhlz4/uQNBD1Ie+9+lI2PukTlQi2N7DTJ4HnICI6qHOKYPBzRn5AcBMm1qG88JIR+p
 63bmhAVtc8Hzh6HO7MYnaOWsTYeG6VZzrvKtGnzOW05cpFQL6daAuuem8sw4SeFCNIXe
 J+SJBxChlaIWe+1fZVd6uoEcn+87gOIvBk5Bgd4RsxYhcThTRluy78O2obNSuwBbP6pu
 UjFRkT1GM061AqCOa05TpL+Kd9NFkLrFLE15C7/G9OYsEbWeqrzaP7WstXNFbWzJ7fNn
 1EWg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OGQBeUWjaN+znm36YqWmJEx4lU5vgP4am+jDJsl40KLIzDO7mhvQTIqpxZoDGXXc/Nut"
X-RZG-CLASS-ID: mo00
Received: from odroid-VirtualBox by smtp.strato.de (RZmta 47.38.0 DYNA|AUTH)
 with ESMTPSA id L5f488y0QNhZk0e
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 27 Jan 2022 00:43:35 +0100 (CET)
Date: Thu, 27 Jan 2022 00:43:25 +0100
From: Lutz Koschorreck <theleks@ko-hh.de>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-sm1-odroid: use correct enable-gpio pin
 for tf-io regulator
Message-ID: <20220126234325.GA7363@odroid-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_154343_891540_C220D558 
X-CRM114-Status: GOOD (  10.36  )
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

The interrupt pin of the external ethernet phy is used, instead of the
enable-gpio pin of the tf-io regulator. The GPIOE_2 pin is located in
the gpio_ao bank.
Using open drain prevents reboot issues.

This causes phy interrupt problems at system startup.
[   76.645190] irq 36: nobody cared (try booting with the "irqpoll" option)
[   76.649617] CPU: 0 PID: 1416 Comm: irq/36-0.0:00 Not tainted 5.16.0 #2
[   76.649629] Hardware name: Hardkernel ODROID-HC4 (DT)
[   76.649635] Call trace:
[   76.649638]  dump_backtrace+0x0/0x1c8
[   76.649658]  show_stack+0x14/0x60
[   76.649667]  dump_stack_lvl+0x64/0x7c
[   76.649676]  dump_stack+0x14/0x2c
[   76.649683]  __report_bad_irq+0x38/0xe8
[   76.649695]  note_interrupt+0x220/0x3a0
[   76.649704]  handle_irq_event_percpu+0x58/0x88
[   76.649713]  handle_irq_event+0x44/0xd8
[   76.649721]  handle_fasteoi_irq+0xa8/0x130
[   76.649730]  generic_handle_domain_irq+0x38/0x58
[   76.649738]  gic_handle_irq+0x9c/0xb8
[   76.649747]  call_on_irq_stack+0x28/0x38
[   76.649755]  do_interrupt_handler+0x7c/0x80
[   76.649763]  el1_interrupt+0x34/0x80
[   76.649772]  el1h_64_irq_handler+0x14/0x20
[   76.649781]  el1h_64_irq+0x74/0x78
[   76.649788]  irq_finalize_oneshot.part.56+0x68/0xf8
[   76.649796]  irq_thread_fn+0x5c/0x98
[   76.649804]  irq_thread+0x13c/0x260
[   76.649812]  kthread+0x144/0x178
[   76.649822]  ret_from_fork+0x10/0x20
[   76.649830] handlers:
[   76.653170] [<0000000025a6cd31>] irq_default_primary_handler threaded [<0000000093580eb7>] phy_interrupt
[   76.661256] Disabling IRQ #36

Fixes: 1f80a5cf74a6 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")

Signed-off-by: Lutz Koschorreck <theleks@ko-hh.de>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index 0bd1e98a0eef..ddb1b345397f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -48,7 +48,7 @@ tf_io: gpio-regulator-tf_io {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v>;
 
-		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-gpio = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-always-on;
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
