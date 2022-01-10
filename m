Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A357EC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4FKMbsOPPLUU7P874bNxE6gYFvuMEfOwPcajN/92cGE=; b=J07LElbfVvdKo8UX0pvQPYtLGy
	uj7Cp+X50Nz2shZSzsK1D3bRgY5CsXMtheacL2zhDnsFbT61SopimPrQ8JAEZ7/EmUyl6hSffcIVg
	rnNWpIiHf8bISBK44LJIwC59DH0MB9K6No3eZa6E9LsiNLnqP1HIp3Y4Qaya5rsQzXzeBm7t9JUOC
	j59pCC+fCptcuRDOrM0JjnMHe5M2SMjR0893Gokk9rY5DDorjSnDpD0rWOOqRkLM9HMQQNl+1Iq+S
	cta4QRY3BtMdK/0qC5qMJ56qe+an8KZzBhBvvqWu2trvtiRpI3/Ky5MQH4OrWogeHKSmVz2+QvAR/
	JuXiOqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rLI-00AaaK-OE; Mon, 10 Jan 2022 09:51:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rLD-00AaWt-Bm
 for linux-amlogic@lists.infradead.org; Mon, 10 Jan 2022 09:51:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id x4so426831wru.7
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jan 2022 01:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i4Ie2z98RRkvRgDdmSJjth8vux9u5V+sd3sLTDBOSis=;
 b=1krRpymSaAjyyeMnbtZz5jZKKGExJIwC4guY6I7cTF2xW/MkboKMumpLK4eSzzTGuW
 bPZTPaxJToBl4G2x11WjWahDH49W7/Q0edSYuI/qdyHZhFOy1Vm7xDiWfgRx8oLffr3D
 DL1xV54ytXOgJiIlE6lOlKdZTIKHODyKs9KcpJXkRcZxZ2XGoiEglPWL5wNBxV/t7DPh
 W6G4xXnlCHqjZOKZ1YpYjpFUbdoqBveElYQm9Sx1l6B6f4yGng1L9TnM7Lb5g7IpYt9h
 qQ1xb1oL5XrRbl5jofbG1obd588sjvTqOr+azxbowKwTnh61O+75LnNTeueoJFoxt8en
 WYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i4Ie2z98RRkvRgDdmSJjth8vux9u5V+sd3sLTDBOSis=;
 b=h5SIlALD8ez7dx5XdxjMZfqp2gsiZDuAOW/tTnbp/0h+nMd91nBBKwiOM+LSiPbjKF
 L9i3QYyUBrk3O8M0jGB8EPBCcj/mwSTlEQ5OrRyIX37+heoFFYM2aFou4yzhiRiIB3Fc
 gJXghFMmOM8WvvIXZ9QHPtifO0LqMwljGSaXJYtdO6j6veNuVNbLPxC93uVs390ID74j
 wwI9Ti+2Svpl4q0XOrdl/0lEzk3A5BjryRntpWKkhxVhd9e/8eb8JCx3hDUQX4beBtEZ
 9OfCzZNetrCX1X7mmZ8eVbgGEofth5uCgrA7rACxXFuQHjTsjzdQPw7UzwnJv12lESJa
 RVAQ==
X-Gm-Message-State: AOAM533Rspcgta9Kpv6EBeCMX8XdCVSVwnK7HBVovY42Tz39QU8riUlZ
 vCa/VA4a0te1pBluO1/Y0Ue0uA==
X-Google-Smtp-Source: ABdhPJz++S/4jbXE7vDXl9HrZHXv627zQa2FULE+6/01NUzCxhG1M9h8uHevDIDZfRj10P8GOWOZCw==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr62893860wri.265.1641808309947; 
 Mon, 10 Jan 2022 01:51:49 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id p21sm6496370wmq.20.2022.01.10.01.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:51:49 -0800 (PST)
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-7-narmstrong@baylibre.com>
 <CAFBinCB3+dSjQFRp5CBpGk5Qi8zoxRDRaobuCtXzU6VtM8+ryQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <508ea2d7-aee3-9409-023c-638b09d733b0@baylibre.com>
Date: Mon, 10 Jan 2022 10:51:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCB3+dSjQFRp5CBpGk5Qi8zoxRDRaobuCtXzU6VtM8+ryQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_015151_487485_B405E405 
X-CRM114-Status: GOOD (  24.27  )
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

