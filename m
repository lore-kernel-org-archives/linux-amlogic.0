Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A88C2D0DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 18:17:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F01702080D
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 18:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d1wcixZJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bdk9f8SU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F01702080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXbzowfIt9TKW2fRdxrbDrYspIh5daMZovHyn9WDAhA=; b=d1wcixZJ+qzo4s
	J9UXVLNZXeXgHUhgnsFX/GzQG5EJCtRiJbdZYzBLR+/xx4T37bgnpCNqmFQOL5ZET1cUhi4N0PyeB
	s4k2D6mm1lDdGULyu8jdBbp3P+oU61nCuTIHiF3citoAdLGUswkoV4FPJcO26ofcQV2coRDf6Vtk/
	W67UG/oj5UZJ16ZrgbvxLHt5uafzilmCGt76Jcyxre0cyV9Qgt1XNd1Ev5jsLy/HP+rnq7o24KBFG
	Jzt4FRG27etxLtEI6BFZqRPzetDhgcVkgwvtntlEgh2qxl8inwCApg2qAWeRFnZaZapMrIncSsfGh
	i0ova0o3zht6UXOLpmeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikXhJ-0007f7-SX; Thu, 26 Dec 2019 18:17:21 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikXhG-0007ee-MF; Thu, 26 Dec 2019 18:17:21 +0000
Received: by mail-ed1-x542.google.com with SMTP id r21so23342774edq.0;
 Thu, 26 Dec 2019 10:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/kVUvUUlIv+S4KgB8PAilg5eRolltdkQ40GkTlROLJs=;
 b=bdk9f8SUF43t/ZpP5zxB4uQXnDLufOuMHu/wIWWmDxL7aVjosImu7uDnGwroYAo9hR
 eJCnfI7jptFKeuPCfVOoo7DiYO5i6BKr4kO6hw5GyLhjfhklx2fPmTYgv6vRDCEfICc6
 N3X3vUhbgwMXiacZqdUHI4AqL0uF0koIJCoO4qJCciRnbmP6Jx5g3AXukI/Fw4JQ/wAv
 o4aL+uNzuC/mo44CJ2xatye3EAhKVbrD6a4UjOkCtB4+olUufm7vbM6mvjvPR9c991vv
 jaTnyHZiCSrclPaFEMixAatFZ8y0GsfV++VqW1GaPDsCrplp7O/+sv4lIfufoL5CcUB6
 HCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/kVUvUUlIv+S4KgB8PAilg5eRolltdkQ40GkTlROLJs=;
 b=V50z7BFBKIFiKtvHUxiKzgu7TM7W5CEo4W6kwLo4rZCZZCX2QmH7x0WEMBPRV+8M6v
 m0eo+jQ/t2mlQs03raWTsqkFqHug89tc05Yrj1IXS9Atlx6KvjZEIhKoAYLwp1N0jwTK
 5Uaa+GIzJgv1u3U2sHcWgHpzROXSxKkez8JYo/vOOxRn/QLNklRllFnRwIETZ+ow0DEQ
 vFbNRZBcje9zRpTYPAZNFf+ycf99kU8fL0enh/O5aW3MYsxgPbetaIhT/N9Ja3tKbNyx
 xI9lyhwj0wUZKh9+ioE8y20lNXwwWbed/qCQTOUNnli/k5BxLY2Fvv7fS2ahTMbHWSRu
 pvaw==
X-Gm-Message-State: APjAAAX0881abrdFHeHYVa/qe69urYnXEHmNisaoENU+nhXZJfHuEDLE
 +TSe/TS6kj0HCTW41nnQAo+a3PSdwom5A9IiAIQ=
X-Google-Smtp-Source: APXvYqyIG6a7r9M4dZcMeoqoNvL9c1xsxC7MdJXKs8s6dyYvgPlDylAr5Jg+h9P+QsIDTu+cgoDJlTOe781mQBrq0i0=
X-Received: by 2002:a17:906:260b:: with SMTP id
 h11mr49327361ejc.327.1577384236409; 
 Thu, 26 Dec 2019 10:17:16 -0800 (PST)
MIME-Version: 1.0
References: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
 <20191225005655.1502037-2-martin.blumenstingl@googlemail.com>
 <20191225150845.GA16671@lunn.ch>
 <CAFBinCA4X1e5_5nBiHmNiB40uJyr9Nm1b2VkF9NqM+wb7-1xmw@mail.gmail.com>
 <20191226105044.GC1480@lunn.ch>
 <CAFBinCB8YQ-tuGBixO_85NFXDdrH5keDURFgri5tFLdrAwUJKg@mail.gmail.com>
 <20191226120133.GI1480@lunn.ch>
