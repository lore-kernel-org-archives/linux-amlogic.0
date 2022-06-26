Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADC3C43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jun 2022 22:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8oPWWwwY34/GRLqf6P/rZrfj8TmrbHMohog2SIMOcE=; b=nxWxLvLYw7AOgt
	X0mynLXubVhJbqCyhRmOg7eRUgDnq2ppTVNu2LjOA0iEZfSXuotvwJI/sHxIQlv+ioV+lyc/Br5c/
	KBVRkFmGn7v3DxnCZEKgpV67Y5Vkfn8O54soyMBzXIjoqd+u3164B308XHFFaCM6DnPIsFge9BuJx
	ypAYKz7yHXOyqLYkJ2s++E92KzSnF9eN7nnCe+3R53KiDlxVQa3w1E5eCDATOPDp7XNIcLCyFmP6R
	jLgBzMPLwi7yeaMmWNmieFRQcVwzjGJx7m9PxeDMl1sdR+Rw4jerMT2wHIJPNaH+EHwx3i1alsn93
	VQuJHloZ/5KLrjiwcIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5adw-00DpgQ-Fk; Sun, 26 Jun 2022 22:22:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5adt-00Dpdq-9W; Sun, 26 Jun 2022 22:22:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id cw10so15408384ejb.3;
        Sun, 26 Jun 2022 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dRXy76sdL7Y/YzwJ1RSzZzZXuzUmmJM6patKce0lSs=;
        b=G/QzgObNuFFB6sQpSeSJ/EwNSjfapmrUIiFxEqiKsD92cORGQxK0WvfCeqrW1RyHgL
         dkMOce31bPuID+gguD1GV16x5RlELmZfSHbvHFYMMZOBrCJMX8673EGBBHYheLhWCTec
         y1BXVOsVFp4erFXgxhTzJOLLaFAWEkvsQRc54jOLsou7qpuk9EE2XHyPqJtDhEi8yyWr
         hL0Ud993pU5ey7KpUxaavcoHG880XaiTs7PnAtxk8fxT18+6c8Vrwuo478eg9B9yjlqY
         qk9bp3Io7FlriuoklO4v4NiDv32p1Jy063RsTmSAZVeIiqSktHSbg+jbMyVB+7DvlpaS
         xQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dRXy76sdL7Y/YzwJ1RSzZzZXuzUmmJM6patKce0lSs=;
        b=6muYcXT0dP15eYoO4qUwQGZ/al9YvOug9dImDqyYdmyYxclgrFN5MgM/Uzd5pE4wAK
         GjFhDdQj08yCDyogh4/9xhmUXb7BUTGRdQtHP9p6PNVXGUrwrwxwTtcweF3LtWizJXyv
         nXw3VI0YJOjMwJxpiRxUOupVw1uMdbHqpNRuCCF0AUnandaVholww5KveTMgWcuPp0vK
         izosMfxsnRKla+kyFoRft1S1qSWq8TH8T7Hjnd+tTIVW6C+ICE9BVCfr+w2KLM+QECuz
         B+8S/4AMSiM/MPV9cYbwEFQcwW/pgL2CsPJHsUKvBumYzDg1F8Oi52zUnXAN/Be1qTI7
         Y5kQ==
X-Gm-Message-State: AJIora+Wo8pfLug3ATm68A+lFYH4zS7Jmh40jfGOx4PaCZ9hmTUf04Hs
	+SmUUSjHiLetzQbmMoSWYT0LNoWUdkaHT/pvwPLBXXWcQ5Y=
X-Google-Smtp-Source: AGRyM1sLRgxNCsB7cXaoTsisvOlnKbFi+KeCPUXiQpDKnxmlU0RfmCxf8a50de/VHNNaGr0vNXlRLQJlSpLEs7hCE7s=
X-Received: by 2002:a17:906:7a0e:b0:722:e8c5:ee96 with SMTP id
 d14-20020a1709067a0e00b00722e8c5ee96mr9907372ejo.147.1656282122843; Sun, 26
 Jun 2022 15:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220616133811.1674777-1-narmstrong@baylibre.com> <20220616133811.1674777-3-narmstrong@baylibre.com>
In-Reply-To: <20220616133811.1674777-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jun 2022 00:21:52 +0200
Message-ID: <CAFBinCCcx_pG7rsMMGsoOOZC6E0-+qiWY3HPQTizMsDWm9wBnw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] phy: amlogic: Add G12A Analog MIPI D-PHY driver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: kishon@ti.com, vkoul@kernel.org, linux-phy@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_152209_398939_FD31AECC 
X-CRM114-Status: GOOD (  21.29  )
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

Hi Neil,

On Thu, Jun 16, 2022 at 3:39 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic G12A SoCs embeds an Analog MIPI D-PHY used to communicate with DSI
> panels.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/phy/amlogic/Kconfig                   |  12 ++
>  drivers/phy/amlogic/Makefile                  |   1 +
>  .../amlogic/phy-meson-g12a-mipi-dphy-analog.c | 177 ++++++++++++++++++
>  3 files changed, 190 insertions(+)
>  create mode 100644 drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
>
> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
> index 486ca23aba32..e4d1170efd54 100644
> --- a/drivers/phy/amlogic/Kconfig
> +++ b/drivers/phy/amlogic/Kconfig
> @@ -59,6 +59,18 @@ config PHY_MESON_G12A_USB3_PCIE
>           in Meson G12A SoCs.
>           If unsure, say N.
>
> +config PHY_MESON_G12A_MIPI_DPHY_ANALOG
> +       tristate "Meson G12A MIPI Analog DPHY driver"
> +       default ARCH_MESON
> +       depends on OF && (ARCH_MESON || COMPILE_TEST)
> +       select GENERIC_PHY
> +       select REGMAP_MMIO
I think this should be "select MFD_SYSCON" as we're not using
REGMAP_MMIO directly

[...]
> +       /* Get the hhi system controller node */
> +       map = syscon_node_to_regmap(of_get_parent(dev->of_node));
I just reviewed a patch that adds of_node_put() for the node returned
by of_get_parent() (after (syscon_node_to_regmap() has been used).
I think we need the same here

> +       if (IS_ERR(map)) {
> +               dev_err(dev,
> +                       "failed to get HHI regmap\n");
> +               return PTR_ERR(map);
to simplify we can use:
    return dev_err_probe(dev, PTR_ERR(map), "failed to get HHI regmap\n");
doesn't make much difference for this one though, but...

[...]
> +       priv->phy = devm_phy_create(dev, np, &phy_g12a_mipi_dphy_analog_ops);
> +       if (IS_ERR(priv->phy)) {
> +               ret = PTR_ERR(priv->phy);
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "failed to create PHY\n");
> +               return ret;
here dev_err_probe() would simplify the code a lot

[...]
> +static const struct of_device_id phy_g12a_mipi_dphy_analog_of_match[] = {
> +       {
> +               .compatible = "amlogic,g12a-mipi-dphy-analog",
> +       },
> +       { /* sentinel */ },
super nit-pick: no comma here


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
