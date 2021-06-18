Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155D3C48BE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 15:09:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8D361351
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 15:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8D361351
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xd0SzffQtbp/89lhzd9N5l1PuGxXcjjcKO+HbJ+0NcQ=; b=1Qo0dkYeLYwXjb8+l/lFc44TyW
	pRNlTe1XLvLpFlzTWOvTyIdWF7fTYVVFbPaT/xJgpIAcJwKwseDrr6aQB4QpWalWuez691XOktSXu
	AXKNTFNV5lX8ezp4uye2gVAa666YO7ObTamIuHuGs03Vn/0EOiOLL/YVhjyw6bpGsmPmsLopomR7X
	o82spNaP9DmaeekaW+JRIhhyaCQ1WGUzch0wiL5FVA4I3ujYDds7cvZMVBi01dSgyUdkYMBhNyIbZ
	VIgPewRXVfxNls4Ph5cboLGuXlYYSCMiN5TaxEZ0krEetaOZoF9tbz7VOGT3NoWuMD5nxJPcRu0FR
	S93D/ZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luG7J-00Ed1z-4n; Fri, 18 Jun 2021 15:09:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luG73-00EcxE-Nv
 for linux-amlogic@lists.infradead.org; Fri, 18 Jun 2021 15:08:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso8915919wmh.4
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jun 2021 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BB8SswcEaNjvxfv5/SYWvaIhulUyrjsY7Tim+J287Po=;
 b=yZmbw54fJezM3UObaPBhSLvrX2gSA9+LSWtH2qYk8jxMojG6lI4YXcKvqvsvQQTWIE
 lKA9iT6D1d2pROZ95mRBVhxjLinX2g0RwgNXx44mtfn7OyIZ+Tr3yT4TzvkeeNuMehuE
 q+74TUg2i0XDPXq1zmBmBmtPyIHQnYUJxckq3BZpSYji7LI0HpPGRGG5GfW3cMZP3FAT
 pSnY2lWSuurXxwZ2+2fuKJEZkaIHtSKYQaCG+GP4MMvstlaqbVqmTSvo9SFUYGVZPjaN
 mr9bjoIs4vlySv5nbPD0ujzQtferv/pkjS1KsqRY1eNHlYcmhfiTDdUPOu7R5J4tkiqm
 1D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BB8SswcEaNjvxfv5/SYWvaIhulUyrjsY7Tim+J287Po=;
 b=E21L3BBahLl2xt1q0xQnh+7iOFPrQy1eh51CFy/LdWceFbn9+JtnSBjkQoghNbF5NA
 QqmMGrSJ46PkBUekPN/pYRaxw6ayrCq2feA6o2tcMkSbfI+D/LulrwbOzMzj4JpMPO4g
 xZDTg6AG+TKw9quN2SDmBVDRma0P7DkrsfrEcgT2zMIyaRBU6YECU4aLDqFhu9Afa+1o
 pn+BvIWGURgen83EkJPe8O5Hoescyzrnp1kX1isicgT81z3uxqx9iH8Ry3+Z2uB6FBWt
 KU+6FxCoEdq3UQF/EFCifVE1FwRQkf1g1Dt4LdtXM9AKnSskwzPdP9gHHNi2W7fZKZW7
 bxSA==
X-Gm-Message-State: AOAM530NtEpUkIkSX1y3UvDjTYoRCckjpydfpB5DZX81joZWmdEm1thv
 EzBBvZOaflOKCIpGv3ucJOAXWg==
X-Google-Smtp-Source: ABdhPJxDHp+81lE3UaKhD8t72YZzpU4a1NRKPGAQoLZH13xKQADxUrtdW0KvDdrw21Ae2pn6NnLEOA==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr10760262wmb.167.1624028931071; 
 Fri, 18 Jun 2021 08:08:51 -0700 (PDT)
