Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12427C25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 19:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gqfjaVj2h+e5+ivUvm0iYVPYwWApTig6J6HLGV+lHw=; b=bEUOSS1pCGGrL3
	xOMdn8h2nMYy1jUs+TwFcn5PN7Ce65iFUxqzbYAS53EqtTSBPbP049NdgIhe6GITILy3/scMPfmgv
	gh2Ut3YWVHgtbnvP9o2IKffLJVQzckSq0aOoB/QUOUwx6dvWaf923cdisLafP8LpP9flzlaeAbBAa
	LC0VcyD8XlxtsdyCBgUJhD7RD1CFJtUbRk4vlWNOh57Y+S/q+a65+UPssECckD6nOkRJeQtRm3I5C
	aQTeH1m2Sua6sje5zHhTXqh4tl1IVYTIIPPRE4KuuPtuudDKeoH2M3vYQjGINcW2f1LVptlUrAivD
	A2oa5syl021LtZG1skww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9V6t-00000000tx1-3lJs;
	Tue, 21 May 2024 19:25:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9V6q-00000000tw5-0GrA;
	Tue, 21 May 2024 19:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZFRPG/s8Udv0lTg44aiXcb7QGspIA/wWM/HaBDg/rf0=; b=vRjQkKgGcgQ8JjB+noOjPk4YvA
	hNS7dUTomZslnzQzvqOklJZU7SP8WWxR63hLGSC1tqfepoehuvV1U/gRRNpWDz4lh2gCVwITQFtKu
	hO+U+omMCnpejxzzOw3itoUi7JIgQB9qr/COAKHRkky3tmBhTSpe+5UsBdsKYzbf3jx0wE4w8KQ/K
	Tuu4GQvfGh3xp3rCPIHNI1KYi6v4BqEcKqWGIM63pMHwo7ef+DlDuCZ2J06VfXGoNUF0xDWXwuf1f
	9aB0rK3gqCR5DBoT1dGWt8k+a/lTa9KlHZdLd5pyw/CYUPXRPoM+1IA+H5EM3xwC1vlUJdjRlERPh
	y9xNIX0A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49428)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s9V6Q-0002hi-1S;
	Tue, 21 May 2024 20:24:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s9V6Q-0005S3-5B; Tue, 21 May 2024 20:24:50 +0100
Date: Tue, 21 May 2024 20:24:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Da Xue <da@libre.computer>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stable <stable@vger.kernel.org>
Subject: Re: [PATCH] net: mdio: meson-gxl set 28th bit in eth_reg2
Message-ID: <Zkz1Au7njclh1r3g@shell.armlinux.org.uk>
References: <CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_122516_437093_3A3D29B7 
X-CRM114-Status: GOOD (  11.58  )
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

On Tue, May 21, 2024 at 02:56:45PM -0400, Da Xue wrote:
> @@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct
> gxl_mdio_mux *priv)
>   * The only constraint is that it must match the one in
>   * drivers/net/phy/meson-gxl.c to properly match the PHY.
>   */
> - writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
> + writel(REG2_RESERVED_28 | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
>          priv->regs + ETH_REG2);
> 
>   /* Enable the internal phy */

In addition to what Andrew said, you need to look at how you're sending
patches - this patch looks like it has been whitespace damaged, which
means it can't be applied.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
