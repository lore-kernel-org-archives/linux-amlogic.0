Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9C1C3600C
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKjA/1g81GRqVYsTiQHQsf+gUbgvEZcmB4JbOoqKy+U=; b=v2bcIT4bmBHakD
	ZunKTgfEsH3uwq5WQnzO9c1M8GXcELzVXl6LYgX3tM3TT+tAuobV7xq7LcUR6Dw8xhRSq2jEfu9QT
	nafAAasbVYhVb69Vu4iRHX/N06DFabS5VSapBGe4G9x+d6CgI4QOQnk20hNpQ8Kjtx6PBg9nhAI39
	Jpg4DMk8dvt9HN8gms8G/hS0gNdWRFuiBYmMH1Kk7OfZmwRFi170Nz4hAXQ/3OF+IjP81DDvxoJKu
	ovnAN/hbAvStFi+jr3HvFR7s1i2GjT9Kz6tE25KAfH8c8H9jNm64kUDqzGG3364Atka2UW0K2B74X
	GcaRtVSUFdaSjqK9tPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFSD-00000000TaX-0lYj;
	Mon, 31 Mar 2025 13:45:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFQU-00000000TRe-2s6P;
	Mon, 31 Mar 2025 13:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zAr+PsQ5oZEISZvL8CyPCWlvx2E0ZRGXrPFMppbVz7U=; b=WiFvSyC7/ScDVRJ6zoDc9cDal6
	136PUf+tWUGT11nU5oDrivLxmYukJvwijogZoCf3NhGt3fAhMVripY33CcaZvnqjBwx3a2DaljT+g
	WcXPwFOc9lISrR9zSDSeyIHKBt1LATOY+Kp3ddT1BK6epTdRrinN4EWCtyPvK+W8SudY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tzFQE-007a4C-Ux; Mon, 31 Mar 2025 15:43:26 +0200
Date: Mon, 31 Mar 2025 15:43:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Da Xue <da@libre.computer>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
Message-ID: <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch>
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250331074420.3443748-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_064342_722761_9603FB66 
X-CRM114-Status: GOOD (  17.83  )
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

On Mon, Mar 31, 2025 at 07:44:20AM +0000, Christian Hewitt wrote:
> From: Da Xue <da@libre.computer>
> 
> This bit is necessary to enable packets on the interface. Without this
> bit set, ethernet behaves as if it is working, but no activity occurs.
> 
> The vendor SDK sets this bit along with the PHY_ID bits. U-boot also
> sets this bit, but if u-boot is not compiled with networking support
> the interface will not work.
> 
> Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
> Signed-off-by: Da Xue <da@libre.computer>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Resending on behalf of Da Xue who has email sending issues.
> Changes since v1 [0]:
> - Remove blank line between Fixes and SoB tags
> - Submit without mail server mangling the patch
> - Minor tweaks to subject line and commit message
> - CC to stable@vger.kernel.org
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/patch/CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com/
> 
>  drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
> index 00c66240136b..fc5883387718 100644
> --- a/drivers/net/mdio/mdio-mux-meson-gxl.c
> +++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
> @@ -17,6 +17,7 @@
>  #define  REG2_LEDACT		GENMASK(23, 22)
>  #define  REG2_LEDLINK		GENMASK(25, 24)
>  #define  REG2_DIV4SEL		BIT(27)
> +#define  REG2_RESERVED_28	BIT(28)

It must have some meaning, it cannot be reserved. So lets try to find
a better name.

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
