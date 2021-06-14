Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D570AC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 22:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404296124B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 22:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 404296124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/koaMelZ/5GSys9mxwiytBVTWQSeSGkjqxL2iNOge4=; b=hZ7j//HJEUP37n
	e2rFg0SFDkcl1PutedwV3MdCjEcxy7moVu0z4MLc5trLWtmlMsVVHbKpmHTr65JZuDERkVhZkE4xM
	jRCrjdFSrJaqALCKJUt5vLMZ3cutupExexH/2dhenRPAwtQEXNKf+3PN8uy8U0Z+9xdjLTIIdqWom
	SYoq6KwH8WkYqqbFsmRd9t4glOkiMwQj4RpCCV0pV9IXt3S5UdefKEg3c5UA0GDKwj8/KbVuWRsnK
	fpXwmQtNzIjCW5ZLDWStmdoyrHPRkvBNu+VVQigdQGiD32DCr3uiODCjG9s+c9ISyOwnnF31vP0T3
	dPP7uncGHWGKJHhY1M2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsv6I-00GPFX-8c; Mon, 14 Jun 2021 22:30:34 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsv6D-00GPEN-L0
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 22:30:32 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so978719pjq.5
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 15:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=70OFgrz/CgZYU63H5upJDLWkyC7MeK33Rz+09jwywK4=;
 b=q0DGUYEBsR1Wd7MyTCOUMhEO/pYWZKf8S3lBCgsCHWEOJGuiiV0CAYBRXS/F9X7T3/
 qVYgl/rmYI7oYLzyAV8o/CtU/Oqt4mC/Vzme5RWIJQDWayLlm/atSkprAoZrLOLoHcFH
 LtB2fCu7O6l5kmWA/HOEfiWto8OvHbopWHsnbwV2TX/0XQzY8/qDx/+WY/bKdLHy3unR
 yaGaTnfQYGvcFWZsQZTrHfe55DWm9KKPTnFZ5JduTEfbq25t1hZbo2+8i0YORpYi9Rbp
 rTmVuXj2MyyoNoCVXaecdUmzMvqO+qNcAjtYD9ftQaHQHgv6BU3xPXpAwzLJydUBmqJm
 tcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=70OFgrz/CgZYU63H5upJDLWkyC7MeK33Rz+09jwywK4=;
 b=hNf+4p6SkE3UWloiLQ+UalowIu0vmG45jG35Y4ue6w+3/EB848aOymNT0uuLeNPF/c
 t6IA6uRYpZVonOarTue7C/F5DpsM+2fmBbhlzXs762BN5yhUhwevIlmPvfqTscEUO28b
 p49rZ6ca0cfpgXImoCf/62QvKsam/45grSGigEPS0Ev706Y1/gMZXgQTw0tjsgAKzmz6
 jVi1RFMYYjD4JzTUYF/wNfGJtj/j9Kf66nGPaqq1/uTlGcO+IeaOfBva9hYmYe7rGYpR
 oeB0eZkgshXIi/WRlBPRKlYwOkP60np2CLebosGZlHp5FVW04QrryQzDxsPaLD35DPc9
 LMzg==
X-Gm-Message-State: AOAM532I3MfGBhwB3EKRJoayMRKast+2ItemMO1NZWWh56AAYttBq/m2
 Pe3dsy/f9b68kyH05c+WuJvTRA==
X-Google-Smtp-Source: ABdhPJwGGoYzguT8I9l/jIiDPz+FK0UawrWbYcIw8QuXkcT/GKcbrs0gkwY4fqmlIzmr5c7vITO2Zw==
X-Received: by 2002:a17:90b:1810:: with SMTP id
 lw16mr20990555pjb.203.1623709823827; 
 Mon, 14 Jun 2021 15:30:23 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:3130:f4da:b90:8ba2])
 by smtp.gmail.com with ESMTPSA id 25sm491336pgp.51.2021.06.14.15.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 15:30:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Marc Zyngier <maz@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build
 as a module
In-Reply-To: <87r1hwwier.wl-maz@kernel.org>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-2-narmstrong@baylibre.com>
 <7hsga8kb8z.fsf@baylibre.com>
 <CAF2Aj3g6c8FEZb3e1by6sd8LpKLaeN5hsKrrQkZUvh8hosiW9A@mail.gmail.com>
 <87r1hwwier.wl-maz@kernel.org>
