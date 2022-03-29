Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F51EC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 08:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaxxt3dt7wrr1WkMOVj6zv7JWyKUEGCeoMEXag42Wxs=; b=SmiL7QHemA7vwr
	L2dIDNYFywyP11qZaeNqncUDSx6JZJbUvoVHKbTIfFPy1/JVv1JSqw3A8zaFHUKr7H9f03IBhsWu5
	jknAD/4HST6WdtPCtWI/HB/R8Vj51HZHXq5aH55PxmAN/5ilZLf9EcbJlUIJ3POlF2qIKFv0cWRkm
	cBUjIjyvoAFuGOEQjv4wW7icYVMD/BJdPi4LQ+ozD21z3/daorsfoV7LwVIDlAhvXoiIj6D27/MAj
	senRf+gQrWC7LcFQxlyCgMR/ll6HSgV305GN2yKE+5USE1S2eNS1bxcu8kcmcm/ZuERW+nyIqSYcc
	q8JEas8ui8Oxrhsa1jOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ79G-00BSTX-OJ; Tue, 29 Mar 2022 08:24:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ79D-00BSSa-Cz
 for linux-amlogic@lists.infradead.org; Tue, 29 Mar 2022 08:24:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id r7so22518237wrc.0
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Mar 2022 01:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=4q7utA2N5uBdT/Hk7/7TmYG0IOBace6qzAeWlAkbf9o=;
 b=1CpE15dMw2nEkW4YYCMic9aIKN2w3BNoDfSIkhBuAqCEEzczO2Y6fdOfXW+XelLTAQ
 A7SdjqBc4nxPzuMKdFd6vSMl88516biNL7AhFjZIpwaFRyBqAegNsblBNLlF/Rjmh4+k
 TjeLLdIUxio9O2iohXtFhvi2sTzYoZTU6HfRyUHmk+sYvImqH+oMggNAoVV0R7FsUE44
 npiH/sfKMS/F5I7QcO6RvJiM538xhyb6SEVfA2GHJVOyK/cb293haK2W8D5xbuOtBYiD
 gCOn3lZgrE2no/rDri5oQCiz8jZuyRFRL+lRphFsdaAp1WczDBU4ecRlplWu+7Eh+wiE
 lFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=4q7utA2N5uBdT/Hk7/7TmYG0IOBace6qzAeWlAkbf9o=;
 b=qKXrXKHrRHkq/1VqE8WxQ+B/YUCLnNkbGgrsaokVtQa2a+9jab6c+wCUw8ealaPU75
 ITU4qIFvlhGXaf5HC+C2Ff/1SW6Td5GdUBNBHzIHPcG+aOB3/dNBOp1KVrT8XF9JyhUz
 Aim38VoRylO9cNk/YfXOYeM8vRqx6mqZH450VQsqH6BV6RyEXI0uIKu03RPLiyxmS87S
 3zyRVM/dUoKh2gvf5tHzT2QPm4wn3QkAhTfqSzg0tXRGLoqh+RKoCfPXsl95/5HFsa33
 RX8ceIXnVOxOLaXmvdNu4tZGDxbxwt4qSgV2Gm7dOh6AAdlDPkE/Z2ucK1Uz0LbPadtu
 QtYg==
X-Gm-Message-State: AOAM532JE+5ka2zK4lSZw3ZoQqJiLIQL7PvB0JIRdSsg735zzcINTRIs
 nvfdUrakgqLDhvRASA8hH9ya3Q==
X-Google-Smtp-Source: ABdhPJzKxD/KLU6iWPF6ZxbUV+9xxFwOzMdCAGFHX4ig6YXgf4XhA3i6zqnXEY8LtnifQ8Zuyx/LWQ==
X-Received: by 2002:a05:6000:1568:b0:1f0:250a:d3ef with SMTP id
 8-20020a056000156800b001f0250ad3efmr7916035wrz.402.1648542253218; 
 Tue, 29 Mar 2022 01:24:13 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0038cba2f88c0sm2000306wms.26.2022.03.29.01.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:24:12 -0700 (PDT)
References: <20220329060821.15251-1-qianggui.song@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Qianggui Song <qianggui.song@amlogic.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: meson: fix unused variable warning
Date: Tue, 29 Mar 2022 10:21:42 +0200
In-reply-to: <20220329060821.15251-1-qianggui.song@amlogic.com>
Message-ID: <1j8rstjhec.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_012415_511783_18E60DAF 
X-CRM114-Status: GOOD (  15.10  )
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


On Tue 29 Mar 2022 at 14:08, Qianggui Song <qianggui.song@amlogic.com> wrote:

> The kernel test robot reported a warning as below:
>>> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
>    static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };
>
> Fix it by adding missing description about this pins
>
> Fixes: 775214d389c2 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-s4.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> index 3c7358f53302..067c6749c849 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> @@ -575,6 +575,7 @@ static struct meson_pmx_group meson_s4_periphs_groups[] = {
>  	GROUP(tdm_d2_c,			4),
>  	GROUP(tdm_d3_c,			4),
>  	GROUP(tdm_fs1_c,		4),
> +	GROUP(tdm_sclk1_c,		4),
>  	GROUP(mclk_1_c,			4),
>  	GROUP(tdm_d4_c,			4),
>  	GROUP(tdm_d5_c,			4),
> @@ -937,6 +938,7 @@ static const char * const iso7816_groups[] = {
>  
>  static const char * const tdm_groups[] = {
>  	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c",
> +	"tdm_sclk1_c",

Thanks for fixing this.
Could you please try to keep this list somehow ordered a bit ?
Here you are adding a new line in the middle with single entry ... it
looks weird. 

>  	"tdm_fs1_d", "tdm_d4_d", "tdm_d3_d", "tdm_d2_d", "tdm_sclk1_d",
>  	"tdm_sclk1_h", "tdm_fs1_h", "tdm_d2_h", "tdm_d3_h", "tdm_d4_h",
>  	"tdm_d1", "tdm_d0", "tdm_fs0", "tdm_sclk0", "tdm_fs2", "tdm_sclk2",


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
