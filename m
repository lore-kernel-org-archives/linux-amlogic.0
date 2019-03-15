Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE7AC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 22:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F5D2218AC
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 22:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T3SzxXFJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NGUYb0Yk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F5D2218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1FCvFQS6W8NIYcjAeImNH4k/LB3fky0YEsumzf6RFI=; b=T3SzxXFJvS//ei
	RQgu3hmmy1y7Dk2cDLE6VO5Tvd5CNBt6R7GzIXsOMp2o74jo/SWblmkqbpjWEVFkrRlQukdDCrPWi
	uSBvU+hzP5aKOPvaIQMkCj7YorTWsyY7ESJHGRVoztNECwAMG+0P1ocMADefAyYhxJo1BwcVeCXIw
	CAMSa0UK9ddcZUxodwANi7Jm/D3yRg/iVp785Uvw/MyWSadJkHYDVi28CKOJbbognTgJvthrIE5wh
	xDf1pN5klU/FmQAFMkv+CMXKST4dO5gK6E4UVyETTZoPugF8ja/v0vINtDNK3fTWUWgPRZVXQw9dv
	AsDYRTt2GWJSk2rRhI6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4uxt-0000le-0h; Fri, 15 Mar 2019 22:06:09 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4uxr-0000l6-5e; Fri, 15 Mar 2019 22:06:07 +0000
Received: by mail-oi1-x242.google.com with SMTP id v84so2222617oif.4;
 Fri, 15 Mar 2019 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jya+9RCRvi8f3hy3KrmXPCNzwRcwhmTgVhI/Vls/16Q=;
 b=NGUYb0YkbIpf3hRAi1SRGukmm/A+bN5U5uuG3mUswPrXLy3P28qsJdtynWFdxG7OE/
 avF9iuZi8hbc61pec+6Vc7tW7m6cnKyf9jJkVnSBqo2K1ltTWWR0f5VYE4PFPTSooJh0
 DIAEMyx591V2Q0CLdlbSY8+MHqVdicF9nXFaRPb2LVah/SBUmtqP1s7eO3AuD3owZBrr
 kF4Kqw9ZsZ8uVn1c/G5t5CHjgBnUnRIF9Y8aRqwlVMj1Sb5nowPNBBYRI2zT9ORo3sBv
 YkFTYw+SAR/u/xOv6gL8cXxX7h2oAqpXCicmqKjMzjoneeSSwYN/FlUIOgcrfzON/qNP
 GsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jya+9RCRvi8f3hy3KrmXPCNzwRcwhmTgVhI/Vls/16Q=;
 b=Ly61RtAce2NuURiq0+WA+xlbk9EuMbuiERetI6bIJSR+2p8w6DokCVE7zV/XgtrjUQ
 LarYLWXx//xvCnMDcNB9VMRmlzMmmSj22CHpkj/bQBI1YsSUk/d3QGBqiSeKckKRLrEB
 eAo/jcdRa+sxqMQ7/oZasi7V7uiPGtxwpCqIQMnM/NAxNYe+oprFtGsNRtIW3iUYU5o6
 ve+EDSq/J60M0oXLLwBxfO9rZAwJvWcPhpEkynm1hWCmJlP9Tm42qCQdqlojTwiOsmzE
 T2uH0uDTTUv31kouoDw91I+oMt4j9SFNFlIqEC9FZFvhYOL1NyWkl1LDbDeXGFqqyjYD
 hdVw==
X-Gm-Message-State: APjAAAVah2VnjZZifD/kQ3JYYtbOp3mGgEHdKdiVBRFKlpLqFTI8b4/M
 INvVuvSuZD/5cSiSSCFPHwRmLIJsZR+u6oDLqh0=
X-Google-Smtp-Source: APXvYqzBkBng+mgCVwsVEk4Jc0ozZbWhjlGZP0JK/J8NS5FxhFERRZkadNAo+0CtRw+f9NycklPUVmQCdUPvFOTlRwQ=
X-Received: by 2002:aca:6209:: with SMTP id w9mr3026660oib.47.1552687565299;
 Fri, 15 Mar 2019 15:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-7-narmstrong@baylibre.com>
In-Reply-To: <20190311095613.11371-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 23:05:54 +0100
Message-ID: <CAFBinCBEeCAKuzOztT5wU1t9UvY=ocVVrdHB6PNG7pp+gXq1=A@mail.gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: meson-g12a-x96-max: add regulators
To: Neil Armstrong <narmstrong@baylibre.com>,
 Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_150607_238557_9D0B8BA1 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Neil and Guillaume,

On Mon, Mar 11, 2019 at 11:04 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Guillaume La Roque <glaroque@baylibre.com>
>
> Add system regulators for the X96 Max Set-Top-Box.
the hint from the "meson-g12a-sei510: add regulators" patch would be
great here as well:
  Still missing
  * VDD_EE (0.8V - PWM controlled)
  * VDD_CPU(PWM controlled)
  * VDDQ1_5

I'm not sure whether this board also has VDDQ1_5 though, but VDD_EE
and VDD_CPU should be very similar (or even identical)

>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 0edbd00b358f..21e5de48613e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -21,6 +21,71 @@
>                 device_type = "memory";
>                 reg = <0x0 0x0 0x0 0x40000000>;
>         };
> +
> +       flash_1v8: regulator-flash_1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "FLASH_1V8";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               vin-supply = <&vcc_3v3>;
> +               regulator-always-on;
> +       };
> +
> +       main_12v: regulator-main_12v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "12V";
> +               regulator-min-microvolt = <12000000>;
> +               regulator-max-microvolt = <12000000>;
> +               regulator-always-on;
> +       };
mine has a 5V DC in. can you please check this on your board?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
