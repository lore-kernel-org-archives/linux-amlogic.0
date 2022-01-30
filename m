Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E9FC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Jan 2022 00:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYEGMESPs5egPTtusRAX70Ckw8nWzc3yLRjLQ6RqCRU=; b=MaQUQjcaRD0Q6r
	7fmYm8cy6IN5ldIUaw61vlZzwotRpI/b1oTbyutpvkwC2pnN8oPiTviOirTws0fxYBATxF75/esGd
	fKJoHol8YdHhbns8qLLwvm3RuxKptQD1J9Pg/cWaVGBx6Q6p+xQgsrKadTo4N23NrEpbK+XKd09cC
	2qY8jrMpuqrwkdb1vR1nu+7tVQ3zM2mLE6bNu4zuHeszaQr3lNQrFOER2CW0R0GfcmuQjDp09EWhg
	90J7RXKuWquYJXN1OyCZvhGyfQoQOqLpYj0Da9YbxL54n56v2XsBuAypafJwkzX21y9JuNDc0ixDi
	rhO1a3ZX1trhQXURnliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDxyL-005dRw-Jm; Sun, 30 Jan 2022 00:21:37 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDxy7-005dQ0-IP; Sun, 30 Jan 2022 00:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643502079;
 s=strato-dkim-0002; d=ko-hh.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=HpQus4csLQkn/DjYJTvo0b+BXqtq4ZkCu0u8D/fNCkc=;
 b=OIvSkHtKhyXY3lMvLo2n6Mks18DwacK8ZiO1sbWPcfZCD4Y85tRCEQNX7Uu3pYbgLt
 LNu06Q3L6QA4GBEsNWgYc5hx+92KdimgLniChG3b8e4o4qWa/ZgFbx3WCjxfDuJ9wIG9
 ofOs4y2RayTHX3MZJ1XCFokk1mhAe8iViSbkbvx7DY0e5fqWiPlCtSMqpIc8qEL2Rv3E
 SkkkFXx+1jQzGi/eenN+TZxr1brwLwOV8iMVjDmMrOgDDhaxb+7r/NXUg3O+FwuHIsWb
 7r8EiBMFdToJ5ZcGdbB/NOsOfgh2dTrZLw3LWEn2xHb7zeYlozGUtu3g6wMzTjHSqhhD
 I0Cw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OGQBeUWjaN+znm36YqWmJEx4lU5vgP4am+jDJsl40KLIzDO7mhvQTIqgxZwGBWrYBTQ="
X-RZG-CLASS-ID: mo00
Received: from odroid-VirtualBox by smtp.strato.de (RZmta 47.38.0 DYNA|AUTH)
 with ESMTPSA id L5f488y0U0LI2BD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 30 Jan 2022 01:21:18 +0100 (CET)
Date: Sun, 30 Jan 2022 01:21:08 +0100
From: Lutz Koschorreck <theleks@ko-hh.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-sm1-odroid: use correct enable-gpio
 pin for tf-io regulator
Message-ID: <20220130002108.GA408329@odroid-VirtualBox>
References: <20220126234325.GA7363@odroid-VirtualBox>
 <651adde5-4887-4701-5183-6a35a443574c@baylibre.com>
 <20220127123814.GA152653@odroid-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127123814.GA152653@odroid-VirtualBox>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_162123_847700_A6705048 
X-CRM114-Status: GOOD (  31.22  )
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

