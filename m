Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484BEC48BDF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 12:12:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0535861057
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 12:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0535861057
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=713NDhQaUuPePQ5vO5ifM38D3IY6KJUWznyGV9av74g=; b=ABRuP66ZPjAmz0
	SgEXE6ECmTEZSlX4ta5WTwai8AyADJZUyQAu/z+c+HOW8hcFIkhMw5JhbpMsXtmsa5aUzbc1y61R7
	1R93xJfUGV3/T74Aw5tODk/Ts17DUgZEf9/qIpPZ/A02WlVv3R+/npwD+D8GKr7O9RE1ZGkZSF5tp
	CNRafAsBQJSlpFQvLqzErSf/hf2mUiOZCGW/cLI68h4reGfD+W7tAm+Kcf6c86va4bbBtM3BWRIXL
	8Nr/4VMFHXTF5id4GOkLCuR3M0TFmFDTbj8KVev592HCf8JwJBSNUVsiBDghYGjQYnOWCI+gkrtHu
	roW5oYCE1FL5W6qwNIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luDMF-00DyOe-7F; Fri, 18 Jun 2021 12:12:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luDM2-00DyMf-CU; Fri, 18 Jun 2021 12:12:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id ji1so9446146ejc.4;
 Fri, 18 Jun 2021 05:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=slXAXg1e2tsmaa9oPiftsSJgeXYcSGg3D4R78XBvMRw=;
 b=qwWNKKGFzMLQylLGpNs12wBfRnyVhAQbPU/ZmXjzNrbJxJxn6AbZShqjD5XWZXuMpY
 iWaNFGbRM591p1VvDIHrd5Shgi1BIXza8Q3/rlNrwPOWduI84z/OAmEuuRBfQevDnW7s
 iZpYraPMYIV7RH3dxv5IJeN7mksx8N5K2458yB1Ja9kznROTqvHYqs5Nj7pBh4K8f2h4
 Pxj3We7xy1ilNjmPcTwZUzA/SbouLq9Im30Wv3/xjasmgXfv6Nfodq4o/zACdVF7J8zi
 uv43EPpFBTga2yaTe1zxryYNe/MwL06Nsn72SNcH3zVuJuzQidCMJjMmiixoG5cGSofO
 Jf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slXAXg1e2tsmaa9oPiftsSJgeXYcSGg3D4R78XBvMRw=;
 b=am9hmH8h8MX+4tYJJLqGKHWP/tAjfe+S+DTgcmxvSjhggGGzp03+j1W2NmU414D97o
 CKtK0/mV3aSLGN79fYxchaumqQMVBT5yXEuMkniD7OhZNwE6o1pODjfqLgBfpivSgxim
 zHQSQA0G4/biEdgexw6GeJrflRf97Ja1sPmGZD7BmpIgiyUH+myaqePMAXiJGSiLxgvD
 4PM7IRWqvAz873EVlgiC990HEoa3EAU1XEtSXOW3Vv1F3Gzy9nZzxvIcr+z68ZcP9lAD
 UVPBxgNrpjHvt4LaBqa1MSKHHIooFNv403EzyRrt3IvZYOOFgWrrNagoEyQhMthsUHry
 dZ3A==
X-Gm-Message-State: AOAM5320uemMM3A2fdV4HO6Q8Jd4ENlyiiBtos2kIZpq72nB/2+aYKxf
 fpGnzLR0DrZHHVC/R534dx90XIRT/8oXsEMvcJw=
X-Google-Smtp-Source: ABdhPJwmZRzjmbGWTNRuKw75VrQ7GwYY3ZIuThEwzm4NkvcTZ8KreujakRXXykcCfLaS3NVfU08UJp95NW5pTSQ6CJ4=
X-Received: by 2002:a17:906:3b99:: with SMTP id
 u25mr10752296ejf.539.1624018328711; 
 Fri, 18 Jun 2021 05:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210618063821.1383357-1-art@khadas.com>
In-Reply-To: <20210618063821.1383357-1-art@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 14:11:58 +0200
Message-ID: <CAFBinCB6bHy6Han0+oUcuGfccv1Rh_P0Gows1ezWdV4eA267tg@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: meson add quirk
To: Artem Lapkin <email2tema@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, yue.wang@amlogic.com,
 khilman@baylibre.com, 
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com, 
 jbrunet@baylibre.com, christianshewitt@gmail.com, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com, 
 gouwa@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_051210_481426_03EAB76D 
X-CRM114-Status: GOOD (  17.85  )
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

Hi Artem,

On Fri, Jun 18, 2021 at 8:38 AM Artem Lapkin <email2tema@gmail.com> wrote:
>
> Device set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
> was find some issue with HDMI scrambled picture and nvme devices
> at intensive writing...
>
> [    4.798971] nvme 0000:01:00.0: fix MRRS from 512 to 256
>
> This quirk setup same MRRS if we try solve this problem with
> pci=pcie_bus_perf kernel command line param
thank you for investigating this issue and for providing a fix!

[...]
> +static void meson_pcie_quirk(struct pci_dev *dev)
> +{
> +       int mrrs;
> +
> +       /* no need quirk */
> +       if (pcie_bus_config != PCIE_BUS_DEFAULT)
> +               return;
> +
> +       /* no need for root bus */
> +       if (pci_is_root_bus(dev->bus))
> +               return;
> +
> +       mrrs = pcie_get_readrq(dev);
> +
> +       /*
> +        * set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
> +        * was find some issue with HDMI scrambled picture and nvme devices
> +        * at intensive writing...
> +        */
> +
> +       if (mrrs != MAX_READ_REQ_SIZE) {
> +               dev_info(&dev->dev, "fix MRRS from %d to %d\n", mrrs, MAX_READ_REQ_SIZE);
> +               pcie_set_readrq(dev, MAX_READ_REQ_SIZE);
> +       }
> +}
> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_pcie_quirk);
it seems that other PCIe controllers need something similar. in
particular I found pci-keystone [0] and pci-loongson [1]
while comparing your code with the two existing implementations two
things came to my mind:
1. your implementation slightly differs from the two existing ones as
it's not walking through the parent PCI busses (I think this would be
relevant if there's another bridge between the host bridge and the
actual device)
2. (this is a question towards the PCI maintainers) does it make sense
to have this MRRS quirk re-usable somewhere?


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v5.12/source/drivers/pci/controller/dwc/pci-keystone.c#L524
[1] https://elixir.bootlin.com/linux/v5.12/source/drivers/pci/controller/pci-loongson.c#L63

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
