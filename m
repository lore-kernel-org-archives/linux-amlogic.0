Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D20C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 21:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMnoqcHG815ucwRzG7Zd7fewR1FDipw4sA+O5AUhmzA=; b=BA+cKP+JenGdAc/r+ubfVYXsra
	oJvAPTlIKm2vb7HwimSHpZ+Q4eBfxBtOnexLuq7DC2hnpaph7hR9vPNFtHKZA6Kpe/xJRoKd+hEM/
	3nPuW2LjRgHdD8rtc9QHfAvanmiR23GQ+9v6cpTq67adm+oJuHzV2Cx0Am2l0+EUTMIpUtWiIAHnr
	4684JhAHnRsWd3XAW1wKt0LmNrTxGlBqcCjhH9QXstkyO83hjTWIxIpVKHJXvOxrjI/RGOAKXaaNs
	DE8ItLZuzOxrP+iC2FQgCXSqMF5DEmr1KnyiywtJsgOlykCkULUE+h/s7QmkwNAJj7UwAGDYP/36j
	CSM3DlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtzAM-0020N5-UG; Sun, 05 Dec 2021 21:35:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtzAJ-0020Ml-TI
 for linux-amlogic@lists.infradead.org; Sun, 05 Dec 2021 21:35:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id j3so18394209wrp.1
 for <linux-amlogic@lists.infradead.org>; Sun, 05 Dec 2021 13:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=epWjfoqIM5iM8Kz2eHVOpsCTtELbUSkxxeWV41PDpW0=;
 b=OH9kxve8qHVsQAMeKTPC1GB/VPe94tQYHgN3VYiWtZ8nRQj2PJ5tqn21D/Ro873eqD
 OrCBvchlyGjZVtEj9yZKhlrFwf0X2wX9jcNOwLfA0dIZqNJKg4lUPtNeeK6fLzFVB4IU
 JpPWc3a9Iz8tnv8Zn7pwSAVJN+qmT86ujg5H2A9IiCeFdJrEQ5F5yihpaSwP9XtIgZw8
 yjNermRVLnonL/L1MLjOSzBh3CFMmYXKAm+R2F8Z4DKDwb/n1MaKNF+43t5Z9yuOP5TJ
 4UcARE79UAJCnzziYAnnWZ96J0iARaY79LmQSMQv5D+wyAYYQl6PAPTR8FcEQ5td9Tff
 1ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=epWjfoqIM5iM8Kz2eHVOpsCTtELbUSkxxeWV41PDpW0=;
 b=EPw1euBdsG/fsnR+Odh+4Zn1npGMnj7isic6dPq3NlHuf51D+AX56k+MsMqKxCsVBy
 S+icnwOMUr42OQKD2nei6GFOR7xwQbBFVMcCrLoGzRCSpS4biJ1WdUcb6zj/cDI7xAas
 dSYu4CKRtRmYgCeCxPDHxqUAxH/z3svDp/DYDOCbEELHGILG0wZ7YOTGxMOXikqeZ/iB
 DM0YIuxp0qpB5avI0CbxG8ifucKhKgk2et4lqHsH6Sp9QR/O7/ZOImA6FKoosARCHCCP
 K5wTfLwxjdwt9DSIO1ThGxz4AjjE9vH4pbvTh73u/cvpPYGdlwy1vFn9QrX6OBn8Gof9
 tGVg==
X-Gm-Message-State: AOAM532kuEvenRQsq7DOKI6EXUgmPUgpwII4HGaBqCgHdy4smPPfmmHz
 jSFpALyiPgEtjPOgdLU0rz888Q==
X-Google-Smtp-Source: ABdhPJzB6cCTgywiUB+081lYOTTBwfJt4abdsi4rweJO3t1NPS5I3U+LPForvYeP/306N9mi2sJUbg==
X-Received: by 2002:adf:97c2:: with SMTP id t2mr38605987wrb.577.1638740122521; 
 Sun, 05 Dec 2021 13:35:22 -0800 (PST)
Received: from [192.168.1.24] (203.247.120.78.rev.sfr.net. [78.120.247.203])
 by smtp.gmail.com with ESMTPSA id j40sm11535887wms.19.2021.12.05.13.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 13:35:21 -0800 (PST)
Subject: Re: [PATCH v3 3/3] phy: amlogic: meson8b-usb2: fix shared reset
 control use
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-4-aouledameur@baylibre.com>
 <CAFBinCCvOnrvC64sA++5DegZq1g9MmwvnCiYh-WB4dSkoBsCBA@mail.gmail.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <bb0ca11d-789a-6f43-ffad-624407122fdd@baylibre.com>
Date: Sun, 5 Dec 2021 22:35:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCvOnrvC64sA++5DegZq1g9MmwvnCiYh-WB4dSkoBsCBA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_133524_007658_5CED2FA4 
X-CRM114-Status: GOOD (  19.09  )
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

Hi Martin,

Thank you for reviewing this.

On 21/11/2021 00:57, Martin Blumenstingl wrote:
> Hi Amjad,
>
> Thanks for working on this!
>
> On Fri, Nov 12, 2021 at 5:33 PM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
> [...]
>> +               reset_control_rearm(priv->reset);
> Using priv->reset in this driver currently requires an IS_ERR check beforehand.
> When I wrote the driver originally I used the following code in
> phy_meson8b_usb2_probe:
>    priv->reset = ...
>    if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
>      return PTR_ERR(priv->reset);
>
> That means: priv->reset can (in theory) be an error pointer at runtime.
> Since your patch is valid: can you please add another one (before this
> one) in the series and change the priv->reset error checking to use
> something like:
>    if (IS_ERR(priv->reset))
>      return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset), "Failed to
> get the reset line");

No worries, will do.


Regards,

Amjad

> With such a patch you can consider this one as:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
>
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
