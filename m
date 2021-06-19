Return-Path: <SRS0=FilP=LN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7DDC48BDF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 03:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70FF761245
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70FF761245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMz+CWtuDaIrL1DheXTKdR+sa0wvHnngM7n04u8OTTQ=; b=ifHsl9D085eueX
	UCYAQ69bOTf9GQl5msuMm3kVfCLFoMiT3nJ9Kvc/vUwReOmggyxy7hjA56XUdR92Gw8y7mnRKBW9K
	QQ5a6WEJuB2MT0gZf3frWBfCrCTjkOQZ0s2HYak7Jbbc5VMuP8GmFDwZIvl1+Wu7T4BVFQQG8QqcI
	K4eJzC6v11ZsbEDIZ986RRbBMZaubQQincy6itf6QQlvOoTS8/OFWRz/gLuqKoQCmjXdt8NJCQjDw
	Rzzs+jHrLvmY/R73OpVBTH0GllZpHVmE5Xtr2ARJWYFNUymluMMTwxYHMo2/6IR3/AtOvDDxkAi39
	tOyu+y2JTgKKLfr1uY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luRFR-00G6Y7-N0; Sat, 19 Jun 2021 03:02:17 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luRFF-00G6Wg-LK; Sat, 19 Jun 2021 03:02:07 +0000
Received: by mail-il1-x12b.google.com with SMTP id a11so3325230ilf.2;
 Fri, 18 Jun 2021 20:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xyPYkkSvMyYVEkMIHpUhP4h40bSciy9qGvek1zjV32o=;
 b=hl7p5r9hd+XZvulOZ1jnVte4vowXCqxDrUCk7I82uif5A6EbofWobMvM3MMwv3c2hX
 DbHqNTPPWtKtjukyEWnWCVwBx9ezt5LSdFwJTsa7ojEDGbRcqgFYOj9XdgonT/YrsDMc
 NNClnul4oOFPWWG6DW+kQF4xUF+0OQ1IsfXsLMNRBLQ4tpvJliSWEdAXbVaSrYnSwr4r
 7HFr2e/SDqQ2rKQSKxyJC8TWqZBUy2CiJtkby5iMvtubZxOJrR5JaMoFV/4lFFrpN58O
 JAvPof4tE5bYCEGqhsU1ojoMgTKRF6KUv4+8Vkpr2ulCitybquS6aHYDMd7y7Y8/IMA5
 C0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xyPYkkSvMyYVEkMIHpUhP4h40bSciy9qGvek1zjV32o=;
 b=gUCCwFdNQUOOZih25HHJ3fmEL6d8IAl62SEhdx3Ud+3bAyMeDheHLoa2g9m2yhSNM2
 ft+LruWJ/n+xCNkosZHgMKdv7/6dswDF0iZZPJYgAUZuO4Aebzmtxua7v8nhyVcBKhQI
 VpvQ22BzKHPS8//zsXYK3odfDeNjIyqqbVlUbU9ao96h1TzUl83Jo6WqeLUcTOLZT1xh
 fpxEvr6DePvhBpvBgaTFehKp95B6XDuD4ptxUvblwLsjP1Qx06c4fIsLINVRIXz9MW2n
 jNHQpIEUEMemRiK80ZNTLSsP5eq7T+eC2Z61/noCwnOTVnOBpDHIpWkinR0H2oDYG+9Z
 sdFg==
X-Gm-Message-State: AOAM532MksMKUQ5BAWN2DX3v1kLotFITeOrvagU4+rc1Wic0aYFMYtG5
 GUmoHqOREJzSSjHje/1kqhr2nuPZuwKoCszPSvQ=
X-Google-Smtp-Source: ABdhPJxeBt4cianRkuXSqEDXxBTpxQiNIcHs/73YLkSBRGbVm/gZYYz3e32m9s80nyIMxBwKAI0S0vPZ7V+LQW8eZzo=
X-Received: by 2002:a92:7b0f:: with SMTP id w15mr9849020ilc.150.1624071724671; 
 Fri, 18 Jun 2021 20:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210618063821.1383357-1-art@khadas.com>
 <CAFBinCB6bHy6Han0+oUcuGfccv1Rh_P0Gows1ezWdV4eA267tg@mail.gmail.com>
 <CAL_JsqK+zjf2r_Q9gE8JwJw+Emn+JB4wOyH7eQct=kBvpUKstw@mail.gmail.com>
 <9b27444c-ea13-0dd2-a671-cef27e03b35c@baylibre.com>
