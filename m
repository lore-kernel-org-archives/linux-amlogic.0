Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC5DC49ED7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 13:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16E4214D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 13:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBx543zN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D16E4214D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BA4rmBehO254v3OAqmu1vtm5QRQhHD+7BGTG7rw0G8=; b=LBx543zNt5QQBv
	3Y2ECKxh3J69c5jaNuvZ8ZBlCEsT8ICweu3pd9jfz02Kr14hPVSL6vF3e5eW3t05HKWkcUSiOldmE
	MBshgDUgwqDvcmZjBVXcSMhqSWw0dfnUMGQOZFxn+j087/5SxMUhCKUrMV+XadG//gOp46CCJEFY+
	kyt1s+mNxezEDJZomppTeW/7Pfum04KrvRcdZvNfDezuzf9KXT0mkrHblpu8697tTMXk2Cb5J4IKE
	D19Cac2wj6HCwic/ShFi/ohYGX7aZYQz/8mExA+8AvX8yPdDpGc+ggPVxAo/rvUjUmdJW/Ds1nnTj
	tN23o7xBGrTz6Q0WthGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9qyW-0000VH-8c; Mon, 16 Sep 2019 13:23:28 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9qyT-0000UT-Mm; Mon, 16 Sep 2019 13:23:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3B7E337;
 Mon, 16 Sep 2019 06:23:21 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A9C53F67D;
 Mon, 16 Sep 2019 06:23:21 -0700 (PDT)
Date: Mon, 16 Sep 2019 14:23:19 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 4/6] phy: meson-g12a-usb3-pcie: Add support for PCIe
 mode
Message-ID: <20190916132319.GQ9720@e119886-lin.cambridge.arm.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
 <20190916125022.10754-5-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916125022.10754-5-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_062325_835291_A35C6149 
X-CRM114-Status: GOOD (  19.51  )
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
Cc: maz@kernel.org, lorenzo.pieralisi@arm.com, gouwa@khadas.com,
 khilman@baylibre.com, nick@khadas.com, linux-kernel@vger.kernel.org,
 kishon@ti.com, repk@triplefau.lt, linux-pci@vger.kernel.org,
 bhelgaas@google.com, linux-amlogic@lists.infradead.org, yue.wang@Amlogic.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 16, 2019 at 02:50:20PM +0200, Neil Armstrong wrote:
> This adds extended PCIe PHY functions for the Amlogic G12A
> USB3+PCIE Combo PHY to support reset, power_on and power_off for
> PCIe exclusively.
> 
> With these callbacks, we can handle all the needed operations of the
> Amlogic PCIe controller driver.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 70 ++++++++++++++++---
>  1 file changed, 61 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> index ac322d643c7a..08e322789e59 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> @@ -50,6 +50,8 @@
>  	#define PHY_R5_PHY_CR_ACK				BIT(16)
>  	#define PHY_R5_PHY_BS_OUT				BIT(17)
>  
> +#define PCIE_RESET_DELAY					500
> +
>  struct phy_g12a_usb3_pcie_priv {
>  	struct regmap		*regmap;
>  	struct regmap		*regmap_cr;
> @@ -196,6 +198,10 @@ static int phy_g12a_usb3_init(struct phy *phy)
>  	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
>  	int data, ret;
>  
> +	ret = reset_control_reset(priv->reset);
> +	if (ret)
> +		return ret;

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> +
>  	/* Switch PHY to USB3 */
>  	/* TODO figure out how to handle when PCIe was set in the bootloader */
>  	regmap_update_bits(priv->regmap, PHY_R0,
> @@ -272,24 +278,64 @@ static int phy_g12a_usb3_init(struct phy *phy)
>  	return 0;
>  }
>  
> -static int phy_g12a_usb3_pcie_init(struct phy *phy)
> +static int phy_g12a_usb3_pcie_power_on(struct phy *phy)
> +{
> +	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
> +
> +	if (priv->mode == PHY_TYPE_USB3)
> +		return 0;
> +
> +	regmap_update_bits(priv->regmap, PHY_R0,
> +			   PHY_R0_PCIE_POWER_STATE,
> +			   FIELD_PREP(PHY_R0_PCIE_POWER_STATE, 0x1c));
> +
> +	return 0;
> +}
> +
> +static int phy_g12a_usb3_pcie_power_off(struct phy *phy)
> +{
> +	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
> +
> +	if (priv->mode == PHY_TYPE_USB3)
> +		return 0;
> +
> +	regmap_update_bits(priv->regmap, PHY_R0,
> +			   PHY_R0_PCIE_POWER_STATE,
> +			   FIELD_PREP(PHY_R0_PCIE_POWER_STATE, 0x1d));
> +
> +	return 0;
> +}
> +
> +static int phy_g12a_usb3_pcie_reset(struct phy *phy)
>  {
>  	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
>  	int ret;
>  
> -	ret = reset_control_reset(priv->reset);
> +	if (priv->mode == PHY_TYPE_USB3)
> +		return 0;
> +
> +	ret = reset_control_assert(priv->reset);
>  	if (ret)
>  		return ret;
>  
> +	udelay(PCIE_RESET_DELAY);
> +
> +	ret = reset_control_deassert(priv->reset);
> +	if (ret)
> +		return ret;
> +
> +	udelay(PCIE_RESET_DELAY);
> +
> +	return 0;
> +}
> +
> +static int phy_g12a_usb3_pcie_init(struct phy *phy)
> +{
> +	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
> +
>  	if (priv->mode == PHY_TYPE_USB3)
>  		return phy_g12a_usb3_init(phy);
>  
> -	/* Power UP PCIE */
> -	/* TODO figure out when the bootloader has set USB3 mode before */
> -	regmap_update_bits(priv->regmap, PHY_R0,
> -			   PHY_R0_PCIE_POWER_STATE,
> -			   FIELD_PREP(PHY_R0_PCIE_POWER_STATE, 0x1c));
> -
>  	return 0;
>  }
>  
> @@ -297,7 +343,10 @@ static int phy_g12a_usb3_pcie_exit(struct phy *phy)
>  {
>  	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
>  
> -	return reset_control_reset(priv->reset);
> +	if (priv->mode == PHY_TYPE_USB3)
> +		return reset_control_reset(priv->reset);
> +
> +	return 0;
>  }
>  
>  static struct phy *phy_g12a_usb3_pcie_xlate(struct device *dev,
> @@ -326,6 +375,9 @@ static struct phy *phy_g12a_usb3_pcie_xlate(struct device *dev,
>  static const struct phy_ops phy_g12a_usb3_pcie_ops = {
>  	.init		= phy_g12a_usb3_pcie_init,
>  	.exit		= phy_g12a_usb3_pcie_exit,
> +	.power_on	= phy_g12a_usb3_pcie_power_on,
> +	.power_off	= phy_g12a_usb3_pcie_power_off,
> +	.reset		= phy_g12a_usb3_pcie_reset,
>  	.owner		= THIS_MODULE,
>  };
>  
> -- 
> 2.22.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
