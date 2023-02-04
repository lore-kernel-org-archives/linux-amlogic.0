Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E22C636CC
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Feb 2023 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXmHBmnB4VRnFNLOmilGaHRLPlqC1WHchHVe5OaSBEk=; b=UpMXVZ9wgTHNZ8
	aBm3YaV17sblDbLMto8KRPiIw5vh1DDs5gDqgPUnFmtCf3D9ZO4qrkbOoKj1D3BzuOmn3NWHLFCk7
	PvEBnEZs9MSn11e1QPQ3cldGY55M//fDRiu5ueV4Q1V9ZTFRq2BPJh5g24eWmsIWSRZ2NDp88x7JU
	Y6Fu60HLWuSjHIg3TSNvxuLCQTcJvSFW9MHMVatY+VNfoIwVQpyuX6yOYjTDV4D2hRElriiU+UK37
	JVNpwrKfS86Hva6vCqhL8rjSboJ3beal2J385ksuvrKxSALf49Dy8fd9XX/DMW0XdkMAAMHHcmZlL
	zYC8Kecomd9q7Xru+BaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pORT5-005ep8-JA; Sat, 04 Feb 2023 22:57:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pORSv-005eoL-1N; Sat, 04 Feb 2023 22:57:02 +0000
Received: by mail-ej1-x632.google.com with SMTP id ud5so24768365ejc.4;
        Sat, 04 Feb 2023 14:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=++3ki4CrWn8PwCbV12Du3KDkubTTSliZE+lFg3FXWZA=;
        b=G6iygtZPFbdD/FLo8tr9r/DmPuXfJxDSYVI/rNJzOq/GHgdHyoLGBn6YJuFDXM0Lf0
         6S9CQDJdXkMFB0EMa+z3LnDKwnFitIf0tcwk+929vdWDwkmF3N2xoQr/wjsfXSNtZApY
         qRNVJm8aNRvO1QkNHoK5l4B1Un6QHQE65e96rT5KPrLvpLrqWORKapfVmUj7AGLelZBn
         L62smTxMu5gfX/c2eGgPQt1Ef/BmkLiEEon96Nw1sRiJKn3wJ1bwtP+TH0Bn3HtO6EXb
         LaObnPyuLZmPd+J3PmeMTZYjVJMm5/+dcsjjOmRzc4EVlF1M+eL7k2ACBNAf1uA3y/uY
         +vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++3ki4CrWn8PwCbV12Du3KDkubTTSliZE+lFg3FXWZA=;
        b=jgw9MGVXstaeQCw65ul0+vXu454tnqfbP+Im1kx8k/tLIoCz3rdZgpEx9RamPJPB7t
         k1LY/fYY8uTIeOWtAwxMwTTZWHTN9nbbaoJAezL3NR8FUPUj54t6im8ypNrujC0v5aRd
         wfDvQ0x/4a7jA/fN5Tir9ElGPa/l10ELZa2iu4kvUh+zH6bD81qxjibgdQyDitIJVg/d
         f//W4oOyaH5/fhq/Ijz57tw7FlpY5nwunFG6fj2v5j7qST349lQhszaz4N09ayxXz1zJ
         jxb72DNlU8ETrwbru9eG9v4C9BI7pd8q98ocF4Rrx06pqa/JOS6HlZE6CNGih9WLSCq9
         KJBA==
X-Gm-Message-State: AO0yUKXx7XuQ/W7AEnWXhR91Qh484btGQE3PiMaYJqvb+BbEbB7zQ+Rt
	t1Q88SVLlnmsqu9h5iW1DPmlMVjQGXfTlQI1RpM=
X-Google-Smtp-Source: AK7set+txf4e33E1Ec5PHP4R/1tRJoemicr5j11xoXShzF1b6MM4YFfNPE3KII06yr1QECYsDjVsxMqYKHgJ1uricNM=
X-Received: by 2002:a17:907:9916:b0:886:2823:423e with SMTP id
 ka22-20020a170907991600b008862823423emr4316559ejc.284.1675551418807; Sat, 04
 Feb 2023 14:56:58 -0800 (PST)
MIME-Version: 1.0
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com> <20230201020647.GA2318275-robh@kernel.org>
 <b0e502fa-ef11-df82-ad45-9367ff7c75b3@gmail.com>
In-Reply-To: <b0e502fa-ef11-df82-ad45-9367ff7c75b3@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Feb 2023 23:56:47 +0100
Message-ID: <CAFBinCDHtX2W=Sh4ffUbugn+XVH2UcXWKH2Q63W9G074x6o7zw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_145701_101640_E67D21DC 
X-CRM114-Status: GOOD (  13.41  )
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

Hi Heiner,

On Wed, Feb 1, 2023 at 11:13 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
[...]
> >> +      - items:
> >> +          - const: amlogic,meson8m2-aobus-pinctrl
> >> +          - const: amlogic,meson8-aobus-pinctrl
> >> +      - items:
> >> +          - const: amlogic,meson8m2-cbus-pinctrl
> >> +          - const: amlogic,meson8-cbus-pinctrl
> >
> > Again, can't have both with and without the fallback allowed.
> >
> Hi Martin,
>
> meson8m2 is the only chip version having a fallback for the
> pinctrl compatible. Is this fallback really needed?
> Looking at the driver it seems that both compatibles
> are handled identically.
Back in the day we decided to duplicate the Meson8 driver code just to
add four new pin functions that are added by the Meson8m2 SoC
generation:
"eth_rxd2", "eth_rxd3", "eth_txd2", "eth_txd3"

The compatible string was defined with a similar approach: since
Meson8m2 just adds a few bits to the Meson8 pin controller it's
backwards compatible.

If the fallback has to be removed then I'm okay with that but I would
like to understand it first.
So far I thought that Rob basically asked to remove the following two
compatible strings from the enum (as they're listed separately with
their fallbacks):
- amlogic,meson8m2-cbus-pinctrl
- amlogic,meson8m2-aobus-pinctrl


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
