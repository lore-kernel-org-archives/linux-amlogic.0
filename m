Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69449C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Feb 2023 18:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3X4EhB/u59Vb9nH7EOUHE1lLf5K4K7DrhrbXuXh3oU=; b=rXaHXvfL419AaV
	XmiK0fhEYzIRBr6di8u0Dm8b/f/oJZJAoJDKj8pwiiVsQWgdT0Bxu/TVkzkUxg45Op6KF6JgMnQPD
	/JY18jEnvW6sB44FzHAY6IZcdcxPaBMxjx9Q3uk5BGCxFQAVB4V2tH3sEPhTY2uXqfdwuaSHgxN9F
	vij4v9PsWR+NQMfwHQhzUlp5LvWq19DmKlQSHRDqorfnYf+vLKYWskrDymUpXtkPzRwjIIBOgSq2w
	uTSJxCNCft7Plhwwq56oChPrNVC8tFo7vIYzEho0K17+5Mk1fxGD1S6SDBFNHdIV0WGMzr/Q8748j
	Xv55uDwDWiXEUdg99qLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pToOz-0026sa-2Q; Sun, 19 Feb 2023 18:27:09 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pToOp-0026qg-I2; Sun, 19 Feb 2023 18:27:00 +0000
Received: by mail-ed1-x535.google.com with SMTP id eg19so4795474edb.0;
        Sun, 19 Feb 2023 10:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CrSEjosx76DpSWx5XDTFr+kUHA2weQ52QVd5sK72Ask=;
        b=JE4X7P2DG03+lyF/2gceW8ohZM1k5wSTKsf1SQOU7UDCeZ3Gm0oFjG40qNr776LP9T
         QnL+FDfpPeSfFJUshAB4b02iaCOQFT/MtF70g6w/V0e/HNXlixpKivlt1lEnW6Morj0p
         dBuXztEHPwtjhcXOomHm/ZOqOC+HLKd4wYKAlYCEksNPLvMOvcGDX6OGNd3uY2+6T3kq
         GXhfFFe7e2qzmQAJErXuX4sZNbxaeZuwMYYK5hKDlxgdh66PwEYxs1XQfO1+hKPKFIHw
         JGJ2/VcFXhF7anLeVVOX1QEk4QNAv0zvrHhijWiCFHrvducSXIc8ZU7C/UGSbGDtQOZR
         Ahqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrSEjosx76DpSWx5XDTFr+kUHA2weQ52QVd5sK72Ask=;
        b=mOtvPmiPSynzUyro2Z9AUnohIjLMvsiHzmq+1FsV/SR8IngLE+jbhVhIdtzyt7BDpz
         dMUsHhl/BvEeSJsf2Yz0A7wgJ9et02GsvUpx6yBxt3ThEUggMPiaJLS1HPdPWIwm2CoT
         fDyyt5g7l4q9HjEGJZbGz7ytOFIRVwDaW1+6SK24R4okKLWgC45Y3behdGS7F2YwyabT
         tAg33HC7DVGHXmDwxRn/mad7FVnQlVrUHKiYBekDVKOyfuDfNHA08kkY9hLXxhaYM2Mo
         bQvKHMsolufLH+16PkExU3DM0mLYLMflQ+ecHeHpkUCk8o5dVFsmeB9CYJD15nkZ791p
         xNFg==
X-Gm-Message-State: AO0yUKXn68QdEVt3zum173/0rJ8IIyt18vQQc9MP4Z88tUJ5+RW53pbz
	G7/k1WFNAHfS93QOEVxqa6gCYiilh3Rms3kYGuY=
X-Google-Smtp-Source: AK7set+hjIMZyDpWx0rNwLV2D3blCrW7tgAwg1K2/j6FObetNlFrdX0uEMMoCDudXOq+g1TFWGFxopgLio98kMF2Iko=
X-Received: by 2002:a17:906:ce59:b0:8b1:7e1b:5ec1 with SMTP id
 se25-20020a170906ce5900b008b17e1b5ec1mr4185182ejb.6.1676831209353; Sun, 19
 Feb 2023 10:26:49 -0800 (PST)
MIME-Version: 1.0
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com> <4dafc70f-be7f-bfdc-8845-bd97b27d1c4c@gmail.com>
In-Reply-To: <4dafc70f-be7f-bfdc-8845-bd97b27d1c4c@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Feb 2023 19:26:38 +0100
Message-ID: <CAFBinCAL+UdDm6P-AhEkS-M7nR=HkFJQ-nijZU8qgp7ZCJ2aww@mail.gmail.com>
Subject: Re: [PATCH 4/5] hwrng: meson: use struct hw_random priv data
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_102659_655903_CA4D351A 
X-CRM114-Status: UNSURE (   6.98  )
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

Hi Heiner,

On Sat, Feb 18, 2023 at 9:59 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> +       void __iomem *base = (__force void __iomem *)rng->priv;
I find that "(void __force __iomem *)" is the more common order in
other drivers. Which of these is correct is something I cannot tell
though.

Also I would like to hear some other opinions because to me the code
was easier to read before.
Your way is shorter and may save a few bytes (including alignment etc.) though.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
