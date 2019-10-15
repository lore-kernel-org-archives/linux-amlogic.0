Return-Path: <SRS0=EyFj=YI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074F8C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 13:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D5C21928
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 13:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KdS7EhFd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D5C21928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXjphnw6yaieg9X1XPewDwcqeXo2TyKrLy+jo4VKFog=; b=KdS7EhFd0yrarI
	FFZIgvwg892AUQTUxOr7Yk4zdBs5OQcFFORnUhh85MVf3buD4WAYX63F91howYZCnjGR6clZuu5ix
	mO8GAGAf8IJqxdEgsq2XWCgzA/hLDfAVb70RKzFo0TiW54yrEPZkj2fltmaHP/8YUAYvgpJ7jNdUW
	wnq6fcrsfWV9Y+ttD6b17ZFBCByM/mTl/vDLwTLdK8ofYkWwL/4hojQa70Xr1ATZbfv+mJLgr14W1
	6cQ+O3Ghwq9zz6XUA+QX5KFVAYrJCMfIMlKV0TqrSp+m/jQInBlLN7aKgvzUqgTThSblLxYQLHUeZ
	6EDguFwOVJqvlMjhiWhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKMej-0004Nm-Cx; Tue, 15 Oct 2019 13:14:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKMeh-0004NP-AB; Tue, 15 Oct 2019 13:14:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E359337;
 Tue, 15 Oct 2019 06:14:26 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1A333F718;
 Tue, 15 Oct 2019 06:14:24 -0700 (PDT)
Date: Tue, 15 Oct 2019 14:14:19 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: meson-g12: add support for PCIe
Message-ID: <20191015131419.GA12343@e121166-lin.cambridge.arm.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916125022.10754-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_061427_440901_51E95486 
X-CRM114-Status: GOOD (  19.86  )
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
Cc: maz@kernel.org, gouwa@khadas.com, khilman@baylibre.com, nick@khadas.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 repk@triplefau.lt, andrew.murray@arm.com, bhelgaas@google.com,
 linux-amlogic@lists.infradead.org, yue.wang@Amlogic.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 16, 2019 at 02:50:16PM +0200, Neil Armstrong wrote:
> This patchset :
> - updates the Amlogic PCI bindings for G12A
> - reworks the Amlogic PCIe driver to make use of the
> G12a USB3+PCIe Combo PHY instead of directly writing in
> the PHY register
> - adds the necessary operations to the G12a USB3+PCIe Combo PHY driver
> - adds the PCIe Node for G12A, G12B and SM1 SoCs
> - adds the commented support for the S922X, A311D and S905D3 based
> VIM3 boards.
> 
> The VIM3 schematic can be found at [1].
> 
> This patchset is dependent on Remi's "Fix reset assertion via gpio descriptor"
> patch at [2].

Merged in pci/meson; however, I am not sure what should be done on
Remi's patch, I would like to queue it up too otherwise it looks
to me that merging this series is not right.

Lorenzo

> This patchset has been tested in a A311D VIM3 and S905D3 VIM3L using a
> 128Go TS128GMTE110S NVMe PCIe module.
> 
> For indication, here is a bonnie++ run as ext4 formatted on the VIM3:
>      ------Sequential Output------ --Sequential Input- --Random-
>      -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
> Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP /sec %CP
>   4G 93865  99 312837  96 194487  23 102808  97 415501 21 +++++ +++
> 
> and the S905D3 VIM3L version:
>      ------Sequential Output------ --Sequential Input- --Random-
>      -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
> Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>   4G 52144  95 71766  21 47302  10 57078  98 415469  44 +++++ +++
> 
> Changes since v1 at [3]:
>  - Collected Andrew's and Rob's Reviewed-by tags
>  - Added missing calls to phy_init/phy_exit
>  - Fixes has_shared_phy handling for MIPI clock
>  - Add comment in the DT concerning firmware setting the right properties
>  - Added SM1 Power Domain to PCIe node
> 
> [1] https://docs.khadas.com/vim3/HardwareDocs.html
> [2] https://patchwork.kernel.org/patch/11125261/
> [3] https://patchwork.kernel.org/cover/11136927/
> 
> Neil Armstrong (6):
>   dt-bindings: pci: amlogic,meson-pcie: Add G12A bindings
>   PCI: amlogic: Fix probed clock names
>   PCI: amlogic: meson: Add support for G12A
>   phy: meson-g12a-usb3-pcie: Add support for PCIe mode
>   arm64: dts: meson-g12a: Add PCIe node
>   arm64: dts: khadas-vim3: add commented support for PCIe
> 
>  .../bindings/pci/amlogic,meson-pcie.txt       |  12 +-
>  .../boot/dts/amlogic/meson-g12-common.dtsi    |  33 +++++
>  .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  25 ++++
>  .../amlogic/meson-g12b-s922x-khadas-vim3.dts  |  25 ++++
>  .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |   4 +
>  .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  25 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |   4 +
>  drivers/pci/controller/dwc/pci-meson.c        | 132 ++++++++++++++----
>  .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    |  70 ++++++++--
>  9 files changed, 292 insertions(+), 38 deletions(-)
> 
> -- 
> 2.22.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
