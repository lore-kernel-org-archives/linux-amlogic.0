Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E30C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 13:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H+Dxdt9415+sVpWBg08sqzkB3AvUZFmY9wC+iAzOI/I=; b=MbcKpv6IBkRB2R
	uApTkeBKzsmhnDAvjYPq+3Ot3ofZIRAHk2y593+vhuqXuaQHOyv0VwmaEBR1kyYf+ej34nua3lFzS
	ZZlWYPufHXlfS1fPH8z+kNrUHN2pYWIUTOhgMRCgUoM4UZRqmMekak8RdUzApyzsRyeAAiaFklYSi
	s4rT4OxBa/rtcMXyw+2dUav4mhu0x+2iw9GPw4EpH9Sj21NogUUAZKXuKPEVWjy3cgwFP+NaSMhQ2
	YxPXoHUs6EiMccZ9QwnXaIKjqFyq4J7ykUptGqa0ryZ8uOeotx8EOX1D/veFnsxGKkGPaLfWep+oz
	znzeTBdvvWj9bZM6ohmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD4Tc-00Fp2P-OQ; Thu, 27 Jan 2022 13:06:12 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD4TG-00FowD-KF; Thu, 27 Jan 2022 13:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643288748;
 s=strato-dkim-0002; d=ko-hh.de;
 h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=b+caAxbUrHuhIpx7+ePsmJewnN68/Jfd7jaXxPBONu0=;
 b=pRTPd08iAF/6d9RISTuRtIS2RahhHjp7EEWcHmzC0jgAKcV89cWSxT6kDqkrXakD2D
 dQzgfoVTA2mKxjXs0NMCKAYbg8b2ZL5lU3K19m59CQenK29ev4NLtOV5hO9lUkc4N47/
 gn18wvNoVgKrd5zhik4n0dLDP7Eb9d3mojG54bWkmntqJKTYVS2mnOGYRGAqSIV7Fiip
 RZ5N9aqu3Nn+o+btt4ss6TN0Bwf6wSYGOw8nXOi1vrBjKkedIvs4JDkdVwm7plOR1vS7
 A/smf0I2e76phZW5aFMCBuHS6t7Le0PFfwojtzgFVh/cj9lNwew+kL1bNXgjlHW2uOZH
 wP7A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OGQBeUWjaN+znm36YqWmJEx4lU5vgP4am+jDJsl40KLIzDO7mhveTrcVbinBxa9usBQY4Ns="
X-RZG-CLASS-ID: mo00
Received: from odroid-VirtualBox by smtp.strato.de (RZmta 47.38.0 DYNA|AUTH)
 with ESMTPSA id L5f488y0RD5moIG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 27 Jan 2022 14:05:48 +0100 (CET)
Date: Thu, 27 Jan 2022 14:05:37 +0100
From: Lutz Koschorreck <theleks@ko-hh.de>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson-sm1-odroid: use correct enable-gpio pin
 for tf-io regulator
Message-ID: <20220127130537.GA187347@odroid-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_050550_874849_CA25A0CF 
X-CRM114-Status: GOOD (  10.27  )
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

only gpio bank
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index 0bd1e98a0eef..ed7cd5f53046 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -48,7 +48,7 @@ tf_io: gpio-regulator-tf_io {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v>;
 
-		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
