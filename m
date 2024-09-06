Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00652CE7AB8
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDiap7pm7C78GglgCBUNxTNTfpKpq82ZykeL8yKk6Dk=; b=l+INRXnN5D3MjV
	qdvWR/1B6TDE7RaQldU2v6a03EHfbhu4N2S0MwEcSuowCQKcQ3l9B9Q4UdWSLTmtd3wUfMelAZfaf
	sVAaFdKqYBhO+xf+/6T3Fj06sV0CpfjKy7QrFhjrA9DEE+5NO3FNUSthJbjCPtNG3UaKhNQ78FTpC
	yKiHZMTR7/X+WVJyvFALrWbo8PlU8AhVZbFY7F/Ekr1ADuGfA+UBZPjdd47rBZHyDzkIHnBFvpmh4
	BDH9BT9lvefhHLuTK4bIQHm5Xn3m4zzpbCtuCLTAhLMqsz3YhbUAwcBfJTyLuuIPAmwXs5w07f+lV
	lVEmdvepwtfKNr1ik47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smT4K-0000000B1De-1WcI;
	Fri, 06 Sep 2024 07:07:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smSvL-0000000AySs-11H1
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 06:58:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42bbe908380so13017395e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 23:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725605905; x=1726210705; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix3H5f1VUNP2HoArupSCtbBV1RYMrnCibJgmIW2VIQA=;
        b=3GGGp3GdT4p842IqEVWIySKnBHPWqjkOMPfjudj56FAUNgZX1mF/dODjfCWVlsVqaM
         t/EnD6CHIS/DMCuWBZVZn4V9VQ54xUKxRSW+pKiS4BEq4UK3c1dg1H9wspxgcTvsGRFy
         akR+Cfz4Rouo1cUNAWGovlllTLZ7RSumGWkbKupm0qkWg7im5+iI7UYsdb4C9llTFEId
         MlBfjFM+fWZY9LjuvDxEOSYs1PwM3w4rMHAF7l8bTwKck3YBB+HkLk9QFe0Fhbi3yRUb
         9lI5Oe2wQghUhq3vRiChPmZYgqSKP+QNWfeXej2dEmHmLHR7VM+c5+g9L9BUf1D3VgOZ
         focw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605905; x=1726210705;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix3H5f1VUNP2HoArupSCtbBV1RYMrnCibJgmIW2VIQA=;
        b=ZfDDvMRieniPQwjEI7ndDSfpxdDx2E22Sv/X5kKkueIIOeGR3VZid3sGYYJ8zy5oqu
         GW5HQdm5kEigIFA0y8+YRPzn5YBt6+t8bOv5NpX5U6GV6l45Fe2rXVYznc6dZVbFI5ms
         z/534hvw13oECqsq6rrMkeI54NvqqwLUepT2jTyWFDvuroQXcpGlhfxpwdVsO8rTI59C
         WieG6kmamH6uxXq6hv4ImSLGdlLhn9bsI8NbvYg9c5oOkllkB1sMWJikaaghJwtf68iR
         Ek5rf9JHwYwlGHAwMXiiY7vBklYzBZwD0z3D0KWg9ViO5BMNDiCBW74hQ3KGnKk1z/qb
         /8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUHCF5VWBWkl0t9R7GNqNzU7CKRa6cs5pQEwgDY54jx/E1+jnFf6xdnjX76UIkBC29KB32Zs5Oe0+bm6Qr3@lists.infradead.org
X-Gm-Message-State: AOJu0YzLp+nViLV673/H2Hv+aNLNFLWXZrV+ycXoa1ttBfnbchU9qCLt
	mY0TMKqstcu3O1FRIZhrcdT6iRyC5xxU8nQHTC5QrWZ2TY9tVGcJ+Z2I6rH1YKk=
X-Google-Smtp-Source: AGHT+IGRqDKkE0IR4DNooBH1qA1IUgx6jQLK/m12iWtXvY9LxpMhMFNXKtqOkdjlNyX16vc5mNGEBw==
X-Received: by 2002:a05:6000:507:b0:368:41bd:149b with SMTP id ffacd0b85a97d-37889612a68mr849398f8f.34.1725605905322;
        Thu, 05 Sep 2024 23:58:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b9859486sm17815559f8f.111.2024.09.05.23.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:58:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: meson: s4: pll: hifi_pll support fractional
 multiplier
In-Reply-To: <20240906-fix_clk-v1-3-2977ef0d72e7@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 13:52:35 +0800")
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
	<20240906-fix_clk-v1-3-2977ef0d72e7@amlogic.com>
Date: Fri, 06 Sep 2024 08:58:24 +0200
Message-ID: <1jttetqne7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_235827_310304_392CBE97 
X-CRM114-Status: GOOD (  17.36  )
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

On Fri 06 Sep 2024 at 13:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> The s4's hifi_pll supports a fractional frequency multiplier, but frac
> parameters are not configured in the driver.

That should probably have been sent separately.
It's about frac, yes, but it has nothing to do with the issue described
in the cover letter.

>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/s4-pll.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index b0258933fb9d..a97e19057b05 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -329,7 +329,6 @@ static struct clk_regmap s4_gp0_pll = {
>   * Internal hifi pll emulation configuration parameters
>   */
>  static const struct reg_sequence s4_hifi_init_regs[] = {
> -	{ .reg = ANACTRL_HIFIPLL_CTRL1,	.def = 0x00010e56 },
>  	{ .reg = ANACTRL_HIFIPLL_CTRL2,	.def = 0x00000000 },
>  	{ .reg = ANACTRL_HIFIPLL_CTRL3,	.def = 0x6a285c00 },
>  	{ .reg = ANACTRL_HIFIPLL_CTRL4,	.def = 0x65771290 },
> @@ -354,6 +353,11 @@ static struct clk_regmap s4_hifi_pll_dco = {
>  			.shift   = 10,
>  			.width   = 5,
>  		},
> +		.frac = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
>  		.l = {
>  			.reg_off = ANACTRL_HIFIPLL_CTRL0,
>  			.shift   = 31,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
