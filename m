Return-Path: <SRS0=LiOq=L7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72314C07E9B
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 15:54:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2881561C4E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 15:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2881561C4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ztnGkdxeowePkwaHfYu+8XxLqrj3yabrjnRJ9SzdqGc=; b=W/fGg0FAxv+wz2
	PFD7qoIqYhqP6EK96eBDE+xCPbBMt53N8XGC4Wi1Kxivfhk63ogeF//Ox+8WzQP3xa2rIkkTrRbGl
	zwsLF0XTRUgYhrK6WNC4Shtsvn4bLJJUo+6P1Amt/O92y4KJBfFK3bb+WAzRUBbcajp1zGgW3YFpl
	dPMYa1u5CxJhhUAfIhJcQlc+AdwZYQ9WkqAOEuZMVALQ00Wqzw0oiDWr/pIxmW5aikSGLbJPzQAf5
	HCFo8zt7dHOcA3MfkaBaMh9u+ogxLJt2zrd2I9IaZNRAxOD7lhobbnAfJJYG6Hvh/i33BiwejeOb7
	ezjomK0l6iXBbp2jAVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m19sU-00FFBO-95; Wed, 07 Jul 2021 15:54:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m19sR-00FFAl-PM; Wed, 07 Jul 2021 15:54:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 477B561CBF;
 Wed,  7 Jul 2021 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625673259;
 bh=jBYB8E2kxgHKI+p6Ge17CrAqEwZGHZvxadKDfFVaIpg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=i2oNik5do5AHOLInc4OUUnh1F5HFHYK0kr4sWV3miNytCJw7/lDxUrFNZc8zt+nVY
 OiD9V2ljFumrYj8FRbVYSSjxPfzFDRrGLSj6Wx3m5uQA2m8CZtbkBk/RKXZ+aWJb2E
 SmHiGI0lmJLrmjHxBW1okpUEq0lX4ITih1OyeYBigaiJ2xoKatvbZdQ2hBOYN8FPYD
 10AdgnOw8vzYCVq5JVfO5sByQHdJvhvdYC2IBE/4TnEELQcKv8QoPSP7J9TBO3vLyg
 T+hSNeXjX71oyYS4rQ5JrGBRvKfteyyO2NwNv3nYVTt1O1mfPW6tTySCVYE1nJY/w3
 rXj5dhh7qvz2Q==
Date: Wed, 7 Jul 2021 10:54:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Art Nikpal <email2tema@gmail.com>, Huacai Chen <chenhuacai@gmail.com>,
 =?utf-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Wilczynski <kw@linux.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
Subject: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
Message-ID: <20210707155418.GA897940@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1271fa28-dddd-01a3-5ad5-e3b4898f5482@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_085419_903038_640B30F8 
X-CRM114-Status: GOOD (  19.23  )
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

On Tue, Jul 06, 2021 at 11:54:05AM +0200, Neil Armstrong wrote:
> In their Designware PCIe controller driver, amlogic sets the
> Max_Payload_Size & Max_Read_Request_Size to 256:
> https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/dwc/pci-meson.c#L260
> https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/dwc/pci-meson.c#L276
> in their root port PCIe Express Device Control Register.
> 
> Looking at the Synopsys DW-PCIe Databook, Max_Payload_Size &
> Max_Read_Request_Size are used to decompose into AXI burst, but it
> seems the Max_Payload_Size & Max_Read_Request_Size are set by
> default to 512 but the internal Max_Payload_Size_Supported is set to
> 256, thus changing these values to 256 at runtime to match and
> optimize bandwidth.
> 
> It's said, "Reducing Outbound Decomposition" :
>  - "Ensure that your application master does not generate bursts of
>    size greater than or equal to Max_Payload_Size"
>
>  - "Program your PCIe system with a larger value of Max_Payload_Size
>    without exceeding Max_Payload_Size_Supported"
>
>  - "Program your PCIe system with a larger value of Max_Read_Request
>    without exceeding Max_Payload_Size_Supported:
> 
> So leaving 512 in Max_Payload_Size & Max_Read_Request leads to
> Outbound Decomposition which decreases PCIe link and degrades the
> AXI bus by doubling the bursts, leading to this fix to avoid
> overflowing the AXI bus.
> 
> So it seems to be still needed, I assume this *should* be handled in
> the core somehow to propagate these settings to child endpoints to
> match the root port Max_Payload_Size & Max_Read_Request sizes.
> 
> Maybe by adding a core function to set these values instead of using
> the dw_pcie_find_capability() & dw_pcie_write/readl_dbi() helpers
> and set a state on the root port to propagate the value ?

I don't have the Synopsys DW-PCIe Databook, so I'm lacking any
context.  The above *seems* to say that MPS/MRRS settings affect AXI
bus usage.

The MPS and MRRS registers are defined to affect traffic on *PCIe*.  If
a platform uses MPS and MRRS values to optimize transfers on non-PCIe
links, that's a problem because the PCI core code that manages MPS and
MRRS has no knowledge of those non-PCIe parts of the system.

You might be able to deal with this in Synopsys-specific code somehow,
but it's going to be a bit of a hassle because I don't want it to make
maintenance of the generic MPS/MRRS code harder.

Bjorn

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
