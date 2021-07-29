Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A342C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 02:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB4D6056C
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 02:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFB4D6056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EF4iDFcwsEQAM1StXR5Il/FDRbIeH1lnmnNq4Tscwt4=; b=IdH/HQZSDlLbzU
	+4Khd9G+5kFc75NADDSIQNs1fDOZLVv44Yc1hAuAFqQ36P0SMgqnAY1NYKw0rMPxOjk2DKtVRtQT7
	N6FraVoI+kgl4vVlf1bzfX63MZsnOneC4w62lxWeQkCigIhOcVt39sWGFsTsp1f4Z0GOubw8HmLeb
	ZfoFkGMxbMeTCSs6BHA6jPRK5k0CT9nBlAAsR5LZTohN/la0It1edq7UTGZ+lGnCiC/L1RcxZuhKR
	zdlD+uj5Irr+XMXbhZFFFuY/2z29V9imnL/6L/JV1dm4wrnFF/IpyN5ZFDUhfHtf46eRi3bgO4maQ
	UA0MwhicW5XQ37G+jcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8vRT-002rko-6z; Thu, 29 Jul 2021 02:06:35 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8vRF-002rjS-AP; Thu, 29 Jul 2021 02:06:23 +0000
Received: by mail-il1-x129.google.com with SMTP id r1so4200908iln.6;
 Wed, 28 Jul 2021 19:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gw638gPEElf7gPsZoaSODOIPFTTqrPgexZer8ynjLek=;
 b=I38YYBpI9kUB85qSrUEOHLs4oZ5hBshAMGMSoHCBvCtMg3Frrpqek7sFDoaq6lCyjt
 rO6VLyfYuzWMWb5bWh6wA4Qv/huiiHGfHyUzxEzm0U5Lcrsf1gzA3yx5pnbafP3PYL+H
 4OV1dT/w1PDDDw9Tax09yRbqHxaH48OrNSDF4FHKcEa7Tan4tnBt3LAyTImwr2nrti4A
 LszDNG/ZZVxqCi9Jq95+D08yzQlUXmrarYxdvLFEENlkHx3NUlrBmaXX1NS2ieAE5A4W
 dWtgM5J/diQ9cEkmR+x3S7k6mSpPl4JM2JWDvuPtihX4zysQuQYz0lAGg470deylF5J6
 qVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gw638gPEElf7gPsZoaSODOIPFTTqrPgexZer8ynjLek=;
 b=bzQbQfuOpVGky5U433lHtqDgC7yKSupc3tWsryKye8UsQ6MJ39OxcL8dq4LYvdVOMU
 iuVW9JfzIphRyiJ+bOMn3zFrbc2GNJaBwcsDfcsl8aMnGwk9M21XkGOUCQybzBoUehue
 EbWpCmk2r1DClGRv8BuC4mvQujQSNh4G6bZSfJXUYtinFf1tdNZBEOAd3ggk2p6X3MPO
 N5cUORiIW09zy6iiecBFv4nKvkxydCKGI/f2tfehdI5yS4XGBfumRK69Wj9HB703Y2fL
 MAck4C9DVJtCB7JmbSj1agl7bADbV5ZAtc/X4WFb275T6c1vsXmZ/5mjJzavIYZIsuhQ
 AgyQ==
X-Gm-Message-State: AOAM5330y1AY5amL979JDOWe4hcZXdZg+4UU2+0ZdFbTx5hWCQQORtz5
 oWlER8fI9fBp1V5ydCdM8Yxu7ajJICK15P1E/zc=
X-Google-Smtp-Source: ABdhPJweTQMZMOJZhsoSA6X0MeGnEy5oVheg7f7rSBxVhp24LiURAoMneyjr65xHD8o3c6MnGXmb40ia8HnNWPc3sro=
X-Received: by 2002:a05:6e02:68d:: with SMTP id
 o13mr1965269ils.150.1627524378676; 
 Wed, 28 Jul 2021 19:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210727194323.GA725763@bjorn-Precision-5520>
 <63838b21-3073-0b07-53d3-b85d6e89f0eb@baylibre.com>
