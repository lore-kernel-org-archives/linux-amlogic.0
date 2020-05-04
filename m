Return-Path: <SRS0=PlEO=6S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9171FC3A5A9
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2020 10:57:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FF99206A5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2020 10:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IlUxE3Ju";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OC0Oig/8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FF99206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8yO+8xWv+j99Y950omPa4HWrIuYFO96GUq0+76TmS0=; b=IlUxE3JuT90E6w
	Djgi/+XmVyijzSHGD8oX+jX9n2VMARNG/AIV8Xlb3Jc1yDnDQMnBAE/jRGjIp2Jv+LbKjxDKHfx8h
	FG1NQKGBBXoPYzkiwuWvrv2/538228sLOOHysFevTWJOqGqLWm6gymRFyyE8eXZYcGJcJtrvzo+ex
	Fe8kgp8D/Vdnt8xkTkxCpi1DeeowmVmhMiooNTKFVcWoC6XBf01SWjgtfAQJRVujhH/sZtdzI6S39
	pyjDzos1LiHJYHbn8IV99+3nYPFuYnLL/aCEWRun8kQe0aHoQpW6n/RJ6W1yRjWmaBhbPgJGt26nE
	9rsAsMfFQ7F/FYyMyxcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVYmk-00013m-VG; Mon, 04 May 2020 10:57:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVYmi-00013H-SL; Mon, 04 May 2020 10:57:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id r26so8526726wmh.0;
 Mon, 04 May 2020 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wa5WiCb9TEfNBJdjqXOuNtc/EWG1LBgXWPOn2VDgW3c=;
 b=OC0Oig/8p1pqe6Npie+Z3tLPK0YEEKOjNLDYcZH+Eei1Q1Jau92N2IIZaovS0dvqe3
 AIVqVnvRLI5LQECLxmgrKjx5oNKZjv25SWD8rfkdeXH2Ho/A9oKYq/Cc/fFADYMS5E8q
 d7V85Q6JXDhsFLyOsxf+3D97Oj9GTM3E+iV695GaIcoBpcS7X6cKFK//3DcoYtDJ1dAA
 bB1E6IPqdTM7qHGg8l8OBB/1S/NZlm2N7XvVwf4blNrJpfD3SOOPUj5ZGbjQar+40caZ
 qou4bYadPbj779ARQ+/NffLLG3oRemD8cR7R3EYTp6AaHH4tFDmeeIk6pmVHZsW1/i2h
 VXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wa5WiCb9TEfNBJdjqXOuNtc/EWG1LBgXWPOn2VDgW3c=;
 b=f+pcL7xkEqcGD02Qbu4mA4nI7ext7BBgqr7mkNmyRXRfYh1Mdzyp/le1VAqGLa0+9I
 Yif+so71qv9MnFrbrsjpOUtf3OLJH2EfiC1hX5AjmLE95nRQRmTwEKYWAsSloRMGtGGC
 tBVKhd4tfQrxli6Wxp4cuua03utx4Z25qeE7q/GufwT31FQe9jnmE48LFVlU1VahHyA7
 ptMAnqXRyGXVX+n2IImWBz1/iAjeqsq7aCBP6pWrAEbgyuFDHx40haYm5P5DS3DwcHVg
 +pCsAhlPNSUMFzmGWphclIlj8RuOBwVjNcx/iNENAK0FGaSq5R3yyCpIY20bUYMyv948
 s4gA==
X-Gm-Message-State: AGi0PubidTZB12RF8+rlhqKsItMe239HtrKLACNlk58AHkT2KLKdm/bT
 93ASOi/MuiishXlfCYghY1LIUocn86Zp4hPUGUzi1tuZAcnOyg==
X-Google-Smtp-Source: APiQypLqWxs9smL4/H4j2LkvDhC+HNcMjptT98h06tKklq/lvJxELX6C+aKZcpkjEaQMIP9E4GnKbgGSyCkX+f2KiWE=
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr15099067wmc.83.1588589835503; 
 Mon, 04 May 2020 03:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
 <20200502114752.1048500-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200502114752.1048500-3-martin.blumenstingl@googlemail.com>
From: hex dump <hexdump0815@gmail.com>
Date: Mon, 4 May 2020 12:57:01 +0200
Message-ID: <CAKTihDUSbnCyqrH3eBU89h9vae3FoAUm9k1j=4s21A=VviyN1A@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: phy: meson8b-usb2: Add compatible string
 for Meson8m2
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_035716_915126_C4C5C333 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, May 2, 2020 at 1:48 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The USB2 PHY on Meson8m2 is identical to the one on Meson8b but
> different to the one on Meson8. The only known difference is that Meson8
> does not set the ACA_ENABLE bit while Meson8b and Meson8m2 do.
> Add an explicit compatible string for Meson8m2 so those differences can
> be taken care of.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Tested-by: hexdump <hexdump0815@googlemail.com>

> ---
>  .../devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml        | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml
> index c2fe8c08d99e..1d402e055045 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml
> @@ -16,6 +16,7 @@ properties:
>            - enum:
>              - amlogic,meson8-usb2-phy
>              - amlogic,meson8b-usb2-phy
> +            - amlogic,meson8m2-usb2-phy
>            - const: amlogic,meson-mx-usb2-phy
>        - const: amlogic,meson-gxbb-usb2-phy
>
> --
> 2.26.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
