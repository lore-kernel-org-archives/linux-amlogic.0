Return-Path: <SRS0=/T27=ME=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0646AC07E99
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 09:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6286113E
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 09:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6286113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQock3VYeE+ZfwxLg1/W/jRLCZoifHz8cl+rp+dMCXA=; b=R//AV58iHH6Pcb
	mukKlQSTuKLNGXrzzyqin+K3dzriny4l/hxjleFghn82CK9yOu4fTxtKZRDlgYPvHKtSJXIwHObUM
	bivPmJ48nxwf5+2vNN3/1WF7XU027Uo6Il0IaKd2f2xncQjxw/NLuunUuMmJr75NLaVMHT5jy8JFh
	TwExiAO9XIVfQWLuKz1ehqh4Hr3e9GiKWJgQo+dmf4vvpxK2EfINQ4G7P4ZhB/6O4TK52UVzDzDV9
	qevkKXvaHiSIWj2Xw49o11NSQMHSMdFNDhRqOvF6l/P5rnQR0TQYvvx1JmhaIxq02pIpYWqEPHap3
	wG7WbVm4mFgRr/G6Va+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2rvn-006hrF-5R; Mon, 12 Jul 2021 09:08:51 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2rvZ-006hpL-0Z; Mon, 12 Jul 2021 09:08:38 +0000
Received: by mail-io1-xd32.google.com with SMTP id g22so21739072iom.1;
 Mon, 12 Jul 2021 02:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U59PeowZNhh2OhvXIbjaI4juvWI/pRnlYgNB+mwdJpo=;
 b=L0xh0mEflI8DgLY9QTqU19xTsXqqizSWvkI/4omJpoe8x7otTPRVRVmo5XiOPskuZW
 S+2sh37QGlqJMFFsca7HTyNXgxBfSetWS5gJ0kcl5nwD3qPSQsmd1CbCuJdfXccS7izq
 o3iGM/Fm8JYvgjvR5eG60NVtkxObrmzxVZNNT9H0/g8wf1Gy5nM3BKEgHHtMahTWmhwf
 a+BfeuziEPQX8uwHXlx2A5BUZ4GhfNCOb1ifDkSNYppve1jA3QQLcHywmzkWRO1eS90I
 3Ycaj2NGgInrD+Jb75x1iEPXYo+9Ml/VZQ819z/N1MjkMZlpouA9qPqglrIzKM3ckOqo
 YyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U59PeowZNhh2OhvXIbjaI4juvWI/pRnlYgNB+mwdJpo=;
 b=UilAE9hsXzm28netFu9/EwDjlp3CCoi8Uh/R5eX9sfsAqGxm8eXjLM0Nnspqwl8COc
 nD6EvsIAAhzYLRyNXQ9jUfYmikV89a618ttJFof+jJTkEGCohqqwt4mSrnDmcfQnyT31
 W01thFaoP7Gsb7xP032yy/idiJUrHjiWKlKllupOQ7yap4IYoz8N9SU5M4VVoQeLALOW
 HBzkLIH00AEumh+ySA7vNnjvLWZVGX0tTGZ1h05nUPSFs3XKKkas3lKlZ9wcqho6z0up
 UvGKvcv/VRVOZgn4kwJtDezMZhsCYGEsB7PzvaPGgRxqTWJrVDhx6uJ7A1+8dSP9p4bP
 A86Q==
X-Gm-Message-State: AOAM531Y0/HFoKIvAIrlGJxtJVJS8QJJKWxHTGfnRjmAUXP79Timo2e0
 KdAs/KMaGLzG+Skj4FCVqtpNroBpxT1DWxr40mk=
X-Google-Smtp-Source: ABdhPJwn9EhcfVBqG/Ji30rbZu4T7eDBpsXWxSwTi6MejqeaTdxa04bjHMwNsghwzPByOpCek548LLiiOJGLHelDhjs=
X-Received: by 2002:a02:c806:: with SMTP id p6mr30443857jao.19.1626080915112; 
 Mon, 12 Jul 2021 02:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <aab7db4a-df1f-280b-73d7-799161528fa2@baylibre.com>
 <20210707165735.GA905464@bjorn-Precision-5520>
In-Reply-To: <20210707165735.GA905464@bjorn-Precision-5520>
From: Art Nikpal <email2tema@gmail.com>
Date: Mon, 12 Jul 2021 17:08:23 +0800
Message-ID: <CAKaHn9L4wLeVrFC7M05zr4enexU9_g=0y4dAbwu6BS+FBVicSA@mail.gmail.com>
Subject: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Huacai Chen <chenhuacai@gmail.com>, 
 =?UTF-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>, 
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Wilczynski <kw@linux.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
 Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_020837_103395_F3AC16D9 
X-CRM114-Status: GOOD (  39.19  )
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

> The PCI core is the correct place to handle MPS/MRRS because their> behavior is defined by the PCIe spec.
>Quirks are the way to work around this defect in the Synopsys PCIe IP.

