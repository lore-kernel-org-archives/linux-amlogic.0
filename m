Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F3AC4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:40:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873AE22282
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AgEbuzhN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NLNalLo9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 873AE22282
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v4CrBBX/FdgS+8TG2rbyJoKU3suVRdjEAmdzpCDyXic=; b=AgEbuzhNRkrfRBzZbQJ4C7dky
	IHOofmcLUmgi/die5KsHI9OlYG8qlQmDotRzO/f0dsscIm85YRfPgn0XLunqPj6vyvEDsllmTNYrx
	POgNX0FfzVLcEm5FXN/LVbQdOFQN646FGyUDUkVBNlWRLF0/IwgA2aq1emO0W6n6S81XVmJRGr6sx
	BOsWIewjlj1pg27d6yrVVAMbVI9Pk9eDKMGlGM6LQ1xDQnML0iOr5qnvwGldGCXsirhUw71YsDh4Q
	ac7gC8yxh4NIDwQK/rHqy0b20BQJM63K8bBHofQeuDi8wtEctTQGXO+PtQSmGbbMPym3ppTAQ+0rq
	1xmVCAONw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUxU9-0001Kt-VJ; Tue, 20 Oct 2020 19:39:54 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUxTl-00017j-FT; Tue, 20 Oct 2020 19:39:30 +0000
Received: by mail-ed1-x542.google.com with SMTP id p13so3085765edi.7;
 Tue, 20 Oct 2020 12:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DmEY/3B36rc7sVYS5bmAl4GIQZmQ0TR8py1mNtFFze8=;
 b=NLNalLo9FO4qKv1h1bag9C95ybV5BXHyv2mhky/ilgVIhYxvghmSphinCFBHjeITDI
 OpDgV2f5jxD9MdWdMD4qZ/bHo/k59MSyFjH8OtqJGkXjK3arkY0dtLU23dQuVJ1k1Yjd
 UCfgYCsAYp57jNZsvmE4HBSyDwBFs9p5njLDKDAWkyY2APtkivk6AoDET6aofvzhxPmb
 eqHiv8jnWHr+Sr+m/KiyxT4r9+ksFVhGPXwJkL8szinb2oIoyEiUKaOMVaZ91uT+A56u
 5qVH0gMxkI4VNBWFcmGqgblbASdaZawwkX3f0ADVn2pAZeidb87nj33sbMnUUnnGU3ZJ
 3Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DmEY/3B36rc7sVYS5bmAl4GIQZmQ0TR8py1mNtFFze8=;
 b=uIyivr+SZZnp6MV5JpafehK8vdfPOGB0X47fkdzAQST4e44g5hMS9rGTvGjHB1s2WX
 QqBKCD0DAVNVuWIKLI/IrOOHX2mfwERWC0krGS9aurzJv9GLEC8fXP+SkC9wXE+IMAbr
 5L9AwP5ROLON+dssnyCdSGRvpxfd9W206A2YRJM7UNMcAWuHsec8HA+zCTIAhfZ3AL97
 K3KloQhIo3hLbaThHZ0L5GBuFCX25JTsvz+cimJ67mGc0zJgBqGxO1NumWDdfNegjB5d
 gVWh8sx5ichtDsWGx/0JB5OgE8p94wmdXiQCvvnJwsPpKfZDF2rRx2bwf35axDhDje0D
 Tsnw==
X-Gm-Message-State: AOAM530m97cxKIWkI/cHcMRkg8TfX5EC4XUoaQBGAeHfG/nLdW4So92f
 SOEDSOGn0aPajNARyX5KpyXZnITWKFqibVl5jt4=
X-Google-Smtp-Source: ABdhPJx3YnqPt0OnfWGhREBVBxoIT3gIhF/DGWwfopbOvy/HF8apZgJJDk+qAfk/8yfX3eD1fi9xRR3AbHsGmkfTGK4=
X-Received: by 2002:aa7:d690:: with SMTP id d16mr4503121edr.301.1603222768286; 
 Tue, 20 Oct 2020 12:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201019172824.32166-1-trix@redhat.com>
In-Reply-To: <20201019172824.32166-1-trix@redhat.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:39:17 +0200
Message-ID: <CAFBinCDKf_TJb9ONfz+383NB0yKDb2a_zxXktAoBHKg_03L2+Q@mail.gmail.com>
Subject: Re: [PATCH] iio: remove unneeded break
To: trix@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_153929_556417_1FF64C75 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: lars@metafoo.de, Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzk@kernel.org, andy.shevchenko@gmail.com,
 linux-arm-kernel@lists.infradead.org, pmeerw@pmeerw.net,
 linux-amlogic@lists.infradead.org, jonathan.albrieux@gmail.com,
 alexandru.ardelean@analog.com, jic23@kernel.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 19, 2020 at 7:28 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> A break is not needed if it is preceded by a return
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/iio/adc/meson_saradc.c       | 2 --
for meson_saradc.c:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
