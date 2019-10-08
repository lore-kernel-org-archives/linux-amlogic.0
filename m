Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE77DC10F14
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 15:06:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0659206BB
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 15:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="meF1bfIK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G8uczl3R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0659206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jN7DbkAWRcKkXhGQin0lNJRSEG8fhJFykOHk/YUZd8s=; b=meF1bfIKP+sH/I
	MVIqB4pwJt+6/wC4kJnkGRJbusMz8NSLKJbNT4RpOWHaLfat1vkc95AHUnbSfKjbtpQofyjy7OO6O
	nio8e/kK/CnXbc6vpwHYcLGEJ50j5worxyTYnt2dTG3hiNKtlJL85ccO6HR47VpyD1SClrG0IcMD6
	owW+oSiDnzHBj8bpfk8LkaXZ4dMZAGFvIyk4ADPkX6xH3Tk6cWJvI6Rdr6cLvlwKpVPq4J/MSkLIj
	Y37lE2AQwkDD0EDw0KdRgmh5W9Kt1qvrbRZJwcY/fD8XOwiKG1f/Wrn1lZAylUR0mURcNnmeNce9C
	sGnbxkyq/R+raFu27/FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHr3s-0001hK-9H; Tue, 08 Oct 2019 15:06:04 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHr3o-0001gQ-S3
 for linux-amlogic@lists.infradead.org; Tue, 08 Oct 2019 15:06:02 +0000
Received: by mail-pf1-x444.google.com with SMTP id a2so10916698pfo.10
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2019 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=tzsRg9pgEa9ifvg41ObkDkwx5TvwMyRk1wxFJpblvlg=;
 b=G8uczl3RULQcRPZNuuCGSUomb/snylYiJ6arGsUloQ3Wa2+dSUqI/YENI2cilQPHq+
 eA3+zmXi0bCaRtlqrEy+DS9RnTMUiUNxO7mtjIW0Oiv+ayXsEwyO1XyYkZs+MHOgW5wu
 oo7eY39CvJcRKrVWmog/2bO2uGO+77/Ey6dQDwRu2cePnp97SenCamFTlNwEhPwdn30b
 eKObB9wkms+pp9bQfr6USpdBqSs/idPOEUXkd5ziVWpP5BZomIUV9TSOmhWqXpWjNkHv
 7mqwMZ5Q2KRhss4E0XnwCxFBcGdvFhuBOHQT+4vIwhLu6XPGYqhiiyZVyUyltufgpUw1
 LQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=tzsRg9pgEa9ifvg41ObkDkwx5TvwMyRk1wxFJpblvlg=;
 b=bggEm/6ya2k4rZASD2CSrMh0+SF14ZC0Nx7dN5ZBAVzKr51Vw+X1pyYXQ5NKFNDizW
 9ew5epkoa9Ad7ZSFGlgag37iz+pLLYIbJxLUHDJK9n+lum3frRU87/IDxrhfkfqi5RVp
 Gx2HvDNWK3ljdLc3P5T2ihytWya0plaIcj4O6vIW4z47YRXesQT+JVzi7XFtospor0KF
 XaNAt4gmZNC8AnNkLq43MyAlZWe4TpV17KvN3oJUFXDZvdTEuH6cj+y72/irBz9s1P5x
 2NrXs1gTYzNBJXV2Qg2HA1Ft/p3IT1HEasK3Dblnjn9caylNbUFId8Ah5Y7mWxcpS6kG
 Ec7w==
X-Gm-Message-State: APjAAAWNdmB1M8nbQgnFxegZE3opBg2SYNWoVKMRzJI7oJKQBedOmS68
 6VmZwwtTbBdUGr/c36bhDD4sCw==
X-Google-Smtp-Source: APXvYqxhixa3F/cEc785OVOZs0F2stbVxXL2Q91Zz8G3dA0FQLAg7s6F+eNuzgo0xQ6EBlfs3p8Uew==
X-Received: by 2002:a65:48ca:: with SMTP id o10mr7551202pgs.116.1570547160188; 
 Tue, 08 Oct 2019 08:06:00 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:8d4b:adae:e1eb:fe8e])
 by smtp.gmail.com with ESMTPSA id u3sm17330522pfn.134.2019.10.08.08.05.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Oct 2019 08:05:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>, balbi@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: dwc3-meson-g12a.c: use
 devm_platform_ioremap_resource()
In-Reply-To: <20191008102751.GA10401@saurav>
References: <20191008102751.GA10401@saurav>
Date: Tue, 08 Oct 2019 08:05:58 -0700
Message-ID: <7h7e5f5lbd.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_080600_932904_62D38FAA 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Saurav Girepunje <saurav.girepunje@gmail.com> writes:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together in dwc3_meson_g12a_probe().
>
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/usb/dwc3/dwc3-meson-g12a.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index bca7e92a10e9..d73ccd9e1366 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -386,7 +386,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	struct device		*dev = &pdev->dev;
>  	struct device_node	*np = dev->of_node;
>  	void __iomem *base;
> -	struct resource *res;
>  	enum phy_mode otg_id;
>  	int ret, i, irq;
>  
> @@ -394,8 +393,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.20.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