In-Reply-To: <20191226120133.GI1480@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Dec 2019 19:17:05 +0100
Message-ID: <CAFBinCC9KioCC8HzPOFm3x3ZjTiQm_gr-aemnziLnTN8Ets_+A@mail.gmail.com>
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on
 Meson8b/8m2 SoCs
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_101719_352159_D30E5216 
X-CRM114-Status: GOOD (  27.96  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linus.luessing@c0d3.blue,
 balbes-150@yandex.ru, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 ingrassia@epigenesys.com, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Thu, Dec 26, 2019 at 1:01 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > the MAC is not capable of generating an RX delay (at least as far as I know).
>
> So that immediately means rgmii is invalid as a phy-mode, since the
> documentation implies the MAC needs to add RX delay.
things turned out even more confusing thanks to your persistence (keep
reading, it will get better though) :-)

I have tested the following on my Odroid-C1 which has an RTL8211F PHY.
With patch #1 from this series I knew that the following was working:
- phy-mode = "rgmii" and 2ns TX delay on the MAC (RX delay is
seemingly not configured anywhere)
- phy-mode = "rgmii-txid" (again, the RX delay is seemingly not
configured anywhere)

with the patch to change the RX delay on the RTL8211F PHY I decided to
try out phy-mode = "rgmii-id": this broke Ethernet.
then I looked at the MAC registers and spotted that bits 13
(adj_enable) and 14 (adj_setup) are set (first time I'm noticing
this). unsetting them makes phy-mode = "rgmii-id" work!
I also confirmed the opposite case: unsetting bit 13 and 14 breaks
Ethernet with phy-mode = "rgmii-txid".

so it seems that there *is* a way to configure the RX delay on Meson8b
and Meson8m2 SoCs (at least).
I will spin up a RfC patch to discuss this with the Amlogic team and
because I don't know what these bits do exactly

> > it's mostly "broken" (high TX packet loss, slow TX speeds) for the two
> > supported boards with an RGMII PHY (meson8b-odroidc1.dts and
> > meson8m2-mxiii-plus.dts)
> > examples on the many ways it was broken will follow - feel free to
> > skip this part
>
> That is actually good. If it never worked, we don't need to worry
> about breaking it! We can spend our time getting this correct, and not
> have to worry about backwards compatibility, etc.
ACK

> > > What we normally say is make the MAC add no delays, and pass the
> > > correct configuration to the PHY so it adds the delay. But due to the
> > > strapping pin on the rtl8211f, we are in a bit of a grey area. I would
> > > suggest the MAC adds no delay, phy-mode is set to rmgii-id, the PHY
> > > driver adds TX delay in software, we assume the strapping pin is set
> > > to add RX delay, and we add a big fat comment in the DT.
> > >
> > > For the Micrel PHY, we do the same, plus add the vendor properties to
> > > configure the clock skew.
> > >
> > > But as i said, we are in a bit of a grey area. We can consider other
> > > options, but everything needs to be self consistent, between what the
> > > MAC is doing, what the PHY is doing, and what phy-mode is set to in
> > > DT.
>
> > do you think it's worth the effort to get clarification from Realtek
> > on the RX delay behavior (and whether there's a register to control
> > it)?
>
> You can ask. There are also datasheet here:
>
> http://files.pine64.org/doc/datasheet/rock64/RTL8211F-CG-Realtek.pdf
> https://datasheet.lcsc.com/szlcsc/1909021205_Realtek-Semicon-RTL8211F-CG_C187932.pdf
>
> It looks like both RX and TX delay can be controlled via
> strapping. But the register for controlling the TX delay is not
> documented.
I checked the mails I got from Realtek I while ago and they even
included the RX delay bits!
I even sent a patch two years ago but I must have dropped it at some
point (maybe I assumed that it wasn't relevant anymore - I don't
remember): [0]

> > you mentioned that there was breakage earlier this year, so I'm not sure anymore
> > (that leaves me thinking: asking them is still useful to get out of
> > this grey area)
>
> It was an Atheros PHY with breakage.
>
> If we can fully control the RX and TX delays, that would be great. It
> would also be useful if there was a way to determine how the PHY has
> been strapped. If we cannot fully control the delays but we can find
> out what delays it is using, we can check the requested configuration
> against the strapped configuration, and warn if they are different.
I am currently testing whether the pin strapping configuration can be
read back by the RX and TX delay registers
my Odroid-C1 has both strapped to GND which means off
but my Khadas VIM2 has TX delay strapped to ETH_VDDIO which means on
(RX delay is still strapped to GND)
once I am done testing I will send patches for the RTL8211F PHY driver


Martin


[0] https://patchwork.ozlabs.org/patch/843946/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
