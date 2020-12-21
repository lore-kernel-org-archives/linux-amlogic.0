Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9637BC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 19:50:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A2F0225A9
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 19:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A2F0225A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HK6ywrfm/uVuiv6OjCHC294oaqQQ45OlzuGiKBMhVWs=; b=bu5CF2O8wkE4j6yh0K4DZ0EF4
	lk7ufDsSMqiwLZ3Jat8cjJY29YcGJX14O+kmdMKQl4N8lSjOpsxZO+gwR4re/tKSctxNBJHnlJNa/
	unZkxo0Cv07Q1kGUIR5NUy6w95f7q6Ehi3SKWKWdzLRJj8TV26guWm1pHDnSeszUxBgWJly3Oo7Oz
	wXOgk6fQNV7nspQ1rGOxUI5YBar2xgd/LOlCbxSOi7olB8RHOFBz0+JbHS7J2suykZFoZebL48G5R
	+XeYkU3qzWpaxGrq3Met1N2P5qYf1JSxSpSXakg2IxPcIvW/9DSK9skgqQwmnbbOdXzuxqwHBgALL
	Huv9Q190Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krRCU-0004xZ-98; Mon, 21 Dec 2020 19:50:34 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krRCS-0004wd-0E; Mon, 21 Dec 2020 19:50:33 +0000
Received: by mail-oi1-x229.google.com with SMTP id w124so12442599oia.6;
 Mon, 21 Dec 2020 11:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EKHYKYvJjr3SdNV5NJTpZB/AVd6o6kMyWNYzPfDbcJc=;
 b=YnXqy4eXAFUfb3hjUiHXsYInF3Oc2mtZnO/TB8nfwAaTHeA37m/d6ewTHREipO8DV7
 Hh7p4CfD3gHI7eMtGXxeOQqxb0sLu4BSSjT/qMZBuEU5ucUzX74/tb1ckPOEyxsk8Lmf
 Jl7d8+KNZ/KPwq3hNvuK8HsnneueBecghDuCixOWKMWKXduVPPfm7C7sYEIvg4lzQpTI
 Ufe1LmNSMDPB3asTurRECDfSaMLCWCvpm6GvDYkbDIwney/WkQqT3lCUab4KloXfVGD/
 37eNollIh5mENPH6JICo0VdKF3jw/+roj1BwC9SUBc3TKkcsUwyEDNzfQ+S2zvzjUQx7
 FwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EKHYKYvJjr3SdNV5NJTpZB/AVd6o6kMyWNYzPfDbcJc=;
 b=OXEb4hxR9sbQeGmmt1NPBPfPsc4q0mOO2NHHTOjisfouhEo4tHfjHjaDSqtUiYwXJm
 Z9RtoTQesgmniV60Tgj/LJzxrEAA8XVoyjxdZUKIFiOONVtTV2bpquGW5yBl4Ap15Gwi
 hnCC8gquYq4kzzAxAsKDJdNbl4kpcsVqrWvohDn0rZpXKLxn2YpSXHvYzeBvCO5w4FXq
 7X4O0gD4QzxhuQRH+X6oaK4S9hanCmfFkrCYas5VKWDwZaPQN67qW7zTjUFq5Us00dNd
 lhC1eov6Apui9h0LRWISYZeiVRfqKqQ/ohLbsbMpQoYb0dc1cAz1jcZ/0ZGushK1Xmx3
 5efw==
X-Gm-Message-State: AOAM533w9togdPUTK2815ICmKNkfSPio1DJXsjzlhwe1yQoAALqaVBfw
 IsX+XJetDKH7F3AGKBliUR7QNC4fNNSFkn+Ql+kdkMmvjhY=
X-Google-Smtp-Source: ABdhPJyTF8Ofb7lnfU1nNVBGH3z83jxGYZHPN6muNzO3z236Fn3gpYFV724Nul736pJL7mdxpOixxpXuNOkl2dee1oA=
X-Received: by 2002:aca:3306:: with SMTP id z6mr1799369oiz.141.1608580228062; 
 Mon, 21 Dec 2020 11:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20201219135036.3216017-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20201219135036.3216017-1-martin.blumenstingl@googlemail.com>
From: Thomas Graichen <thomas.graichen@googlemail.com>
Date: Mon, 21 Dec 2020 20:50:14 +0100
Message-ID: <CAOUEw12Ldi9Kv2Gd=OCEgeVa+jv_FM1HqGRQBiEYCo==8PcrWA@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: ignore the second clock input
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_145032_190019_6A7ADBB3 
X-CRM114-Status: GOOD (  25.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com,
 kuba@kernel.org, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Dec 19, 2020 at 2:52 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The dwmac glue registers on Amlogic Meson8b and newer SoCs has two clock
> inputs:
> - Meson8b and Meson8m2: MPLL2 and MPLL2 (the same parent is wired to
>   both inputs)
> - GXBB, GXL, GXM, AXG, G12A, G12B, SM1: FCLK_DIV2 and MPLL2
>
> All known vendor kernels and u-boots are using the first input only. We
> let the common clock framework automatically choose the "right" parent.
> For some boards this causes a problem though, specificially with G12A and
> newer SoCs. The clock input is used for generating the 125MHz RGMII TX
> clock. For the two input clocks this means on G12A:
> - FCLK_DIV2: 999999985Hz / 8 = 124999998.125Hz
> - MPLL2: 499999993Hz / 4 = 124999998.25Hz
>
> In theory MPLL2 is the "better" clock input because it's gets us 0.125Hz
> closer to the requested frequency than FCLK_DIV2. In reality however
> there is a resource conflict because MPLL2 is needed to generate some of
> the audio clocks. dwmac-meson8b probes first and sets up the clock tree
> with MPLL2. This works fine until the audio driver comes and "steals"
> the MPLL2 clocks and configures it with it's own rate (294909637Hz). The
> common clock framework happily changes the MPLL2 rate but does not
> reconfigure our RGMII TX clock tree, which then ends up at 73727409Hz,
> which is more than 40% off the requested 125MHz.
>
> Don't use the second clock input for now to force the common clock
> framework to always select the first parent. This mimics the behavior
> from the vendor driver and fixes the clock resource conflict with the
> audio driver on G12A boards. Once the common clock framework can handle
> this situation this change can be reverted again.
>
> Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Reported-by: Thomas Graichen <thomas.graichen@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Tested-by: thomas graichen <thomas.graichen@gmail.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index 459ae715b33d..f184b00f5116 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -135,7 +135,7 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
>         struct device *dev = dwmac->dev;
>         static const struct clk_parent_data mux_parents[] = {
>                 { .fw_name = "clkin0", },
> -               { .fw_name = "clkin1", },
> +               { .index = -1, },
>         };
>         static const struct clk_div_table div_table[] = {
>                 { .div = 2, .val = 2, },
> --
> 2.29.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
