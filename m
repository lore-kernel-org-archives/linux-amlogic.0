Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67835ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkOFVgA0I6Gfb/Mf4Vy1DMuJNDLJYlpONk8Rq8igGUM=; b=V4sXNisRHd7gIh
	Dm/4y6bf54zy69FIxwGpZUPUOzLUsFsOwjh4eK7Hne0ElPVTyWNSPYqK7s2VBQj4Srg7/oDXt6Tmr
	/q9EQQ/uUrxWI/KTSMGJVwPbJYGETD6ch0nhguXAVjFoEwFJguSnQR/8JgX6mjz2Vki9oLptVFHAZ
	7y0cP4x//GGl159wB1gtUxUmVddyGgdTqBvxgE9cycEY44FDTvZekQs03aavteNEZphhufEvVA6Iu
	zCgq9z+HKRBL8i9xfQ9hvmJE3JIie/jKL/wysXo25hNtCYQylLhOD15hM5kUN0X2RsvkiI9k1gob3
	WByAhFciJUyxndOraI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbWO-0072M2-1L; Mon, 29 Aug 2022 09:57:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbWJ-0072Fs-GQ
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 09:57:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id b5so9477745wrr.5
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 02:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc;
        bh=W/wb4+5X5ScQArKn4kh2p9wnfAhIxnpSatlHXwMeb8E=;
        b=q2Mc8dJ2li6OvlIX1H7ViuURhL1UVGJXT810KqQL3AKPdpF8iTKrf8hfx60LdReR5f
         6FEiOifps19HcD0zmS1f6JVbkeNOuWf5AO5gECTd8ughKv+2zZJU9a1iCwLs83O0cEwN
         ah91xVDHWhMYzuITCwzFjQlKP4FloZE3Xc0C11Qy7Sy1AY+ER9Ax+fMHfsJlXvkVkw2n
         fTm1z4TNsCp4KgaTxuTeNeamcXDLBqLRn7kk6i4oMDAEQjAeGk4iD4Qj7/2oG+5A++4Y
         Cwej6fu11Yz4b/kGX/V0WvE4UwA6/BGvIFwWumhV66ruKL6eMGUrtUUkud8c8v93NdJU
         BMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc;
        bh=W/wb4+5X5ScQArKn4kh2p9wnfAhIxnpSatlHXwMeb8E=;
        b=BQ81KX9dw94j8OHZmgjVWBBY0DPCUufTO4bvDDdcWsTj815Ozl0mRjREsBSsmxoYmP
         oOKjDOF51SK3d4xM8z8zztP8/GNwSzq5FmhwMIokdNDhkjmXbQL8iY77bzpIHRL57dhv
         FYjgwQB5KN4Q1ApObvZ7rU5QFt/X2nqGwk0x7W8Ib81kRBV0OdABtEH5TakC7ZQEfK5v
         880K0plDc/DI/3AuLlKOoLuDLx3vPJ//uCMocNqx6+bqIzbjnfnEBhHxqB5ZOiwIc7Zl
         DZq2NWIVMB/xRCtKXIhTc4nIMFg8gbxoZ4NxSUJBgGYM1Bpw76BxYyJ+fnh5CJ5zs/Lz
         QCVg==
X-Gm-Message-State: ACgBeo2MpnzV++VZXqK3K+awrQqMh3rD+OM8hOPDJ3rIz4is7csSqnVo
	9N1fMTfwPwe3aYfu4uc4rV+j4w==
X-Google-Smtp-Source: AA6agR6VLUFIg2m+d+eX2ZgwPDynA6glHGDACuRb2JIEf+lKOtbQEBVmCnUGBmt7RUbyTWFF3PlEiQ==
X-Received: by 2002:a5d:6b44:0:b0:225:fbb:678e with SMTP id x4-20020a5d6b44000000b002250fbb678emr6018310wrw.482.1661767046058;
        Mon, 29 Aug 2022 02:57:26 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r6-20020a5d4946000000b00226d2462b32sm5663675wrs.52.2022.08.29.02.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:57:25 -0700 (PDT)
References: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu
 <yu.tu@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND] clk: meson: pll: copy retry workaround from
 vendor driver
Date: Mon, 29 Aug 2022 11:54:06 +0200
In-reply-to: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
Message-ID: <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_025727_853639_9AFD1962 
X-CRM114-Status: GOOD (  16.80  )
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


On Sun 14 Aug 2022 at 23:25, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On a S905X4-based system this call fails randomly.
> The vendor driver has a retry mechanism and on my system
> the second attempt is successful always.
>

This reason looks a bit weak to me.
I'd like AML team to comment on this PLL problem as I suspect it might
relate to other PLL we have been seeing

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/clk/meson/clk-pll.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 9e55617bc..daa025b6d 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  
>  static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>  {
> -	meson_clk_pll_init(hw);
> +	int retries = 10;
>  
> -	if (meson_clk_pll_wait_lock(hw))
> -		return -EIO;
> +	do {
> +		meson_clk_pll_init(hw);
> +		if (!meson_clk_pll_wait_lock(hw))
> +			return 0;
> +		pr_info("Retry enabling PCIe PLL clock\n");
> +	} while (--retries);
>  
> -	return 0;
> +	return -EIO;
>  }
>  
>  static int meson_clk_pll_enable(struct clk_hw *hw)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
