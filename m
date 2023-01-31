Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155B4C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Jan 2023 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qp5rEMncoNohsxR6mO6PErFX4v88QEmEiskYb3m57k=; b=reuWcgAqJ5Ma2t
	dz+HIfJVA8WcZI7fqjAgwcQZSUMmNMnsB1/pXYFzVcUEvZuwjwAozDR3KNirokRyXrvPQwVXx2nOh
	9B8ssc1V3+CI5rfQGy74YYSl6ZHDjdJWb2sk/2PiKLvy3jnTBFzwLjStdnNsZmn/Q4NnfmSwruEFR
	5eLb+2m05VTG9YF8+0g5ayfnr4vhXEXhxj0xxdLAv3dXsDoBwxNpLrnwF7iA5b1gX0gGLq0gx7vJb
	uxcyoCRLznU2TDXftr5wR+mUb5Wz5u0CumQYgzv8qy6UJT6bChSc24HY2CwlICVDQEIrT2DFUjh+3
	diLwiqylt+AIMWD5zZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnzl-007Skb-32; Tue, 31 Jan 2023 10:36:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnao-007HkL-7w
	for linux-amlogic@lists.infradead.org; Tue, 31 Jan 2023 10:10:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso5183855wms.5
        for <linux-amlogic@lists.infradead.org>; Tue, 31 Jan 2023 02:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=7CdDpf2HvFlRQpQEy8BTNgrbPxxoMvWAhrZNxv0ihbw=;
        b=EsczMRY9pPKBmk0Uoa90CyuZBNr/wmbe8DL6DdmUKyhg9uT4jfKKwFFR/eXjWogSyS
         byyQ2TmNEFYrdw1gNOTj7au/GibHuX4b+usuQwoqP6zJAWmiUzHxrBvlJ+jBw1DIrYsv
         SNHCXPqB+idCsnYL+8IZqYaSe2HFxMEt+coR3oQHHEMG71Fob8ex995m6rbqdBo1DWBd
         F0h68k2qzLM3JMl+LoAUaN95pSRayhCLxjsWv+biSmsBzwzWGbZY6UmSungwu9YTmLwU
         kwrcT8DFMIOeGI0jbMWklUnyGTdbv6mukyK/4883jkLf5dpBeCGLnipNcMAgIa6Dkezd
         ldcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CdDpf2HvFlRQpQEy8BTNgrbPxxoMvWAhrZNxv0ihbw=;
        b=d2NSQZqBtDBdZ0s+fRfT5yHHUuRBqGwOH+FiOpGFrsN6qadaIQ/Q3YzL5XYq9KrxpU
         Cpq11P6NYrtSogy8ZhmVunFYnPTQ3Xdj5zJULoBEVWrlitak0MgsvHNx2PSgNsM8/bb+
         LqjOKGaGObfAaAF6q485FY6OrzkNf13YNgRwfcDqG3Z2vXRI3SoGi9G1v9tqy9UiIkuT
         6KmY1ohMabPJAlH1GPcdDHwVC8xOol+ZYP9xfwXg93MD0TQg89fl4Ep1KfotlamBxnvw
         5osGl5BPNJSQlOpjlqWDXOmGY3nSKECJweaCDJZd+ku9Sfoh9xNHbUjsGKQldd9i5Klq
         yl8g==
X-Gm-Message-State: AFqh2koCpManGpXMRiQyq1N10sr6cF/DodLceNPo+gHYbeNzDUTA1XOw
	/GbjzxeV87ANUErdXNHtaljBjA==
X-Google-Smtp-Source: AMrXdXthUNPuxugLmFyr20OmcGU3scVtN6peVaj9WzwNmFTstwv/1P+9kRFJRaBdgp4jtqclwOZUvw==
X-Received: by 2002:a05:600c:539b:b0:3da:1bb0:4d78 with SMTP id hg27-20020a05600c539b00b003da1bb04d78mr50940932wmb.14.1675159818451;
        Tue, 31 Jan 2023 02:10:18 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c4d0900b003dc54eef495sm7097981wmp.24.2023.01.31.02.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 02:10:17 -0800 (PST)
References: <20230130231402.471493-1-cphealy@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: cphealy@gmail.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, neil.armstrong@linaro.org,
 khilman@baylibre.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, jeremy.wang@amlogic.com
Cc: Chris Healy <healych@amazon.com>
Subject: Re: [PATCH v3] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
Date: Tue, 31 Jan 2023 11:05:19 +0100
In-reply-to: <20230130231402.471493-1-cphealy@gmail.com>
Message-ID: <1jbkmf2ewn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_021022_524151_86BFB0CD 
X-CRM114-Status: GOOD (  16.59  )
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


On Mon 30 Jan 2023 at 15:14, Chris Healy <cphealy@gmail.com> wrote:

> From: Chris Healy <healych@amazon.com>
>
> The Meson G12A Internal PHY does not support standard IEEE MMD extended
> register access, therefore add generic dummy stubs to fail the read and
> write MMD calls. This is necessary to prevent the core PHY code from
> erroneously believing that EEE is supported by this PHY even though this
> PHY does not support EEE, as MMD register access returns all FFFFs.

This is definitely something that should be done, Thx !

>
> Fixes: 5c3407abb338 ("net: phy: meson-gxl: add g12a support")

This commit does not seems appropriate, especially since only the GXL ops
are changed, not the g12a variant.

This brings a 2nd point, any reason for not changing the g12 variant ?
I'm fairly confident it does support EEE either.

> Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Chris Healy <healych@amazon.com>
>
> ---
>
> Changes in v3:
> * Add reviewed-by
> Change in v2:
> * Add fixes tag
>
>  drivers/net/phy/meson-gxl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index c49062ad72c6..5e41658b1e2f 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -271,6 +271,8 @@ static struct phy_driver meson_gxl_phy[] = {
>  		.handle_interrupt = meson_gxl_handle_interrupt,
>  		.suspend        = genphy_suspend,
>  		.resume         = genphy_resume,
> +		.read_mmd	= genphy_read_mmd_unsupported,
> +		.write_mmd	= genphy_write_mmd_unsupported,
>  	},
>  };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
