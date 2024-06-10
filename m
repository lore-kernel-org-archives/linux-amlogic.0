Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C785BC27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUB9WHFLk/3CTiTDjHNqhUE7Fx0xHAo/vQGB5HQg9rU=; b=ixYyfrVo7pFr29
	QnXCFimNFJf7XFdZSrzvU+ymSpmWd45lLr0lL39Z4mq/klrUylG0HxH33YpZil+5BVWhcC5ewewC6
	RM5B/sHvVlpRza36+ySq/WO3bayJBcakG6uUFJWANsNrhI+M/9WgbXq7yxDDeD5+nGjzJ81txXvpR
	Z+wzYmLgDPKIetzuhRYUQzSuBlyr1wy8X95aLTvtlnlk2SnC6W01NYdMWSo6fBSDCqvD3FKsCNPzM
	wBJGUuHLrdpW4AabuBvZLEDP8HAcSaab2YNGnKy5V3ZhMTEMCZLXYpRZuVYhB63QOK6nePBy7jMOT
	Ach0zoiaDrOwtsRW1vrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGfth-00000005OOa-2MNk;
	Mon, 10 Jun 2024 14:21:21 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGfte-00000005ONd-0Qpm
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jun 2024 14:21:19 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dfab5f7e749so4460227276.0
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2024 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718029276; x=1718634076; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=609nhEks7Zh1KnZUal4usjWqxEdaNAgYUODDdUetHO8=;
        b=GN6aBNpd0gijF1Ifq37m8E51E/N45KW5xGF9mNZzVSyXRsGwg/Av3NFr0cJqNQmv/b
         3cUxN0UsijbZeiCGdSss1OPiDNkKy4z6Fr3XXLHTThoPSz2BLEvicyQkzV2bexbLLkSx
         Am0n1nize2THzIbsizfn6bhdBG9Hzi7nouRKSItqfevcCh6QvYVepTVu3ENZ8izb36TF
         i1kumHRnOGkRLObIx3Mw6M2duMHULqfsQWiMvkbU/T8XuE2rY4vdmslj1HosTtT7jOYp
         mYP8C7vrlqUFMlvkpKraGsJYvwEPnsYhmY4GiZTcOUfcWMC6K0A4UEMsZjWlo8ysZpN2
         /j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029276; x=1718634076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=609nhEks7Zh1KnZUal4usjWqxEdaNAgYUODDdUetHO8=;
        b=t4O6t+HAKj/1IPoRbxLM690GRr5qfUovsvqr96RylgLbw7LMPo1m7n8ML3VAz+u+HE
         RFWixkOEBmmCjGBswT04oSr0aJu5X0qBL/ho985JhHXB3dE4dfoDzwepJuXQwyNg1tJN
         qNVY2dV+wC2Ia56pffG58JeTNMSaeoo0O3HY6ia7pKK9Bq9uGMNKn9Bt7lKptf3CCm8q
         CmV2sMvm3vUdDuLP5R+RLu7z/nnsQjfYlWveXuY9u/J6u+XOUCcPyIOj0LdPz4tzCxmu
         xhG+PF5Wbjvods6iJ9EuStHTIG5/YtaDcXAh0gVyVhuFPpEVIvYkFAQpzYdaovdCEOwj
         nL6A==
X-Forwarded-Encrypted: i=1; AJvYcCVG/RLsdYnqq1ypKDPF0vOswbULdqJ7JSOxbFrVuS8nl4/cDVwqYFlW/ktYETyNcTkgb50jcQKAdxxMV7oQKnqz3GX0JBDfGnMDakwE8tCFiCo=
X-Gm-Message-State: AOJu0Yz5wGpvjNk04ZUaYD+5Ec4zNhMAXX8LXiaS59++GfQDh8Akoom0
	ceaz5JGCIKT9tvjhAdZwFy7eW1PxWizNksL6LzrvSZTk8kILLhYC92zZigv5JErHt9coX3OeyZg
	EVF7GTbn4AJIc6bBPbG9iR8LWBrSLcuPBRPKUlQ==
X-Google-Smtp-Source: AGHT+IHoLwnHudRkBd9FlzoLDTTCeU9TkBRvSaQLs0M46ytBLEBxCuzZWLLsA/eXcLgbGrm/YTtoVzzDIcGtxZj8s10=
X-Received: by 2002:a25:c744:0:b0:df7:8fdd:1ca9 with SMTP id
 3f1490d57ef6-dfaf65f730dmr9276763276.1.1718029276379; Mon, 10 Jun 2024
 07:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-v1-1-4acbb8cc2626@linaro.org>
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-v1-1-4acbb8cc2626@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 10 Jun 2024 16:20:40 +0200
Message-ID: <CAPDyKFrNGzNqTfsYF6bwbZy8kJtRTcBJ3Xr99HFumtOGZOpxtw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: meson-gx: add optional power-domains
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_072118_170441_C1A0DC65 
X-CRM114-Status: GOOD (  15.16  )
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

On Wed, 5 Jun 2024 at 11:34, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On newer SoCs, the MMC controller can require a power-domain to operate,
> add it as optional.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index bc403ae9e5d9..57646575a13f 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -51,6 +51,9 @@ properties:
>        set when controller's internal DMA engine cannot access the DRAM memory,
>        like on the G12A dedicated SDIO controller.
>
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>
> ---
> base-commit: c3f38fa61af77b49866b006939479069cd451173
> change-id: 20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-a94d681d2e69
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