> don't want it to make
> maintenance of the generic MPS/MRRS code harder.

Trying summarize ( every one must use separate quirk )

which file is right place for for meson_mrrs_limit_quirk()

- pci/controller/dwc/pci-meson.c or
- pci/quirks.c

rewrited quirk just for meson:

static void meson_mrrs_limit_quirk(struct pci_dev *dev)
{
    struct pci_bus *bus = dev->bus;
    int mrrs, mrrs_limit = 256;
    static const struct pci_device_id bridge_devids[] = {
        { PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3) },
        { 0, },
    };

    /* look for the matching bridge */
    while (!pci_is_root_bus(bus)) {
        /*
         * 256 bytes maximum read request size. They can't handle
         * anything larger than this. So force this limit on
         * any devices attached under these ports.
         */
        if (!pci_match_id(bridge_devids, bus->self)){
            bus = bus->parent;
            continue;
        }
        mrrs = pcie_get_readrq(dev);
        if (mrrs > mrrs_limit) {
            pci_info(dev, "limiting MRRS %d to %d\n", mrrs, mrrs_limit);
            pcie_set_readrq(dev, mrrs_limit);
        }
        break;
    }
}
DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_mrrs_limit_quirk);


On Thu, Jul 8, 2021 at 12:57 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Jul 07, 2021 at 06:43:13PM +0200, Neil Armstrong wrote:
> > On 07/07/2021 17:54, Bjorn Helgaas wrote:
> > > On Tue, Jul 06, 2021 at 11:54:05AM +0200, Neil Armstrong wrote:
> > >> In their Designware PCIe controller driver, amlogic sets the
> > >> Max_Payload_Size & Max_Read_Request_Size to 256:
> > >> https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/dwc/pci-meson.c#L260
> > >> https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/dwc/pci-meson.c#L276
> > >> in their root port PCIe Express Device Control Register.
> > >>
> > >> Looking at the Synopsys DW-PCIe Databook, Max_Payload_Size &
> > >> Max_Read_Request_Size are used to decompose into AXI burst, but it
> > >> seems the Max_Payload_Size & Max_Read_Request_Size are set by
> > >> default to 512 but the internal Max_Payload_Size_Supported is set to
> > >> 256, thus changing these values to 256 at runtime to match and
> > >> optimize bandwidth.
> > >>
> > >> It's said, "Reducing Outbound Decomposition" :
> > >>  - "Ensure that your application master does not generate bursts of
> > >>    size greater than or equal to Max_Payload_Size"
> > >>
> > >>  - "Program your PCIe system with a larger value of Max_Payload_Size
> > >>    without exceeding Max_Payload_Size_Supported"
> > >>
> > >>  - "Program your PCIe system with a larger value of Max_Read_Request
> > >>    without exceeding Max_Payload_Size_Supported:
> > >>
> > >> So leaving 512 in Max_Payload_Size & Max_Read_Request leads to
> > >> Outbound Decomposition which decreases PCIe link and degrades the
> > >> AXI bus by doubling the bursts, leading to this fix to avoid
> > >> overflowing the AXI bus.
> > >>
> > >> So it seems to be still needed, I assume this *should* be handled in
> > >> the core somehow to propagate these settings to child endpoints to
> > >> match the root port Max_Payload_Size & Max_Read_Request sizes.
> > >>
> > >> Maybe by adding a core function to set these values instead of using
> > >> the dw_pcie_find_capability() & dw_pcie_write/readl_dbi() helpers
> > >> and set a state on the root port to propagate the value ?
> > >
> > > I don't have the Synopsys DW-PCIe Databook, so I'm lacking any
> > > context.  The above *seems* to say that MPS/MRRS settings affect AXI
> > > bus usage.
> >
> > It does when the TLPs are directed to the RC.
>
> That's a defect in the RC.
>
> > > The MPS and MRRS registers are defined to affect traffic on *PCIe*.  If
> > > a platform uses MPS and MRRS values to optimize transfers on non-PCIe
> > > links, that's a problem because the PCI core code that manages MPS and
> > > MRRS has no knowledge of those non-PCIe parts of the system.
> >
> > Yes and no, it only affects PCIe in P2P, in non-P2P is will certainly affect
> > transfers on the internal SoC/Processor/Chip internal bus/fabric.
> >
> > > You might be able to deal with this in Synopsys-specific code somehow,
> > > but it's going to be a bit of a hassle because I don't want it to make
> > > maintenance of the generic MPS/MRRS code harder.
> >
> > I understand, but this is why these quirks are currently implemented in the
> > controller driver and only applies when the controller has been probed
> > and to each endpoint detected on this particular controller.
> >
> > So we may continue having separate quirks for each controller if the core
> > isn't the right place to handle MPS/MRRS.
>
> The PCI core is the correct place to handle MPS/MRRS because their
> behavior is defined by the PCIe spec.
>
> Quirks are the way to work around this defect in the Synopsys PCIe IP.
>
> Bjorn

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
