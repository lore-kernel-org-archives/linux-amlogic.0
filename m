Return-Path: <SRS0=hlvN=RB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766B3C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Feb 2019 12:14:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4504F2087C
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Feb 2019 12:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TGZFIx8i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO2BCr9O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4504F2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2kERq3VU+dcPeWbWRNYlkN/scOFqU5FKprYDRd3zXE=; b=TGZFIx8i2BsGpA
	iOcLbvoFsJfm8iUe0fJ+NV6oB7iOM+UtCzk/WbrFKmau8BaQxh8oakLqP54ZP8JTfk4JFb8AexYuW
	HTaykiLQA8j7Jx7DVQsRMR2r/YP9JYI/eJKdbyskd3qG8NaCF7p1eoHd9xt4HBLFTaV/6GtwRMyJE
	UeJgLHIRwh2Pxbdf5gy/5GC1Cx8rtz0RFwzvaYJmqzye1aUt2V4XmdSWahJYEnFXjGaTV+FDtI2eu
	4uHFMe1HndR5hn3ATbTFXdS65IlsMgeqJFg8su10vIkeKIZKXuuiReZ5H8vshw1r9BAlFbfugUQ6+
	EAmWEO/9ad9G0f1NqxpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gybcv-0008EN-Fz; Tue, 26 Feb 2019 12:14:25 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gybcK-0007hE-1M
 for linux-amlogic@lists.infradead.org; Tue, 26 Feb 2019 12:14:01 +0000
Received: by mail-oi1-x243.google.com with SMTP id t82so10077040oie.12
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Feb 2019 04:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kw0KnTlMhuALFKVc3/zwZ2mJ7NZitylpA9wVAVggfoo=;
 b=OO2BCr9O+qcPKVJntXt+IoThmsA3Kdsb/AmmywYr3fI4VU6vXBFMtHeRMq253EQn93
 8K1+xquSP3Ka/jDLJoII6ymx38lPz2zsCBYBwOoNqWBRb32pLubyxjMa/5rAl9nUIACk
 stLM0e7SNTiWW0AQX94PAeMk9X9TSGDvgW7T3OOqmGXpy7SQHbqXfEjnn7/YqvROMGTh
 1yNzDI8TWzjoEWoWJYTAXvLNNUbt0PSsV4EgkPxd1FaUh/XJs+h6VLET6wzVkhsFmuxV
 2IwfTcBtFot6B5xObOTLXn4Y4ZmJoaMAjNYPf4olkC9V4FMiUKbU5EDv3rmThh4+7r6j
 2gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kw0KnTlMhuALFKVc3/zwZ2mJ7NZitylpA9wVAVggfoo=;
 b=cU9oiVPOROSGBtvxHDEYJFpAsGkOepYG95cydJy+dbbDdgZtiBMTMrMr4MLXNXDNsU
 AfTmpQ5Yjn4GCGeFa+ujCOH38RZ1r8voKXfctAJl8YyhSrNWa5vIcixP8HBle7VTK9Q+
 H/Guud7129e0zTEIVEfgEWemefwwe3J44IjZSFF1KOITuqs2OSRheq/xElAH4NDG2HS5
 /3oQzazzbWJ6K/Ahh5oYbF9SgUMQU461NaNO6Fa8ndbH8/do5oXV4L5eGb4KCPm4RB7G
 oqnhDWnhkQlVVnKzlshWN099KxiFWVTlxnRgo+xLhoVpo3nEyF0ukOxyQ1JMqXB/w+pv
 aIgQ==
X-Gm-Message-State: AHQUAuaGri2KL4dgR7DzJs23xPg7lmk+5Fq8xQqyqWx2f9OuhJz/C2sO
 eFOFsjHWdApiILyffmBZmZ7I+Yv8oQgBhs4i3sw=
X-Google-Smtp-Source: AHgI3IbdM6Gfamm1QMUTBOK3Y5yxbD7GUk0AChb2fyslyiJKgwoP9joaN5TW3MtTDrt6gnk66aMnzo+VhmHIfDbQg4M=
X-Received: by 2002:aca:d4ce:: with SMTP id l197mr2173896oig.81.1551183226965; 
 Tue, 26 Feb 2019 04:13:46 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDRKJS-RXgVBDo2gjp_bU8Wmbhr+HGXNad4vCFyrvN_HA@mail.gmail.com>
 <CANAwSgR=PXtfMJWm_pOLYrV2imKpuw2FQOLT_J73tuu-q7WHww@mail.gmail.com>
 <CANAwSgSw4dCQnHv0cMSxDs7S=83NUh5B6M8m_-ooFQKv02=v_g@mail.gmail.com>
 <CAFBinCCCnCBO4dbvGjDuiH6Ba-9mcg3Ax3-vkLipGijubNBFBA@mail.gmail.com>
