Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD7FC2D0E7
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 23:26:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18E020409
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 23:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MKoQeISX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ue1h1Ngs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C18E020409
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O16Es2w5CxGX62YR3ZfKCAloqsf5CEcqIho1UjAPi8Q=; b=MKoQeISXswNWRd
	UJnDLRyPYxho8YZQhovpMlNGKIwXwmihs1FDQ3GiOlMfcs+Eitw/Vh+iC/EkZkw3qdirmFelc8FX7
	9vXjFILoWv8YxF7v8RH9ymOFyVvDXmucbO/wNCoowN07CyVqu+jhuQZNa0BVATvLOeqoH771rdUd4
	nKveeICjPhsk6OlIAjLUFo2M1r90UlM6EnLtuXGAsinavEyuupJlkoURvxMB3/CefKxxZhEbJexYq
	9QoOWbEOr/1IniOUn3c3JgRdeNhlIkuDdLv34u7C+q2x2O3pF6Gglqr+npagFp5Gjg66L6KNdAH9r
	jHLGMxAY3DwIARaVZ/Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHbtF-0003jD-RA; Thu, 26 Mar 2020 23:26:21 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHbtC-0003ig-3G; Thu, 26 Mar 2020 23:26:19 +0000
Received: by mail-ed1-x541.google.com with SMTP id v1so9005554edq.8;
 Thu, 26 Mar 2020 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqZyECE7b3l+/W5cG6aN6aQ7OERbPPJKLPh37gMr4P8=;
 b=ue1h1NgsTbotQg6qMgEzUEGsjz11gWWWp2SUopj+TH8eOOBmYryxsfc281mZqrloEv
 P76dythInNUEfdLKgr7SgCfjmFg6sE925yUai/7kD6iygiYW41tOLyueWqE41PZp/QQL
 FrX5esvWQpq4u2MT/46hJXxhdRYrB5LZG3OXoJRY8UAsN3fhBfF+Mmj+NBCYmBlhXkiB
 ee9g1chV624ys8iJxZOeJyLMD2lsOpr6uT72VNd2zFkDdFIzEQU1YJ3iJvKiaWZUvhxd
 8ctYZYkWyFiCfSr/Sev5oQ62jff2k4N93aiamR/xOeC6EwLqNDKHb5/vZDTffrPQMHeA
 j5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqZyECE7b3l+/W5cG6aN6aQ7OERbPPJKLPh37gMr4P8=;
 b=hF4JFD5Nnwlxz0Jz0VjWay3NlJ+YTW8HPf1w+bZqimV+pf7C+0OyMvjNnDSgaGhpoT
 H1P5+xRVJ4hIEOEhZLtEZj4SpHHWpHgnQeJF+Q6imfhxBYXP6zjsU+3TrzEo7HTjdm8O
 eACT7NwxotumlfShhE94gzfK/nyTP/0jqisLFm+kbD+vGYW7V+VXMkjmAAdR2sG3U7UQ
 P5Dd+4n4UXQeg27wNxRCM1mlclZ3mLA0QrtvV7iCBQd+pfDRKIuklhLAEu4vuY91jL//
 HvZT2bzNORel3X7OxbrJYjHb2XzM4KFVxXqgURL1jYrZpbIBcQ5bXekIzZXfyO0rfaaK
 YbjA==
X-Gm-Message-State: ANhLgQ1soppZwdYswzNhwFykNlNx7scrEpLgKpwp5i/GlJ/RirGD8p5G
 B9EGZE8E7zo/mqKUfSI0/zpalb/2szzezLCsiQTDWo5H
X-Google-Smtp-Source: ADFU+vszUtR++CH3qXXBapVjGUYTUgP4+oCVQrrF3dM3CXErGyDOKMkYURV1D0IJSRdLQ53DbhvctfJOG7ec6N875qg=
X-Received: by 2002:a17:906:491:: with SMTP id f17mr162602eja.30.1585265176806; 
 Thu, 26 Mar 2020 16:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200326134507.4808-1-narmstrong@baylibre.com>
 <20200326134507.4808-8-narmstrong@baylibre.com>
In-Reply-To: <20200326134507.4808-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Mar 2020 00:26:06 +0100
Message-ID: <CAFBinCBhk+XvjGODBaNH7tzCfGktYdmk1wED8UC6cYmS3ucbig@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] usb: dwc3: meson-g12a: refactor usb init
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_162618_137077_EB3BC321 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: balbi@kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Thu, Mar 26, 2020 at 2:45 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> -static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
> +static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv,
> +                                    enum phy_mode mode)
>  {
>         int i, ret;
>
> -       if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
> -               priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
> -       else
> -               priv->otg_phy_mode = PHY_MODE_USB_HOST;
> -
>         for (i = 0; i < priv->drvdata->num_phys; ++i) {
>                 if (!priv->phys[i])
>                         continue;
> @@ -284,9 +286,10 @@ static void dwc3_meson_g12a_usb3_init(struct dwc3_meson_g12a *priv)
>                         FIELD_PREP(USB_R1_P30_PCS_TX_SWING_FULL_MASK, 127));
>  }
There is something strange with dwc3_meson_g12a_usb2_init.
enum phy_mode mode is added here but it's not used inside this function

I also think that we should not pass enum phy_mode to
dwc3_meson_g12a_usb_otg_apply_mode
I'm aware that the original function used enum phy_mode inside but
this doesn't seem right:
we're not configuring a PHY there
instead we're setting up the OTG switch so I think we should use enum
usb_role instead

[...]
not part of this patch but should be:
there's a still a direct call to dwc3_meson_g12a_usb_init() in
dwc3_meson_g12a_resume()
I think that needs to be changed to priv->drvdata->usb_init(priv); as well

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
