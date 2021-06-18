Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861F3C48BDF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 14:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32626610CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 14:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32626610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1aVHicYOG3HkuTySItaALsBsUPrvoNLESpaYYpOe4s=; b=Qnb3r+dp3Ewovw
	WR/1JlL9A3lq4iRRX6V5bM9D2shcE0HwPd8u7Jw8Gg6RFCWYkW2RCZX3uxY3JRCT1ud9A5cK/ub0L
	lhbLozSULA9hXMtYljQVMgUhq45YD+3a5ye3kpzbeeYT2OCvYi7vKXEKlbl+7friZAHsh4IA0Vs5P
	yqoi1pPZePAITh4u3gvrQJ2+e0zDugiDzx3FmO+bbs3A07mA28xbZFujIUwxR8oLTSOAcXVEewO38
	Ov/rW+5S+gvIwld22q9XhOfrC5q0BEiFWYdo1Xewr6uiYQB8Er4sFsBmtoFZoBY4xE5175E+32Swz
	tp0yybMGIkezli4R0Q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luFVz-00EU2a-CO; Fri, 18 Jun 2021 14:30:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luFVw-00EU27-Pu; Fri, 18 Jun 2021 14:30:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E772C61222;
 Fri, 18 Jun 2021 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624026631;
 bh=Z55SLbU8ZD5nUDrh8T99iwxmj76HXBy5zPcLuyKUE+k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RnrkiZpe9q8B2Cg+xjqgeayELOfe8JGeBbnl2PONMDfxp9XwIAbvo775WBxcxHj9z
 fdtB6Mo6csKLCexqWsaHgnLkhyuP/SGlOAxUdRkGyYRWJ2KbJUEMhLgGZaxhw9Z+Tx
 L9ReImrcqoTfHIwXsXmZgVdfVNQdrL/LCA2mqoMW0bzpP4Rt0xnFBVmFg6f9j/mQY/
 6mS1QUzvQtJvu6fMXVhTuy1im2USzuuQUTzlGtkZy3J7k/YWt1fnLOZuvt4Ftq9GPD
 Fk3a0nRu1MSSHckSYLkTr/rJUfLK10u6YFfHKWpXmTovY5AUOJhAPTEnBxI+qu2pXa
 hKz9rD3josUbQ==
Received: by mail-ed1-f53.google.com with SMTP id df12so6445729edb.2;
 Fri, 18 Jun 2021 07:30:31 -0700 (PDT)
X-Gm-Message-State: AOAM5335do9Hzu/9gmd45kizQg+8rq4hDUdDF/Fq6RZVvUlkAKUQ5qxg
 6NwdBThmBDGwtkadJLDFwUQAo3oEWOcGsV7EXQ==
X-Google-Smtp-Source: ABdhPJxL9CaQPuY06jCjKdQITDNtB6+/Tex0AkJknZjnOdcaEnznF5fo8kfUkN0Y3H/xw1kcmv3KZ4ICsSup5WIpZBM=
X-Received: by 2002:aa7:cac9:: with SMTP id l9mr5255201edt.373.1624026630436; 
 Fri, 18 Jun 2021 07:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210618063821.1383357-1-art@khadas.com>
 <CAFBinCB6bHy6Han0+oUcuGfccv1Rh_P0Gows1ezWdV4eA267tg@mail.gmail.com>
In-Reply-To: <CAFBinCB6bHy6Han0+oUcuGfccv1Rh_P0Gows1ezWdV4eA267tg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 18 Jun 2021 08:30:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK+zjf2r_Q9gE8JwJw+Emn+JB4wOyH7eQct=kBvpUKstw@mail.gmail.com>
Message-ID: <CAL_JsqK+zjf2r_Q9gE8JwJw+Emn+JB4wOyH7eQct=kBvpUKstw@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: meson add quirk
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Artem Lapkin <email2tema@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof Wilczynski <kw@linux.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, 
 PCI <linux-pci@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, art@khadas.com,
 Nick Xie <nick@khadas.com>, gouwa@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_073032_917465_4B6FF622 
X-CRM114-Status: GOOD (  23.37  )
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

On Fri, Jun 18, 2021 at 6:12 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Artem,
>
> On Fri, Jun 18, 2021 at 8:38 AM Artem Lapkin <email2tema@gmail.com> wrote:
> >
> > Device set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
> > was find some issue with HDMI scrambled picture and nvme devices
> > at intensive writing...
> >
> > [    4.798971] nvme 0000:01:00.0: fix MRRS from 512 to 256
> >
> > This quirk setup same MRRS if we try solve this problem with
> > pci=pcie_bus_perf kernel command line param
> thank you for investigating this issue and for providing a fix!
>
> [...]
> > +static void meson_pcie_quirk(struct pci_dev *dev)
> > +{
> > +       int mrrs;
> > +
> > +       /* no need quirk */
> > +       if (pcie_bus_config != PCIE_BUS_DEFAULT)
> > +               return;
> > +
> > +       /* no need for root bus */
> > +       if (pci_is_root_bus(dev->bus))
> > +               return;
> > +
> > +       mrrs = pcie_get_readrq(dev);
> > +
> > +       /*
> > +        * set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
> > +        * was find some issue with HDMI scrambled picture and nvme devices
> > +        * at intensive writing...
> > +        */
> > +
> > +       if (mrrs != MAX_READ_REQ_SIZE) {
> > +               dev_info(&dev->dev, "fix MRRS from %d to %d\n", mrrs, MAX_READ_REQ_SIZE);
> > +               pcie_set_readrq(dev, MAX_READ_REQ_SIZE);
> > +       }
> > +}
> > +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_pcie_quirk);

Isn't this going to run for everyone if meson driver happens to be enabled?

> it seems that other PCIe controllers need something similar. in
> particular I found pci-keystone [0] and pci-loongson [1]
> while comparing your code with the two existing implementations two
> things came to my mind:
> 1. your implementation slightly differs from the two existing ones as
> it's not walking through the parent PCI busses (I think this would be
> relevant if there's another bridge between the host bridge and the
> actual device)
> 2. (this is a question towards the PCI maintainers) does it make sense
> to have this MRRS quirk re-usable somewhere?

Yes. Ideally, the max size could just be data in the bus or bridge
struct and perhaps some flags too, then the core can handle
everything.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
