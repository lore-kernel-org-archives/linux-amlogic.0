Return-Path: <SRS0=wfDe=WU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E671FC3A59E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 21:19:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B152D20674
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 21:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgCe2lkp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kGmCMbR7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B152D20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc5Fd9gIhGe7gqkUgkC8D6pcgrDUgj5KGEyPx33oDbs=; b=fgCe2lkp/RiDhB
	O0JiHPRXWTR/aESE7YVlGD2i+XxsNbC9I7xN6msc+JtKjS3o7CVJ/BwnjMRyf/3Zinc8pMhMByvdH
	+IE073o7oZ0MbsGM3ZKpaDwO0tjlR4NyB8i3c0SN21r25t82uVbATHhE5fFnNWgSDx8atLBGemSFP
	8S+xhahX76QSIdl4/+jPLvSXKQpBNdmfQ0YlhND1r0q6ToviOJqBqJJNsHL1GtK/jvOz4P6jVyIDL
	2qobMJa1Ly/mFng1g+o5OleklFwikz7f/+WWYK70uJn8woKTIXVbZoGdCu3qBNifRColGFOYJC8NO
	cGGmnJYvZfQbaojXUKVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1dRb-00010b-62; Sat, 24 Aug 2019 21:19:31 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1dQM-0000Wq-AT; Sat, 24 Aug 2019 21:18:15 +0000
Received: by mail-ot1-x343.google.com with SMTP id 100so1109808otn.2;
 Sat, 24 Aug 2019 14:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fC0UloVJVd7/NU/uEaCTd2LLUTCDIdGGkP7UNozA/vg=;
 b=kGmCMbR7sxG2Q8arZgcNRhhxUCcaNY2s4M5AYWXatkqZrkrTiw/az6vmKkeQ+y9dEc
 v/tuz6wuTkTI+rnsAVPp40XfYO2EoxITAIk1/RQOMwzzCZGZD/2BHWKJxT8XClRRv/xK
 ZTOEXs62AfMNAwgwqtj2J57M+qDI1UHhG4F+4rTJDFWLkOf/8DAj9PCcuxoVKAYCXgG0
 PY/sPTQrqZbxlgZ6vUvOlcRkZcYcbvnEVu+pC+dgYb71mZ5gNgMbJtsMCquMhVKBtRE5
 4gdy1e76nRnZBVcr8neWFQ3hJ8x4zUEq36HSDhNvg07d4h00Jx5DyUsC0mVfkfTEt393
 c1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fC0UloVJVd7/NU/uEaCTd2LLUTCDIdGGkP7UNozA/vg=;
 b=dxD/cxbvRyhT7Mf6ZlRiLm1AQtnrj58WFExyGSjH9G4q/WQgs+jssUe/0kd1a9wrPM
 9HZi+NKfnWBqlaDWD0Fphqr3S6Z/moLxLLNDmSK8HKins+Fk61gGdXG6tqyRm+mVhapZ
 6RIBDV4763WU6AgjPw0VLP+DAUo1shjIMrcTqqHvI6LoVd9orJRi4GNmmIuz87Clatno
 ++x06L4MHArgejJ7GCkrxTkh/sL5wzLCiKL9bhb4s+UW5a3zdkdzZ4vj29LXsK/fV2hM
 XUepAKQv289K70FVH1d/9HSlrkXgZZV9lWZcT4GWPGJGZWseHtxh8r7qNWHa2yjoC7gM
 EQVQ==
X-Gm-Message-State: APjAAAW9+HXb9sW/9yEvKshZXycjrya7Xytzj26hhcbpQi71Q9mkTCkl
 NMcdRsF5Qb+JuOlLMB1wTqk6paMA3cDrluZqHyE=
X-Google-Smtp-Source: APXvYqyc9UMrt0FZO+Czm5ynmHfnj9YArOYB/nd6DV6XFFx7to8SEBFvn4jOe+dwqxaAVKBg8HIXBX6GFOg3lVZAIRY=
X-Received: by 2002:a9d:7b44:: with SMTP id f4mr895020oto.42.1566681492890;
 Sat, 24 Aug 2019 14:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190824184912.795-1-linux.amoon@gmail.com>
In-Reply-To: <20190824184912.795-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 24 Aug 2019 23:18:01 +0200
Message-ID: <CAFBinCCkEE8==-Sqqj_=Ofnx7_H-970dETwEmEPohs74806ZMw@mail.gmail.com>
Subject: Re: [PATCHv4 0/3] Odroid c2 usb fixs
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_141814_391556_DDC6A57C 
X-CRM114-Status: UNSURE (   6.49  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

thank you for the patches

On Sat, Aug 24, 2019 at 8:49 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> Anand Moon (3):
>   arm64: dts: meson: odroid-c2: p5v0 is the main 5V power input
>   arm64: dts: meson: odroid-c2: Add missing linking regulator to usb bus
>   arm64: dts: meson: odroid-c2: Disable usb_otg bus to avoid power
>     failed warning
this whole series is:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
