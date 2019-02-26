Return-Path: <SRS0=hlvN=RB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30AEC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Feb 2019 11:37:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4972173C
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Feb 2019 11:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJuY6kwY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sC5ZBzUA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D4972173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1ISdYUW7hHpOfo/mASnAnpp/PBr0AdzkOzmKZD1/ps=; b=JJuY6kwY52u4ML
	0dwZvvQyQ9F82H6+xR2bU7433fVI1ffrPyxEMR+sqF9o5q1zdN6t6x8goLpVATM8rmMe7ObzReUzR
	jYrKm86p44zPgyXbhLwmWvMMb6jcL5Uc1DmpPmDUTB8FVm9RrPmXgiAxqlOuqchiA4ujGXQUZp1ru
	Pi43O1KhhPFy239InHiZeUs3yaFpfod/vpRf64tiJFFg8gUpmixdFtLXPLz+uB+jgAKN27jF9+SWF
	ZOeBBnC+E7Gp7DbsIvj1W1HvtLhHq4MnZRY9ZWcxWin4V4QKg6CNo5iXPwJJ7jFkFyKemGVpDTq98
	2VV8NG9gugSgE5Vsfzlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyb33-000223-0T; Tue, 26 Feb 2019 11:37:21 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyb2z-00021M-VO
 for linux-amlogic@lists.infradead.org; Tue, 26 Feb 2019 11:37:19 +0000
Received: by mail-oi1-x242.google.com with SMTP id g16so10066470oib.1
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Feb 2019 03:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7GIw1+sO+pcAPwTBsaGoAgZyjP++dzT6DuPTD5JmqnM=;
 b=sC5ZBzUAG0/x8/X7/ikzvki/Z1E63INkXbYkqgz48Xu0b6nJ4x8eJMKqIx5qPgxDCh
 SGI5GpvDERUfi+A0RjaH3a2igApVgWqielVPjFeDdDxMjoLiVfgzElszL8aqpy05LmNG
 OIUG1Kc2xbsA1RwIylygSL0GZRFoniSJ2mo5eJYBeol3g1XR/wNiJ2D5Wfi1RBPIGu6W
 QjxQ1w6OHl98/XiK0rZIx/2wecyPk749aLlTovcVDi4DXpOUNRrrvZhblwav5KBmNtJR
 Q7Cw6ZbPkNlKh6z2DH9EjXmxAbZFmiMzFqTDAPEUQdlFIzCaAUplfidSl3GQFkE+oErA
 PD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GIw1+sO+pcAPwTBsaGoAgZyjP++dzT6DuPTD5JmqnM=;
 b=HkTwOzWB6dMR3hA4FgTju1o67iAIKEQ3UyrHGdU2CD9XlXPTtc1z+whgOGAZ0HUjV4
 zxCP7bwgKXNmYtBLhs047dQuzWQoFbZU4oe7gR/AZGPt4p3/CE0UxWQmNIgFnJXA7FmT
 4Qtj9Y4xnAEvUH5ARg6OHwNwGVFsy06cmwi4bE4QfaxeIxeHTK9IrFUHM48kTqPdibcw
 FNA2zwuOhyD9ECfqWNS5ORVw91I8+tqL+8i57RsGU1+BAEAXrzL5ocargB3PGbizuPXi
 sPzvNaN7ZZNSsVGVEIWU9BpsMi4WPW2FGZwciWlFsDY05fvM7iXRfINITSM+Mbg/RHM9
 OZNg==
X-Gm-Message-State: AHQUAuZEsHbQJAtFY4tC2SeN7OJpgg/1aN1XpgvVYRPKziUXYLcbKOoK
 vcQzTQdpjV7tyFQQ3DS5ZFj5SGdXnxqTcau0FDk=
X-Google-Smtp-Source: AHgI3Iac8/9J8GWKRlsK0PaXAFcuQ3SCfrdXVhHcVxXCyvPKr03QKGqZhtVxU9CDUUv0GAp/Gm7X7cz+fgSWul++kWY=
X-Received: by 2002:aca:6209:: with SMTP id w9mr916882oib.47.1551181036310;
 Tue, 26 Feb 2019 03:37:16 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDRKJS-RXgVBDo2gjp_bU8Wmbhr+HGXNad4vCFyrvN_HA@mail.gmail.com>
 <CANAwSgR=PXtfMJWm_pOLYrV2imKpuw2FQOLT_J73tuu-q7WHww@mail.gmail.com>
 <CANAwSgSw4dCQnHv0cMSxDs7S=83NUh5B6M8m_-ooFQKv02=v_g@mail.gmail.com>
