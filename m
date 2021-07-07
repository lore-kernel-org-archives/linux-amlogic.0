Return-Path: <SRS0=LiOq=L7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7ADC07E95
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 16:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCC2761CB9
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 16:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCC2761CB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yiYh/tDPdlIrg16n+NcPany+zm3OKzz8JCWHQCzz6uc=; b=ZJbgZCZOESdC0QttthwMuEvI3P
	9THlkwGFcpE/ugLvDbrgDMkio2mFaBBLKqWai98dGzTbJMxC2+RFHKaqlUkuk+8DeZqwwYV3AMNhF
	u0l5g1er2HoqVbbPwz08x8vPLrw8/USeD58eLCrW4FZK3v3d+ALfeKtdrCOJnMMqIP8TOLVy1Nlhy
	r1TxY1VM1ARkcMtmaH7PFGwabdS+eCK8rkOhBvghOyFrT2o+U5SPWjFxcTo2T4ilW0mcCRLDtVrYD
	qbF7YzEeMhms0fMFmJp7VJZRrEUdz2Xay8LnNWa9CjSjbFmsmtzlxvg/vM7pLiNhqlGYxZQNizA77
	W1jcqZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Ae2-00FIy8-RY; Wed, 07 Jul 2021 16:43:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Adp-00FIux-2T
 for linux-amlogic@lists.infradead.org; Wed, 07 Jul 2021 16:43:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id i8so3773291wrp.12
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Jul 2021 09:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iGAqdezK2vHGAQ68dZd/ZC/J1Kp8ZpS6hRcaEAVA45M=;
 b=gjQPOAOhCm7H78f15yDmge4+B3Lml1OZV2BqBTx1bzrBFZarbGDKyvpUXWm00zD6AT
 yYgcN0AH7xQrg1mg9/hi/JePEd5X6zlrY6gwMai6ZKLZ+AjHENeNSjvm2pdmP2UxYqgz
 vAJtwTN+F7O5DRvPv/ch+pY6p6yNXtXealbnxpglX/6bfvhzr3GXGZWJPoJ/iQf3SETs
 9roTlfqsXpizY9pqnN473fCK+4Yt1oDrM+nvotru/AKUwrvBYUi5NjP4azj+1kwIO/8K
 bXi1hEKLXLBNcjU2PUD4jqDdqOfg60nJCFS0krIG8/NYO/UNHBwkaSzXLB1y0uyQm1FV
 mlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iGAqdezK2vHGAQ68dZd/ZC/J1Kp8ZpS6hRcaEAVA45M=;
 b=ZinGZQF8NFRKuJ1CswK5lccBPOCX+Kq009cWavn32hahCCF6u9leP1783PwzKx7jK/
 NvEt/lYLWhwzw75fasbd2WxfADUjpUKtJVvrQVk6L4sl+Euu+AxbE8kxDatldC3Dc94s
 /UXAvgzkebM9i0Nw7Cu65FWt+Wa6u2g/rmMPeOeXNSrw2Sc1fPG0fOk96hXx1s0hAbBh
 tsXm2PnVyl+cMEEeINZhInijqag+bSByU6FmMOXQp7/0bav6PhwE0T/A9Ji57UwAYrjF
 kYiZvAO9v+NBgAB/koX4eIyoLN+sjPtYvqVsadvkSViApBECY4Au5mtQ459dNP2M+VI/
 0eeg==
X-Gm-Message-State: AOAM533JXB46WgNrJJHzsyikXCeJLzHq+bUtj5mHiYsCIYePZK/3/Mlp
 GtI5JQuMrnjqPS/l94o/HwgO9A==
