Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B68C0032E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Oct 2023 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElgwRr/9Vy/7jdmvU2ZgnXWcq3fcEyHJw8C9IoyUFKM=; b=j0tqSHQ474TBB+
	pEdQ4IaZrQnT8KsxwqztqJ7aOj3VdsJp16pohOR/ApZcfNs2yGDwQX7I/pAETpSzYytZKRV2ypa5o
	ejl1ObF+KXzKGRdWzL4sJB6jxWcTjmapHAHf4agZek2J32/2A54hQOw3L/8vKb7/V7ZlHJdY+5oQI
	O1PhlRFkHgo6PA4CiNtg5PlGIGyRYyhUaoiIhmmYeCA5BtzqJlUCouxDm9ZXan2rFQjjDlYWPR75w
	sEJxTECmEmHGiJ0dKhNKm5HAsQAfg8Y8Slzs9eYJdkYDd0Zc5SweV7xxoupb8bIPBHTE+JcTMF4if
	FiKae/0qFvSfH22UnpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpgm-002O13-1U;
	Fri, 20 Oct 2023 13:37:20 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpge-002Nyk-23
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Oct 2023 13:37:17 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c50cd16f3bso11833911fa.2
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Oct 2023 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697809029; x=1698413829; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=s/4QVz4WiRPPNhmC81yxFrG4Euma7o0q2x66+hnNm/A=;
        b=LCFqWaMufreoW4M4+c7BaUjJiGhZg5Txlre8cM8M+snv0Km3rlyUZTAxqY4G2Qbpv/
         7FRaU/x6ngl+ucTf/tEUVMphTaB5+kAKgXeyzPuXwQQxZ6CsOVW62YgX3Ohz3GQPnGbI
         Gn8a2CvZrLNulyXu3nYQYlSGyVGjCcOUeQUq1ZHBbHb+4i+v0mYs4NaNamsAJyLaJFTe
         1ohMYNV+WRnnX66QshRZ6Xxy7bL01kLuGC2smiFA8PG2hiTVOGssrEkaGqpQaqsvnXAa
         sV/Vf9BubJ73s4QbJrrRjB1yov6wuUru+F6+GuNEgow8JXUahYpnh3XrQVQUR1gN/dNZ
         KPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809029; x=1698413829;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/4QVz4WiRPPNhmC81yxFrG4Euma7o0q2x66+hnNm/A=;
        b=exMcI+RSjUjMyn/z7hXv+9eW9dY6OH4MxYs3bJQ+44V7BnO45yMPjFwgMR8Spx5SnB
         WW8CSQiRIMFe5J5+HSvct++T/c/9sc5cSJSXX96rdN3Y4yoUnN4SUEau3SGhtluWA9yW
         tNxsFAl682lyAfjO9JN/Efm3/JfWLZPv87r4IP61+IhRA9ZyDW1c+apRi9LuehvKyfEk
         3TekiapLbc20Ch+uXCDHWZyNUW6h8taydjfIVfll5SRXILOCHOzWMi+8SmI+0MwOZlQS
         KGvrWTNYCidh1Oe5ZP8svGLby82p2Nn77/ABheaPeyFu5tECDgNYbd9Ok9E9ScOSudB9
         9WLg==
X-Gm-Message-State: AOJu0YzYUJnU4TyKV3gZCIpemrwJKDnE87cvosAm1Iw8OZQWQIuiF0f6
	o0nTwlvsmzlq37QmQtZlKXIPZQ==
X-Google-Smtp-Source: AGHT+IGN1aOFa5F/gq7N/SrwpyCQAbL/TaKgscRZTpTwJE4H9XiEkid4VycqErwR3y57xfWxRRKmbA==
X-Received: by 2002:a2e:a4cb:0:b0:2c5:55a:b6b5 with SMTP id p11-20020a2ea4cb000000b002c5055ab6b5mr1245550ljm.28.1697809029076;
        Fri, 20 Oct 2023 06:37:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f548:bdfb:ed67:dbbd])
        by smtp.gmail.com with ESMTPSA id e7-20020a05600c218700b00407efbc4361sm6958098wme.9.2023.10.20.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:37:08 -0700 (PDT)
References: <20231020132036.1181762-1-arnd@kernel.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Yu
 Tu <yu.tu@amlogic.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: S4: select CONFIG_COMMON_CLK_MESON_CLKC_UTILS
Date: Fri, 20 Oct 2023 15:35:25 +0200
In-reply-to: <20231020132036.1181762-1-arnd@kernel.org>
Message-ID: <1jmswds9dn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_063712_938045_33433D34 
X-CRM114-Status: GOOD (  13.15  )
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


On Fri 20 Oct 2023 at 15:19, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Without this, the newly added driver fails to link:
>
> aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
> s4-pll.c:(.text+0x13c): undefined reference to `meson_clk_hw_get'
>
> Fixes: e787c9c55edad ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/meson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index c5303e4c16043..3c28560b0faba 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -149,6 +149,7 @@ config COMMON_CLK_S4_PLL
>  	tristate "S4 SoC PLL clock controllers support"
>  	depends on ARM64
>  	default y
> +	select COMMON_CLK_MESON_CLKC_UTILS
>  	select COMMON_CLK_MESON_MPLL
>  	select COMMON_CLK_MESON_PLL
>  	select COMMON_CLK_MESON_REGMAP

Thx Arnd and sorry about this.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Stephen, do you mind taking this directly ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
