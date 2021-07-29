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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAA3C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 02:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAC56103C
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 02:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAAC56103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIUlt5OnltPEmS0ElyTt97U0N4p7pEZPARI9m5I1G80=; b=ozqWWK5Cof11I+
	OoeBMCCAtn+/x4haghc3sOV9Pre4GujroZ6kIxN0Dx+Y5hSaSpqzT3ON6uPuirZ0NRgIGpiHjBrA4
	iStYlchQ7ymThI9cT5WhtC8qbPbyy9i9b/Axyn4ERe3TaHx1pTF6FfbLSmI7aY9f+lWfhHN+phg/Q
	MAF8Hwq1zEr1Xbvxatbuj5HYeTJ8KRDSwWqTRM6waNZVd/Kcq9aTsm9ZDIuQB2YsQhl3ExIdMpXMD
	PQ+RWEBdtHPv/kXGqoP9RPrxr3ud/f9ozWOvmfXNsMjyn016q8fIMkswii6XYFDW9aYM5j6EVcKMP
	540pcPxt7HFa3EyxXQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8vgB-002u2W-Jd; Thu, 29 Jul 2021 02:21:47 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8vfx-002txM-9H; Thu, 29 Jul 2021 02:21:35 +0000
Received: by mail-io1-xd2b.google.com with SMTP id y200so5077693iof.1;
 Wed, 28 Jul 2021 19:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R17HCftwnExVBITUL3vMzRaZWklHE7WTCzst6j3TZE0=;
 b=hdY7VFsi9N5o+MaERqFmJqM8rLDPtB24yNrw+m9uftYHjOvQS76KB/pQ/8oTN3TvTO
 03Lp9St5tVPVpSf8lsDb1oebdIOF0hxx2HfufdT6xzCCEUmQ6mub+5LmyHdYF9pvmgCS
 FH8eo6S3ndkglCahj1jXSXb+aGWYSKf1wadUkLEUM2uLvvYMKsnjFJt8ebATOnWMmaOQ
 YX/pjqSFvHPI3aL2EQZmmZW7fPRRAbGkrILXQwFBQBe60rvEGG4c1fMzd/w6f7aIsA40
 ihVvGtyc80KDt7UcbpWNaN04EY9Xn/5Q4C3Nacu/ER8xEExCKT3PqpWy3DXUn3AUZT7P
 ZObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R17HCftwnExVBITUL3vMzRaZWklHE7WTCzst6j3TZE0=;
 b=IHrc0oVhEiT6QwFjO8cZ0mDz9g52eF9l8zUw+YNJPwTowwRHeC5dqFtF+oFq1ji3Ci
 8PbGGIzyH/kiOwIr1CeykMg3NxS5zdd4wqUJuoeGzetc9iOQT7zHYw0YYEqYBqf6Eax4
 ATX2UZxQNtQ5YqhPb8EqAwQSASZINPBtC2Ka0ANkrxkptnbq28pHfyvhv9VccTOszuQ4
 k/kYnzCQ0EXQY61eWQtZ+7zEehlbpt6vNaJMB/J6SQ0XPmf7jl9Wqt0NXU8UQysSzj2b
 BJQ70yH/bQKaj9lmvAypzE5ufMTT9iHzGJqQn2FaqzC5OEDxQ7Z4ZzLCWQ1hRExxRXUD
 X/FA==
X-Gm-Message-State: AOAM533mdqP3XnqxA6ZKgoYoa26h6dxw7JGddRpCBLBlNLnPbqgt9M3h
 KfHg8/pryRzY7azQzF8mwhhowIl1dexuqLXgWzA=
X-Google-Smtp-Source: ABdhPJwhF+4ItV92GHowHGlYO3feVZkAERCaidqhU4S0KwkvIU5yRksnVUo6bOZR3DlFQmAQ2tsdJ6eNwSE4qqzCU0I=
X-Received: by 2002:a05:6602:2801:: with SMTP id
 d1mr2044245ioe.73.1627525291992; 
 Wed, 28 Jul 2021 19:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210727023000.1030525-1-art@khadas.com>
 <20210727194323.GA725763@bjorn-Precision-5520>
In-Reply-To: <20210727194323.GA725763@bjorn-Precision-5520>
From: Art Nikpal <email2tema@gmail.com>
Date: Thu, 29 Jul 2021 10:21:20 +0800
Message-ID: <CAKaHn9LxBey-BT4nLWDUS7ZOUSFrUhXsqe8zp9LYWceVr5vfgA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: DWC: meson: add 256 bytes MRRS quirk
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Yue Wang <yue.wang@amlogic.com>, 
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
X-CRM114-CacheID: sfid-20210728_192133_386347_669A0E75 
X-CRM114-Status: GOOD (  42.30  )
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

