Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BC4C47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 09:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 285CD61242
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 09:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285CD61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LJpbpv+LNKACj7kVukq/QUM+TEaw+3kBnZ9QA3wzSQ=; b=3byIkAIttcYwla
	Gzl2MVNKFhDcGNPdh62IxulAGGdzqmDVN1FDgKtviec+CsBLnkkMfNj0Ihjf7U1oKEsMrCR63gbDZ
	Odi1jUAhBTfvj2s0mdrA+gDUI+2SYDKtHgwErcfVw1CGGaOpkCipYfx7BZCsXi7tzvhtgD+TOr+up
	KJHpoSZf9o911Dkux8/diKnWfkYJ1ByrhG6aEQAsceujjGB0q8dL6TaL2/QRayZ+xHG7uaACXVJ76
	NtXsdGEqTJZjR0F9mQ1BoJVKewRQzcsul31p6mdi/LTTseknFvXgXSzrzGjx7x4YauJWocgJB57It
	eQ7Df892P/qSc7kP82QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpSzO-00GOY9-AI; Sat, 05 Jun 2021 09:53:10 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpSz2-00GOPJ-8Y; Sat, 05 Jun 2021 09:52:52 +0000
Received: by mail-ed1-x52d.google.com with SMTP id b11so13995324edy.4;
 Sat, 05 Jun 2021 02:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+0AfCe+AnGuvkOIER3nDjEqdQTuYBtNrjSVqb94ABWM=;
 b=BqMzg/S9cDMDkZYiXVBCycIeo7ddgthjkqzFqqWYzcAo+SrHpYLe2KcATTz99bai+t
 29vE9+raYz3cyLM2j/QOj30ytpEcwzN4OFxwuIX8EudPjQ3hJQ1lseT9ItFYQHuKnMjO
 /vTc9AD2NrG4NmG9FFa1+FboycLSHbaAGEZqCW7ge5NB+S0oWNxOouoY0cxP6NoTI5j1
 aqC1vskHtDQX5MPgRTQbJ7tH/Kddc0qvghBw8tIJwe0zX10QURhPsv6UF53Lw1haMbFt
 8aVC6xQjpPunsQ2DRuk/B2ilH/A4gg/E0TeDrcu88FpWGl114h4jIPyObZgHYBdARym7
 e9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0AfCe+AnGuvkOIER3nDjEqdQTuYBtNrjSVqb94ABWM=;
 b=oqy6o1jbWcG4UYfzvbbRWsFTtaeQmtVaYTMIdyXrEXt3jgn7AFIDwd+Bp9rxry729v
 H0a1kEy27er+1l3VGqR2ZAyMELqf8nDHRJfEZORA+C85K97uReNoOsOuTUU5xj/ytfqX
 A7WeYX+fSdKkemDDBGSkwMOy3Wc42RI9EONRiGifW/2EehWoKN4VedKPnHw4UMBSfLAM
 qhAJEu6INlsxhYz5GhxDqg4tp6Uq9JsKMCKrbN51pTed1PkeuMR0xsmCWE6vgdkGuOdr
 kmzZXzmr+ef4apOABvxRx0m3hbRyQd7/MgWaR/zcWKjWvNxmKAQvi4J+Pf/08V0+F3zq
 dYWA==
X-Gm-Message-State: AOAM532TiMgCPD5zhKxwrjoAoWAYSP83tzNfh/P8Y8ExGm1gzv3c7E3N
 Ouwr0JrINwUkuDBYSf1wxKfVWB0DBaXwHpklyi6Tq51QtAA=
X-Google-Smtp-Source: ABdhPJyKglIG9Jms2+CsJNo7kBtqYbUy0dCCoVZc7b/D2JH8g0ejV5RMArrBSbT3dFZIxWaS4XrRXrGh1wxvv00JeL8=
X-Received: by 2002:aa7:cfc7:: with SMTP id r7mr6251662edy.13.1622886765949;
 Sat, 05 Jun 2021 02:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210605062313.418343-1-xieqinick@gmail.com>
 <20210605062313.418343-2-xieqinick@gmail.com>
In-Reply-To: <20210605062313.418343-2-xieqinick@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Jun 2021 11:52:35 +0200
Message-ID: <CAFBinCCsix8MJKzsapmNA-Fe9wKk7xZMsLj9bGWZ_GskiqZLoA@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: meson: vim3: add serial aliases
To: xieqinick@gmail.com
Cc: robh+dt@kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nick@khadas.com, artem@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_025248_347693_A8D6F5F7 
X-CRM114-Status: GOOD (  15.72  )
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

On Sat, Jun 5, 2021 at 8:23 AM <xieqinick@gmail.com> wrote:
>
> From: Nick Xie <nick@khadas.com>
>
> Add serial aliases for Khadas VIM3/3L.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 66d67524b031..4686ea7abe0b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -13,6 +13,10 @@
>  / {
>         aliases {
>                 serial0 = &uart_AO;
> +               serial1 = &uart_A;
uart_A is used for the Bluetooth module so with mainline Linux it will
not get a /dev/ttyAMLx character device
For that reason we are not adding an alias for uart_A when a new
board.dts is added

I suggest that you also drop this alias here because it is not visible
to the user ever
Same applies to VIM1 and VIM2 as well


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
