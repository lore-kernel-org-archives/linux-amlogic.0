Return-Path: <SRS0=YX+9=M2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EB0C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Aug 2021 09:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B5A860F8F
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Aug 2021 09:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B5A860F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bg20JMT3WFNNLaJB2bKv54cuemyQCfH5hcTBzv51MuQ=; b=A8YbTbYGwc8zAkbN0cKiAA+yUD
	aVTZ0TcupjQQYJjhhn/aHdEsj0my19D5g67fbU1JotmIVFvs01MSLHMCh+a8zWAh4lG+2f98zHejy
	YM//CT2nFlBxQf19IL6A78eqqOdFOHVWkzo7oFLFDzO+ehFCCsU87ehWeLVwvZLrk5KYFhuv/Zhok
	Mfr3/3FFkaavlByqv0CypemyRT4WTQHOL+D3PcR0AsULBq8/wdjUjGjrJHyCGWAvLEMErmgb5ifus
	Yu/kMwP2zCzs1hwj8jd5oOpDmAjj3veuFW+hsj/Uyj5CiK2uHQQ48aZItY69QCgp5pnyLETWCUp+G
	OZBbbXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAr5t-001t4k-Ku; Tue, 03 Aug 2021 09:52:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAr5e-001szy-Ql
 for linux-amlogic@lists.infradead.org; Tue, 03 Aug 2021 09:52:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id b11so19307500wrx.6
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Aug 2021 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4gQJBKlzRibFbCxRwc6BlJ20DMbJbZxNp2rWsHTFOQE=;
 b=TmTzGbUM4+f5CoXJvTPUMFGksh0sJGXwGL0TxO4qQmG61cUKZaXxauAnSCavkGiPPm
 tUdqVOUy1gh5Cbhr1NMiBnbt7rBOBhZfBl5Rnk3aIyYn9AdP1xWXWvjmVpoHlocvf07O
 G8fBHnSSmEdA/dUE3zQTMYInuIpMb8yHT7zh0mT2fQ0CM7T5CSPQPwjGRvtz4eFrG1Xi
 WcYAft/5DKYktu5gDkE9lT2ySiYZ/IBSOfB3vE4RD+pFZ6jklAuN3+QS3a1Qi+/N+mPL
 RJqnntqRiZoJATG1l7ITZntDvlHHWGXK9oRlm93/5GQtl7MwcAKkVy4Rlrtc6cxDN2/P
 A+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4gQJBKlzRibFbCxRwc6BlJ20DMbJbZxNp2rWsHTFOQE=;
 b=hVRGWSUrxk11YveSmzhvFI1R8ZFdc81rwAuCrGo7fHbKpKHbhyHEV0ERcGag+40hgE
 n0I9vhu5FPQ3h7JXSZJbegrsvgNVD7AzAklYcWHRslSoExRL+PMghel+dw/U7Kf5w9N5
 LwIfujV8eKq6YmqAjTZZG9jaFr69ETn/o+GRqT30H1NcK2yHIPiMz2a8wBkanVvYjlkf
 iVAJyouqLynkydOCt8K56yUT1eZJroB6VEdPrEHnkxcRVjPIlowpeLHILK6B87cP3F1h
 EdA2NF30qnMZylGT4cCZSFjjpghiCW0KJndQVnb15TQiiXD9chEty/SZx633iYkEbHVW
 SPhQ==
X-Gm-Message-State: AOAM531tXaX7HCbss5knhA4HIROWS0V+VHAZs6cI15mQP9p9zoaR5dX2
 tXvYkTXeOXLa9NkHOAgCY6uy0g==
X-Google-Smtp-Source: ABdhPJzIYDMM/ya7SaDr9xxc7OGvCr7NyH8MwD14oMOWDzZ0u6nlb2wmEiH5s0LoEr1s7qe7Dkj9mA==
X-Received: by 2002:adf:f351:: with SMTP id e17mr22230429wrp.360.1627984320337; 
 Tue, 03 Aug 2021 02:52:00 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:97a4:5347:fbdb:4cb7?
 ([2001:861:44c0:66c0:97a4:5347:fbdb:4cb7])
 by smtp.gmail.com with ESMTPSA id j14sm14123968wru.58.2021.08.03.02.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 02:51:59 -0700 (PDT)
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
To: Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Lee Jones <lee.jones@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Saravana Kannan <saravanak@google.com>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-2-narmstrong@baylibre.com>
 <7hsga8kb8z.fsf@baylibre.com>
 <CAF2Aj3g6c8FEZb3e1by6sd8LpKLaeN5hsKrrQkZUvh8hosiW9A@mail.gmail.com>
 <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <f5a12599-f7dd-75a4-08ea-867f833e2572@baylibre.com>
