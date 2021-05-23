Return-Path: <SRS0=qVzq=KS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1264DC4707A
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 May 2021 16:04:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF3C60E0B
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 May 2021 16:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF3C60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Gj3WKaNSJ/DPSEUiPlmjn6ug58YWSxQ6e5Pe+3OeIg=; b=BL91HJs76Wl/SzA39j9kxxkOGF
	/q37si7828bPEtKsJbHXFGmUeNcDsF4mnwOGN3d4vn3s8NdFYgu052E2r7Z/6dcgrP+5s8a+POq7I
	nHygxUuCVjVF2BnnKbsAsce89uq03WPxr/uW/6l3+98gsuus31QMQ3pXhTyA/lMWbZIfXTJnU8KrO
	3JIwaQFP4HH+rRHxjdjsjdhyyJw2vRpp/6L1o+q6dbZWEN/G56D/DiiBBlal0quhxhbVC9AydxgBC
	NkMxrUeRxV1efa4C2rsA2rJVIdeip5feKqJaDP/IPd2TNWlROM16+PY5eEbqP+UXls/wYdPWBKbhb
	doXgRCIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkqaS-004alx-80; Sun, 23 May 2021 16:04:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkqaE-004alD-0T; Sun, 23 May 2021 16:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gJkD6i4SEo6SHdZ7GGHPrHMiskGVfh8CdW3Nufpvn2I=; b=Fdx3dzikUr09xTI7yMHd2YnK3L
 vrxAVPb9IokkDnXsd5pCVtdcc/it0YdLW8jWS03TTk3H1UivuevBHXGjfaaeqg+YW5A/adLk1P3/q
 aZLDMmC+5eBdpafx0HVst2q5PXcbCCGga1uAhJbNwCZbm4OvGVYwFNz7UDIcSBVnDPtvpOnHRnndF
 HRdVJsDeXs6J76Z7uej1jgqyHJVMCHnboPk6QdjZDoGB6DPzROwDV/akpDhGx+nUPlPK1sd4HbD7M
 ezzKLDE9ve9GuLDKyS9+d5Hoa2yasNqmqXO9zKqnv5nnVDrqjTwkiUDw5Mw5+Vi1g8+RTHoIylOYx
 c0Krci7w==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkqa9-000UK2-9H; Sun, 23 May 2021 16:04:02 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b17so29067639ede.0;
 Sun, 23 May 2021 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJkD6i4SEo6SHdZ7GGHPrHMiskGVfh8CdW3Nufpvn2I=;
 b=CnI3Abzt5Xv9BhXQL8KS9PW5422NN27D1tSFTpWB4Knv/ZRbOmrQ1ShJYV9KlqeGHS
 z7Fe4E7REfieJoL5gru+JIA1CUtP5Bhrn8Zp54hRj4apLyiRkK26gDNXlL/C4Im/NCpi
 BNqOYkHoIJCH8en6v7t4x2mrcOGf8k+MSGL6fTt3478Dou+Zeuhynm0cDXoc0hG8pzPJ
 Tb8FGtTw2RTOBQGnSkSFnS49eAApdPQYIv7HKTS4/xHBnSD+PMKBCm2mmOl+6fSAT7GA
 ovFDq21Va8xrotyiZVPDxWiGC1wLh3V7uPvJxHRXlGrD0g+kfn69UrKiFhnQ5xAoqAKI
 guCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJkD6i4SEo6SHdZ7GGHPrHMiskGVfh8CdW3Nufpvn2I=;
 b=qg9oPh7R3dgHKiWt5br/7rmwnQ6nYlGvMYoEs+sBR4hSdZ5hA/RLdSVxgC61QCcKTW
 vAZdkIsLDBiz8hOJepICM0yBGgzt0eTw2rqsbYehYf5VdLOj89IlRhKYVnPweSC+xh2F
 03dcbB7xv4W7o7daA39F4oXs8f3LOYLmPZ7xH3nqxYB702OqVYIo1rge2VnVQE/po6Oo
 OXx+SrtnnvYXv2THVhhFKE1pj9EbTprLd7NZZtQzDh49Aztw0WDkVE65vo0dbZS7EIg2
 3PUwjvrrQTxgVTaq7pcwPUIvPSm6iHZdblaSreEDkeRUv4T/SFliSKM6J77YinJqXnWj
 N0Mw==
X-Gm-Message-State: AOAM532/+0TOzL+Oqd6ViLnyEzH876s60KjRUMnVuFF7i7PVJ0pVsVqA
 yoQfxLg5ipKPlXb2HO5EzyM64ycVjWeU/gpBKSk=
X-Google-Smtp-Source: ABdhPJxFDpHabe9W6/7esigrOS2kY4rmQITdh3xVTXAkjKPgodavQcSx3o8iM0vUCzjfrFm/ao20QTXEe9xq6Na96dM=
X-Received: by 2002:a50:9346:: with SMTP id n6mr21297997eda.365.1621785837181; 
 Sun, 23 May 2021 09:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <79df054046224bbb0716a8c5c2082650290eec86.1621616013.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <79df054046224bbb0716a8c5c2082650290eec86.1621616013.git.christophe.jaillet@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 May 2021 18:03:46 +0200
Message-ID: <CAFBinCCBo4fYoO=2NiWTEixPuJo2Q=J1o1+yfi4Oc32SLi=GAw@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: Disable the regulator in the error
 handling path of the probe
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, 
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 jbrunet@baylibre.com, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_090401_367065_A080DCDC 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Christophe,

On Fri, May 21, 2021 at 6:55 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If an error occurs after a successful 'regulator_enable()' call,
> 'regulator_disable()' must be called.
>
> Fix the error handling path of the probe accordingly.
>
> The remove function doesn't need to be fixed, because the
> 'regulator_disable()' call is already hidden in 'dwc3_meson_g12a_suspend()'
> which is called via 'pm_runtime_set_suspended()' in the remove function.
>
> Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
for me this makes sense so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
> Please review carefully.
>
> I'm not that sure about:
>    The remove function doesn't need to be fixed, because the
>    'regulator_disable()' call is already hidden in 'dwc3_meson_g12a_suspend()'
>    which is called via 'pm_runtime_set_suspended()' in the remove function.
>
> This is more a guess than anything else!
I am not 100% sure about the suspend code-path, so I am hoping that
someone else (for example Neil) can also review your patch


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