In-Reply-To: <CAFBinCCCnCBO4dbvGjDuiH6Ba-9mcg3Ax3-vkLipGijubNBFBA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 26 Feb 2019 17:43:36 +0530
Message-ID: <CANAwSgR0VUmcAiqn4OGzx8972qS4OPD=J2KHO8CGYCYgh6=bUA@mail.gmail.com>
Subject: Re: 32-bit Amlogic SoCs: avoid using Ethernet MAC addresses
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_041348_633220_13233086 
X-CRM114-Status: GOOD (  27.82  )
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Tue, 26 Feb 2019 at 17:07, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Feb 26, 2019 at 11:26 AM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Hi Martin,
> >
> > On Mon, 25 Feb 2019 at 17:49, Anand Moon <linux.amoon@gmail.com> wrote:
> > >
> > > hi Martin,
> > >
> > > +Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > On Mon, 25 Feb 2019 at 02:25, Martin Blumenstingl
> > > <martin.blumenstingl@googlemail.com> wrote:
> > > >
> > > > I have seen Anand's your question in [0]:
> > > > > only issue is I have is the each time their is random MAC address so I
> > > > > get new IP from dhcp server.
> > > > > How can I avoid this. I have tried to enable eFuse driver but with no success.
> > > >
> > > > u-boot on the 64-bit SoCs can read the MAC address from the eFuse and
> > > > pass it (via the .dtb) to the kernel.
> > > > This requires an ethernet0 alias in the mainline .dts though, see [1]
> > > > for and example.
> > > >
> > > > I'm not sure if this also works with the older u-boot on the 32-bit SoCs.
> > > > if it doesn't then there's a nvmem-cells binding for all Ethernet
> > > > controllers: [2] (please note that the function implementing this
> > > > binding was recently renamed: [3])
> > > > as far as I can tell the stmmac driver doesn't support the nvmem-cells
> > > > based binding yet
> > > >
> > > > Anand, if you want to work on this: feel free to do so!
> > > > I have the SDHC MMC driver and a discussion about the power-domain
> > > > drivers on my TODO-list, so I'm pretty busy at the moment.
> > > >
> > > >
> > > > Regards
> > > > Martin
> > > >
> > >
> > > Thanks for your inputs :) 8)
> > >
> > > After enable CONFIG_MESON_MX_EFUSE and added the alias
> > >
> >
> > As far as I can tell this nvmem consist of field.
> >  Board ID
> >  MAC address
> >  Serial Number
> >  UID
> >
> > I feel efues value in nvmem are read with following offset just for testing.
> > but it also need some driver changes to read from secure memory
> > by enable CONFIG_MESON_SM and get the mac address to be set in ethernet driver.
> > > On Odroid C1+
> > > # hexdump /sys/devices/platform/soc/da000000.secbus/da000000.nvmem/meson8b-efuse0/nvmem
> > > 0000000 1143 0000 4b48 3143 3131 3232 3346 4537
> > > 0000010 3942 4432 0000 0000 0000 0000 0000 0000
> > > 0000020 0000 0000 0000 0000 0000 0000 0000 0000
> > > *
> > > 00001b0 0000 0000 1e00 1006 addc 0000 0000 0000    *00:1e:06:10:dc:ad*
> > > mac address from nvmem
> > > 00001c0 0000 0000 0000 4b48 3143 3133 3631 3131
> > > 00001d0 3732 3130 6237 6537 3165 6437 3034 3764
> > > 00001e0 02ad ec24 ff7f acfb d692 5300 0047 0000
> > > 00001f0 0000 0000 0000 aff6 a000 0000 1400 c100
> > > 0000200
> > >
> > arch/arm/boot/dts/meson8b.dtsi
> > @@ -360,6 +360,18 @@
> >         compatible = "amlogic,meson8b-efuse";
> >         clocks = <&clkc CLKID_EFUSE>;
> >         clock-names = "core";
> > +
> > +       board_sn: board-sn@0000000 {
> > +               reg = <0x0000000 0x10>;
> > +       };
> > +
> > +       eth_mac: eth-mac@00001b4 {
> > +               reg = <0x00001b4 0x6>;
> > +       };
> > +
> > +       board_sno: board-sno@00001c0 {
> > +               reg = <0x00001c0 0x30>;
> > +       };
> >
> > This is what I am looking into.
> > If you have some input please share.
> your findings are looking good to me!
>
> I believe that some of the offsets are specific to the Odroid-C1.
> this is what the Endless Mini EC-100's kernel uses: [0] (eth_mac
> matches, but it seems that the other two don't)
>
>
.title = "mac", //for the main network interface
.id = EFUSE_MAC_ID,
.offset = 436,
.enc_len = 6,
.data_len = 6,

offset for mac which is in dec *436* is equal to hex *0x1b4* which I
am using for testing now.

I am changing this offset setting so that I get consistence result out of it.
I will also check with armbina image and see if I can find some thing usefull.

Thanks for your valuable inputs once again :)

Best Regards
-Anand

>
> [0] https://github.com/endlessm/linux-meson/blob/9969d20dc0f034e7a5addd4f6d28a8193e956b16/drivers/amlogic/efuse/efuse_version.c#L519

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
