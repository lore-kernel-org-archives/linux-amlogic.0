Return-Path: <SRS0=Q/al=QR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05C1C282C2
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Feb 2019 10:56:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9C2214DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Feb 2019 10:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O3KiPudt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VcT41kpl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9C2214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWSaR5O2ROZzjONicweVltc4dIKJkJ1cjBIRi8pHPm4=; b=O3KiPudtW6p6/5
	kMlep+VQydbG3SadsR6MXgzOwTEKNNKI9OF4yBuWNxPs8ykHM5Ne2/llgyGnthJtz0L8IzaTpsD8z
	MOIrUfm7VOd8sxBzYlwwl3K2KS9KsDL4dV3NJI6pYMmh0rcfjx83Cp5EVh7l3PAv8kZRVdgXkpIwa
	VBHJ5rLvmaMEiBzrYkA/ZQwIqJkWpfJ2CpAjMtowevwrkqA5YRGHeO722Y9JVFZXBhdx1R+6kCyrI
	syTHLQTUlRmt9Ollfz4eLWFr7S1epX943BGeDHpJ1RFtcq/cTEXA/nH7ti3iAE/KsVr2og8Z+5h6F
	M0/BKDpb84G61AGzqkjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsmmu-0008Ro-6q; Sun, 10 Feb 2019 10:56:40 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsmmZ-0008Ee-7T
 for linux-amlogic@lists.infradead.org; Sun, 10 Feb 2019 10:56:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id z5so11750558wmf.0
 for <linux-amlogic@lists.infradead.org>; Sun, 10 Feb 2019 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=7oY8y/5KEU9g0VhG2/ILsB0AuA8IxVBBUO9nvWk0KyM=;
 b=VcT41kpltmh5cgM3qum9dSbkysM0qJsdFOwCRuuKdUShepKgJe8A8QFyc7xeBlu2QM
 I/StkV7SJBB9I8d0J26JJhxt2/g9Nv5Se3SUBDE8i5W6ABe9B+5ry/23TMOGCpA5SxiS
 gAAuGinKXCOhGxzVMfPlEoMfA6si3s/+ZynSkfejcsdyXNP6e9dvRXaK64rsWWWrupjl
 FuuHUjaPIEEjwEzq1S5n9MRVX5Q3bpTHxuxT3JFgFckyMJgV4nA0RCQ2Lku/DFdHYqJ3
 4IRPUhUOVedSZCYYgE5IRMAHZOBlLKogD4B5/rKeHOidihoVFo9sFBI9QalAhdh59P61
 quuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=7oY8y/5KEU9g0VhG2/ILsB0AuA8IxVBBUO9nvWk0KyM=;
 b=SHNBmy6gMWghu2XYMgUTFRiuq4HKXXBl/2R7oDbVXfaBOqJS5+le7Xz9o7Ho2S+MRu
 QNyU/9/s3UeFzln884Bx11FTW8F/7ya4VVWPl1kcsl+6rlcrcRCqePjkDHwrBLA3C349
 jndZuqbrpu5yyDr1rQ7yKU9MnXZuC6pr7Sew/SvneSAOLUeLbVXayAtdnM46Sw2j7aJy
 Ll9mt8xU2MaIOFRjAJpyFKlqHc1WwnvLpR/ftTDjoEgKmBz4m/fmGPyW1b46NR6oaJri
 Ne2R92qH2kLAmE1lH2eWCwLVIlxuVEDgdTMm3SOffV9pFeQyIeLKJRmSAfWcLgA2QgSo
 RoMQ==
X-Gm-Message-State: AHQUAuYXX9r+3NNs0yvwa0qzVfolJkI9F1EnxGIrhL9RiJ+N8XO9IxwA
 hAu1gD6FZKckmsFXlO+N7/eRCg==
X-Google-Smtp-Source: AHgI3Ia1Q1G98suQPYDhp2Vh6c9gUzIZxf6fP47l91UticAb0del3vUR4PibMIt43379ARmIXmSYjQ==
X-Received: by 2002:a1c:b1d5:: with SMTP id a204mr5954495wmf.32.1549796175600; 
 Sun, 10 Feb 2019 02:56:15 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id q21sm11054636wmc.14.2019.02.10.02.56.14
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 10 Feb 2019 02:56:15 -0800 (PST)
Message-ID: <5C60034E.5030706@baylibre.com>
Date: Sun, 10 Feb 2019 11:56:14 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Stijn Tintel <stijn@linux-ipv6.be>, khilman@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson-gxbb-odroidc2: enable I2C bus B
References: <20190209155005.18458-1-stijn@linux-ipv6.be>
In-Reply-To: <20190209155005.18458-1-stijn@linux-ipv6.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_025619_280689_2D5146A0 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Le 09/02/2019 16:50, Stijn Tintel a =E9crit :
> The ODROID C2 has 2 I2C buses, so enable both of them.

Thanks for the change, but this I2C bus is on the 40-pin header,
until we have a way to add support for HATs/CAPEs/<whatever hooks on the he=
ader>
upstream, we prefer not enabling any functions on these pins by default.

You can, if you want add support for most functions, but "disabled" with a
proper description of pins used by these functions.

You can also maintain a set of overlay files like it's done for the
libretech-cc boards https://github.com/libre-computer-project/libretech-ove=
rlays/tree/for-4.13.y/overlays
and use them with the Armbian mainline based latest image for example.

Neil

> =

> Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/a=
rm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 1cc9dc68ef00..ee666471a580 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -180,6 +180,12 @@
>  	pinctrl-names =3D "default";
>  };
>  =

> +&i2c_B {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&i2c_b_pins>;
> +	pinctrl-names =3D "default";
> +};
> +
>  &ir {
>  	status =3D "okay";
>  	pinctrl-0 =3D <&remote_input_ao_pins>;
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