On Thu, Jan 27, 2022 at 01:38:14PM +0100, Lutz Koschorreck wrote:
> On Thu, Jan 27, 2022 at 11:15:12AM +0100, Neil Armstrong wrote:
> > Hi,
> > 
> > On 27/01/2022 00:43, Lutz Koschorreck wrote:
> > > The interrupt pin of the external ethernet phy is used, instead of the
> > > enable-gpio pin of the tf-io regulator. The GPIOE_2 pin is located in
> > > the gpio_ao bank.
> > > Using open drain prevents reboot issues.
> > > 
> > > This causes phy interrupt problems at system startup.
> > > [   76.645190] irq 36: nobody cared (try booting with the "irqpoll" option)
> > > [   76.649617] CPU: 0 PID: 1416 Comm: irq/36-0.0:00 Not tainted 5.16.0 #2
> > > [   76.649629] Hardware name: Hardkernel ODROID-HC4 (DT)
> > > [   76.649635] Call trace:
> > > [   76.649638]  dump_backtrace+0x0/0x1c8
> > > [   76.649658]  show_stack+0x14/0x60
> > > [   76.649667]  dump_stack_lvl+0x64/0x7c
> > > [   76.649676]  dump_stack+0x14/0x2c
> > > [   76.649683]  __report_bad_irq+0x38/0xe8
> > > [   76.649695]  note_interrupt+0x220/0x3a0
> > > [   76.649704]  handle_irq_event_percpu+0x58/0x88
> > > [   76.649713]  handle_irq_event+0x44/0xd8
> > > [   76.649721]  handle_fasteoi_irq+0xa8/0x130
> > > [   76.649730]  generic_handle_domain_irq+0x38/0x58
> > > [   76.649738]  gic_handle_irq+0x9c/0xb8
> > > [   76.649747]  call_on_irq_stack+0x28/0x38
> > > [   76.649755]  do_interrupt_handler+0x7c/0x80
> > > [   76.649763]  el1_interrupt+0x34/0x80
> > > [   76.649772]  el1h_64_irq_handler+0x14/0x20
> > > [   76.649781]  el1h_64_irq+0x74/0x78
> > > [   76.649788]  irq_finalize_oneshot.part.56+0x68/0xf8
> > > [   76.649796]  irq_thread_fn+0x5c/0x98
> > > [   76.649804]  irq_thread+0x13c/0x260
> > > [   76.649812]  kthread+0x144/0x178
> > > [   76.649822]  ret_from_fork+0x10/0x20
> > > [   76.649830] handlers:
> > > [   76.653170] [<0000000025a6cd31>] irq_default_primary_handler threaded [<0000000093580eb7>] phy_interrupt
> > > [   76.661256] Disabling IRQ #36
> > > 
> > > Fixes: 1f80a5cf74a6 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")
> > > 
> > > Signed-off-by: Lutz Koschorreck <theleks@ko-hh.de>
> > > ---
> > >  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> > > index 0bd1e98a0eef..ddb1b345397f 100644
> > > --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> > > +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> > > @@ -48,7 +48,7 @@ tf_io: gpio-regulator-tf_io {
> > >  		regulator-max-microvolt = <3300000>;
> > >  		vin-supply = <&vcc_5v>;
> > >  
> > > -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> > > +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
> > 
> > Wow, indeed it's not the right GPIO chip... my bad.
> > 
> > >  		enable-active-high;
> > >  		regulator-always-on;
> > >  
> > 
> > Concerning the GPIO_OPEN_DRAIN, it's right since the line has a pull-up, does it really fix reboot issues ?
> There is a 10k pull up on the pin of C4 and HC4. Therefore it is fine to
> set to GPIO_OPEN_DRAIN. If this pin is left ACTIVE_HIGH and I call
> reboot, the bootloader is does not came up, it is an boot loop. Tobetter
> fixed that with a reset device driver, but I think using GPIO_OPEN_DRAIN
> is the right solution.
Sorry, this comment is not entirely correct. The GPIO_OPEN_DRAIN is
needed to fix a boot loop at bl2 level. Also it look like that the reset
driver fixes the boot loop at BL3X boot level and is needed for proper
operation.
> > 
> > Anyway, can you split the changes ? First for gpio_ao, second for GPIO_OPEN_DRAIN ?
> Yes of cause. I will generate a new patch set.
> > 
> > Neil
> > 
> > 
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
