Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D025C5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB1321985
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aJk9KUR7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TtsFiJat"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB1321985
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftVQEZiAFlVh2xbLaxdIIekt+VjHTMwlqEMory6cVg0=; b=aJk9KUR7OswaEu
	zQEpeOKt5Zga56rFp6rBoUR7uP0n9u6wKnwMFkFe0AyfZ9EOT2D/tDPMlhtP3kn3fwH67rgFS/2op
	XeJYQfKXkVB3S/jAExun75tcBuPkoe1DhRyKMRwQCGLFO3FGGAnLKIHADVXSTeDihurXqVhKKPlH0
	er9LzeXL0vfuk2QUYMRHH3ejqEAfYhjp/ywTvty3Lb6KJ4Gl9CAIeAmoONLl76U9WKlr43x1iR3HZ
	uywNrYyB6YFXHeHq0TIA4Ct+4d5jcusSVcQuqjL+kfKE9OBE5IpFqev+Qxk3vLfiOJmewQpCLmJjW
	a4jFtEq21VHYGR00Lbaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiRmw-0004EA-BX; Tue, 02 Jul 2019 23:02:14 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiRmh-00042g-Gb; Tue, 02 Jul 2019 23:02:00 +0000
Received: by mail-ot1-x343.google.com with SMTP id r21so277603otq.6;
 Tue, 02 Jul 2019 16:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qbrn6+3X47dwhyUkAWXte8J+fjd+tHfpJpFHgAD+S58=;
 b=TtsFiJatyqjLoJBxRVt34oXzoLGjO+FToXJtmv6CMHqLJ1J83PkR6QLrCwLHwZJnDn
 rctTXjH0uAqvaRXNTUMUyew3QYxk8VGHKOJx53ikFwb5551GicsjHXcHFydA3g2ygLLm
 qUGMeUdNAuAwkIfZf0Xdyzf7BNKslpY47cG4HmIReOIUhHcoNfXFQGvf7od4YcjkIT0x
 xfigNk7ibXc0Nk50OjWAz5Hnkma8gjHVw6gkyxtRaWT80undWb/Xshw9gtH2ElUj2U6b
 xNHQG6Gf3IEUxRhcTkGmBLtMbJiauTEClCyOKiARxVaySyOrgn6brYMqadKyW+9xVZ78
 6kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qbrn6+3X47dwhyUkAWXte8J+fjd+tHfpJpFHgAD+S58=;
 b=PtBE42rpoh1hXwjXXTzMB+B0tT5sz1KutvPf9o/GFt7OiNk1brp9lkC5WLG9/BVLHu
 p1JuI7kVwNm0ZOoa17K4Ez7qqME/CG5KvGmxkkf61KYgGLWt9iJ5NX2kg6tpfR1uzjvB
 CK/vONJ2GYuzw6RgBepUISpaPPn82hI5YbxgWh/+UlI+bIE9696tJQ5vllUEvIWdqpfl
 PojFjb7Mtp71FXJSVbFBOkLbBBOtskxEWjktlshL1es7f227RMg4D9B6lK6F0ihOTUDq
 0wbylCiIDjuoW8olyG/UCjtScgfg7jRDwgciaktmUqP/+w4HqEjtlzpuMg5O+clhDRAz
 UiYQ==
X-Gm-Message-State: APjAAAUC07nohr6955BHbXQP42dRrT6HKHDfYJ/MhqLOLKtyZA8v8oAh
 9CNBSnmnQD9a5c8+PzZtVxFt48iPQoB02cVPzMw=
X-Google-Smtp-Source: APXvYqwyhHHZpYKTd+W1EP2ObsG3A5HTjaf6wiigNc78pHsXxw86smXpidtCkCRHFB9PyazmH3UOEt3pYpO/+Mr8cF0=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr26119392otb.98.1562108518402; 
 Tue, 02 Jul 2019 16:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-6-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 01:01:47 +0200
Message-ID: <CAFBinCD8WfhgcjKfstvVoDaLWm9yoZUg4SJpj-i1R+KgZ17aKg@mail.gmail.com>
Subject: Re: [RFC/RFT v3 05/14] soc: amlogic: meson-clk-measure: protect
 measure with a mutex
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_160159_556728_1F47AA91 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> In order to protect clock measuring when multiple process asks for
> a measure, protect the main measure function with mutexes.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/soc/amlogic/meson-clk-measure.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 19d4cbc93a17..c470e24f1dfa 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -11,6 +11,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/regmap.h>
>
> +static DEFINE_MUTEX(measure_lock);
I wonder if that should be part of struct meson_msr for consistency reasons

apart from that:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
