Return-Path: <SRS0=RlPG=M3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E623DC4338F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 21:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A4461040
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 21:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6A4461040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V447By3SnGw2gApfFnj6ql+3xG7l0ryoQObdhhr3WAk=; b=wLIBUn6sXDIc9b
	NeH9/on0ftXb3nzu2LbJnAsaNccCdADwgs+p7F/1CylqEJS4Oua9ZxuwW1AUhVPXuGonT0h3rd+1x
	gSC26imxuc6eG63IiPqMU51kyuB+bMjHioOtCQnJh5MPORqKAD2RnlP4nXDYAUvndqxqsYZZKZ5XU
	Xs+EhMN4EYodKoiaUGdwuVntx2MhdoetYvidxU6AwwCrPcMg7iJpSvwnGEWB55Vcq5vJKULaHtWOJ
	ofxB1Qt9ojIs3Kkt4RbWoqKTSeSnMQLmnZB9MjSTO5vIEr6c0sqoFyNbadsOmNobv58uSGZTPi6zX
	6wi+C9PChmjiqNJZ+McQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBOk9-007V6f-2t; Wed, 04 Aug 2021 21:48:05 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBOk5-007V62-Kn
 for linux-amlogic@lists.infradead.org; Wed, 04 Aug 2021 21:48:03 +0000
Received: by mail-yb1-xb36.google.com with SMTP id x192so6021424ybe.0
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Aug 2021 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KRoLUTCoSR0bH9PoFJhlJID9z3ogqrNBELOHgMdcgZI=;
 b=Tm8u/fBt2jfvpCHpu9LdTriauh41G7MbJ/k7/1kIxQJdpa0yL5ppkHMPaney174HJd
 F6BZJC1Vsr/w7a7elTuygtEl5Za6qZXAeUwWCleO++VdpvXuAyb7fABAnQ50RViJA+Rk
 dcae/D+aSZvnrw/jEB/+s+7RcLa0fEu8ezV0O+bFyQCJkEDQX/RzBXux6m6GBamCdgHw
 cQRCd2tdHpEiCCIsOvV7DoZpQvCzcwI9UiQkNOuioJR+ekL4lwsLvmJUUNieqvjYv9Iv
 EifQp/eG9NxFAeUFAlt+Jp4ORTFA89cWUoh4p2ndaj1SuptzLudhkG77S/1fT4e3tM2q
 XDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KRoLUTCoSR0bH9PoFJhlJID9z3ogqrNBELOHgMdcgZI=;
 b=oPD8a2hGbmM4nzXUQ/ZQc7EuVkogAr4arFTAH+brIq5eYXes5o7ybZhi6ABKTFvy0t
 SLYl4EZVci4J+5fy8XlgHPPdKbxYLcuscsu+4kPGZMu4KF8zNKY+p53FI2J+qroYqk7D
 AHdxIyoJGK5WckQW3qLBpGdiBX1Ueli7K7bZvRMKexIdoBLRFmEdGYh6n0OvgIGQxDvV
 3ZRmeeyvZMOK4JZfUxGd9OybBZpigi7mMilvk1yvOv1HdJZiPA5ptCrgXblwUzn+xd3y
 bYNQc4B8zBuKbOJktt2uDTPhLPZ1HtF5d+5FGEzbZ+8M6CK+wYibAZsLOYcF4KaLRJlb
 G1kg==
X-Gm-Message-State: AOAM531Y8lMCcWmiTI5I1LyQ63hNi8Zb2vkh1+LdBjLplG5diZg1mphg
 HjLdE8b7AhP7i4ZnMoB+Nzf+pV1auZTM+GZ90zzyEg==
X-Google-Smtp-Source: ABdhPJyISe+k/AN2pZLmSpbnlxpKTFVJtkTu7zHA3NBj4rQd64Knpc3lIPzo5Kq7m4F3BIdTEkaeICAMhnx91j5z/EU=
X-Received: by 2002:a25:81ce:: with SMTP id n14mr2063907ybm.32.1628113680544; 
 Wed, 04 Aug 2021 14:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-2-narmstrong@baylibre.com>
 <7hsga8kb8z.fsf@baylibre.com>
 <CAF2Aj3g6c8FEZb3e1by6sd8LpKLaeN5hsKrrQkZUvh8hosiW9A@mail.gmail.com>
 <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org>
 <CAGETcx9OukoWM_qprMse9aXdzCE=GFUgFEkfhhNjg44YYsOQLw@mail.gmail.com>
 <87sfzpwq4f.wl-maz@kernel.org>
 <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
In-Reply-To: <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 4 Aug 2021 14:47:24 -0700
Message-ID: <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
To: Marc Zyngier <maz@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Kevin Hilman <khilman@baylibre.com>, Lee Jones <lee.jones@linaro.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-amlogic@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_144801_748564_B42708D5 
X-CRM114-Status: GOOD (  48.00  )
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

