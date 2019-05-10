Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BBCC04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 21:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 823B020989
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 21:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OD0idfKi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ci2xc1wM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 823B020989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9fvttU6dJlIpUsLeILFUdSZ25RyDe87wsWsNp0ZnNU=; b=OD0idfKiqkWN2p
	EOjSfueNzhG4UXBzb7y0GJl5AaRG2yPPBE/lJLf0vNweFDdwMEPeonZ4Z6w0aXwL2Va0WKiQijSx1
	b/ESrpFyafJqAhtKZtv+t3OQzoTfVZteSBeRX67Z2LduoEDF0czGSE1evRKWw54otMUN3fgcAhVNZ
	OB0KKtZhJiwA9Ui/sR0P+a5dGzCMlWeD8Vmb3XZTTo/NE0vB2hg785cmNHii86xAmPBYvwFXG9ahi
	wTFOK+j0WYPPW1ISufGm3ys4q/9LedOgYPOT50/9zvrqpYPIP1H9I9dgXEdYAUTijdDFsU0Zg3sBw
	pe7d/AKE2bbNi192ygVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPDJ7-0003mv-2r; Fri, 10 May 2019 21:43:57 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPDJ4-0003mV-3H
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 21:43:55 +0000
Received: by mail-pf1-x444.google.com with SMTP id t87so3892486pfa.2
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=txyEEfuShyaKA6OU4S1C4qT56CSHhTHuadhhSgL/B1w=;
 b=ci2xc1wMaUwRzlapr3pHT3/06zeHBirtF8f8zIVeaDiEcqVmHzp8ogt2zKmtauZmmL
 VZg/Ua/ac6Wvtp5CoYM+tnC+aYJaIBAZL/I49GcWt47mNK4nhHSsjecPYnOitfIdasBD
 AYTR08ttwqYyE0Ej5rmdVDb49HkxqKb+WKnZ9TH0Y0zkn244hVP/WYmeoBK5CqBl2emv
 g/aKYE7jv5GV/ja1Evbhw35hjze33nG1A3FodYiHjFc19l124BBiEBJ9VqziVZ8Mqjzx
 qBdPmQfXE/QaAS4/STKAdR9UpbmC9z32yGxjaZ5yEj7OpwP5BmxaWMtk4pmQj6lcNOxx
 L6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=txyEEfuShyaKA6OU4S1C4qT56CSHhTHuadhhSgL/B1w=;
 b=FCJeJxeoUnsbFD28tamVOTIltqcNApRG9TOpoCJM/FaWkB3Ssjdx1wzZ9QwhiN210h
 zwxVm60m+wWTUZ0wIzZeKojRRBzeJZI3CHiTlbBxWjSOu8lYGpHBPa11Dcr7iYdVzigS
 dKOiuznk+W7kS9Wi48eoKR9HktJ4/+3xdpGFzUE1eR+uTxz+Uo7tUQW99LGogSVKgEGV
 qMurzERZpEWBt6f/GPpP7TCv+6TNlKbL22mpNo0BXZ0rtgo3viyOIg1ixontO5Oolqpk
 iWyExAeA4WCnbSiAdMYs/8WbxypTQyLea0hyfXrMDWQ7LfTtl7FKQmolSDJXc6iasiT1
 girw==
X-Gm-Message-State: APjAAAWUtY69FX/fJpKnIf2gw6JpNdTVW5K4VPhVV7X0qN7Pm3T6RPU2
 S4B/e35dsAs0rCFme5TBfWNf+g==
X-Google-Smtp-Source: APXvYqzRCjmRJjSzsDwGBlbaEZrNsuy1m6VB19YK4Aid076Xs8KZtDoj/OsSd8Sa+55YAvxnj8ibsw==
X-Received: by 2002:a63:a449:: with SMTP id c9mr16552136pgp.149.1557524632125; 
 Fri, 10 May 2019 14:43:52 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id
 j189sm15075590pfc.72.2019.05.10.14.43.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 14:43:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: sei510: consistently order nodes
In-Reply-To: <20190510155327.5759-2-jbrunet@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com>
 <20190510155327.5759-2-jbrunet@baylibre.com>
Date: Fri, 10 May 2019 14:43:50 -0700
Message-ID: <7h4l62dlyh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_144354_182739_ED9B459E 
X-CRM114-Status: GOOD (  10.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Like order boards, order nodes by address then node names then aliases.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 92 +++++++++----------
>  1 file changed, 46 insertions(+), 46 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index 34b40587e5ef..61fb30047d7f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -14,10 +14,6 @@
>  	compatible = "seirobotics,sei510", "amlogic,g12a";
>  	model = "SEI Robotics SEI510";
>  
> -	aliases {
> -		serial0 = &uart_AO;
> -	};
> -
>  	adc_keys {
>  		compatible = "adc-keys";
>  		io-channels = <&saradc 0>;
> @@ -31,13 +27,8 @@
>  		};
>  	};
>  
> -	ao_5v: regulator-ao_5v {
> -		compatible = "regulator-fixed";
> -		regulator-name = "AO_5V";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		vin-supply = <&dc_in>;
> -		regulator-always-on;
> +	aliases {
> +		serial0 = &uart_AO;
>  	};

minor nit: I kind of like "aliases" and "chosen" at the top since they
are kind of special nodes, but honestly, I can't think of a really good
reason other than personal preference, so keeping things sorted as
you've done here is probably better.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
