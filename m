Return-Path: <SRS0=o4E8=M4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC3DC4338F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Aug 2021 06:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B4A60560
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Aug 2021 06:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16B4A60560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HDjfPZX7n/sG4tJECdl/y0kvnFgBPnAqR/DYCj1FYZw=; b=FtDG03LnmNngdmdxdJCWIE6EfL
	JKs492zgC91xNH2H3qXVnwc/rhP2BQRNMUSK22xtchuknxX3hFQIJrhI0U9gu0IYjw8aCiys5+q07
	qvS5h/q1ZFBorZf5/X454+6C9QquLZxxbfK8Xo7S7qkN+FEjsIncp0iXK5SbTu+Q0s7ij403SopGo
	xebFnKqnOmkqi6fVDISHkedX+pKinv/F9X3ZB/RVgjongDKLCPT9ggFKMR/lGZ9PrXZTqbg58nEKK
	wqF9KKsBhj0llId9tlZtd5eD47ytI+Rnuom7QAh0w0/gnoPxtXDYGVuWpDYevCwlmd8OTDUYq2DGM
	hmYrQgCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBWuQ-008FdJ-Ej; Thu, 05 Aug 2021 06:31:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBWuM-008FcN-IH
 for linux-amlogic@lists.infradead.org; Thu, 05 Aug 2021 06:31:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso5412849wms.5
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Aug 2021 23:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6jUhEtKSiG7ZerzsDL2H1kO7Htn4R9iX/da1sgzTYhQ=;
 b=sVkwhLsN7lFzvmfY3MOh+638o1qqgcCi1P8Mz/17oEAwPa4qnuPqbFxbhny+sYRAkX
 l3KQp/WFPkwKHO/sgBLIC6Gswo9/GKzE+u9ZBqmOq1NQd+DXQbd4Hd3BCbdCWQ57pTin
 1xA7/h53c5t/wsXjIkv0R62LWSm25FluPws1e4TUmKiDrcJMVdszVF+tf/jqCn61AC8g
 YgeQTyFVuuqAzA+PWHr9sWy3gwEKX9YYxL0mwH1uclnJaRIkiSUchCftUP8ZPwfyOQ4F
 xgNzj2zblW+nFiQcaXNTapERV2fNgVVo45D7LUjFk2u8kg4ENZEEpBNg5RnOBCZG/7t6
 XImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6jUhEtKSiG7ZerzsDL2H1kO7Htn4R9iX/da1sgzTYhQ=;
 b=B3XLVSnDIM4LQuxndWy3gNwyOZ4MkxYVmA3Zs3xfk8Ks8+TjqlwRbuPNJkjAhkKtPF
 wA/AEzW5Ml45i0M6Ko9k9JtYpMjZ7Mm1KwuOJnwPEl3V5t1dWdDs6wnoO6TekuL1nZ5x
 crxfE1O6ctNEcbKxim4TAVL25Oaneg1IYgTkgGdzOXD6ruQf85mcwbUnM9gF0uNePm7S
 FAjLFvOCx20ndJ63Fd5N/ia0PuFBx9W0KNkNOdVLvX0Ujgzr1dnsOvaUQLX9e9ZEv6bw
 EJFlwZCVxqiPZXq3p7Ym+J2jAV5Spq4FfurrNjFW/jhRzQC4MaoLdcZrWD6n20Efim7C
 CzUQ==
X-Gm-Message-State: AOAM533+4QGZ2OQzcM7sK0q3bDHHMqgBf2KOXwRiiyVGoYmp6Gd0JCgA
 Gb3zG4IXJMcKINXGdkuIBjTd+w==
X-Google-Smtp-Source: ABdhPJwhzVUVFwT3U+v9V/pf/bnOjk+HxXuJhP6KwE+dmCvAuziAmYWEXS/ynfioDbEwv2YrnygzVg==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr3169713wmb.47.1628145068651; 
 Wed, 04 Aug 2021 23:31:08 -0700 (PDT)
