Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09E0C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 11:20:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5600C2171F
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 11:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+r/k1xR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g49nX4X2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eB/Ww7os"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5600C2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEbRWBPeBKSzxMFBOta7XODVjrCbz1H+MdHoK/sbXSg=; b=K+r/k1xR7YTbS4
	SC0KJBZV6Sb5JkGeNm6bGM5RPCg1x5QZjDXPsAdBvcd5e/aFlQScnj97fwu2ssSO2AWeMczwzIcmH
	uJMTn1/vejiU1yVecp5NtNVxrig85WBB+kBF5DENFSGzW7iGiT1su80aKn3mCoyHUzYXJv2lP91YD
	XQnSkIYHFEODMDugNPpHVg7VY1xKV1ualzz5+PeMbgy4fWKNGBanOqrhPAJE1jiQXIGOA4lvIAVBP
	ZGsR1QKvNqZUf3Z9+5A25018r6j2BdRgslTGYIqrFSbfvx9fa+rgYgPaqrAXp1ZMCKqHjLwvSSIL0
	MoLyKmDGyvTGjuo9irkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h41vn-0002j2-LL; Wed, 13 Mar 2019 11:20:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h41vh-0001K4-LC
 for linux-amlogic@bombadil.infradead.org; Wed, 13 Mar 2019 11:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s1zAivap7ECwynYe4xnVyvyJ8rC0V8FIe7PE8u9zfRQ=; b=g49nX4X22cjUsDDIDL+i0uWS4
 ShJR7VBOam0PQSTZ+rc+4TaJaA8saLYhl5fp1GjpFXNyOa9bNE4bbviDeLAQqv3kVTkA8T9zdpq/N
 k+D6aYkfAV8Z41mhGnjaiuPW1OwIXiTIwWlJDCBPHRRWS02Jq4FA8aOftbkh5DbTppS2PR+Fie5eW
 mBejF3Mpg3EcpJGcEWI+7KEJNwGlk9dTisSyCt8h4+Ov2f6sKeuAQHIH7DrqFMF6P5dEqh3gyLBQH
 TE/6P8lFE/+YjmaG1nxqiyGMwZ0KlkQ6r/jL8ySPnU4kxk8kSdopjPFuSAh8BzZDuG/52uGqRfPxP
 JKgr+3EJg==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h41fI-000100-J8
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 11:03:18 +0000
Received: by mail-pf1-x441.google.com with SMTP id n22so1129968pfa.3
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=s1zAivap7ECwynYe4xnVyvyJ8rC0V8FIe7PE8u9zfRQ=;
 b=eB/Ww7os4vu6TCDty5HZIcM8A5fEpeK8Sg857UyvOmz+ZrRNseLtbo2x68efFdLvvH
 2Adu4yDCZXj8vFZtVdL9X3FjHcw9/p1mEjOzj+yyh20cpC5AZZIucn3cITVDpn8os2Oq
 Ld4uWb5a5BCBgielP5mXu0oQ6VoeT6CToO941JkRRMtw3Knqz3CLchfEAd0TYCNo6t4C
 2l/mkUAgG54L8fZw29svQqK8moR0lRmV1GIfxk7OhOs1TsWY27n4KDiJM2f7PQaV80KA
 1DE0nfBrYCfubh5GbrSo/X24lHdOovbhGnxn4BOZ2eyqBIePj3PJ0PgahWVFfa40y0Xq
 eDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=s1zAivap7ECwynYe4xnVyvyJ8rC0V8FIe7PE8u9zfRQ=;
 b=JqWOA3zKg5tfiEVFVHfsU1OfsGm+SfjQ2oAHaA8/zx/HwH08oYAJvVpGSlmi+f8yvq
 Jq7M8SYmOUynJnjraoXBbCDYU27RmWGWM8lOhkoIdsRbqQivsMiFVkJpAwDKgnuSV22t
 C70vfTeXyjBoSWKLV3wg79FJKaBI3wmNF4deSKiAA9zT7ZSZvzvOQbfWQrbpasyUxc0P
 lIe+/PktFX8PPQLKxO0U5EHZF6GFm451LCVt5yn2XRDRHg6HVTWd72Hz4c4BlwJCtWJn
 fwDgbosAg/lzY7MiZKC9m76LmsJRqd/Ohq5yuQJXUkqh+nAXMP8CUOtQYMnLlSSKCWPi
 0fxA==
