Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325ECC433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:13:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D97205C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tI5r1ix8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PCva7823"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D97205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugW8ODxkwgbvtoRRx9SiFa01565M03G7VMWVxlz6tFI=; b=tI5r1ix8Y5Z7ZI
	ZoULa/JNGUWwOTaxEqbRmiVGWQicK9mqaKPbb3S2d6O5H3R92J1wclko77ndvbE5631UZRrNzHTY9
	gbQkuophDhgnqW0SkeTzZ1n5t/IEdZ2WDsLrqQHPyuBBf5UFdVDyc/afua2vg52MjleLlnKEt2f3G
	kk4fEcLOijZCiba42pMiKJGT+9MJBixEMD2sYF2aFz8q2olB6wkGUHEzY96d/9Y9vY1/BpWY/3Goi
	qXbRTLx4YP9TqnFsX88DHavtihvWPl4cE6z3iFnU2gtp5yLQqbV1XKd9bj1FNhAl9PbIyE42Qx3eU
	CD9K268TBEU3+SuJ9ONA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv4tX-0003rg-Cw; Tue, 06 Aug 2019 19:13:15 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv4tU-0003qg-FR; Tue, 06 Aug 2019 19:13:13 +0000
Received: by mail-oi1-x243.google.com with SMTP id l12so7594104oil.1;
 Tue, 06 Aug 2019 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vsIcnWtDlXQXoT39FUMhv6STy1MA/nY/7+ohKy0CG9I=;
 b=PCva78234+8dGi9ooJjncnPkATqM4ogU4wQtMcMIWoJUt7R0rmuGYbMZgwfY/eb1rF
 4UJlb14BQxeXW5sGBddhNuPu61eGczQj3Sw6GKvwg9dXI6UfTwzNIb52CLYwZsa2QhTE
 kioMu2NkoWQPeZ5h8Ni46UfBr3Qzjwj2p1N+8bhzyHxYVXzChoB08YZClubTddE8QViM
 qycF0pGtPJapJiluqp7F0iUh3q/T9vJ0gGI0/wuIFxXLBvMt4nPeutpI6YD/Co/a1RD+
 1aGXaEzAoUxF1D1NEWCLT1FtB/MsV+o4kmH89HEwYZOHFRHzuoyAvQ9S5YS7QRFWLuwC
 ZXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vsIcnWtDlXQXoT39FUMhv6STy1MA/nY/7+ohKy0CG9I=;
 b=UVuzfXnTvlQRp5RXZjvMcOIm/eZLsE8YHw65UI3me4v7Mxq4HgTLTshlU0AZ6HvwqW
 5rzKFr4gmVk4PYSEoh6ZZ1DIk5wuMCU34fJdCdpkQRGmBCGVQxJ3kR41ZLOoVRDoDth+
 GiOO2nXKUQknAWvS1cYdfXQ066sRxaNgHPDgW6vzagNAkw+PKonf/ljKOMRVkdnjZZ8Q
 BSfVxpzl4LCxhl1CaX9JywB7CVEWIO1o/s5Lp75d8MAmDW+Ku7wF7x7Dh8Z5b23aqx++
 bC4ELEiNpXVh6wrdE/EL62j8uNMLdSG1KTy692RwoIHo8YyGN+waz1TDYYwFGMSyOdNj
 yAmw==
X-Gm-Message-State: APjAAAUIzwwcARc8+gxLufN46+xPmfLmSOpd4arNNeRhWPlzUi1pgVau
 dw5+jZZlSfPnZ2+g2Mf6Udy4aYWdGD1kpvvwayqalAxG
X-Google-Smtp-Source: APXvYqx1iaCtx2l6jQ/ORnw89sfklYFDiCu3d3ftL/+v2VZsnJxN0/SkcNSl0A0A0nWT/bugr/Ie6vZfl4ZTkagSVMw=
X-Received: by 2002:aca:5c55:: with SMTP id q82mr2858373oib.15.1565118788681; 
 Tue, 06 Aug 2019 12:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-5-narmstrong@baylibre.com>
In-Reply-To: <20190805120320.32282-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2019 21:12:57 +0200
Message-ID: <CAFBinCCiEX3m7E8FLwgKjpEvVC+zZOy0XBbaesuxSKZuQNxv4w@mail.gmail.com>
Subject: Re: [RFCv2 4/9] dt-bindings: reset: amlogic,
 meson-reset: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_121312_517697_A5F89220 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 5, 2019 at 2:06 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Reset controller over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
