Return-Path: <SRS0=apJy=LZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6879AC11F64
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 15:46:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6CF6140D
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 15:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6CF6140D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YxVnXPYwpF6FEl7+ZpSP7iXGKFqj257y9UBT+EbO6Ww=; b=YMhm3giuzhMUbb
	qgYhPN1WPFVwyU6C68z7pikHZzrCCZomXf20DklNDawXRLRjx1OMT3mZFxhDhy6qf/k8fZNcPMKqG
	LqGtlHuCR03Lzh3PXQVkCEstfBZsD4U+W0KK52CyfHwV3pP4tMamfWB5gG9RSU0dd2mGhm6To9C8y
	1cALrqVlVlbCWweyhgE0yzH6jKIyLyRncvUXr48btkt0oO5X9VapB3XarxMPevozPLpsfwbgfluUx
	nQVe04mUln7IYodMLrHJ4N+HXbmLw7j9jdcJBuV21aqnVTgZBelZSfcsQZPvS3QER/CmgQcV6mUfE
	6RuMYcj8rzOYm5ZcskGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyyto-000Izj-7Y; Thu, 01 Jul 2021 15:46:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyytl-000Iyu-J1; Thu, 01 Jul 2021 15:46:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2BFF6140D;
 Thu,  1 Jul 2021 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625154401;
 bh=Fo6AvVX0T+1xIewne53jQHZgRx7ColYBFIZLicuS57E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HLfERLO+ag2XpeEdUQ3c+67U2cFQRMS900ys8JFNdarrsvJMkfbNx2hew1hwq+a9A
 gvNqINLoD7TLBOUYlCcWGsC1q03yev55tPj+Gd3ddWdMLfKLCMHrr8f7qLaIlO6QfJ
 LogsYURus7JMnPZxrijhTaktRpMR1HaZF+prKYL5a2q4LNhr0XEiF7HDvdyVKxMIr3
 Jn3TyNcwVME3djp1Wg6MtTGksBVjwZqg8Ibo1Dnw91c6yZNr/JOxunZ6Q46uacDnsu
 fJbdJ9/0kztzOtEWnYuLncgmAAkCE9Mb8EFuzG5M4IjHAvz7dvgEuM7Is0rKZmcQ7F
 CWTraAM9A83Gg==
Date: Thu, 1 Jul 2021 10:46:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Artem Lapkin <email2tema@gmail.com>
Cc: narmstrong@baylibre.com, yue.wang@Amlogic.com, khilman@baylibre.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
Message-ID: <20210701154634.GA60743@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210619063952.2008746-1-art@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_084641_690767_B6260698 
X-CRM114-Status: GOOD (  10.14  )
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

[+cc Huacai]

On Sat, Jun 19, 2021 at 02:39:48PM +0800, Artem Lapkin wrote:
> Replace dublicated MRRS limit quirks by mrrs_limit_quirk from core
> * drivers/pci/controller/dwc/pci-keystone.c
> * drivers/pci/controller/pci-loongson.c

s/dublicated/duplicated/ (several occurrences)

Capitalize subject lines.

Use "git log --online" to learn conventions and follow them.

Add "()" after function names.

Capitalize acronyms appropriately (NVMe, MRRS, PCI, etc).

End sentences with periods.

A "move" patch must include both the removal and the addition and make
no changes to the code itself.

Amlogic appears without explanation in 2/4.  Must be separate patch to
address only that specific issue.  Should reference published erratum
if possible.  "Solves some issue" is not a compelling justification.

The tree must be consistent and functionally the same or improved
after every patch.

Add to pci_ids.h only if symbol used more than one place.

See
https://lore.kernel.org/r/20210701074458.1809532-3-chenhuacai@loongson.cn,
which looks similar.  Combine efforts if possible and cc Huacai so
you're both aware of overlapping work.

More hints in case they're useful:
https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com/

> Both ks_pcie_quirk loongson_mrrs_quirk was rewritten without any
> functionality changes by one mrrs_limit_quirk
> 
> Added DesignWare PCI controller which need same quirk for
> * drivers/pci/controller/dwc/pci-meson.c (PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3)
> 
> This quirk can solve some issue for Khadas VIM3/VIM3L(Amlogic)
> with HDMI scrambled picture and nvme devices at intensive writing...
> 
> come from:
> * https://lore.kernel.org/linux-pci/20210618063821.1383357-1-art@khadas.com/
> 
> Artem Lapkin (4):
>  PCI: move Keystone and Loongson device IDs to pci_ids
>  PCI: core: quirks: add mrrs_limit_quirk
>  PCI: keystone move mrrs quirk to core
>  PCI: loongson move mrrs quirk to core
> 
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