> This needs to say whether this is a functional or a performance issue.

Looks like not a performance issue , this is a functional issue.

We detect just one problem(may be exist another i dont know ) for
writing(reading works fine) any data to NVME devices with MRRS != 256
we have scrambled HDMI display

> Does this problem actually affect *all* DesignWare-based controllers?
> So why is this limited to PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3?

i can say only for VIM3 device which use this controller and have this problem

On Wed, Jul 28, 2021 at 3:43 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Jul 27, 2021 at 10:30:00AM +0800, Artem Lapkin wrote:
> > 256 bytes maximum read request size. They can't handle
> > anything larger than this. So force this limit on
> > any devices attached under these ports.
>
> This needs to say whether this is a functional or a performance issue.
>
> If it's a functional issue, i.e., if meson signals an error or abort
> when it receives a read request for > 256 bytes, we need to explain
> exactly what happens.
>
> If it's a performance issue, we need to explain why MRRS affects
> performance and that this is an optimization.
>
> > Come-from: https://lkml.org/lkml/2021/6/18/160
> > Come-from: https://lkml.org/lkml/2021/6/19/19
>
> Please use lore.kernel.org URLs instead.  The lore URLs are a little
> uglier, but are more functional, more likely to continue working, and
> avoid the ads.  These are:
>
>   https://lore.kernel.org/r/20210618230132.GA3228427@bjorn-Precision-5520
>   https://lore.kernel.org/r/20210619063952.2008746-1-art@khadas.com
>
> > It only affects PCIe in P2P, in non-P2P is will certainly affect
> > transfers on the internal SoC/Processor/Chip internal bus/fabric.
>
> This needs to explain how a field in a PCIe TLP affects transfers on
> these non-PCIe fabrics.
>
> > These quirks are currently implemented in the
> > controller driver and only applies when the controller has been probed
> > and to each endpoint detected on this particular controller.
> >
> > Continue having separate quirks for each controller if the core
> > isn't the right place to handle MPS/MRRS.
>
> I see similar code in dwc/pci-keystone.c.  Does this problem actually
> affect *all* DesignWare-based controllers?
>
> If so, we should put the workaround in the common dwc code, e.g.,
> pcie-designware.c or similar.
>
> It also seems to affect pci-loongson.c (not DesignWare-based).  Is
> there some reason it has the same problem, e.g., does loongson contain
> DesignWare IP, or does it use the same non-PCIe fabric?
>
> > >> Neil
> >
> > Signed-off-by: Artem Lapkin <art@khadas.com>
> > ---
> >  drivers/pci/controller/dwc/pci-meson.c | 31 ++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> > index 686ded034..1498950de 100644
> > --- a/drivers/pci/controller/dwc/pci-meson.c
> > +++ b/drivers/pci/controller/dwc/pci-meson.c
> > @@ -466,6 +466,37 @@ static int meson_pcie_probe(struct platform_device *pdev)
> >       return ret;
> >  }
> >
> > +static void meson_mrrs_limit_quirk(struct pci_dev *dev)
> > +{
> > +     struct pci_bus *bus = dev->bus;
> > +     int mrrs, mrrs_limit = 256;
> > +     static const struct pci_device_id bridge_devids[] = {
> > +             { PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3) },
>
> I don't really believe that PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3 is the
> only device affected here.  Is this related to the Meson root port, or
> is it related to a PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3 on a plug-in card?
> I guess the former, since you're searching upward for a root port.
>
> So why is this limited to PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3?
>
> > +             { 0, },
> > +     };
> > +
> > +     /* look for the matching bridge */
> > +     while (!pci_is_root_bus(bus)) {
> > +             /*
> > +              * 256 bytes maximum read request size. They can't handle
> > +              * anything larger than this. So force this limit on
> > +              * any devices attached under these ports.
> > +              */
> > +             if (!pci_match_id(bridge_devids, bus->self)) {
> > +                     bus = bus->parent;
> > +                     continue;
> > +             }
> > +
> > +             mrrs = pcie_get_readrq(dev);
> > +             if (mrrs > mrrs_limit) {
> > +                     pci_info(dev, "limiting MRRS %d to %d\n", mrrs, mrrs_limit);
> > +                     pcie_set_readrq(dev, mrrs_limit);
> > +             }
> > +             break;
> > +     }
> > +}
> > +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_mrrs_limit_quirk);
> > +
> >  static const struct of_device_id meson_pcie_of_match[] = {
> >       {
> >               .compatible = "amlogic,axg-pcie",
> > --
> > 2.25.1
> >

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
