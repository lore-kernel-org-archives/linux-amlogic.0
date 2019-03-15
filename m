Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BABBC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A02E20657
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fY73UDR+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eQXzutDl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A02E20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4fhdUmhhAz1qlhRw6WCHyTGYMXjs/HPm2Mww4zk9GA=; b=fY73UDR+CqTc75
	iqyD60m4v3xiwYSzaAp2Nri2/fsn5Ij6TbuCHURLcsWflmiXepGFGyesaeEJt5lRbaxlpBKKOzM82
	4D0sBSpMBjqbm4LaBNJF5PKcZFtpP/dBGruMPziWTBdG8KMW3GyM5Kpbxy2icNbJy4rabYaRulcAR
	CfZtn4tAzq6gvwS4cAcZ/2YU9nxY++MMszigkAInkyQ34fWIlpUnyIX5G72wCRdQ0wF+OX/j2bl35
	k+tY1Da3sdGSGUb4qNWGIEjqsb0YDHbyjWR60EH73/vjjVd3x3JsafEOh2ygmDtJ/81Pp7ykuam4C
	+74hvIrArnKsabzEsBqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4uh7-0001YD-F4; Fri, 15 Mar 2019 21:48:49 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4uh2-0001XS-7M; Fri, 15 Mar 2019 21:48:47 +0000
Received: by mail-ot1-x341.google.com with SMTP id q24so9677567otk.0;
 Fri, 15 Mar 2019 14:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gE4sBOVkRwRnt8KIIAcvowjB6I4HM0nW8hKSb5lf5DU=;
 b=eQXzutDlvr7xTHtW6R+w8KuikHPoW0oUJ4rQMOFNPrqyLynLfBswC+K1KNZdfwrOw/
 iS6wzkzs+uv8wxhbp1BNMKzXpZie6+UZ2j4EZhbMsHXbXmrIBsJPaT0LVKrF9ejYHjR+
 ewNGJBpv1CrdnQFpTVOBvvGLv5aFKuk78xOjsNU1Aw3nRhc2Ed4zyEgbzNrWlVV4ibKC
 H53yIk9SSRkcBGaqR62F8T77I1bWeDj3+zfBuH7AmaKt+GCZEC7qMUj0DA1+1XDIHvh+
 KudmRbIHOb8LavePHiIIEFJDprs26ucocKxlGHOEhb6mkM8KHjLAsj17sMbtEFk6gUb0
 bpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gE4sBOVkRwRnt8KIIAcvowjB6I4HM0nW8hKSb5lf5DU=;
 b=BM8Lj//x8U19ARixTSkZ9mX5BIKbvZ7RtTp/3UhqEh5UOaNdsNaaXtn0f/EhZ4pmcS
 K393ZiUCfZEPgw8nE76rrKrDxYrOHxzEWtODy4e9aBaSOKo+d/dau85vqO6Nj+pdUzDJ
 yWYeQ0Hm7VLGadpcKNWOm+bkzOXruQnNOhedKqMwtt7QkQOyLGWv7WvIwHSKvRXuz6xh
 qHpvvHujfFJ/zKL6FJuFOlAKGOMwaDSZTgnXsVUJ2PRDHEfHbY8GPVhnHFBOWBfG7UZe
 YPUpGxxbQIc81t8E9QD2c2ye4e/0hPqeydBOj5/mA5GoTBPs6qTY/pqmf+cj77Zxezni
 rfvQ==
X-Gm-Message-State: APjAAAXHmnaK8OwHHQ1RGGpTxn3bTagGDjk/ad6p2a/hXry/OcuCRHiw
 kbdHZjpr/UHRTK5MIrDX/zZ47GkA2V4Y30jhF6o=
X-Google-Smtp-Source: APXvYqwJU5fFUUCeC1Q34gt1I0LOCxQIcWmubuzTwMKrFVJwJ6mHYDyi/nGZl89cdYG0+TxwXEvFQmZpugajwijf/kg=
X-Received: by 2002:a9d:7441:: with SMTP id p1mr3678653otk.148.1552686522929; 
 Fri, 15 Mar 2019 14:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-8-narmstrong@baylibre.com>
In-Reply-To: <20190311095613.11371-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:48:32 +0100
Message-ID: <CAFBinCCbu54hvATKpQ+DxZ6g-FCJ_7Gty2v3HMWJWNFDbwwKwQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] arm64: dts: meson-g12a-x96-max: Enable BT Module
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_144846_159067_A83C3B66 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 11, 2019 at 10:57 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Enable the Bluetooth Module on the X96 Max Set-Top-Box.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I didn't have time to test this yet but it looks sane to me, so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 21e5de48613e..61606601fb4f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -88,6 +88,18 @@
>         };
>  };
>
> +&uart_A {
> +       status = "okay";
> +       pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +       pinctrl-names = "default";
> +       uart-has-rtscts;
> +
> +       bluetooth {
> +               compatible = "brcm,bcm43438-bt";
> +               shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
you could add:
  host-wakeup-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
(at least according to the output of /sys/kernel/debug/gpio and the
.dtb on my X96 Max)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
