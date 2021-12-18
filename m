Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162C9C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Dec 2021 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIKWb+gwq6sODfaoZhMWs0a8savnIvrwpnntTYTLP44=; b=ifj4/sXHKy7WZY
	EfyzhXJgbHn3LzbRm/KnzRylQtWQkXwVSOPELAJRJEjDyYIiNjhMbOLgkToQ4g4ZoVq2oCWMKqGyN
	4ATa9SEKmgk50YjR6J6dbrKQn8imZ5oRhhsHKujG9XTdoePUESIBvJdroEg+VNpykuvW4Do+y2DgR
	3Q20KXqeUyQRd9pICNlukC/CupB3UOuuYcieIYMA3Z9lh1jtZVNN2gbgEzTvyL+XY1/5VGiT0CW48
	MlX4g5ZeUK2oA6+iKpiXi/0Y7mDuQ5SnJHpepASXW6zzDaZEWJjwpH6P+TJrKWNCblPs8b++n298R
	p//Slo+eiHXzd5oi80bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mybKk-00E46F-2W; Sat, 18 Dec 2021 15:09:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mybKf-00E45P-W8
 for linux-amlogic@lists.infradead.org; Sat, 18 Dec 2021 15:09:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e5so9902391wrc.5
 for <linux-amlogic@lists.infradead.org>; Sat, 18 Dec 2021 07:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=4Jx0r8u8GwSVNZZUQkIGbMqgfeOF8CFRv/AVFU4Cz6Q=;
 b=LgF86P71CsNKaxbYYlfp4fDQgcPN1o8/rxFOXydIH8BZQ6GI+KfTJB2tJ6baAnF6yv
 jUIoOI8t1/FlOVDrS50KyecuHQF9LjNoEt5n7XCnctJgZAIvlLMy1yJBJ2/azBvwg/Da
 FnoZMsnhKNYFvrBLkKV6XvFO3zIZtL+4psnS3mHMLBlJ6T1RSreAV5O787SAU8mFgT3k
 +ifiKpKunsClSndxfTqJhf1FhC3Makx30Gm9Cq8J29f6oGoamZ2mxwQeOr2W9KPIF8aC
 jfAU+wtrUi+VCIwUqJk9ONkmBjGlY4mozz9rFqX6p1xMbYnJBxfmgck5rIJgV2kMB1ab
 vV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=4Jx0r8u8GwSVNZZUQkIGbMqgfeOF8CFRv/AVFU4Cz6Q=;
 b=LlheMznDvmQ2andsxiol7y5PxUC+If2DOQAEW+ZzD3u1asESU1sac9Ep2xjn3kJq+f
 42BxHATJRCyVs6l9N+OoI1N0ALGgtH3strsrCyafQb7BQpRT7ZFi8yeulw7Q7pMxJ7LA
 dP2GbC/QSBQQeVAzWWh9UioikFBty8gZT9mHxQxi86XJ5jZOS91EB+6axOvyWpBwj0LH
 eI5QwYPTU+E9N+weDISEj0paieH1ho+X/bE3A3dggKVEFopb/bWw09LST0663StYhAL+
 Zwesns2LH09661bioIXG/Z+SQTaWdfGuGL1kowy7wRF5lbOuYzJ7XqU9DmGh/ba9hlO9
 8VDQ==
X-Gm-Message-State: AOAM533fYiD3O8LSIGn52Mf6I5bxun9uzO/Do0dRGB3Cyky6KLLMhUTT
 pk/TQY64TBsKZ+FFH0paeUWXuA==
X-Google-Smtp-Source: ABdhPJyHNPKxPcjCWCy6WIP+tPA29bOw4V1wdCTCIArytZ74LqRyhzJKZ8cGqnz8hYeFB6Kqs1t1vQ==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr6283676wru.501.1639840147739; 
 Sat, 18 Dec 2021 07:09:07 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id p1sm1554275wma.42.2021.12.18.07.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 07:09:07 -0800 (PST)
References: <20211218142632.15293-1-alexander.stein@mailbox.org>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: meson-g12b-odroid-n2: move assigned-clocks
Date: Sat, 18 Dec 2021 16:03:16 +0100
In-reply-to: <20211218142632.15293-1-alexander.stein@mailbox.org>
Message-ID: <1j4k769ch7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_070910_103064_CB8F79A0 
X-CRM114-Status: GOOD (  14.02  )
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


On Sat 18 Dec 2021 at 15:26, Alexander Stein <alexander.stein@mailbox.org> wrote:

> dtschema expects a 'clocks' property if 'assigned-clocks' is used, but
> 'sound' node does not.
> So move the MPLL[0-2] clock settings &clkc_audio which actually use them.

No, this does not make sense.
The sound card needs the clocks set in such way - nothing else
The clock controller work just as well regarless of the clock rate

Having a clock property or not does not change that

> This fixes the dtschema warning:
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
>

Then the schema needs fixing IMO

> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi    | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 9c05c83453f5..85257507206c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -252,14 +252,6 @@ sound {
>  				"U19 INR", "ACODEC LORP",
>  				"Lineout", "U19 OUTL",
>  				"Lineout", "U19 OUTR";
> -
> -		assigned-clocks = <&clkc CLKID_MPLL2>,
> -				  <&clkc CLKID_MPLL0>,
> -				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
> -		assigned-clock-rates = <294912000>,
> -				       <270950400>,
> -				       <393216000>;
>  		status = "okay";
>  
>  		dai-link-0 {
> @@ -365,6 +357,13 @@ &cecb_AO {
>  };
>  
>  &clkc_audio {
> +	assigned-clocks = <&clkc CLKID_MPLL2>,
> +				<&clkc CLKID_MPLL0>,
> +				<&clkc CLKID_MPLL1>;
> +	assigned-clock-parents = <0>, <0>, <0>;
> +	assigned-clock-rates = <294912000>,
> +					<270950400>,
> +					<393216000>;
>  	status = "okay";
>  };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
