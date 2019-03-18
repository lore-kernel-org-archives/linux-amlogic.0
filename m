Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDFCC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:13:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5C420828
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qJrqAm2p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FkxCn4Rc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5C420828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0HEcDLb4JqffTZc6DzGqVv6DmovqwjmyrAYwPg4l/c=; b=qJrqAm2pgSGRj0
	e2LhezvLDd9Jnv7115gVl7L9q2dWxu5LxXkH7m7gT+Lqxp+6G7i46r3kE6DzWuNxrbotE61ABqsVA
	C26WV+J3z8EqASYoQz4AwZIdREuzZJrk07IIphFQHM1U61YRuumPRCIYz/WpHkYyJwLj6YgXWWCIv
	Ltqj0zBcmj7k/6FPiEjdasrrEXiL5tU3ZZCY3qzOLLU7FwIqOq2I4eZAFhIq95s0CEelGDVoPXwnU
	bKOQ5VuHOyUiNe0XZJjKw2VJUNW1iiLsGgU0E7amTnWfg6Bbq/X6zrs3r3g00wGI0c5r5SlH9Kr7b
	6G6PmZEhxaQUjZYokPyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5ydW-0003d1-Ru; Mon, 18 Mar 2019 20:13:30 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5ydU-0003cf-Vq; Mon, 18 Mar 2019 20:13:29 +0000
Received: by mail-oi1-x244.google.com with SMTP id 67so14130617oif.10;
 Mon, 18 Mar 2019 13:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JX7zqHaIu/f/4WJ+moXDPr6XWTpIHVkf/YKVmDEyBQE=;
 b=FkxCn4Rci7k/IG1yg+mVFwx3nbStmUAu7To1o6ypuvQhJOTj92rQ/P8aj1HxNcQv5n
 B4XJB1jKVcvs0OKe87146WNXH5iew/LbN6t3aFsyBLIjRNLStkYrREzIaZcIaxjsNgJD
 UnPBfYfqYougvtcZl1/D/hJXwohtFGxubsL0/9r05ob9H23MwFE7hDzFv/iJ/Zba3ozn
 edmcPTMjStHtOX5nR2BywAFHxgu+KpGFYPESzbyVy/+TgV63CwfotaF4XPMgdqhsb3O4
 6DtPnZU3t0zzuF50kffrb98/ujzgaeVC/CLHK7F3AZqydOixi5b7aefk7r4pJEfApzTN
 Kjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JX7zqHaIu/f/4WJ+moXDPr6XWTpIHVkf/YKVmDEyBQE=;
 b=JNUOvf7JdgMvQgkZVDJtJZd1d8UQNpvMoSlIsSspreOaPwkmQ1cYbD+pSHwSAcHmJf
 GjoARO7rOIhCHSHExhwpEFQnz0VzkQ9TZg+ZL0fDHBDViiilhaNjkMDdjAi0LzA+ovNb
 esZqyzXReAW9kbxe4SXAXIokprKvE/Zv6PskmEwoutCVk/MJ2xCPPh/hpSRaMrnARQzv
 0fHAzagHJE/uwe5g+1G2ewL6g0i2pX1f5QaydWoF41zf7a9DXK9P+5SKMtHUzzzQ9aMH
 tMBfUDKI4GVJ67HP+rWx0z84inEiCP5+05kUtVvd+oHVZ3n7Ime0IMAjBLpEKCPmyswK
 Hwvg==
X-Gm-Message-State: APjAAAXfMAqKjYaVtVVsDnTIoY9YUPWwm5drPLyKDXDvCC6NMokD0RhJ
 9+l0RtjInumasNi9WbxAb5wFuy/Z08r0jDQrTq4=
X-Google-Smtp-Source: APXvYqxK+mqOGTY75gVcQ00WrMF7FJmWZKnkJnEyR3CkSIhW78B4iNPZdaUyWb8dTm0JNUkx/QsUX8/7amy4g4tgpIU=
X-Received: by 2002:a54:4e02:: with SMTP id a2mr469676oiy.140.1552940007949;
 Mon, 18 Mar 2019 13:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190318100458.5619-1-narmstrong@baylibre.com>
 <20190318100458.5619-7-narmstrong@baylibre.com>
In-Reply-To: <20190318100458.5619-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 21:13:17 +0100
Message-ID: <CAFBinCCSKh145--5EAPQyJjbuefRgWm57G+05so28-WiZjqNYg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] arm64: dts: meson-g12a-x96-max: add regulators
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_131329_053506_797498FF 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: khilman@baylibre.com, Guillaume La Roque <glaroque@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 18, 2019 at 11:06 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Guillaume La Roque <glaroque@baylibre.com>
>
> Add system regulators for the X96 Max Set-Top-Box.
>
> Still missing
> * VDD_EE (0.8V - PWM controlled)
> * VDD_CPU (PWM controlled)
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 0edbd00b358f..5c37930b09e2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
[...]
> +       vcc_5v: regulator-vcc_5v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VCC_5V";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               vin-supply = <&dc_in>;
> +
> +               gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> +               enable-active-high;
is there any way to test whether this GPIO is the right one?
I couldn't find a reference to a GPIOH_8 regulator in
buildroot_openlinux_kernel_4.9_fbdev_20180706


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