X-Google-Smtp-Source: ABdhPJxeijjxwxWfBuEFBQBDYFnxi3/lFyZFlY15NyHqu1q8O5dEzP3hK206AlbuCAurYbj9ViOigw==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr28985295wru.3.1625676195470; 
 Wed, 07 Jul 2021 09:43:15 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:59ba:fed7:14a3:f22f?
 ([2001:861:44c0:66c0:59ba:fed7:14a3:f22f])
 by smtp.gmail.com with ESMTPSA id t11sm21281369wrz.7.2021.07.07.09.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 09:43:14 -0700 (PDT)
Subject: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Art Nikpal <email2tema@gmail.com>, Huacai Chen <chenhuacai@gmail.com>,
 =?UTF-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Wilczynski <kw@linux.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
References: <20210707155418.GA897940@bjorn-Precision-5520>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <aab7db4a-df1f-280b-73d7-799161528fa2@baylibre.com>
Date: Wed, 7 Jul 2021 18:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707155418.GA897940@bjorn-Precision-5520>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_094317_219460_367ED718 
X-CRM114-Status: GOOD (  26.31  )
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

Hi,

On 07/07/2021 17:54, Bjorn Helgaas wrote:
> On Tue, Jul 06, 2021 at 11:54:05AM +0200, Neil Armstrong wrote:
>> In their Designware PCIe controller driver, amlogic sets the
>> Max_Payload_Size & Max_Read_Request_Size to 256:
>> https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/dwc/pci-meson.c#L260
>> https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/dwc/pci-meson.c#L276
>> in their root port PCIe Express Device Control Register.
>>
>> Looking at the Synopsys DW-PCIe Databook, Max_Payload_Size &
>> Max_Read_Request_Size are used to decompose into AXI burst, but it
>> seems the Max_Payload_Size & Max_Read_Request_Size are set by
>> default to 512 but the internal Max_Payload_Size_Supported is set to
>> 256, thus changing these values to 256 at runtime to match and
>> optimize bandwidth.
>>
>> It's said, "Reducing Outbound Decomposition" :
>>  - "Ensure that your application master does not generate bursts of
>>    size greater than or equal to Max_Payload_Size"
>>
>>  - "Program your PCIe system with a larger value of Max_Payload_Size
>>    without exceeding Max_Payload_Size_Supported"
>>
>>  - "Program your PCIe system with a larger value of Max_Read_Request
>>    without exceeding Max_Payload_Size_Supported:
>>
>> So leaving 512 in Max_Payload_Size & Max_Read_Request leads to
>> Outbound Decomposition which decreases PCIe link and degrades the
>> AXI bus by doubling the bursts, leading to this fix to avoid
>> overflowing the AXI bus.
>>
>> So it seems to be still needed, I assume this *should* be handled in
>> the core somehow to propagate these settings to child endpoints to
>> match the root port Max_Payload_Size & Max_Read_Request sizes.
>>
>> Maybe by adding a core function to set these values instead of using
>> the dw_pcie_find_capability() & dw_pcie_write/readl_dbi() helpers
>> and set a state on the root port to propagate the value ?
> 
> I don't have the Synopsys DW-PCIe Databook, so I'm lacking any
> context.  The above *seems* to say that MPS/MRRS settings affect AXI
> bus usage.

It does when the TLPs are directed to the RC.

> 
> The MPS and MRRS registers are defined to affect traffic on *PCIe*.  If
> a platform uses MPS and MRRS values to optimize transfers on non-PCIe
> links, that's a problem because the PCI core code that manages MPS and
> MRRS has no knowledge of those non-PCIe parts of the system.

Yes and no, it only affects PCIe in P2P, in non-P2P is will certainly affect
transfers on the internal SoC/Processor/Chip internal bus/fabric.

> You might be able to deal with this in Synopsys-specific code somehow,
> but it's going to be a bit of a hassle because I don't want it to make
> maintenance of the generic MPS/MRRS code harder.

I understand, but this is why these quirks are currently implemented in the
controller driver and only applies when the controller has been probed
and to each endpoint detected on this particular controller.

So we may continue having separate quirks for each controller if the core
isn't the right place to handle MPS/MRRS.

Neil

> Bjorn
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
