Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AF5C07CA9
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7IkF94vGw7CzDDOnOD5J+5Ei78L2ME9AvCGGk3veCA=; b=Jva7MHj1Ef2Qba
	M8ktpQAuZmDd11GE+MNMHr/VVfBFL9O45vdY+K4vN5KGXwo4mhtzgAU2zhELslvEhgEN6dmtQihuS
	BosSs1+EEx2vbRu/XQfvz0TZI41+gni+5uwsO6ZV6ZONDvxkGgSHwJprG9QFt70VNBiNCPcWmS1LO
	ktTfszpO+m7qb4tAaPwukt8YOnT1PniVp4bSHUZM0vVIFSo8ThPZZZIXmbUUqWsYrzBQEZERoXSd/
	X0+57oE/G4n1Y9szqJr+fDAQDW0M/gIRg5psKRFq0OUm0bbpksNW22Cd78tgsDN6xW8gBhnuagp7D
	KTo4jv9E2a8EZ4WxSt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fGB-00AZzP-0U;
	Thu, 30 Nov 2023 11:31:11 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fG8-00AZy5-1P
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Nov 2023 11:31:09 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5d34f8f211fso4780197b3.0
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Nov 2023 03:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701343867; x=1701948667; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ds7ABFYrMMycv745Smb8RwddOGN4IRIdlcfUsv1PeZg=;
        b=szXWK413mx56nQdBar3TjcAVlJs5ijZukmb9tzu28MMh1BzTZa8Z0bDahRevJ3YfIT
         lIUEDboLz4cs9CGzxmWJgXLSTelz+IlXrP4hPcMw+t2YRYHHfp5YkkTd3BA7dzFd6he8
         r2E2ux5zxcF1rolt+FQ+dHaX5l9PpNHb+sOVUhtUJ2CoYT7g6IhKBWAjtJbz/b+dvlZY
         /WAhOH17vMsug1dBNCavXv84RSg38vFTBA3LkdQQpyZezT4eMWk9jBVpebWRknkEQc/K
         MlTK+4P7CUOw6MGskE0LjDy7bdZyTvlYYXVGhpRxPWGAsyNclOe36n0jNeHZM16m3fRH
         u+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701343867; x=1701948667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ds7ABFYrMMycv745Smb8RwddOGN4IRIdlcfUsv1PeZg=;
        b=wyU1RmrBeE0RAPE4ZcVrIMNnx1THQi2RaF5wsrG/KkZrwiZtEdptWsEYS2DjKGoxls
         IKM6QdkO20V7L/sudwM+ClOdnSVt4ErnXYSbCtIVTN5QFkzjnNuLkbTvGFzSfz8OcL3O
         m287N/WH0LW9z8kPA/v43IhNtxMALdzpje+xPD7MLphVH1p6T0titpXPY4MDkk8fGTTX
         0Nd28kWP/o69YUu6r+6jDpPI9iQ1yRGwnvwWGah/+idBf9Yq/6wjuhKG+IVu7bUA1Zsk
         R8UNVMjv537b8rV0U40z8R2vbg7ks1a3OZYuwcboAVikMEYqLaFkoK8DUmQ/v1Xd1IFL
         XV4A==
X-Gm-Message-State: AOJu0YwvuKqX6GjeZkN+/tPV7IUMyyG6SVJ1FAS0/M0CKcpLknTnyWmn
	77zVxlwS+qvj2DKSso519YxLIny0C2G9Xko/V0oPfg==
X-Google-Smtp-Source: AGHT+IGAESo71TcDtp4PhAumypPzLOYsMlreSo9KOtjEUiXzZQ5yHW7O4gv5AvPrsbQWkUO+3HKTXPu2yghcVpnpeDA=
X-Received: by 2002:a0d:ca93:0:b0:5c5:a04c:5eb2 with SMTP id
 m141-20020a0dca93000000b005c5a04c5eb2mr23685462ywd.33.1701343866889; Thu, 30
 Nov 2023 03:31:06 -0800 (PST)
MIME-Version: 1.0
References: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
 <20231123-topic-amlogic-upstream-isp-pmdomain-v2-2-61f2fcf709e5@linaro.org>
In-Reply-To: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-2-61f2fcf709e5@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Nov 2023 12:30:31 +0100
Message-ID: <CAPDyKFq7-sGF+obKXOYHaox=Ak29HuJ1=ZMfGiBHrMOQqiiH4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: amlogic: meson-ee-pwrc: add support for
 G12A ISP power domain
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_033108_475195_B23DC9F4 
X-CRM114-Status: GOOD (  16.79  )
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

On Thu, 23 Nov 2023 at 17:17, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add entries for the ISP power domain found in the Amlogic G12B SoC
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index 0dd71cd814c5..fcec6eb610e4 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -47,6 +47,8 @@
>
>  #define G12A_HHI_NANOQ_MEM_PD_REG0     (0x43 << 2)
>  #define G12A_HHI_NANOQ_MEM_PD_REG1     (0x44 << 2)
> +#define G12A_HHI_ISP_MEM_PD_REG0       (0x45 << 2)
> +#define G12A_HHI_ISP_MEM_PD_REG1       (0x46 << 2)
>
>  struct meson_ee_pwrc;
>  struct meson_ee_pwrc_domain;
> @@ -115,6 +117,13 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
>         .iso_mask = BIT(16) | BIT(17),
>  };
>
> +static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
> +       .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
> +       .sleep_mask = BIT(18) | BIT(19),
> +       .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
> +       .iso_mask = BIT(18) | BIT(19),
> +};
> +
>  /* Memory PD Domains */
>
>  #define VPU_MEMPD(__reg)                                       \
> @@ -231,6 +240,11 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>         { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
>  };
>
> +static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
> +       { G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
> +       { G12A_HHI_ISP_MEM_PD_REG1, GENMASK(31, 0) },
> +};
> +
>  #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)        \
>         {                                                               \
>                 .name = __name,                                         \
> @@ -269,6 +283,8 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>         [PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>         [PWRC_G12A_NNA_ID] = TOP_PD("NNA", &g12a_pwrc_nna, g12a_pwrc_mem_nna,
>                                     pwrc_ee_is_powered_off),
> +       [PWRC_G12A_ISP_ID] = TOP_PD("ISP", &g12a_pwrc_isp, g12a_pwrc_mem_isp,
> +                                   pwrc_ee_is_powered_off),
>  };
>
>  static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
>
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