On 07/01/2022 23:49, Martin Blumenstingl wrote:
> Hi Neil,
> 
> some high-level comments from me below.
> 
> On Fri, Jan 7, 2022 at 3:58 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> +/*  MIPI DSI Relative REGISTERs Definitions */
>> +/* For MIPI_DSI_TOP_CNTL */
>> +#define BIT_DPI_COLOR_MODE        20
>> +#define BIT_IN_COLOR_MODE         16
>> +#define BIT_CHROMA_SUBSAMPLE      14
>> +#define BIT_COMP2_SEL             12
>> +#define BIT_COMP1_SEL             10
>> +#define BIT_COMP0_SEL              8
>> +#define BIT_DE_POL                 6
>> +#define BIT_HSYNC_POL              5
>> +#define BIT_VSYNC_POL              4
>> +#define BIT_DPICOLORM              3
>> +#define BIT_DPISHUTDN              2
>> +#define BIT_EDPITE_INTR_PULSE      1
>> +#define BIT_ERR_INTR_PULSE         0
> Why not use BIT() and GENMASK() for these and prefixing them with
> MIPI_DSI_TOP_CNTL_?
> That would make them consistent with other parts of the meson sub-driver.

Yeah it was a lousy copy-paste from vendor driver, and I was lazy, but I'll fix this.

> 
> [...]
>> +static void meson_dw_mipi_dsi_hw_init(struct meson_dw_mipi_dsi *mipi_dsi)
>> +{
>> +       writel_relaxed((1 << 4) | (1 << 5) | (0 << 6),
>> +                      mipi_dsi->base + MIPI_DSI_TOP_CNTL);
> please use the macros from above
> 
>> +       writel_bits_relaxed(0xf, 0xf, mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
>> +       writel_bits_relaxed(0xf, 0, mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
> 
> [...]
>> +       phy_power_on(mipi_dsi->phy);
> Please propagate the error code here.
> Also shouldn't this go to a new dw_mipi_dsi_phy_power_on() as the PHY
> driver uses the updated settings from phy_configure only in it's
> .power_on callback?

Good point, let me check that.

> 
> [...]
>> +       phy_configure(mipi_dsi->phy, &mipi_dsi->phy_opts);
> please propagate the error code here as the PHY driver has some
> explicit code to return an error in it's .phy_configure callback
> 
> [...]
>> +       phy_init(mipi_dsi->phy);
> please propagate the error code here
> 
> [...]
>> +       phy_exit(mipi_dsi->phy);
> please propagate the error code here

ok for the 3

> 
> [...]
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       mipi_dsi->base = devm_ioremap_resource(&pdev->dev, res);
> other parts of the meson DRM driver have been converted to use
> devm_platform_ioremap_resource()
> I suggest updating this as well to simplify the code here

Yep, again lazyness

> 
> [...]
>> +       mipi_dsi->phy = devm_phy_get(&pdev->dev, "dphy");
>> +       if (IS_ERR(mipi_dsi->phy)) {
>> +               ret = PTR_ERR(mipi_dsi->phy);
>> +               dev_err(&pdev->dev, "failed to get mipi dphy: %d\n", ret);
>> +               return ret;
> you can simplify this with:
>   return dev_err_probe(&pdev->dev, PTR_ERR(mipi_dsi->phy, "failed to
> get mipi dphy\n");
> 
> [...]
>> +       mipi_dsi->px_clk = devm_clk_get(&pdev->dev, "px_clk");
>> +       if (IS_ERR(mipi_dsi->px_clk)) {
>> +               dev_err(&pdev->dev, "Unable to get PLL clk\n");
>> +               return PTR_ERR(mipi_dsi->px_clk);
> you can simplify this with:
>   return dev_err_probe(&pdev->dev, PTR_ERR(mipi_dsi->px_clk, "Unable
> to get PLL clk\n");
> Also should it say s/PLL clk/px clock/?
> 
> [...]
>> +       top_rst = devm_reset_control_get_exclusive(&pdev->dev, "top");
>> +       if (IS_ERR(top_rst)) {
>> +               ret = PTR_ERR(top_rst);
>> +
>> +               if (ret != -EPROBE_DEFER)
>> +                       dev_err(&pdev->dev, "Unable to get reset control: %d\n", ret);
>> +
>> +               return ret;
> you can simplify this with:
>   return dev_err_probe(&pdev->dev, PTR_ERR(top_rst, "Unable to get
> reset control\n");
> 
> [...]
>> +       mipi_dsi->dmd = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
>> +       if (IS_ERR(mipi_dsi->dmd)) {
>> +               ret = PTR_ERR(mipi_dsi->dmd);
>> +               if (ret != -EPROBE_DEFER)
>> +                       dev_err(&pdev->dev,
>> +                               "Failed to probe dw_mipi_dsi: %d\n", ret);
> you can simplify this with:
>   dev_err_probe(&pdev->dev, ret, "Failed to probe dw_mipi_dsi\n");
>

Again 4 lazyness effects, will fix !

Thanks,
Neil


> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