On Wed, Aug 4, 2021 at 11:20 AM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Aug 4, 2021 at 1:50 AM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Wed, 04 Aug 2021 02:36:45 +0100,
> > Saravana Kannan <saravanak@google.com> wrote:
> >
> > Hi Saravana,
> >
> > Thanks for looking into this.
>
> You are welcome. I just don't want people to think fw_devlink is broken :)
>
> >
> > [...]
> >
> > > > Saravana, could you please have a look from a fw_devlink perspective?
> > >
> > > Sigh... I spent several hours looking at this and wrote up an analysis
> > > and then realized I might be looking at the wrong DT files.
> > >
> > > Marc, can you point me to the board file in upstream that corresponds
> > > to the platform in which you see this issue? I'm not asking for [1],
> > > but the actual final .dts (not .dtsi) file that corresponds to the
> > > platform/board/system.
> >
> > The platform I can reproduce this on is described in
> > arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts. It is an
> > intricate maze of inclusion, node merge and other DT subtleties. I
> > suggest you look at the decompiled version to get a view of the
> > result.
>
> Thanks. After decompiling it, it looks something like (stripped a
> bunch of reg and address properties and added the labels back):
>
> eth_phy: mdio-multiplexer@4c000 {
>         compatible = "amlogic,g12a-mdio-mux";
>         clocks = <0x02 0x13 0x1e 0x02 0xb1>;
>         clock-names = "pclk\0clkin0\0clkin1";
>         mdio-parent-bus = <0x22>;
>
>         ext_mdio: mdio@0 {
>                 reg = <0x00>;
>
>                 ethernet-phy@0 {
>                         max-speed = <0x3e8>;
>                         interrupt-parent = <0x23>;
>                         interrupts = <0x1a 0x08>;
>                         phandle = <0x16>;
>                 };
>         };
>
>         int_mdio: mdio@1 {
>                 ...
>         }
> }
>
> And phandle 0x23 refers to the gpio_intc interrupt controller with the
> modular driver.
>
> > > Based on your error messages, it's failing for mdio@0 which
> > > corresponds to ext_mdio. But none of the board dts files in upstream
> > > have a compatible property for "ext_mdio". Which means fw_devlink
> > > _should_ propagate the gpio_intc IRQ dependency all the way up to
> > > eth_phy.
> > >
> > > Also, in the failing case, can you run:
> > > ls -ld supplier:*
> > >
> > > in the /sys/devices/....<something>/ folder that corresponds to the
> > > "eth_phy: mdio-multiplexer@4c000" DT node and tell me what it shows?
> >
> > Here you go:
> >
> > root@tiger-roach:~# find /sys/devices/ -name 'supplier*'|grep -i mdio | xargs ls -ld
> > lrwxrwxrwx 1 root root 0 Aug  4 09:47 /sys/devices/platform/soc/ff600000.bus/ff64c000.mdio-multiplexer/supplier:platform:ff63c000.system-controller:clock-controller -> ../../../../virtual/devlink/platform:ff63c000.system-controller:clock-controller--platform:ff64c000.mdio-multiplexer
>
> As we discussed over chat, this was taken after the mdio-multiplexer
> driver "successfully" probes this device. This will cause
> SYNC_STATE_ONLY device links created by fw_devlink to be deleted
> (because they are useless after a device probes). So, this doesn't
> show the info I was hoping to demonstrate.
>
> In any case, one can see that fw_devlink properly created the device
> link for the clocks dependency. So fw_devlink is parsing this node
> properly. But it doesn't create a similar probe order enforcing device
> link between the mdio-multiplexer and the gpio_intc because the
> dependency is only present in a grand child DT node (ethernet-phy@0
> under ext_mdio). So fw_devlink is working as intended.
>
> I spent several hours squinting at the code/DT yesterday. Here's what
> is going on and causing the problem:
>
> The failing driver in this case is
> drivers/net/mdio/mdio-mux-meson-g12a.c. And the only DT node it's
> handling is what I pasted above in this email. In the failure case,
> the call flow is something like this:
>
> g12a_mdio_mux_probe()
> -> mdio_mux_init()
> -> of_mdiobus_register(ext_mdio DT node)
> -> of_mdiobus_register_phy(ext_mdio DT node)
> -> several calls deep fwnode_mdiobus_phy_device_register(ethernet_phy DT node)
> -> Tried to get the IRQ listed in ethernet_phy and fails with
> -EPROBE_DEFER because the IRQ driver isn't loaded yet.
>
> The error is propagated correctly all the way up to of_mdiobus_register(), but
> mdio_mux_init() ignores the -EPROBE_DEFER from of_mdiobus_register() and just
> continues on with the rest of the stuff and returns success as long as
> one of the child nodes (in this case int_mdio) succeeds.
>
> Since the probe returns 0 without really succeeding, networking stuff
> just fails badly after this. So, IMO, the real problem is with
> mdio_mux_init() not propagating up the -EPROBE_DEFER. I gave Marc a
> quick hack (pasted at the end of this email) to test my theory and he
> confirmed that it fixes the issue (a few deferred probes later, things
> work properly).
>
> Andrew, I don't see any good reason for mdio_mux_init() not
> propagating the errors up correctly (at least for EPROBE_DEFER). I'll
> send a patch to fix this. Please let me know if there's a reason it
> has to stay as-is.

I sent out the proper fix as a series:
https://lore.kernel.org/lkml/20210804214333.927985-1-saravanak@google.com/T/#t

Marc, can you give it a shot please?

-Saravana

>
> -Saravana
>
> index 110e4ee85785..d973a267151f 100644
> --- a/drivers/net/mdio/mdio-mux.c
> +++ b/drivers/net/mdio/mdio-mux.c
> @@ -170,6 +170,9 @@ int mdio_mux_init(struct device *dev,
>                                 child_bus_node);
>                         mdiobus_free(cb->mii_bus);
>                         devm_kfree(dev, cb);
> +                       /* Not a final fix. I think it can cause UAF issues. */
> +                       mdio_mux_uninit(pb);
> +                       return r;
>                 } else {
>                         cb->next = pb->children;
>                         pb->children = cb;

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
