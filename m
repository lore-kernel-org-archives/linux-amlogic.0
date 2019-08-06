Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42690C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 15:22:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1453D20C01
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 15:22:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ikGKPb+j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WB6QyejA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1453D20C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfvbECQY1FCe9r2Ajr8zEPYOnW+CU3IDyfCs4Xg7FLc=; b=ikGKPb+j2QYG1I
	rQyW/JKrYHA0qxDSjwRQH1u/t8C7PFgYn/gfaVzGLQCNHQ4yoWTT8KyTlUdxedLVe2/oX1VU+Rueq
	Ka0ip5zU3sf9EtA60yK9pFraaYYf7xub+JxgF+zTpcBMAmylnA2tThJGk9z+5GaRAdk4gnFZRaWQw
	bXIZ6lzfa/15X94IpNcsvsLnJoSteslbhV33wyHHdpAcDbefZS2qDh07HK3Uq6WyeV7apHkc7fGTk
	LiSuDWo7se9W+joIqZxv2ojJW24PYeA+4TXw9CFccmv5M8yZa1hlVaaHG3G5W0lzUGWXaSato/g2C
	mOutd+Luzh1Vt90uG48g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv1IC-00073J-Em; Tue, 06 Aug 2019 15:22:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1I9-00072s-UW; Tue, 06 Aug 2019 15:22:27 +0000
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 298AC216F4;
 Tue,  6 Aug 2019 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565104945;
 bh=JMOEGp6KBvPBaAeXLbOqrCVjJ676yUa1QkpMH2rvtq4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WB6QyejA8rC5KTGkiRanEHrenr2L+WDGFEwbW+24bcL6OUKddBHt1Km2Qppjg/bK5
 g6/jDc8o51vd81bcLHPWsTds7N81BByiFL2CDoWg7U0NJOyGa1kRPubYoEDiXKxvsd
 u0YsfNugfJZSgo/DSk6wYjlQaQsowFhNnHCQfeI8=
Received: by mail-qt1-f176.google.com with SMTP id l9so84851188qtu.6;
 Tue, 06 Aug 2019 08:22:25 -0700 (PDT)
X-Gm-Message-State: APjAAAXMJxCKuax6LyNuc0h2foPacooxuQv/+3MeSt1DcrPPW4Vuv6tI
 X5weNjhvqbNjufdXLCXeBvrF9CCjjkvteJ3Cyg==
X-Google-Smtp-Source: APXvYqxiYQR/HHbmEVYeeT1TCkPHwlx94sDjj7D7ngVhqwAXC1LaYwuz8JDKA4JGq7UFpO7Gh+2kiQyApncgjpmPu2I=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr3591713qth.136.1565104944340; 
 Tue, 06 Aug 2019 08:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190806125041.16105-1-narmstrong@baylibre.com>
 <20190806125041.16105-2-narmstrong@baylibre.com>
In-Reply-To: <20190806125041.16105-2-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 6 Aug 2019 09:22:12 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+6kCO8x53d1670VjgEjfs5opKY+R3OgsAo0WsXqq512Q@mail.gmail.com>
Message-ID: <CAL_Jsq+6kCO8x53d1670VjgEjfs5opKY+R3OgsAo0WsXqq512Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: snps,
 dwmac: update reg minItems maxItems
To: Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_082226_008140_D468222F 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

+Maxime

On Tue, Aug 6, 2019 at 6:50 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic Meson DWMAC glue bindings needs a second reg cells for the
> glue registers, thus update the reg minItems/maxItems to allow more
> than a single reg cell.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I haven't checked, but the derivative schema could be assuming this
schema enforced reg is 1 item. I don't think that's a major issue
though.

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