Date: Tue, 3 Aug 2021 11:51:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87im0m277h.wl-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_025202_987255_1993886F 
X-CRM114-Status: GOOD (  29.55  )
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

On 03/08/2021 11:44, Marc Zyngier wrote:
> On Mon, 14 Jun 2021 23:30:22 +0100,
> Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Marc Zyngier <maz@kernel.org> writes:
>>
>>> On Fri, 21 May 2021 10:47:48 +0100,
>>> Lee Jones <lee.jones@linaro.org> wrote:
>>>>
>>>> [1  <text/plain; UTF-8 (quoted-printable)>]
>>>> On Tue, 20 Oct 2020 at 19:23, Kevin Hilman <khilman@baylibre.com> wrote:
>>>>
>>>>> Neil Armstrong <narmstrong@baylibre.com> writes:
>>>>>
>>>>>> In order to reduce the kernel Image size on multi-platform distributions,
>>>>>> make it possible to build the Amlogic GPIO IRQ controller as a module
>>>>>> by switching it to a platform driver.
>>>>>>
>>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>>
>>>>> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>>>>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>>>>>
>>>>> Tested as a module on meson-sm1-khadas-vim3l where the wired networking
>>>>> uses GPIO IRQs.
>>>>>
>>>>
>>>> Good morning Neil, Kevin,
>>>>
>>>> What happened to this set in the end?  I still don't see it in Mainline.
>>>
>>> Last time I tried this patch, it broke my test setup in non-obvious
>>> ways. Has someone checked that the issue I reported back then has been
>>> resolved now that fw_devlink is more usable?
>>
>> OK, after much anticipation (and much delay due to me forgetting about
>> this), I just gave this series a spin again on top of v5.13-rc6, and it
>> seems to work fine with `fw_devlink=on`
>>
>> I started with your config[1] and accepting all the defaults of any new
>> configs.  IOW, I ran: yes '' | make oldconfig after copying your config
>> to .config.
>>
>> With that it seems to be working fine for me.
>>
>> Right after boot (and before network probes) I see module loaded, but no
>> users yet in /proc/interrupts:
>>
>> / # uname -a
>> Linux buildroot 5.13.0-rc6-00002-g679c8e852942 #5 SMP PREEMPT Mon Jun 14 15:08:40 PDT 2021 aarch64 GNU/Linux
>> / # lsmod |grep gpio
>> irq_meson_gpio         20480  0
>> leds_gpio              16384  0
>> / # cat /proc/interrupts
>>            CPU0       CPU1       CPU2       CPU3
>>   9:          0          0          0          0     GICv2  25 Level     vgic
>>  11:          0          0          0          0     GICv2  30 Level     kvm guest ptimer
>>  12:          0          0          0          0     GICv2  27 Level     kvm guest vtimer
>>  13:       1416        916        534       1421     GICv2  26 Level     arch_timer
>>  15:          5          0          0          0     GICv2  89 Edge      dw_hdmi_top_irq, ff600000.hdmi-tx
>>  22:         38          0          0          0     GICv2 225 Edge      ttyAML0
>>  23:         20          0          0          0     GICv2 227 Edge      ff805000.i2c
>>  25:          2          0          0          0     GICv2 232 Edge      ff809000.adc
>>  28:        322          0          0          0     GICv2  35 Edge      meson
>>  31:          0          0          0          0     GICv2 222 Edge      ffe05000.sd
>>  32:        787          0          0          0     GICv2 223 Edge      ffe07000.mmc
>>  34:          0          0          0          0     GICv2 194 Level     panfrost-job
>>  35:          0          0          0          0     GICv2 193 Level     panfrost-mmu
>>  36:          3          0          0          0     GICv2 192 Level     panfrost-gpu
>>  39:          0          0          0          0     GICv2  63 Level     ff400000.usb, ff400000.usb
>>  40:         32          0          0          0     GICv2  62 Level     xhci-hcd:usb1
>> IPI0:       425        544        664        925       Rescheduling interrupts
>> IPI1:        86        166        269        136       Function call interrupts
>> IPI2:         0          0          0          0       CPU stop interrupts
>> IPI3:         0          0          0          0       CPU stop (for crash dump) interrupts
>> IPI4:         0          0          0          0       Timer broadcast interrupts
>> IPI5:         0          0          0          0       IRQ work interrupts
>> IPI6:         0          0          0          0       CPU wake-up interrupts
>> Err:          0
>>
>> So then I init the network interface and PHY works, DHCP works etc.
>>
>> / # udhcpc
>> udhcpc: started, v1.31.1
>> [  102.250449] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=37)
>> [  102.256413] meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
>> [  102.269433] meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
>> [  102.271357] meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
>> [  102.278493] meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rgmii link mode
>> udhcpc: sending discover
>> [  104.743301] meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>> [  104.746470] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
>> udhcpc: sending discover
>> udhcpc: sending select for 192.168.0.122
>> udhcpc: lease of 192.168.0.122 obtained, lease time 600
>> deleting routers
>> adding dns 192.168.0.254
>> adding dns 192.168.0.254
>> / # cat /proc/interrupts
>>            CPU0       CPU1       CPU2       CPU3
>>   9:          0          0          0          0     GICv2  25 Level     vgic
>>  11:          0          0          0          0     GICv2  30 Level     kvm guest ptimer
>>  12:          0          0          0          0     GICv2  27 Level     kvm guest vtimer
>>  13:       1575       1018        604       1588     GICv2  26 Level     arch_timer
>>  14:          8          0          0          0     GICv2  40 Level     eth0
>>  15:          5          0          0          0     GICv2  89 Edge      dw_hdmi_top_irq, ff600000.hdmi-tx
>>  22:        132          0          0          0     GICv2 225 Edge      ttyAML0
>>  23:         20          0          0          0     GICv2 227 Edge      ff805000.i2c
>>  25:          2          0          0          0     GICv2 232 Edge      ff809000.adc
>>  28:        322          0          0          0     GICv2  35 Edge      meson
>>  31:          0          0          0          0     GICv2 222 Edge      ffe05000.sd
>>  32:        787          0          0          0     GICv2 223 Edge      ffe07000.mmc
>>  34:          0          0          0          0     GICv2 194 Level     panfrost-job
>>  35:          0          0          0          0     GICv2 193 Level     panfrost-mmu
>>  36:          3          0          0          0     GICv2 192 Level     panfrost-gpu
>>  37:          2          0          0          0  meson-gpio-irqchip  26 Level     0.0:00
>>  39:          0          0          0          0     GICv2  63 Level     ff400000.usb, ff400000.usb
>>  40:         32          0          0          0     GICv2  62 Level     xhci-hcd:usb1
>> IPI0:       476        567        720        956       Rescheduling interrupts
>> IPI1:        93        166        270        137       Function call interrupts
>> IPI2:         0          0          0          0       CPU stop interrupts
>> IPI3:         0          0          0          0       CPU stop (for crash dump) interrupts
>> IPI4:         0          0          0          0       Timer broadcast interrupts
>> IPI5:         0          0          0          0       IRQ work interrupts
>> IPI6:         0          0          0          0       CPU wake-up interrupts
>> Err:          0
>> / #
> 
> This thing keeps failing on my end. It only works if I force the
> irqchip module to be present before the MDIO module is loaded. Here's
> an example:
> 
> root@tiger-roach:~# modprobe mdio_mux_meson_g12a
> [  125.871544] libphy: mdio_mux: probed
> [  125.882575] g12a-mdio_mux ff64c000.mdio-multiplexer: Error: Failed to register MDIO bus for child /soc/bus@ff600000/mdio-multiplexer@4c000/mdio@0
> [  125.892630] libphy: mdio_mux: probed