X-Gm-Message-State: APjAAAXLARyeAhCnINuBsG0d6VWaAwAdlc4UJGMS3vRJ99wU6X/l+HBp
 21P0/CvYTLCIvxm/htxih1Io2TYz0sJ66w==
X-Google-Smtp-Source: APXvYqwcYN+hh84jUZuAHGI1ZxzE4OR034TULZaPm2fef+FgtZiXl3TM7o/j3jKlW8Y/kpPLjIfXmw==
X-Received: by 2002:a63:fc49:: with SMTP id r9mr36671226pgk.447.1552424566702; 
 Tue, 12 Mar 2019 14:02:46 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:1daf:3f96:9f7f:33ba])
 by smtp.googlemail.com with ESMTPSA id
 q62sm22235827pfi.183.2019.03.12.14.02.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 14:02:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 6/9] arm64: dts: meson: g12a: Add UART A,
 B & C nodes and pins
In-Reply-To: <20190307151342.7381-7-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-7-narmstrong@baylibre.com>
Date: Tue, 12 Mar 2019 14:02:45 -0700
Message-ID: <7hbm2fu7pm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_110316_721728_F3CAAF05 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patch adds the 2 UART nodes in the EE power domain with the corresponding
> pinctrl nodes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Similar to PATCH 4/9, are you wanting to move this to the board series?

Kevin

> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 82 +++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 2a700bb45d04..50e2cd36e08b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -113,6 +113,61 @@
>  						#gpio-cells = <2>;
>  						gpio-ranges = <&periphs_pinctrl 0 0 86>;
>  					};
> +
> +					uart_a_pins: uart_a {
> +						mux {
> +							groups = "uart_a_tx",
> +								 "uart_a_rx";
> +							function = "uart_a";
> +							bias-disable;
> +						};
> +					};
> +
> +					uart_a_cts_rts_pins: uart_a_cts_rts {
> +						mux {
> +							groups = "uart_a_cts",
> +								 "uart_a_rts";
> +							function = "uart_a";
> +							bias-disable;
> +						};
> +					};
> +
> +					uart_ao_a_c_pins: uart_ao_a_c {
> +						mux {
> +							groups = "uart_ao_a_rx_c",
> +								 "uart_ao_a_tx_c";
> +							function = "uart_ao_a_c";
> +							bias-disable;
> +						};
> +					};
> +
> +					uart_b_pins: uart_b {
> +						mux {
> +							groups = "uart_b_tx",
> +								 "uart_b_rx";
> +							function = "uart_b";
> +							bias-disable;
> +						};
> +					};
> +
> +					uart_c_pins: uart_c {
> +						mux {
> +							groups = "uart_c_tx",
> +								 "uart_c_rx";
> +							function = "uart_c";
> +							bias-disable;
> +						};
> +					};
> +
> +					uart_c_cts_rts_pins: uart_c_cts_rts {
> +						mux {
> +							groups = "uart_c_cts",
> +								 "uart_c_rts";
> +							function = "uart_c";
> +							bias-disable;
> +						};
> +					};
> +				};
>  			};
>  
>  			hiu: bus@3c000 {
> @@ -256,6 +311,33 @@
>  				compatible = "amlogic,meson-g12a-clk-measure";
>  				reg = <0x0 0x18000 0x0 0x10>;
>  			};
> +
> +			uart_C: serial@22000 {
> +				compatible = "amlogic,meson-gx-uart";
> +				reg = <0x0 0x22000 0x0 0x18>;
> +				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_B: serial@23000 {
> +				compatible = "amlogic,meson-gx-uart";
> +				reg = <0x0 0x23000 0x0 0x18>;
> +				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_A: serial@24000 {
> +				compatible = "amlogic,meson-gx-uart";
> +				reg = <0x0 0x24000 0x0 0x18>;
> +				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
>  		};
>  	};
>  
> -- 
> 2.20.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