In-Reply-To: <CANAwSgSw4dCQnHv0cMSxDs7S=83NUh5B6M8m_-ooFQKv02=v_g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 26 Feb 2019 12:37:05 +0100
Message-ID: <CAFBinCCCnCBO4dbvGjDuiH6Ba-9mcg3Ax3-vkLipGijubNBFBA@mail.gmail.com>
Subject: Re: 32-bit Amlogic SoCs: avoid using Ethernet MAC addresses
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_033718_008395_0EEB166E 
X-CRM114-Status: GOOD (  25.68  )
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

Hi Anand,

On Tue, Feb 26, 2019 at 11:26 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> On Mon, 25 Feb 2019 at 17:49, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > hi Martin,
> >
> > +Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > On Mon, 25 Feb 2019 at 02:25, Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > I have seen Anand's your question in [0]:
> > > > only issue is I have is the each time their is random MAC address so I
> > > > get new IP from dhcp server.
> > > > How can I avoid this. I have tried to enable eFuse driver but with no success.
> > >
> > > u-boot on the 64-bit SoCs can read the MAC address from the eFuse and
> > > pass it (via the .dtb) to the kernel.
> > > This requires an ethernet0 alias in the mainline .dts though, see [1]
> > > for and example.
> > >
> > > I'm not sure if this also works with the older u-boot on the 32-bit SoCs.
> > > if it doesn't then there's a nvmem-cells binding for all Ethernet
> > > controllers: [2] (please note that the function implementing this
> > > binding was recently renamed: [3])
> > > as far as I can tell the stmmac driver doesn't support the nvmem-cells
> > > based binding yet
> > >
> > > Anand, if you want to work on this: feel free to do so!
> > > I have the SDHC MMC driver and a discussion about the power-domain
> > > drivers on my TODO-list, so I'm pretty busy at the moment.
> > >
> > >
> > > Regards
> > > Martin
> > >
> >
> > Thanks for your inputs :) 8)
> >
> > After enable CONFIG_MESON_MX_EFUSE and added the alias
> >
>
> As far as I can tell this nvmem consist of field.
>  Board ID
>  MAC address
>  Serial Number
>  UID
>
> I feel efues value in nvmem are read with following offset just for testing.
> but it also need some driver changes to read from secure memory
> by enable CONFIG_MESON_SM and get the mac address to be set in ethernet driver.
> > On Odroid C1+
> > # hexdump /sys/devices/platform/soc/da000000.secbus/da000000.nvmem/meson8b-efuse0/nvmem
> > 0000000 1143 0000 4b48 3143 3131 3232 3346 4537
> > 0000010 3942 4432 0000 0000 0000 0000 0000 0000
> > 0000020 0000 0000 0000 0000 0000 0000 0000 0000
> > *
> > 00001b0 0000 0000 1e00 1006 addc 0000 0000 0000    *00:1e:06:10:dc:ad*
> > mac address from nvmem
> > 00001c0 0000 0000 0000 4b48 3143 3133 3631 3131
> > 00001d0 3732 3130 6237 6537 3165 6437 3034 3764
> > 00001e0 02ad ec24 ff7f acfb d692 5300 0047 0000
> > 00001f0 0000 0000 0000 aff6 a000 0000 1400 c100
> > 0000200
> >
> arch/arm/boot/dts/meson8b.dtsi
> @@ -360,6 +360,18 @@
>         compatible = "amlogic,meson8b-efuse";
>         clocks = <&clkc CLKID_EFUSE>;
>         clock-names = "core";
> +
> +       board_sn: board-sn@0000000 {
> +               reg = <0x0000000 0x10>;
> +       };
> +
> +       eth_mac: eth-mac@00001b4 {
> +               reg = <0x00001b4 0x6>;
> +       };
> +
> +       board_sno: board-sno@00001c0 {
> +               reg = <0x00001c0 0x30>;
> +       };
>
> This is what I am looking into.
> If you have some input please share.
your findings are looking good to me!

I believe that some of the offsets are specific to the Odroid-C1.
this is what the Endless Mini EC-100's kernel uses: [0] (eth_mac
matches, but it seems that the other two don't)


Regards
Martin


[0] https://github.com/endlessm/linux-meson/blob/9969d20dc0f034e7a5addd4f6d28a8193e956b16/drivers/amlogic/efuse/efuse_version.c#L519

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
