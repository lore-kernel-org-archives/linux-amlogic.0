Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA86C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Mar 2022 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JUUT2PyDRN0biDQ3BG777WS2+EqAAyrEvgIEHYp1NY=; b=YfPNdJiPAASsoO
	XXiyyoSPymgqsNmtYvVzvYHZp8EPaJseLUuvbclgNBLV6zqsiNg5m0NZsiHsav4o1iAk7Ff9LJuz6
	de6v5cLxkc5PrmwarJKPNCOkNcmZKLSWvh89gc6s6gcwfw3l/Lk7izNlirOTmg/PdaXSvUYNKIcB+
	AJIP7DRNRZDCA5O9Ym4VjNtbnjO0wAJo4Qf+mjJ5ppc1A0zSoYOmvhRqg8Q+Z8fBPIjn7AypDqJ/P
	BYm1jJiAHO9zsgvnOobNHDiEo7dnmX0Az6Moxlh4/bpCmkLDBpr6uvPDyFfj2H2AOEeCOzUOrddgg
	T5gbb1/1Q3ydTZI7He4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR8lv-00GSxZ-LJ; Mon, 07 Mar 2022 08:31:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR8ls-00GSvU-9r
 for linux-amlogic@lists.infradead.org; Mon, 07 Mar 2022 08:31:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id u10so20287051wra.9
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 00:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M/a9sSwIlTaA0uOLJ9Rhq9zNudgRJnKE3XEQH6XwFTk=;
 b=rObXpXR3EaNrhwjqznYI5UI/8FW8+HkUOrYJHj0N9jvZN7ux/1LqsMbdB0xtvY8r+8
 MJ9B0tASl1hXnNc0pV/OfoduCWvT439CKst/kIy9PV/klegMlInhxK9AoT83oZAMxWsK
 1XGuP2VKlhDirgv2lIItCN64UFVG15ahzoo86J1EdkkKtSeYEOHpn2yt9kJRUB1m5Hh2
 6TH1SJUbNAmMiSJntJ2N9SHkqINNZE3deeA4HRSbwxzHeCCXYgnPetPmm0nAEKGQec0E
 epM3gjETw6giPTSM+m2Ovo7tPANwqmUyP0aR/B9zMlbAI38eBsyA+cJQlwt27fsSUb3C
 /+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M/a9sSwIlTaA0uOLJ9Rhq9zNudgRJnKE3XEQH6XwFTk=;
 b=G/ydHFh/UYi5hcxfH+2LYyL40rljEk95Or01GOcUpbWFUxdgzun8bGUclFoRaPS7iN
 88ICoFjl9/pfugCoKAQBRwk9KtOLAdlc5e4xu+uclchBm3An5GyfRVvr9ugOa+XoYggK
 Vc2XR3RfM35CPfmwnhiVoGFZYq8N6iJB1dLW+CBZLpTAk8tW90LjP+ohlTnVadKh/eFu
 ez/o/2P+yYU/mOa9Qxfi1ZSSK8+720bFQLLqiEMPdyetounvxWAHpli/yoFKfbXkjq78
 hHyQubzp2jZHga/+XyqwcWzpc7vtz4sfocyiifjyg/Ly1X+kDzkjAITLmHcd5xRMtPnL
 A8RA==
X-Gm-Message-State: AOAM531UlMLHVcJxxHpaMQXFpYM+I4aif9v083SPbbVN3+p2IgS+onhz
 RuaZ3HBZRBv3P2lT6SDWBV+N3Q==
X-Google-Smtp-Source: ABdhPJyEq7eU3DL5hMKyDwdqWuJL5kvEefFehXEj8huNMwMlxYC7JfjL1Sd0vMOPNsNkU9dppusmZw==
X-Received: by 2002:adf:f94a:0:b0:1ef:9485:e43d with SMTP id
 q10-20020adff94a000000b001ef9485e43dmr7164123wrr.552.1646641870512; 
 Mon, 07 Mar 2022 00:31:10 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:1451:71b4:fefe:6096?
 ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm12607329wme.24.2022.03.07.00.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:31:10 -0800 (PST)
Message-ID: <ae246f3f-debd-f183-7d77-ab72c9332cd5@baylibre.com>
Date: Mon, 7 Mar 2022 09:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] usb: dwc3-meson-g12a: constify drvdata structs
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <a3c178c9-7c33-d7b8-9f6e-734dc28728ab@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <a3c178c9-7c33-d7b8-9f6e-734dc28728ab@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_003112_386425_3B048E40 
X-CRM114-Status: GOOD (  15.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 06/03/2022 21:59, Heiner Kallweit wrote:
> Constify the drvdata structs. This also matches the definition of
> member drvdata in dwc3_meson_g12a.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/usb/dwc3/dwc3-meson-g12a.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index bd814df3b..b282ad0e6 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -188,7 +188,7 @@ static int dwc3_meson_gxl_usb_post_init(struct dwc3_meson_g12a *priv);
>    * reset to recover usage of the port.
>    */
>   
> -static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata gxl_drvdata = {
>   	.otg_switch_supported = true,
>   	.otg_phy_host_port_disable = true,
>   	.clks = meson_gxl_clocks,
> @@ -202,7 +202,7 @@ static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
>   	.usb_post_init = dwc3_meson_gxl_usb_post_init,
>   };
>   
> -static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata gxm_drvdata = {
>   	.otg_switch_supported = true,
>   	.otg_phy_host_port_disable = true,
>   	.clks = meson_gxl_clocks,
> @@ -216,7 +216,7 @@ static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
>   	.usb_post_init = dwc3_meson_gxl_usb_post_init,
>   };
>   
> -static struct dwc3_meson_g12a_drvdata axg_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata axg_drvdata = {
>   	.otg_switch_supported = true,
>   	.clks = meson_gxl_clocks,
>   	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
> @@ -229,7 +229,7 @@ static struct dwc3_meson_g12a_drvdata axg_drvdata = {
>   	.usb_post_init = dwc3_meson_gxl_usb_post_init,
>   };
>   
> -static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
>   	.otg_switch_supported = true,
>   	.clks = meson_g12a_clocks,
>   	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
> @@ -241,7 +241,7 @@ static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
>   	.usb_init = dwc3_meson_g12a_usb_init,
>   };
>   
> -static struct dwc3_meson_g12a_drvdata a1_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata a1_drvdata = {
>   	.otg_switch_supported = false,
>   	.clks = meson_a1_clocks,
>   	.num_clks = ARRAY_SIZE(meson_a1_clocks),

Looks good:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
