Return-Path: <SRS0=P8k8=QL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDF4C282C4
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Feb 2019 09:59:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF1B2081B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Feb 2019 09:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LoHCPiDC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CjwTCiI8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF1B2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBtQRvVT7Z7SVsUvLxW2gZYes8bXC4eT+rHEFF+AAVU=; b=LoHCPiDCNRUhoy
	ds4ORyMx/OXH191yKYqTuZbVsd+8LUufwjuZjw+Tu8VFkhSC1pIIcKLyODzQbA0Jvy4J526yQcED3
	BLqFMXSyszW9RP/FP6qY2GrveOABq8s6MHK51Ve79hPlIZgD0scFtd7gseF/pukLXFWA8GPKubARD
	RPEWWooA5bPnY3H/Sy04j3owrZ089koUNGpZjgjYpSa+hC+a2+r0HNLETMxPnfs2AYgVet2fANW6e
	yEqUIMeEA6Q143ErIPVTDTtZfMf6oSeoIwgAvXqy8sz+T1Ffc8LHta9zbgCKSjdZhlIT2t3KKbLSJ
	RFtoRXjy055Ro0jEdRdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqb2b-0001MZ-PM; Mon, 04 Feb 2019 09:59:49 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqb2Z-0001LS-5p
 for linux-amlogic@lists.infradead.org; Mon, 04 Feb 2019 09:59:48 +0000
Received: by mail-wr1-x444.google.com with SMTP id l9so13602526wrt.13
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Feb 2019 01:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aeI2DtFyd3cY+jY1489HFbl0luQvdWGB6TJ7lBabdo0=;
 b=CjwTCiI8T4M3Hz/dfytA4ZuN726PaIpQZTJy2Xq/FvGNqvtthG1FC+Oe24vxhrffkb
 0wnNg1uPr3xSmRnTtrxaWp/kry6Qp6IIyqY3tWdsEAG8MUW9KS4geftLJqWAgMJlnuB+
 Tw4XXVnRU7rtNXfMp/YB0jiKOGeUMB5EpxY4b8f/oASH6lfeHTGA98eNJ4PjgfeweNL3
 5k24J2MjXHaz+lEzkqN6jSpZkFhUZspCP0IsvkiNHPqi849m7XGHjqvIZ8Ky5onoozdC
 OSr2HlfcTamOyLdhYf5fGt8PHwK7yUwVRL4N+alXI3IxPwhcZvY/ybEcntcBpEaT4Nce
 M72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aeI2DtFyd3cY+jY1489HFbl0luQvdWGB6TJ7lBabdo0=;
 b=Y3JXBAMsu4gjBafe27LndYRZuuiwBxbPCC7onj/J6BpB7fYknFRJ3v3Xk4ANuzwNrI
 hVuzeMZDlAgx2LMsUomx+QYPd4jV3SDFjXHdX6Ojm0Oy6ZX5KZuM4F3+ta6FFoDO0zyb
 OghxoYueAkli4yOoF1awccG2zoRu2DRFQkeFTZEMj90oaMTMevCLA4ZMHKfkjLXAIHUs
 DMdFG03iCi6WbDDEmOKJ6gQrUU0yqR3chGXBZc2iSQs4HckrfA1qyoo/WG8VBtIeuvZN
 aJ5dOzFtXllqVIlzNQumWY5GqjoMeOuIMJhsTwC3G1y9iQBHEUqxSZY0iohov84Yd2dD
 HBeQ==
X-Gm-Message-State: AJcUukd6k/DyPx+5U12FXBHRWJfo2nS5FvWsOYYrC8UgZcDXDuHwee5a
 JFI3n3DSu5ecJUQRXCa3k6ZBzRakExToYaU0e6uV6w==
X-Google-Smtp-Source: ALg8bN7lHMO6Hlgap21U4xcnbHcWEtLdg+eW0yH5Qmwtj7w62V9elNN46ayTwvt2/0GSaE1FI0Z1QIqG1JP7CaHzTno=
X-Received: by 2002:adf:ef0d:: with SMTP id e13mr47728456wro.29.1549274385281; 
 Mon, 04 Feb 2019 01:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20190204094937.22763-1-narmstrong@baylibre.com>
In-Reply-To: <20190204094937.22763-1-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 4 Feb 2019 10:59:34 +0100
Message-ID: <CAMO6nawKrH3d2X=TikdJy8yjiPyuJJRnpaBjyfPYuRx3d=7vVA@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: canvas: Fix meson_canvas_get when probe
 failed
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_015947_214510_1DDA86C6 
X-CRM114-Status: GOOD (  17.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,
On Mon, Feb 4, 2019 at 10:49 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> When probe fails, a platforn_device is still associated to the node,
> but dev_get_drvdata() returns NULL.
>
> Handle this case by returning a consistent error.
>
> Fixes: d4983983d987 ("soc: amlogic: add meson-canvas driver")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/soc/amlogic/meson-canvas.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> This fix depends on "soc: amlogic: add missing of_node_put()" at [1]
>
> [1] https://patchwork.kernel.org/patch/10794545/
>
> diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
> index 87a6c6e23591..151aa84bc593 100644
> --- a/drivers/soc/amlogic/meson-canvas.c
> +++ b/drivers/soc/amlogic/meson-canvas.c
> @@ -51,6 +51,7 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
>  {
>         struct device_node *canvas_node;
>         struct platform_device *canvas_pdev;
> +       struct meson_canvas *canvas;
>
>         canvas_node = of_parse_phandle(dev->of_node, "amlogic,canvas", 0);
>         if (!canvas_node)
> @@ -63,7 +64,17 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
>         }
>
>         of_node_put(canvas_node);
> -       return dev_get_drvdata(&canvas_pdev->dev);
> +
> +       /*
> +        * If priv is NULL, it's probably because the canvas hasn't
> +        * properly initialized. Bait out with -EINVAL because, in the

Bait -> Bail ?

> +        * current state, this driver probe cannot return -EPROBE_DEFER
> +        */
> +       canvas = dev_get_drvdata(&canvas_pdev->dev);
> +       if (!canvas)
> +               return ERR_PTR(-EINVAL);
> +
> +       return canvas;
>  }
>  EXPORT_SYMBOL_GPL(meson_canvas_get);
>
> --
> 2.20.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Thanks for the patch, I missed the fact that a driver could have a
pdev yet with a failed probe.

Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