In-Reply-To: <63838b21-3073-0b07-53d3-b85d6e89f0eb@baylibre.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Thu, 29 Jul 2021 10:06:06 +0800
Message-ID: <CAKaHn9+rEBTm3DfdSBXhMuark=4YvXqv1YoEQdo43f=gOFnwCg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: DWC: meson: add 256 bytes MRRS quirk
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Yue Wang <yue.wang@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Wilczynski <kw@linux.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
 Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_190621_416791_5B53417B 
X-CRM114-Status: GOOD (  50.30  )
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

> The fun part is that the pci=pcie_bus_perf kerne cmdline solves this already,

yes pci=pcie_bus_perf works only because setup same MRRS=256 in this case
same like in this patch pcie_set_readrq(dev, 256 )

some details about pci=pcie_bus_perf

[    4.665327] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
[    4.671166] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pref]
[    4.677793] pci 0000:00:00.0: supports D1
[    4.683028] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
[    4.691667] pci 0000:01:00.0: [2646:2263] type 00 class 0x010802
[    4.697469] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
[    4.704218] pci 0000:01:00.0: pcie_get_mps - 128
[    4.709607] pci 0000:00:00.0: pcie_get_mps - 256
[    4.715145] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 31.504
Gb/s with 8.0 GT/s PCIe x4 link)
[    4.748582] pci 0000:00:00.0: BAR 14: assigned [mem 0xfc700000-0xfc7fffff]
[    4.755575] pci 0000:00:00.0: BAR 6: assigned [mem
0xfc800000-0xfc80ffff pref]
[    4.762731] pci 0000:01:00.0: BAR 0: assigned [mem
0xfc700000-0xfc703fff 64bit]
[    4.769849] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    4.775195] pci 0000:00:00.0:   bridge window [mem 0xfc700000-0xfc7fffff]
[    4.781741] pci 0000:00:00.0: pcie_get_mps - 256
[    4.787118] pci 0000:00:00.0: pcie_set_mps - 256 (32)
[    4.792404] pci 0000:00:00.0: pcie_get_mps - 256
[    4.797637] pci 0000:00:00.0: pcie_get_mps - 256
[    4.802674] pci 0000:00:00.0: Max Payload Size set to  256/ 256
(was  256), Max Read Rq  256
[    4.810602] pci 0000:01:00.0: pcie_get_mps - 128
[    4.815590] pci 0000:00:00.0: pcie_get_mps - 256
[    4.820422] pci 0000:01:00.0: pcie_set_mps - 256 (32)
[    4.825274] pci 0000:01:00.0: pcie_get_mps - 256
[    4.829946] pci 0000:01:00.0: pcie_set_readrq - 256
[    4.834609] pci 0000:01:00.0: pcie_get_mps - 256
[    4.839174] pci 0000:01:00.0: pcie_get_mps - 256
[    4.843582] pci 0000:01:00.0: Max Payload Size set to  256/ 256
(was  128), Max Read Rq  256

and pci=pcie_bus_perf works for whole system and i think its not good
idea use or adoptate this option for this case

Artem

