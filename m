Return-Path: <SRS0=EyFj=YI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E540AECE588
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 14:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F5320854
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 14:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZLO+oWed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1F5320854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWjlVlPwWWKfHL3x8LhWSCni4Yg3ljRTuXBvkN75584=; b=ZLO+oWedwciYGM
	MutB7KIBF3nQh7YwYjQn8S/0UJj9jciPaA8b7gkDd9xe9RUA1XhUTiP3NOffa7qqROcg5zLWbIiPy
	oNSVx0xKWJKu6mdmSxFmdU6NDievMcPir9CSnHOYCSL+VyZ3Hdp/zSUF1OgiMGfT0lIQ0sPBxIcMS
	2LhWAbejIoHthopJjsQHHeA/QYe1eFUlQ5wcbCiEjrD8mLEobGwoImj/ZWyGmxM/oYQeCGQsJVz7+
	B5qRF8Em6dbRrAo4UsNJT6982hRKc+em6B8nHaQ+w/OBujG1UWPmVoZZnxG9jcL7PzzWEahJDiG6d
	yqurFWvdRm6om1zW/rUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKNP5-0005Rs-Oe; Tue, 15 Oct 2019 14:02:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKNP2-0005R8-NI
 for linux-amlogic@lists.infradead.org; Tue, 15 Oct 2019 14:02:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C822337;
 Tue, 15 Oct 2019 07:02:19 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2436B3F718;
 Tue, 15 Oct 2019 07:02:18 -0700 (PDT)
Date: Tue, 15 Oct 2019 15:02:13 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH] PCI: amlogic: Fix reset assertion via gpio descriptor
Message-ID: <20191015140213.GA18503@e121166-lin.cambridge.arm.com>
References: <20190901133915.12899-1-repk@triplefau.lt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190901133915.12899-1-repk@triplefau.lt>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_070220_803422_55351A49 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org,
 Yue Wang <yue.wang@Amlogic.com>
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
> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to pci/meson, thanks.

Lorenzo

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