Received: from [10.1.3.24] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u12sm9276925wrr.40.2021.06.18.08.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:08:50 -0700 (PDT)
Subject: Re: [PATCH] PCI: dwc: meson add quirk
To: Rob Herring <robh@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Artem Lapkin <email2tema@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof Wilczynski <kw@linux.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 PCI <linux-pci@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 art@khadas.com, Nick Xie <nick@khadas.com>, gouwa@khadas.com
References: <20210618063821.1383357-1-art@khadas.com>
 <CAFBinCB6bHy6Han0+oUcuGfccv1Rh_P0Gows1ezWdV4eA267tg@mail.gmail.com>
 <CAL_JsqK+zjf2r_Q9gE8JwJw+Emn+JB4wOyH7eQct=kBvpUKstw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9b27444c-ea13-0dd2-a671-cef27e03b35c@baylibre.com>
Date: Fri, 18 Jun 2021 17:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK+zjf2r_Q9gE8JwJw+Emn+JB4wOyH7eQct=kBvpUKstw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_080853_810708_A56D928F 
X-CRM114-Status: GOOD (  21.02  )
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

On 18/06/2021 16:30, Rob Herring wrote:
> On Fri, Jun 18, 2021 at 6:12 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>>
>> Hi Artem,
>>
>> On Fri, Jun 18, 2021 at 8:38 AM Artem Lapkin <email2tema@gmail.com> wrote:
>>>
>>> Device set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
>>> was find some issue with HDMI scrambled picture and nvme devices
>>> at intensive writing...
>>>
>>> [    4.798971] nvme 0000:01:00.0: fix MRRS from 512 to 256
>>>
>>> This quirk setup same MRRS if we try solve this problem with
>>> pci=pcie_bus_perf kernel command line param
>> thank you for investigating this issue and for providing a fix!
>>
>> [...]
>>> +static void meson_pcie_quirk(struct pci_dev *dev)
>>> +{
>>> +       int mrrs;
>>> +
>>> +       /* no need quirk */
>>> +       if (pcie_bus_config != PCIE_BUS_DEFAULT)
>>> +               return;
>>> +
>>> +       /* no need for root bus */
>>> +       if (pci_is_root_bus(dev->bus))
>>> +               return;
>>> +
>>> +       mrrs = pcie_get_readrq(dev);
>>> +
>>> +       /*
>>> +        * set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
>>> +        * was find some issue with HDMI scrambled picture and nvme devices
>>> +        * at intensive writing...
>>> +        */
>>> +
>>> +       if (mrrs != MAX_READ_REQ_SIZE) {
>>> +               dev_info(&dev->dev, "fix MRRS from %d to %d\n", mrrs, MAX_READ_REQ_SIZE);
>>> +               pcie_set_readrq(dev, MAX_READ_REQ_SIZE);
>>> +       }
>>> +}
>>> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_pcie_quirk);
> 
> Isn't this going to run for everyone if meson driver happens to be enabled?

It should be enabled only when the Amlogic bridge is present, thus similar filtering as keystone & loongon
is needed, but with such filtering we could reuse ks_pcie_quirk() and loongson_mrrs_quirk() as is.

> 
>> it seems that other PCIe controllers need something similar. in
>> particular I found pci-keystone [0] and pci-loongson [1]
>> while comparing your code with the two existing implementations two
>> things came to my mind:
>> 1. your implementation slightly differs from the two existing ones as
>> it's not walking through the parent PCI busses (I think this would be
>> relevant if there's another bridge between the host bridge and the
>> actual device)
>> 2. (this is a question towards the PCI maintainers) does it make sense
>> to have this MRRS quirk re-usable somewhere?
> 
> Yes. Ideally, the max size could just be data in the bus or bridge
> struct and perhaps some flags too, then the core can handle
> everything.

AFAIL Simply moving ks_pcie_quirk() and loongson_mrrs_quirk() to core with the amlogic pci IDS added would be sufficient here.

Neil

> 
> Rob
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