On Wed, Jul 28, 2021 at 11:08 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
>
> On 27/07/2021 21:43, Bjorn Helgaas wrote:
> > On Tue, Jul 27, 2021 at 10:30:00AM +0800, Artem Lapkin wrote:
> >> 256 bytes maximum read request size. They can't handle
> >> anything larger than this. So force this limit on
> >> any devices attached under these ports.
> >
> > This needs to say whether this is a functional or a performance issue.
> >
> > If it's a functional issue, i.e., if meson signals an error or abort
> > when it receives a read request for > 256 bytes, we need to explain
> > exactly what happens.
> >
> > If it's a performance issue, we need to explain why MRRS affects
> > performance and that this is an optimization.
> >
> >> Come-from: https://lkml.org/lkml/2021/6/18/160
> >> Come-from: https://lkml.org/lkml/2021/6/19/19
> >
> > Please use lore.kernel.org URLs instead.  The lore URLs are a little
> > uglier, but are more functional, more likely to continue working, and
> > avoid the ads.  These are:
> >
> >   https://lore.kernel.org/r/20210618230132.GA3228427@bjorn-Precision-5520
> >   https://lore.kernel.org/r/20210619063952.2008746-1-art@khadas.com
> >
> >> It only affects PCIe in P2P, in non-P2P is will certainly affect
> >> transfers on the internal SoC/Processor/Chip internal bus/fabric.
> >
> > This needs to explain how a field in a PCIe TLP affects transfers on
> > these non-PCIe fabrics.
> >
> >> These quirks are currently implemented in the
> >> controller driver and only applies when the controller has been probed
> >> and to each endpoint detected on this particular controller.
> >>
> >> Continue having separate quirks for each controller if the core
> >> isn't the right place to handle MPS/MRRS.
> >
> > I see similar code in dwc/pci-keystone.c.  Does this problem actually
> > affect *all* DesignWare-based controllers?
> >
> > If so, we should put the workaround in the common dwc code, e.g.,
> > pcie-designware.c or similar.
> >
> > It also seems to affect pci-loongson.c (not DesignWare-based).  Is
> > there some reason it has the same problem, e.g., does loongson contain
> > DesignWare IP, or does it use the same non-PCIe fabric?
>
> As my reply on the previous thread, the Synopsys IP can be configured with a
> maximum TLP packet to AXI transaction size, which is hardcoded AFAIK Amlogic
> doesn't explicit it. And it doesn't seem we can read the value.
>
> This means is a TPL size if higher than this maximum packet size, the IP will
> do multiple AXI transactions, and this can reduce the system overall performance.
>
> The problem is that it affects the P2P transactions aswell, which can support any MPS/MRRS.
> But honestly, it's not a big deal on a PCIe 2.0 1x system only designed for NVMe and basic
> PCIe devices.
>
> The fun part is that the pci=pcie_bus_perf kerne cmdline solves this already,
> isn't there any possibility to force pcie_bus_perf for a particular root port ?
>
> Neil
>
> >
> >>>> Neil
> >>
> >> Signed-off-by: Artem Lapkin <art@khadas.com>
> >> ---
> >>  drivers/pci/controller/dwc/pci-meson.c | 31 ++++++++++++++++++++++++++
> >>  1 file changed, 31 insertions(+)
> >>
> >> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> >> index 686ded034..1498950de 100644
> >> --- a/drivers/pci/controller/dwc/pci-meson.c
> >> +++ b/drivers/pci/controller/dwc/pci-meson.c
> >> @@ -466,6 +466,37 @@ static int meson_pcie_probe(struct platform_device *pdev)
> >>      return ret;
> >>  }
> >>
> >> +static void meson_mrrs_limit_quirk(struct pci_dev *dev)
> >> +{
> >> +    struct pci_bus *bus = dev->bus;
> >> +    int mrrs, mrrs_limit = 256;
> >> +    static const struct pci_device_id bridge_devids[] = {
> >> +            { PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3) },
> >
> > I don't really believe that PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3 is the
> > only device affected here.  Is this related to the Meson root port, or
> > is it related to a PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3 on a plug-in card?
> > I guess the former, since you're searching upward for a root port.
> >
> > So why is this limited to PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3?
> >
> >> +            { 0, },
> >> +    };
> >> +
> >> +    /* look for the matching bridge */
> >> +    while (!pci_is_root_bus(bus)) {
> >> +            /*
> >> +             * 256 bytes maximum read request size. They can't handle
> >> +             * anything larger than this. So force this limit on
> >> +             * any devices attached under these ports.
> >> +             */
> >> +            if (!pci_match_id(bridge_devids, bus->self)) {
> >> +                    bus = bus->parent;
> >> +                    continue;
> >> +            }
> >> +
> >> +            mrrs = pcie_get_readrq(dev);
> >> +            if (mrrs > mrrs_limit) {
> >> +                    pci_info(dev, "limiting MRRS %d to %d\n", mrrs, mrrs_limit);
> >> +                    pcie_set_readrq(dev, mrrs_limit);
> >> +            }
> >> +            break;
> >> +    }
> >> +}
> >> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_mrrs_limit_quirk);
> >> +
> >>  static const struct of_device_id meson_pcie_of_match[] = {
> >>      {
> >>              .compatible = "amlogic,axg-pcie",
> >> --
> >> 2.25.1
> >>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