Date: Mon, 14 Jun 2021 15:30:22 -0700
Message-ID: <7h7diwgjup.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_153030_561664_1A320404 
X-CRM114-Status: GOOD (  19.77  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Fri, 21 May 2021 10:47:48 +0100,
> Lee Jones <lee.jones@linaro.org> wrote:
>> 
>> [1  <text/plain; UTF-8 (quoted-printable)>]
>> On Tue, 20 Oct 2020 at 19:23, Kevin Hilman <khilman@baylibre.com> wrote:
>> 
>> > Neil Armstrong <narmstrong@baylibre.com> writes:
>> >
>> > > In order to reduce the kernel Image size on multi-platform distributions,
>> > > make it possible to build the Amlogic GPIO IRQ controller as a module
>> > > by switching it to a platform driver.
>> > >
>> > > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> >
>> > Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>> > Tested-by: Kevin Hilman <khilman@baylibre.com>
>> >
>> > Tested as a module on meson-sm1-khadas-vim3l where the wired networking
>> > uses GPIO IRQs.
>> >
>> 
>> Good morning Neil, Kevin,
>> 
>> What happened to this set in the end?  I still don't see it in Mainline.
>
> Last time I tried this patch, it broke my test setup in non-obvious
> ways. Has someone checked that the issue I reported back then has been
> resolved now that fw_devlink is more usable?

OK, after much anticipation (and much delay due to me forgetting about
this), I just gave this series a spin again on top of v5.13-rc6, and it
seems to work fine with `fw_devlink=on`

I started with your config[1] and accepting all the defaults of any new
configs.  IOW, I ran: yes '' | make oldconfig after copying your config
to .config.

With that it seems to be working fine for me.

Right after boot (and before network probes) I see module loaded, but no
users yet in /proc/interrupts:

/ # uname -a
Linux buildroot 5.13.0-rc6-00002-g679c8e852942 #5 SMP PREEMPT Mon Jun 14 15:08:40 PDT 2021 aarch64 GNU/Linux
/ # lsmod |grep gpio
irq_meson_gpio         20480  0
leds_gpio              16384  0
/ # cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
  9:          0          0          0          0     GICv2  25 Level     vgic
 11:          0          0          0          0     GICv2  30 Level     kvm guest ptimer
 12:          0          0          0          0     GICv2  27 Level     kvm guest vtimer
 13:       1416        916        534       1421     GICv2  26 Level     arch_timer
 15:          5          0          0          0     GICv2  89 Edge      dw_hdmi_top_irq, ff600000.hdmi-tx
 22:         38          0          0          0     GICv2 225 Edge      ttyAML0
 23:         20          0          0          0     GICv2 227 Edge      ff805000.i2c
 25:          2          0          0          0     GICv2 232 Edge      ff809000.adc
 28:        322          0          0          0     GICv2  35 Edge      meson
 31:          0          0          0          0     GICv2 222 Edge      ffe05000.sd
 32:        787          0          0          0     GICv2 223 Edge      ffe07000.mmc
 34:          0          0          0          0     GICv2 194 Level     panfrost-job
 35:          0          0          0          0     GICv2 193 Level     panfrost-mmu
 36:          3          0          0          0     GICv2 192 Level     panfrost-gpu
 39:          0          0          0          0     GICv2  63 Level     ff400000.usb, ff400000.usb
 40:         32          0          0          0     GICv2  62 Level     xhci-hcd:usb1
IPI0:       425        544        664        925       Rescheduling interrupts
IPI1:        86        166        269        136       Function call interrupts
IPI2:         0          0          0          0       CPU stop interrupts
IPI3:         0          0          0          0       CPU stop (for crash dump) interrupts
IPI4:         0          0          0          0       Timer broadcast interrupts
IPI5:         0          0          0          0       IRQ work interrupts
IPI6:         0          0          0          0       CPU wake-up interrupts
Err:          0

So then I init the network interface and PHY works, DHCP works etc.

/ # udhcpc
udhcpc: started, v1.31.1
[  102.250449] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=37)
[  102.256413] meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[  102.269433] meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
[  102.271357] meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
[  102.278493] meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rgmii link mode
udhcpc: sending discover
[  104.743301] meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
[  104.746470] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
udhcpc: sending discover
udhcpc: sending select for 192.168.0.122
udhcpc: lease of 192.168.0.122 obtained, lease time 600
deleting routers
adding dns 192.168.0.254
adding dns 192.168.0.254
/ # cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
  9:          0          0          0          0     GICv2  25 Level     vgic
 11:          0          0          0          0     GICv2  30 Level     kvm guest ptimer
 12:          0          0          0          0     GICv2  27 Level     kvm guest vtimer
 13:       1575       1018        604       1588     GICv2  26 Level     arch_timer
 14:          8          0          0          0     GICv2  40 Level     eth0
 15:          5          0          0          0     GICv2  89 Edge      dw_hdmi_top_irq, ff600000.hdmi-tx
 22:        132          0          0          0     GICv2 225 Edge      ttyAML0
 23:         20          0          0          0     GICv2 227 Edge      ff805000.i2c
 25:          2          0          0          0     GICv2 232 Edge      ff809000.adc
 28:        322          0          0          0     GICv2  35 Edge      meson
 31:          0          0          0          0     GICv2 222 Edge      ffe05000.sd
 32:        787          0          0          0     GICv2 223 Edge      ffe07000.mmc
 34:          0          0          0          0     GICv2 194 Level     panfrost-job
 35:          0          0          0          0     GICv2 193 Level     panfrost-mmu
 36:          3          0          0          0     GICv2 192 Level     panfrost-gpu
 37:          2          0          0          0  meson-gpio-irqchip  26 Level     0.0:00
 39:          0          0          0          0     GICv2  63 Level     ff400000.usb, ff400000.usb
 40:         32          0          0          0     GICv2  62 Level     xhci-hcd:usb1
IPI0:       476        567        720        956       Rescheduling interrupts
IPI1:        93        166        270        137       Function call interrupts
IPI2:         0          0          0          0       CPU stop interrupts
IPI3:         0          0          0          0       CPU stop (for crash dump) interrupts
IPI4:         0          0          0          0       Timer broadcast interrupts
IPI5:         0          0          0          0       IRQ work interrupts
IPI6:         0          0          0          0       CPU wake-up interrupts
Err:          0
/ #


Kevin


[1] http://www.loen.fr/tmp/Config.full-arm64




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
