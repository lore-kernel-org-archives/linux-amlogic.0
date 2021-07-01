Return-Path: <SRS0=apJy=LZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AF5C11F64
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 17:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D56D6140B
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 17:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D56D6140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCHrBKHcsk4BpEUhBt3nMGATFNuKrgNew9bIKLapf4c=; b=w6Unu4XP7I3l2i
	oKOEH5VIekuBMNMeiFGNasIcpc4Md73n9+cpf/OCwsj8qv3icEE0PtZ8mLM+d9LKhI2iT9TsM3IEi
	7WrV5ll3WNNOBj1z+UxAW71Ab4GsPyePfDrJogzRK/OIqxsqmzqF3H1PxRLyzrZ0O145Qm+S1t3vL
	YlssXthXRhKpXNxtIRAIs5rkqJYdG8IPDN5pzA9iZ2TGoBTCM7zjMqsr9XNKJ0MvA8J14s4utn/Ef
	7S+RWhfWO0J7d5kEH3lDVhzDhuKc35Mfra4GGO1FNfH3UG67MGblLfBdaFwlmpmvyU4GAiaH8WR2T
	lRm2UUbtSjj5tWaRj82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz0AI-000XW5-SY; Thu, 01 Jul 2021 17:07:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz0AG-000XUx-Kr; Thu, 01 Jul 2021 17:07:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD4C06140A;
 Thu,  1 Jul 2021 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625159267;
 bh=aTKWcebr4gvOdJEh+MwCAWFIMDCqNX7Qa2V/EBQEtiw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Mye9w1C+v7xkZ4mI1bW7x1IG6ac5vQpTckShNCuuKVKP+2KFUsvI/rRjEsUINs/zS
 Qb14K3Imigs8QXCmpfUEyccNUfVPmu1kOCqb6pBX3w8NAz8zBoW/2l7WieidNXtSMB
 LOqwVMEcI7V5smYsxjJlY62256PRGa+zidPJ/OaThDjy6L/T7t9p5IEIKaFnOCGLAR
 jQ5nRHJHPWPFnFJATfyuOXc1X3LpGtaDLpuIjqRrArf+LulFJsPx16glpAzo1KvOB7
 qEL1wcxyX78a4HERA5tkevE7XHHJnK0P+nXFaXPBaWTCLEvx9RBtpWNykBCVFDpgKd
 cpqOdnK48CJng==
Received: by mail-ej1-f48.google.com with SMTP id l24so11549032ejq.11;
 Thu, 01 Jul 2021 10:07:47 -0700 (PDT)
X-Gm-Message-State: AOAM5332a9hH7H5MaU/0zMYty7cy3Ex3tbxxxGrfZurKaUNpojeIieq6
 rVY9r+BeEdAZIscfLeEhq6cEpPFGiyYdQgPMqw==
X-Google-Smtp-Source: ABdhPJxMUoof2kutwTR0KYkA8LrVVB8luU4gaBx2d5dFt2FtiQBOmrHMMm++Vt9EmJelAopleLH0UPhrp23B32WUcg0=
X-Received: by 2002:a17:906:1951:: with SMTP id
 b17mr983711eje.468.1625159266413; 
 Thu, 01 Jul 2021 10:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210619063952.2008746-1-art@khadas.com>
 <20210619063952.2008746-3-art@khadas.com>
In-Reply-To: <20210619063952.2008746-3-art@khadas.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 1 Jul 2021 11:07:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKV6iV1pbYNqFig5h5bH1cQ3pbdGc35F=sALNKdh2g4HA@mail.gmail.com>
Message-ID: <CAL_JsqKV6iV1pbYNqFig5h5bH1cQ3pbdGc35F=sALNKdh2g4HA@mail.gmail.com>
Subject: Re: [PATCH 2/4] PCI: core: quirks: add mrrs_limit_quirk
To: Artem Lapkin <email2tema@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Yue Wang <yue.wang@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Krzysztof Wilczynski <kw@linux.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, art@khadas.com,
 Nick Xie <nick@khadas.com>, gouwa@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_100748_752426_025D6829 
X-CRM114-Status: GOOD (  21.25  )
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

On Sat, Jun 19, 2021 at 12:40 AM Artem Lapkin <email2tema@gmail.com> wrote:
>
> Prepare new MRRS limit quirk which can replace dublicated functionality

typo

> for some controllers from Loongson, Keystone, DesignWare
>
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  drivers/pci/quirks.c | 54 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 653660e3b..73344ec71 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -5612,3 +5612,57 @@ static void apex_pci_fixup_class(struct pci_dev *pdev)
>  }
>  DECLARE_PCI_FIXUP_CLASS_HEADER(0x1ac1, 0x089a,
>                                PCI_CLASS_NOT_DEFINED, 8, apex_pci_fixup_class);
> +
> +/*
> + * Some Loongson PCIe ports have a h/w limitation of
> + * 256 bytes maximum read request size...
> + *
> + * Keystone PCI controller has a h/w limitation of
> + * 256 bytes maximum read request size.
> + *
> + * Amlogic DesignWare PCI controller on Khadas VIM3/VIM3L have some
> + * issue with HDMI scrambled picture and nvme devices
> + * at intensive writing...
> + */
> +static void mrrs_limit_quirk(struct pci_dev *dev)
> +{
> +       struct pci_bus *bus = dev->bus;
> +       struct pci_dev *bridge;
> +       int mrrs;
> +       int mrrs_limit = 256;
> +       static const struct pci_device_id bridge_devids[] = {
> +               { PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_PCIE_PORT_0) },
> +               { PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_PCIE_PORT_1) },
> +               { PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_PCIE_PORT_2) },
> +               { PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_RC_K2HK),
> +                .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },

Seems like checking the class is redundant given the VID and Device ID
seems to be pretty unique.

> +               { PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_RC_K2E),
> +                .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
> +               { PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_RC_K2L),
> +                .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
> +               { PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_RC_K2G),
> +                .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
> +               { PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3) },

This is Amlogic I guess. But they are reusing the IP default values?
Any other vendor that does the same will get the same quirk applied?
These are write-able,
so perhaps the driver should set them to something Amlogic specific.

> +               { 0, },
> +       };
> +
> +       /* look for the matching bridge */
> +       while (!pci_is_root_bus(bus)) {
> +               bridge = bus->self;
> +               bus = bus->parent;
> +               /*
> +                * 256 bytes maximum read request size. They can't handle
> +                * anything larger than this. So force this limit on
> +                * any devices attached under these ports.
> +                */
> +               if (pci_match_id(bridge_devids, bridge)) {

I would invert this to save some indentation:

if (!pci_match_id(bridge_devids, bridge))
    continue;

> +                       mrrs = pcie_get_readrq(dev);
> +                       if (mrrs > mrrs_limit) {
> +                               pci_info(dev, "limiting MRRS %d to %d\n", mrrs, mrrs_limit);
> +                               pcie_set_readrq(dev, mrrs_limit);
> +                       }
> +                       break;
> +               }
> +       }
> +}
> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, mrrs_limit_quirk);
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
