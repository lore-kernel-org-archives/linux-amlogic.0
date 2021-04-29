Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0852C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 21:34:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6695561445
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 21:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6695561445
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MtUO1D8gyh/DRM/jBylbcu5kLkKfsxElH6lgQXVxlPM=; b=R/eTgF+d3Tqu5zmVfrLMJl4Nk
	LmErZAEzHerZoCp6ed7AkCd+yrgh10ZyESc91xuX0xvEwn/PQDi8E85qfDLtk8Go702GPLDSnL2j8
	7BMmfbgFfVQakZoGR9+MBFRfdnxSzWip1TW9EssABE2fZQtnf0rpAk2rKwoWSXbEzDXSzXJDzUhjB
	U6y32WJYEEzvAPl71IEYlZYoFahxu4Ixnjp7ySnMX7ztbVYJZt/dnInnyCILfD7+v4uYo8bUCRVr/
	leZk9nPfezy0vVsLEmsi96eAX3S/fxjDjbJlIAs6kLX163RbxjlJahOZPn3MwsLbTimhj1riufgAf
	azlH0Nwqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEJ2-006a3n-0G; Thu, 29 Apr 2021 21:34:44 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEIj-006a0w-Q3; Thu, 29 Apr 2021 21:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lK7Nlie8/CSVsi6nATHCgI80+6/hcW39NKGz6rfjDvg=; b=Jx5PKzmkNQkVwy0LcsI1gYnKE/
 vsyWEMSmJapUnpV/yoKi54S5ueYxl2lq89UV/58ErF3xJz7DneoxQM4iAc1+zwB2FssDK0ScMQOeW
 q3mbmsNm5/JpWYbeNB8xC9n2urxOL/b8UWWUSDq1n79w2b0cqmGqp4QBYgxOy9sKNbt3m0lGGvF7R
 Cs0TEdKzDfExCK6QHKhHkt/M0fPq+fnGj3aVLxg0TH3YqbAgyQ3r+0DC9j2uV27N7yB5Syr9//tgE
 fRlpraKIQuf2uvAhm51DOf6uvIT+zPfQ6Hghx7nB8xNNjWu71Cr3rkJ9pRsmESswjGZrhRQJwhjJt
 bfnitxgw==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEIX-000zGV-AK; Thu, 29 Apr 2021 21:34:14 +0000
Received: by mail-ed1-x52b.google.com with SMTP id c22so16656449edn.7;
 Thu, 29 Apr 2021 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lK7Nlie8/CSVsi6nATHCgI80+6/hcW39NKGz6rfjDvg=;
 b=lGwWY4B0mzo9H/D8qY6EwB2aDhMdLWxmvdzG7QLtNvUZqht09Awps1zmgiFdYHjVn9
 YBmxabI/Uo7fBYfTRUhE25B01vtzhy19V1fT3/einCKwtU2aozJUX2NKI0zcLlmvZehy
 eqbTtbucreVWSCMR46rtS0tNpBEMhOJY58bLsEhvB6oZ4GU/O4yjKjbYuiVqS961AcR+
 vdpPbO2jOILHStO7xjyH6Yl40TgfEnD/TcUZmeoRMKyfDHdhDzVxp+kh2s2CIbgVM77e
 FpSsPBfjVKqa8EVuMUzPH+utOXLxZb7ahm8STgE4pv2BRH4hoSHYhc5dvRIMztk1b3h3
 kRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lK7Nlie8/CSVsi6nATHCgI80+6/hcW39NKGz6rfjDvg=;
 b=sSEFh9NTgpvicaA8ddpkmWfH1lEZTyQoDQ1sYhf1EL8EuQjCvMAOr2qw3j2SIc9pAC
 hxf9XRtbkTp+kGo861ytDgLkwjq+/U4bdEsMTvFwKuxuDQwbnntXgjwJ742u9wk7EqU+
 lkC8CzvgyJlFc03L/79c0LMgfEuDNlPtjA5ViDATzbMPz2rCrmB2deIcbZC0cpL2F7DN
 j/R1E/SH0xemn3pHy8VRPZX0ewW56MCHI/ZmwTrTqcyAX1hO8oED59qkxQkI2Zq3ivaM
 DJfYHOuy+pX5xeAn3p5aaTfq+dKsGihBJkvsthfqYQ+8bn/XdyAnmCJoZh0e+yU/ggPP
 Azkg==
X-Gm-Message-State: AOAM530W+/t9tsciQdjdtX3JUZpWw8IHL4lCXlu3yqL3GMNeLyQzCmuK
 nbmdBhX9nfM7900c0JV8vUwfpougGdVak18pKUU=
X-Google-Smtp-Source: ABdhPJyJlMTpZCe3fhbuYHhGYiJ2pCRraOG67uxsWh2kgU9qtljHfumpwrJxvOsleWMNFwrjL2V0tDuom6jURPpkn14=
X-Received: by 2002:a50:9e4f:: with SMTP id z73mr1972841ede.338.1619732051559; 
 Thu, 29 Apr 2021 14:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210429060830.6266-1-wens@kernel.org>
In-Reply-To: <20210429060830.6266-1-wens@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 29 Apr 2021 23:34:00 +0200
Message-ID: <CAFBinCBrx8tCiWMf+p1k7Mn91yQ5JFGFgSw5fYvGtn6zjwxPJw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_143413_375766_9AE6FF2D 
X-CRM114-Status: GOOD (  19.08  )
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

On Thu, Apr 29, 2021 at 8:08 AM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> The NanoPi K2 has a AP6212 WiFi+BT combo module. The WiFi portion is
> already enabled. The BT part is connected via UART and I2S.
>
> Enable the UART and add a device node describing the Bluetooth portion
> of the module.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
one nit-pick below - with that you can add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> index 7273eed5292c..10f48fb1af61 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> @@ -385,9 +385,19 @@ &uart_AO {
>
>  /* Bluetooth on AP6212 */
>  &uart_A {
> -       status = "disabled";
> +       status = "okay";
>         pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
>         pinctrl-names = "default";
based on Documentation/devicetree/bindings/serial/serial.yaml please add:
  uart-has-rtscts;


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