In-Reply-To: <9b27444c-ea13-0dd2-a671-cef27e03b35c@baylibre.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Sat, 19 Jun 2021 11:01:53 +0800
Message-ID: <CAKaHn9JK341ijN81kJyh32LksXVNGXTz-59QiGPxp0K6WGFN6g@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: meson add quirk
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Krzysztof Wilczynski <kw@linux.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, PCI <linux-pci@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Lapkin <art@khadas.com>, 
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_200205_748923_E37A7F4B 
X-CRM114-Status: GOOD (  27.55  )
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

> Neil
> It should be enabled only when the Amlogic bridge is present, thus similar filtering as keystone & loongon
> is needed, but with such filtering we could reuse ks_pcie_quirk() and loongson_mrrs_quirk() as is.
> AFAIL Simply moving ks_pcie_quirk() and loongson_mrrs_quirk() to core with the amlogic pci IDS added would be sufficient here.

My patch was not a good solution! its was just example how to fix our
problem - need to remade it

Yes i'm agree with Neil , at this moment we can move (replace
duplicate functionalities)  ks_pcie_quirk() and loongson_mrrs_quirk()
to core  + add amlogic pci IDS PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS,
PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3) - without other changes for everyone,
and after we can improve this quirk by next patches

i will send new patches variant soon

On Fri, Jun 18, 2021 at 11:08 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 18/06/2021 16:30, Rob Herring wrote:
> > On Fri, Jun 18, 2021 at 6:12 AM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> >>
> >> Hi Artem,
> >>
> >> On Fri, Jun 18, 2021 at 8:38 AM Artem Lapkin <email2tema@gmail.com> wrote:
> >>>
> >>> Device set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
> >>> was find some issue with HDMI scrambled picture and nvme devices
> >>> at intensive writing...
> >>>
> >>> [    4.798971] nvme 0000:01:00.0: fix MRRS from 512 to 256
> >>>
> >>> This quirk setup same MRRS if we try solve this problem with
> >>> pci=pcie_bus_perf kernel command line param
> >> thank you for investigating this issue and for providing a fix!
> >>
> >> [...]
> >>> +static void meson_pcie_quirk(struct pci_dev *dev)
> >>> +{
> >>> +       int mrrs;
> >>> +
> >>> +       /* no need quirk */
> >>> +       if (pcie_bus_config != PCIE_BUS_DEFAULT)
> >>> +               return;
> >>> +
> >>> +       /* no need for root bus */
> >>> +       if (pci_is_root_bus(dev->bus))
> >>> +               return;
> >>> +
> >>> +       mrrs = pcie_get_readrq(dev);
> >>> +
> >>> +       /*
> >>> +        * set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
> >>> +        * was find some issue with HDMI scrambled picture and nvme devices
> >>> +        * at intensive writing...
> >>> +        */
> >>> +
> >>> +       if (mrrs != MAX_READ_REQ_SIZE) {
> >>> +               dev_info(&dev->dev, "fix MRRS from %d to %d\n", mrrs, MAX_READ_REQ_SIZE);
> >>> +               pcie_set_readrq(dev, MAX_READ_REQ_SIZE);
> >>> +       }
> >>> +}
> >>> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_pcie_quirk);
> >
> > Isn't this going to run for everyone if meson driver happens to be enabled?
>
> It should be enabled only when the Amlogic bridge is present, thus similar filtering as keystone & loongon
> is needed, but with such filtering we could reuse ks_pcie_quirk() and loongson_mrrs_quirk() as is.
>
> >
> >> it seems that other PCIe controllers need something similar. in
> >> particular I found pci-keystone [0] and pci-loongson [1]
> >> while comparing your code with the two existing implementations two
> >> things came to my mind:
> >> 1. your implementation slightly differs from the two existing ones as
> >> it's not walking through the parent PCI busses (I think this would be
> >> relevant if there's another bridge between the host bridge and the
> >> actual device)
> >> 2. (this is a question towards the PCI maintainers) does it make sense
> >> to have this MRRS quirk re-usable somewhere?
> >
> > Yes. Ideally, the max size could just be data in the bus or bridge
> > struct and perhaps some flags too, then the core can handle
> > everything.
>
> AFAIL Simply moving ks_pcie_quirk() and loongson_mrrs_quirk() to core with the amlogic pci IDS added would be sufficient here.
>
> Neil
>
> >
> > Rob
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
