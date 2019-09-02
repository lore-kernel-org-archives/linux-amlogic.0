Return-Path: <SRS0=Oax9=W5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5786C3A59E
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 10:55:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F1021744
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 10:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kN6hJ/Gp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F1021744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dx61xpuA0sUeLqziKAtQtyZMuj+vWzO44EqalsuF/Jk=; b=kN6hJ/GplMS83p
	YkFKK2HVRAPxCk+BYPvdoJC2hyrTIaAzHHr9UoSl+CM+z25IugcQEa9oqJwS/Xu/Sm9b4pvmiRg56
	HZcWx0eSXhPvkAEDZg/O06/TFS6ckgUZJPacdz0J4JtvNrf4SBoeE9iUbBVa46kZNtm7nB75dhiT1
	M/TJmbMz7yZMAaM6374rN5VgOc9YB6eSQnIA6vjbFR9wI6jqsUvG21LKjoxXWgcuUOI2ZllZhtaJo
	fQ0ds/9N9m46WtPart3g0SClr95jvHj05Z8700NVNNvswx5Z9DbYV7LQdMKe8p1METyhCMQKpuycL
	8m2JCfAbzzunIwoJkcMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4jzp-0003ak-T4; Mon, 02 Sep 2019 10:55:42 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i4jzn-0003aB-5x
 for linux-amlogic@lists.infradead.org; Mon, 02 Sep 2019 10:55:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98C8428;
 Mon,  2 Sep 2019 03:55:38 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1124E3F246;
 Mon,  2 Sep 2019 03:55:37 -0700 (PDT)
Date: Mon, 2 Sep 2019 11:55:36 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH] PCI: amlogic: Fix reset assertion via gpio descriptor
Message-ID: <20190902105536.GG9720@e119886-lin.cambridge.arm.com>
References: <20190901133915.12899-1-repk@triplefau.lt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190901133915.12899-1-repk@triplefau.lt>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_035539_270100_013360AB 
X-CRM114-Status: GOOD (  15.83  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Yue Wang <yue.wang@Amlogic.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Sep 01, 2019 at 03:39:15PM +0200, Remi Pommarel wrote:
> Normally asserting reset signal on gpio would be achieved with:
> 	gpiod_set_value_cansleep(reset_gpio, 1);
> 
> Meson PCI driver set reset value to '0' instead of '1' as it takes into
> account the PERST# signal polarity. The polarity should be taken care
> in the device tree instead.
> 
> This fixes the reset assertion meaning and moves out the polarity
> configuration in DT (please note that there is no DT currently using
> this driver).

The device tree bindings for this give an example configuration:

        pcie: pcie@f9800000 {
                        compatible = "amlogic,axg-pcie", "snps,dw-pcie";
                        reg = <0x0 0xf9800000 0x0 0x400000
                                        0x0 0xff646000 0x0 0x2000
                                        0x0 0xff644000 0x0 0x2000
                                        0x0 0xf9f00000 0x0 0x100000>;
                        reg-names = "elbi", "cfg", "phy", "config";
                        reset-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;

Is the 'reset-gpios' line still consistent with this change, or does
this need to be updated as well?

Thanks,

Andrew Murray

> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index e35e9eaa50ee..541f37a6f6a5 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -287,9 +287,9 @@ static inline void meson_cfg_writel(struct meson_pcie *mp, u32 val, u32 reg)
>  
>  static void meson_pcie_assert_reset(struct meson_pcie *mp)
>  {
> -	gpiod_set_value_cansleep(mp->reset_gpio, 0);
> -	udelay(500);
>  	gpiod_set_value_cansleep(mp->reset_gpio, 1);
> +	udelay(500);
> +	gpiod_set_value_cansleep(mp->reset_gpio, 0);
>  }
>  
>  static void meson_pcie_init_dw(struct meson_pcie *mp)
> -- 
> 2.20.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