This error is caused because the PHY in the mdio@0 sub-bus cannot get the IRQ from the irq-meson-gpio driver,
so it may be a dependency issue causing the PHY not probing the irq-meson-gpio node.

IRQ management from PHY drivers is weird, because the core request the IRQ instead of the PHY driver.
maybe causing fw_devlink issue not detecting the link.

Neil

> 
> Trying to bring up the Ethernet interface will fail. Note that there
> was no attempt to load the irqchip driver.
> 
> root@tiger-roach:~# modprobe -r mdio_mux_meson_g12a
> root@tiger-roach:~# modprobe irq-meson-gpio 
> [  144.983344] meson-gpio-intc ffd0f080.interrupt-controller: 100 to 8 gpio interrupt mux initialized
> root@tiger-roach:~# modprobe mdio_mux_meson_g12a
> [  150.376464] libphy: mdio_mux: probed
> [  150.391039] libphy: mdio_mux: probed
> 
> And it now works.
> 
> Is it a MDIO issue? a fw_devlink issue? No idea. But I'd really like
> to see this addressed before taking this patch, as everything works
> just fine as long as the irqchip is built in (which on its own could
> well pure luck).
> 
> Saravana, could you please have a look from a fw_devlink perspective?
> 
> Thanks,
> 
> 	M.
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
