Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A34C38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQ4ML5I24MMo/rPwoi2xAyPcXTURCYRGqahEGzGWv3o=; b=uIVsW4Yv/Mld30
	zFTqi0ZRyvqi+sDxEh4xiap9HSQMKg6A4iJQHSmV5vBaz3zzHHZSOqIQ5IxbXPs/klLIQqlI8Ghk5
	AA1uyqsrHwKBIU/iJ2vAvYCpROIDeH3vyQWNk/3rNKEnV6oNDCE202dEx6wMb+ss3wrtNLqj/XDz4
	xAO5h/9jdwnDL+chiZcu8U6Pqm6WI0/GuR/gWoKfxKG4znA3pBz+NoHLFWCJGyM7bI01FHIoRa7Qr
	7WM0JlWPZW59CKSM7a3OmhtCZcL6u5dgMbwivTCRJByrXBqWCaWyDH653pqV5CTbvkgmaJbI6jWQd
	qTPhLacR53/+Qieq8X/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJy8Q-0001yU-VU; Mon, 23 Jan 2023 14:49:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJy8N-0001wW-Dp
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 14:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ia7/ZP4bXCGrUTRpWB18mfOkIKozBHuhD3EIMORkx0k=; b=O8/XFVt31/zl9ZjV9ewgaMejPj
	tJXOTjslf7VsJmQb1vGgqrFQ0fDtlRb7SnsYIFgwyyWbKGWTzLTIr8iaUBMjaxcnEAjAKrW5A/+Ef
	YnBBvYGofuKK68Ab9veSREz/D4SmLwzcqTsFGTrEFyXDzk/Uu7MoYtyHyN+2asjHtDNU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pJy8F-002urF-MU; Mon, 23 Jan 2023 15:49:11 +0100
Date: Mon, 23 Jan 2023 15:49:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Qi Duan <qi.duan@amlogic.com>
Subject: Re: [PATCH net] net: mdio-mux-meson-g12a: force internal PHY off on
 mux switch
Message-ID: <Y86eZwWbhjNwrd76@lunn.ch>
References: <20230123135037.195157-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230123135037.195157-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_064919_504946_B17EBE76 
X-CRM114-Status: GOOD (  14.85  )
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

On Mon, Jan 23, 2023 at 02:50:37PM +0100, Jerome Brunet wrote:
> Force the internal PHY off then on when switching to the internal path.
> This fixes problems where the PHY ID is not properly set.
> 
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Suggested-by: Qi Duan <qi.duan@amlogic.com>
> Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
> The initial discussion about this change can be found here:
> https://lore.kernel.org/all/1j4jslwen5.fsf@starbuckisacylon.baylibre.com/
> 
>  drivers/net/mdio/mdio-mux-meson-g12a.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/mdio-mux-meson-g12a.c
> index 4a2e94faf57e..da61f00a6666 100644
> --- a/drivers/net/mdio/mdio-mux-meson-g12a.c
> +++ b/drivers/net/mdio/mdio-mux-meson-g12a.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/delay.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
> @@ -151,6 +152,7 @@ static const struct clk_ops g12a_ephy_pll_ops = {
>  static int g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
>  {
>  	int ret;
> +	u32 value;

Reverse Christmas tree please. Longest first, shortest last.

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
