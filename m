Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71480C636D4
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Feb 2023 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKKsCbWK6svgf1TfyA+lV8ZXttGJ2JJv5Afe1Wg0yns=; b=UNgs75bUcxMmH+
	7ThtMrL4M4Vlc6aj4WdrCKojBmOuaRBsmh5v9UknO+eY99P13IfAQCX4rYwMQExJWv/PQd64DFhWw
	1LtDeYzjdZ9rcnB98r86L3BqHjML5hwQaPleuVl71olcoDh6gerBxMeIaEy7R1pcB+jvrQRSDWQlN
	jEY4TkNFkBTHNPqdlvV2Dup18vuRtojYKd3XFOlKieOVDhKTkCQ0BofrE3DMqa0tbQV1/yD3WV6lO
	eyWT52538bQXFVLxAH5174wqKwGZgUDuAvRn2jPit7HZlG07Wu8yHUPtplevi0IDIbRM+/NZNLZ+V
	J7/+akgAME2PJc/LmHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyQD-00DljW-Iz; Fri, 17 Feb 2023 10:56:57 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyQ1-00DlfF-CJ
	for linux-amlogic@lists.infradead.org; Fri, 17 Feb 2023 10:56:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id i10-20020a17090a7e0a00b002341a2656e5so772988pjl.1
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Feb 2023 02:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qL9D7opV5FlButcIFs+D5dml5+uZHYprzNmObUFhYpg=;
        b=b35uDJ4BTWHKcjV+ndJTUdlujdWns6GhZ3wBcGdu5le4OecC9oeuwz9hbGxLBoDVLx
         ZkVRsE41IjbfotgQbUTP878Nut6Xdlp82CeycYuLWJ5lZQ2SGeN8GfKGaFyZH/8SDvFN
         qboVdQk7ZK6ep5Y1qEBQLrsg27DktgXvG6yHTzSiCAYw6rAn0AG+P9NAonIKCR679dok
         08vk6RIUazmiCuBsnu0cduJfkk6P496XFceRhP/7T97UzRsnKYuEJJ47X8FoIuLFfSIX
         kaWyeUp7WHBSnZCj5FXqyXfOhfcpLcczDNQxKmR37pe7rs0wyA/FBLHEvf8NLFR3nGb/
         fwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qL9D7opV5FlButcIFs+D5dml5+uZHYprzNmObUFhYpg=;
        b=U/Ay7mbbOU3Qbt4a33w6o26iuOAKePz+bg4AhpC30JkEBQIr9ETiz7kvXwgZj7RSwB
         /bQcvO5OzsJnE1/ZvuxYWx5t8qU2XyjNG4Pmf33KqSTsHGmD7Ydiyywmr9LlMCmxZsSw
         n1nO4/UIrYeichctWR4jcXjYVHN/p8vVFQVCLJ+Wqb9BeZXrGzKSuuFcPAmrszwqsLvv
         AWsXjNdtswnwzoFY6vczRa1XM4WzFPqNRiviEa+ufAeIfHmuNArcdGs7xJsb7L9cAiCI
         GKetUKh8sewWk8fCC+4wUDQzOMBu3qv7rfkKd6SqyFpfARfecl3Q1IIDDHVKi4xb+DyB
         dzyw==
X-Gm-Message-State: AO0yUKVAPcQ1FF6VN8WIRZcQgxaNPwNGxkvFqihmVtw9qZoxiCSNSSZp
	wpJjuRk8IK8e2Cs2+k3LmSf3bUnbGRk3c6HzeHNL3g==
X-Google-Smtp-Source: AK7set8/3hGFfpeRYlD+tUybEgVpGpn3np/IuVQOzJ75dMcdpHnGJ5LGPNNdRBMEmUbFQ78VqcfTkdHmsaur08h7j/k=
X-Received: by 2002:a17:903:2643:b0:19b:5233:51d8 with SMTP id
 je3-20020a170903264300b0019b523351d8mr182684plb.13.1676631403920; Fri, 17 Feb
 2023 02:56:43 -0800 (PST)
MIME-Version: 1.0
References: <b316c6ba-a373-f1d2-27d2-9add5e25a9d2@gmail.com>
In-Reply-To: <b316c6ba-a373-f1d2-27d2-9add5e25a9d2@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Feb 2023 11:56:07 +0100
Message-ID: <CAPDyKFrUezBm=ALtdyM-6jy8zdpMW5HN_xi=21+-Hv4aUjB9fQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: use devm_clk_get_enabled() for core clock
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_025645_443108_4FC8F3F4 
X-CRM114-Status: GOOD (  17.31  )
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

On Wed, 15 Feb 2023 at 21:01, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Use devm_clk_get_enabled() to simplify the code.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 079c52dbe..6ed95c555 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -155,7 +155,6 @@ struct meson_host {
>         struct  mmc_command     *cmd;
>
>         void __iomem *regs;
> -       struct clk *core_clk;
>         struct clk *mux_clk;
>         struct clk *mmc_clk;
>         unsigned long req_rate;
> @@ -1166,6 +1165,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         struct resource *res;
>         struct meson_host *host;
>         struct mmc_host *mmc;
> +       struct clk *core_clk;
>         int cd_irq, ret;
>
>         mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct meson_host));
> @@ -1228,17 +1228,13 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                 host->pins_clk_gate = NULL;
>         }
>
> -       host->core_clk = devm_clk_get(&pdev->dev, "core");
> -       if (IS_ERR(host->core_clk))
> -               return PTR_ERR(host->core_clk);
> -
> -       ret = clk_prepare_enable(host->core_clk);
> -       if (ret)
> -               return ret;
> +       core_clk = devm_clk_get_enabled(&pdev->dev, "core");
> +       if (IS_ERR(core_clk))
> +               return PTR_ERR(core_clk);
>
>         ret = meson_mmc_clk_init(host);
>         if (ret)
> -               goto err_core_clk;
> +               return ret;
>
>         /* set config to sane default */
>         meson_mmc_cfg_init(host);
> @@ -1322,8 +1318,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         free_irq(host->irq, host);
>  err_init_clk:
>         clk_disable_unprepare(host->mmc_clk);
> -err_core_clk:
> -       clk_disable_unprepare(host->core_clk);
>         return ret;
>  }
>
> @@ -1338,7 +1332,6 @@ static int meson_mmc_remove(struct platform_device *pdev)
>         free_irq(host->irq, host);
>
>         clk_disable_unprepare(host->mmc_clk);
> -       clk_disable_unprepare(host->core_clk);
>
>         return 0;
>  }
> --
> 2.39.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
