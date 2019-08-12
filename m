Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BEBC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 16:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45CBF20679
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 16:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c20BqwZf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xSTOh9h2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45CBF20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ho+QFyamj9qZkGj/T9WnpCfLUuegUarBJJL/IVf77oY=; b=c20BqwZfgUU8qT
	EItZ8SGzpIcv912fHxasFmbPYblrM8cX63n20SfWSz5cdgvuXZu+YJJ3qfeMFkCAqFwgkXJUYjSGt
	FavsDhGv9wWEAaXtNxdJy7pECx5ZCrO+9wO9jQM3n2EzugQogIi5dNL6eV/LvZO/hoSCCosTjSTK9
	a8OHAqPh52zm9S+wDrEEaOWDFZv8WhSQ7MyYhQiApT5KZcKIlEGcXMKmUNUucekZ74lbUitiqXo+N
	ixFVptXIGDdeynb4fSBaEwVzwfC9Oo00eCRwZ/meL9EAHZWfJPXQnH+S4QXwk1uovNM0m/tduui+F
	8VQm1acIU9tlombsc/QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxDEG-0004M2-Ce; Mon, 12 Aug 2019 16:31:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxDE6-0004F5-NI
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 16:31:21 +0000
Received: by mail-wm1-x342.google.com with SMTP id l2so145818wmg.0
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7j2F6czmvL1ihv3E7n7MMuOUAa5rNveJU7g593UBgYA=;
 b=xSTOh9h2HX4eRr/sFVEwfbnUvN24DujY5BIcNJrS8ivVAR6KMTWJ/ODWqQXBloN/jK
 z/XY2ixB+QMFtF0BLRbNSzSwRkyzcSXSXgWNBjcaF1mI9AaGtSexLw18VhF9X1SySAsY
 wynbSdt/jvTDFZkKTDx6B/u1LupR6bRzT5md+cGGgrkRNhvEbiHdHwhsbQ/ylF7TPebN
 gKiWtFddsM80lb1BkTKx++1N7O58a5UhkYM8AZjfqwnwm3Z/1SRF9fIkbeb5wrPkKy9W
 DkstxnclguamE68bROEp5JsalTxz2zlCJTDuRzy6UJF/bYrYmzf80dRMcooY8DeHBCPN
 bDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7j2F6czmvL1ihv3E7n7MMuOUAa5rNveJU7g593UBgYA=;
 b=JjX7WJksdLVKRomIrZTkbG9oDKtIFOOfpMxOMO8nxe2sB9pzz3I53szdd2JXD40TYx
 j0wna5WTNv83DNZz8RZG6MhcYxDFWW8BEEYRoJpu8ElGFs9dyYYCvUbwMEEMJOjpkKVr
 1Z7otsNQlKuGX3ltbSftoHWqoGm9fzp7G5cM21k8TXjIq62+PMUldpwAaUucNYGKArs2
 sdWJIPWa8l5wGjmWZUU9A0MWSopKf9pTGxFhOdbHsjdQht9oTzN8tz1GpO2WfuQOyC/w
 +5/gphYdDJN1Lx7YOXRnAEmz6jIiy53jr4nNlud6NfLzxpUGbaRiq2GEpxIst5+OiBdw
 qrCg==
X-Gm-Message-State: APjAAAVbVxNG/Y+ypiwSEQNHrWZjw1kzcm1BqQJoSjoL+1TTlP4VkZeR
 4HWK4NDKLTFT1vkeiOf21vS2Tp8t8TUROHbZd6bAgg==
X-Google-Smtp-Source: APXvYqyBPrcQ6sKCBQ9GudU9fmlJm1BzQW1oNBg6A7HHuE1qGnnV3Lr+F7PfdpqBa1bRHlFWSF9yk1iPYMGg2B6knOM=
X-Received: by 2002:a7b:c04f:: with SMTP id u15mr165779wmc.106.1565627476232; 
 Mon, 12 Aug 2019 09:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190808085522.21950-1-narmstrong@baylibre.com>
 <20190808085522.21950-4-narmstrong@baylibre.com>
In-Reply-To: <20190808085522.21950-4-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 12 Aug 2019 18:31:05 +0200
Message-ID: <CAMO6naxDkpjLTaByYBhkgP6i1YE1F1ATBAp8gPuVjDy9DAUM7g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Update with Amlogic DRM bindings
 converted as YAML
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_093118_939907_762FA777 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 8, 2019 at 10:55 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The amlogic,meson-dw-hdmi.txt and amlogic,meson-vpu.txt has been
> converted to YAML schemas, update MAINTAINERS to match them again.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6426db5198f0..c55c18531cd1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5318,8 +5318,8 @@ L:        linux-amlogic@lists.infradead.org
>  W:     http://linux-meson.com/
>  S:     Supported
>  F:     drivers/gpu/drm/meson/
> -F:     Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
> -F:     Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
> +F:     Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> +F:     Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>  F:     Documentation/gpu/meson.rst
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>
> --
> 2.22.0
>

Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
