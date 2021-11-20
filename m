Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE939C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Nov 2021 23:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lF0b6Qlwczpw6siFRj3Ldqm3Dr4OpuX0DF9OkBRrDcY=; b=umk0ncLU/PuUf3
	tBH5zlV9jV1Aev33Iv6DT+JOopM0sq1lAc5J1z0FbCPSjz8mhaIDfN9tcJ/a9SpLkINX4BIbtym80
	LzPsVLfD+3FICtzLFhXIkDvqKtMxUfGfuVqBtrhyejs7ybeK/X0RpJHMP5urQ96FveKNTXWnrn5/2
	F+mtx4jIjS/EraEU32AtI5bCeUuhx3DkoNtSwYN37vkRJOeG7qKzZYDiBNqY0QS3btJcUxYAyjHQK
	BJl3YkDNuxTuiqTrfeCmLgF78e+apoHPzbfhRBssF58VoWkvjBwgUq9U8Z2kDWKK5ycS6OArSYnyN
	7wqKERHobGYoWA62FRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moaEX-00D5Qy-8W; Sat, 20 Nov 2021 23:57:25 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moaET-00D5QY-Rh
 for linux-amlogic@lists.infradead.org; Sat, 20 Nov 2021 23:57:23 +0000
Received: by mail-ed1-x532.google.com with SMTP id o20so14882574eds.10
 for <linux-amlogic@lists.infradead.org>; Sat, 20 Nov 2021 15:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F5sv4rcMTrhYHornG640LvlmFUzYpzF/uMv5wuwnFA4=;
 b=KqF35IvUaoojoKBQHxLa+EhPGzpcMTC8+x718D5FuVl6VeWd604ugCjjre5otbt5PV
 bG3m2Jtu/s3Umpi4aFznHxGqyAwh8R+XOy7wAUHfYJoeVcOHOiptPq8aPiYsSsaDkXLw
 ovvBD+N6g0La0ZsoTNIJY3sVChWs/hUnYDsz99dHyJuqWsHQIfQCjCRdmCAxjn/U/Oel
 GvbJlryGkJInHx9D9G0UmlQt7ojwP1LjP0AdtQP1nl2nmZrtuUwnhNHRu/N3nVIUDa7P
 +gp/S9fTBEp9J1D1Ti3vGiA+HLIg3MTLnvcvAlLyocudM67N8QI5G1SIzXeNc/fZ8OZc
 Ka4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5sv4rcMTrhYHornG640LvlmFUzYpzF/uMv5wuwnFA4=;
 b=pEdhSS+TZ32TsZ2p3Dn3y7f0/YzwE/AwYMFxFLARH7BxUz73FSGJTg+LMSWJs3Q5Zk
 icN2YfOuBG970wcW8ZERKRRPB5N2vRj0SRLRbhbjbaZ+W0rXwttgiY+5VEGnkBSvip6L
 Q5t2mmjZ3sfmsF88maTZn4EiQXRCtsQlXYbdnuio34S41TzJkZ2gzd/+IP0lQsVoMJ52
 DCKKn6hBtxfycyNFJZOiTrgmUddaN8TKqF6VQkpjRcmLdvyYBzeZrQsmKG3uIx4rPb0j
 HhIq0Yr+ACHbUfOCkiOaYR8Y9tRxu46T1q7o70VPIvtI9GWWvFpVANn7Cbn6xW38JTht
 KndQ==
X-Gm-Message-State: AOAM531JyPG/7PKsJBGhyKbv8QmjpoJRTT5RHNqx3gmk5aKZ08F/nScF
 wAvQ28526se+GkjMwDCbtl3j3+vPW0IFvYbFjWU=
X-Google-Smtp-Source: ABdhPJzn8mqm8xib8HnioRMdm0uhJxnJSh9wqmShlbVnLNSL1nB8uBXlhDbcbNqXHaabpnMoro2qzWyD++Zopf4gFpQ=
X-Received: by 2002:a50:f68c:: with SMTP id d12mr35001969edn.307.1637452640350; 
 Sat, 20 Nov 2021 15:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-4-aouledameur@baylibre.com>
In-Reply-To: <20211112162827.128319-4-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Nov 2021 00:57:09 +0100
Message-ID: <CAFBinCCvOnrvC64sA++5DegZq1g9MmwvnCiYh-WB4dSkoBsCBA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] phy: amlogic: meson8b-usb2: fix shared reset
 control use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org, 
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_155721_960094_AB8EA4F8 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Hi Amjad,

Thanks for working on this!

On Fri, Nov 12, 2021 at 5:33 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
[...]
> +               reset_control_rearm(priv->reset);
Using priv->reset in this driver currently requires an IS_ERR check beforehand.
When I wrote the driver originally I used the following code in
phy_meson8b_usb2_probe:
  priv->reset = ...
  if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
    return PTR_ERR(priv->reset);

That means: priv->reset can (in theory) be an error pointer at runtime.
Since your patch is valid: can you please add another one (before this
one) in the series and change the priv->reset error checking to use
something like:
  if (IS_ERR(priv->reset))
    return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset), "Failed to
get the reset line");

With such a patch you can consider this one as:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