Received: from [10.1.3.29] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j14sm4735302wrr.16.2021.08.04.23.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 23:31:08 -0700 (PDT)
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
To: Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Kevin Hilman <khilman@baylibre.com>, Lee Jones <lee.jones@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-2-narmstrong@baylibre.com>
 <7hsga8kb8z.fsf@baylibre.com>
 <CAF2Aj3g6c8FEZb3e1by6sd8LpKLaeN5hsKrrQkZUvh8hosiW9A@mail.gmail.com>
 <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org>
 <CAGETcx9OukoWM_qprMse9aXdzCE=GFUgFEkfhhNjg44YYsOQLw@mail.gmail.com>
 <87sfzpwq4f.wl-maz@kernel.org>
 <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
 <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4e98d876-330f-21a4-846e-94e1f01f0eed@baylibre.com>
Date: Thu, 5 Aug 2021 08:31:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_233110_736621_CB8E38CD 
X-CRM114-Status: GOOD (  35.56  )
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

Hi Saravana,

On 04/08/2021 23:47, Saravana Kannan wrote:
> On Wed, Aug 4, 2021 at 11:20 AM Saravana Kannan <saravanak@google.com> wrote:
>>
>> On Wed, Aug 4, 2021 at 1:50 AM Marc Zyngier <maz@kernel.org> wrote:
>>>
>>> On Wed, 04 Aug 2021 02:36:45 +0100,
>>> Saravana Kannan <saravanak@google.com> wrote:
>>>
>>> Hi Saravana,
>>>
>>> Thanks for looking into this.
>>
>> You are welcome. I just don't want people to think fw_devlink is broken :)
>>
>>>
>>> [...]
>>>
>>>>> Saravana, could you please have a look from a fw_devlink perspective?
>>>>
>>>> Sigh... I spent several hours looking at this and wrote up an analysis
>>>> and then realized I might be looking at the wrong DT files.
>>>>
>>>> Marc, can you point me to the board file in upstream that corresponds
>>>> to the platform in which you see this issue? I'm not asking for [1],
>>>> but the actual final .dts (not .dtsi) file that corresponds to the
>>>> platform/board/system.
>>>
>>> The platform I can reproduce this on is described in
>>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts. It is an
>>> intricate maze of inclusion, node merge and other DT subtleties. I
>>> suggest you look at the decompiled version to get a view of the
>>> result.
>>
>> Thanks. After decompiling it, it looks something like (stripped a
>> bunch of reg and address properties and added the labels back):
>>
>> eth_phy: mdio-multiplexer@4c000 {
>>         compatible = "amlogic,g12a-mdio-mux";
>>         clocks = <0x02 0x13 0x1e 0x02 0xb1>;
>>         clock-names = "pclk\0clkin0\0clkin1";
>>         mdio-parent-bus = <0x22>;
>>
>>         ext_mdio: mdio@0 {
>>                 reg = <0x00>;
>>
>>                 ethernet-phy@0 {
>>                         max-speed = <0x3e8>;
>>                         interrupt-parent = <0x23>;
>>                         interrupts = <0x1a 0x08>;
>>                         phandle = <0x16>;
>>                 };
>>         };
>>
>>         int_mdio: mdio@1 {
>>                 ...
>>         }
>> }
>>
>> And phandle 0x23 refers to the gpio_intc interrupt controller with the
>> modular driver.
>>
>>>> Based on your error messages, it's failing for mdio@0 which
>>>> corresponds to ext_mdio. But none of the board dts files in upstream
>>>> have a compatible property for "ext_mdio". Which means fw_devlink
>>>> _should_ propagate the gpio_intc IRQ dependency all the way up to
>>>> eth_phy.
>>>>
>>>> Also, in the failing case, can you run:
>>>> ls -ld supplier:*
>>>>
>>>> in the /sys/devices/....<something>/ folder that corresponds to the
>>>> "eth_phy: mdio-multiplexer@4c000" DT node and tell me what it shows?
>>>
>>> Here you go:
>>>
>>> root@tiger-roach:~# find /sys/devices/ -name 'supplier*'|grep -i mdio | xargs ls -ld
>>> lrwxrwxrwx 1 root root 0 Aug  4 09:47 /sys/devices/platform/soc/ff600000.bus/ff64c000.mdio-multiplexer/supplier:platform:ff63c000.system-controller:clock-controller -> ../../../../virtual/devlink/platform:ff63c000.system-controller:clock-controller--platform:ff64c000.mdio-multiplexer
>>
>> As we discussed over chat, this was taken after the mdio-multiplexer
>> driver "successfully" probes this device. This will cause
>> SYNC_STATE_ONLY device links created by fw_devlink to be deleted
>> (because they are useless after a device probes). So, this doesn't
>> show the info I was hoping to demonstrate.
>>
>> In any case, one can see that fw_devlink properly created the device
>> link for the clocks dependency. So fw_devlink is parsing this node
>> properly. But it doesn't create a similar probe order enforcing device
>> link between the mdio-multiplexer and the gpio_intc because the
>> dependency is only present in a grand child DT node (ethernet-phy@0
>> under ext_mdio). So fw_devlink is working as intended.
>>
>> I spent several hours squinting at the code/DT yesterday. Here's what
>> is going on and causing the problem:
>>
>> The failing driver in this case is
>> drivers/net/mdio/mdio-mux-meson-g12a.c. And the only DT node it's
>> handling is what I pasted above in this email. In the failure case,
>> the call flow is something like this:
>>
>> g12a_mdio_mux_probe()
>> -> mdio_mux_init()
>> -> of_mdiobus_register(ext_mdio DT node)
>> -> of_mdiobus_register_phy(ext_mdio DT node)
>> -> several calls deep fwnode_mdiobus_phy_device_register(ethernet_phy DT node)
>> -> Tried to get the IRQ listed in ethernet_phy and fails with
>> -EPROBE_DEFER because the IRQ driver isn't loaded yet.
>>
>> The error is propagated correctly all the way up to of_mdiobus_register(), but
>> mdio_mux_init() ignores the -EPROBE_DEFER from of_mdiobus_register() and just
>> continues on with the rest of the stuff and returns success as long as
>> one of the child nodes (in this case int_mdio) succeeds.
>>
>> Since the probe returns 0 without really succeeding, networking stuff
>> just fails badly after this. So, IMO, the real problem is with
>> mdio_mux_init() not propagating up the -EPROBE_DEFER. I gave Marc a
>> quick hack (pasted at the end of this email) to test my theory and he
>> confirmed that it fixes the issue (a few deferred probes later, things
>> work properly).
>>
>> Andrew, I don't see any good reason for mdio_mux_init() not
>> propagating the errors up correctly (at least for EPROBE_DEFER). I'll
>> send a patch to fix this. Please let me know if there's a reason it
>> has to stay as-is.
> 
> I sent out the proper fix as a series:
> https://lore.kernel.org/lkml/20210804214333.927985-1-saravanak@google.com/T/#t

Thanks a lot for digging here and providing the appropriate fixes !

Neil

> 
> Marc, can you give it a shot please?
> 
> -Saravana
> 
>>
>> -Saravana
>>
>> index 110e4ee85785..d973a267151f 100644
>> --- a/drivers/net/mdio/mdio-mux.c
>> +++ b/drivers/net/mdio/mdio-mux.c
>> @@ -170,6 +170,9 @@ int mdio_mux_init(struct device *dev,
>>                                 child_bus_node);
>>                         mdiobus_free(cb->mii_bus);
>>                         devm_kfree(dev, cb);
>> +                       /* Not a final fix. I think it can cause UAF issues. */
>> +                       mdio_mux_uninit(pb);
>> +                       return r;
>>                 } else {
>>                         cb->next = pb->children;
>>                         pb->children = cb;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
