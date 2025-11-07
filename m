Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976AECCF9F8
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Nov 2025 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfUMjVHNNN567E+d9GoDCvd5wt2acIye/KH5/KfvC1o=; b=NxSm28ApOkh/pc
	E4FZmm0CqnuJyqqslLIPT1/tQJQrbwjRZJy3X2CvLv2oABGw6dVA7Q7z9q4FHMBqydBaCVUtfVo/k
	HavkHEjYb58DqVwAwH98d6vB+J04BA6vbzNkltCf+T5SgCWzt+/xYC/Jxkzjeqbyysi4cPTPpYyTk
	jwYabkyD1lKxixjfYJV+VVNpsvBwVSVaM1upTtmXnc8Y5eAcsTxrMzl+8g7GZcCruuZAfwZtkda2m
	MSt50WXI9uJ1deDRuYyKZlG+vnYgwn8K661udeJBMjtHaT6l1utj/tCkUxu83qbHj3n8EVNJn8ID5
	+obl+hQbzlxKX+l77w7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOtG-000000002b6-0YHQ;
	Fri, 07 Nov 2025 16:00:42 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOtC-000000002ZJ-3HyU
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Nov 2025 16:00:41 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b729a941e35so107948666b.3
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 08:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531236; x=1763136036;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkBMuEFYniV7o/NZEZ9uUf/PpOYiog+if+0C8Zohm+8=;
        b=QoDETvRJmb/+jyEefYjQgICodDtY6nUEpAfbowULEk7/x6n/9y7O2hA1i7LsEo70ra
         BlDDWq0Terojj6bY0O3RE0pcaRQCN4ePxzdhu8GjoYFWWaYzU6f8hAP3ujiW8WKdxHt/
         qT2+0tbIph573PjOUpwpgE4mtHqH0D9K1UJbg/a0wzFniBEXv+ksOT39QG7X8FNG+mYO
         TX3J63jbqwsLpC8u2Hq0kMlNKAWGkV0Vq4axlphKBaDzIUtkPgcOsuGYkqqBPRfNvD3M
         5QVu0u1RhGK/T4DBFgDZBSbULWkQBYsc2uxFIIf7xlHr4jgKrcjhB62kc/2QWn8NcO/I
         lX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG3S9Q/JnIYVo1+SnFrvBw/Gxasr9rJb5bYJ/0U8cGXJ9yN3AggzSKuk1uhhUcC973Tbe62vc4rLod1VHo@lists.infradead.org
X-Gm-Message-State: AOJu0YzIUDCcunDTyjkJ2TYcV5PJqGqHSV6w+jaNh/rMC+smnCm4+hgA
	nSg9tmr8tNUXMV754jlBjX1jOmw0fUaa4cKYkYWhp7o9i/CQfH05IpOujamdSHZpLIpFNQIEI03
	9hUo/p4lkKcgzYsEH8yafWqcb2GidsB8=
X-Gm-Gg: ASbGncudPgOP/9grPQPwexYIaF1YvPMHBizxIOETTHSL5hMFgLhMsZChrqA1vt7/bKQ
	eheYTrFy6Oiw601619AfuZQU8bwNdVw2REA16LXCqyc6BJRdmVlCwx6+uJsbHBMctlYxIsR1WAO
	r38A4lcFk5w7wmXPf6GgMieOe3tjY8e2OOoJ8joZj522BJTW3eSfsWpJ5LPwxQRZs/H7P6E0Gmd
	BZq+wvMvZbS1JOu3io1Wb+OOUP8LtLCVrbNMgcGtKlKM9NAaRnrfarUGJGormy+YwIBpD+fQL2N
	w3GM3lMz9yoPIyJ/Qw==
X-Google-Smtp-Source: AGHT+IFOoHBXH/PzewtzvKKUtM610X3TQ1SmT9FLvQyuUDuxyBy4OLhIMpEqweiHRkcJBKlSnsBceRB/zJjkJgVr+9A=
X-Received: by 2002:a17:906:f582:b0:b70:a9fd:1170 with SMTP id
 a640c23a62f3a-b72c0eef5bfmr340953066b.65.1762531236039; Fri, 07 Nov 2025
 08:00:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 11:00:35 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 11:00:35 -0500
MIME-Version: 1.0
In-Reply-To: <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <kernel@esmil.dk>
User-Agent: alot/0.0.0
Date: Fri, 7 Nov 2025 11:00:35 -0500
X-Gm-Features: AWmQ_bnSZQW08h0NXQTG6zSRGIlnDRSY70b9JlHXkxjmDNLgOFrMa4uAbMmEPzM
Message-ID: <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
Subject: Re: [PATCH net-next 11/16] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_080038_830123_F5B11876 
X-CRM114-Status: GOOD (  10.99  )
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

Quoting Russell King (Oracle) (2025-11-07 15:28:55)
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 22 +++++--------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 1ef72576c6f1..00078b7a6486 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -35,25 +35,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>         struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
>         struct regmap *regmap;
>         unsigned int args[2];
> -       unsigned int mode;
> +       int phy_intf_sel;
>         int err;
>
> -       switch (plat_dat->phy_interface) {
> -       case PHY_INTERFACE_MODE_RMII:
> -               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
> -               break;
> -
> -       case PHY_INTERFACE_MODE_RGMII:
> -       case PHY_INTERFACE_MODE_RGMII_ID:
> -       case PHY_INTERFACE_MODE_RGMII_RXID:
> -       case PHY_INTERFACE_MODE_RGMII_TXID:
> -               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
> -               break;

After these two patches the STARFIVE_DWMAC_PHY_INFT_RMII and ..RGMII macros are
left unused. Maybe just squash the patches and remove the definitions?

/Emil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
