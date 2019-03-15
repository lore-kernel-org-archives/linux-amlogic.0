Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B959C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:25:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD53218AC
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASyNYOIj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sk1vB9wH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CD53218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QT9VaF5/DfjC6In9oiatJ16SC44rvOqc2Z4qOWVT5Sk=; b=ASyNYOIjLapsL/
	mxJP07u8hRxxC0DvaSjn6HxxcRy5RpOysxKdJGLNA0nFfiJOlW0ai+j5JKURzMe6v4MVWvEoEugAV
	3411M2UOE04JMjLO5m2W+1gjHmoDxTricbVKueUabvTgNmkkJuVkGIV1WsubitLiEhDDHJS8WeOhK
	l1ZagXMncprJxKXDQE4Eob1OR2GKbJiPgGOsnSPrwTBMwXcckmrDEe4+D86TNi+5oJ+witq+fBs+y
	0DISfr0376TqWQuHm9Iq4NHOUEVin1jRxnsP50VOGWJJSJanjSa+CV6PmprVruEUd5+GigH4va1PU
	/upYSP76JWDm8pLI43Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4uK2-0007w9-37; Fri, 15 Mar 2019 21:24:58 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4uJz-0007vf-E0; Fri, 15 Mar 2019 21:24:56 +0000
Received: by mail-oi1-x242.google.com with SMTP id a15so8522330oid.5;
 Fri, 15 Mar 2019 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+hW0z2dd1SHc5BKAuV0zrVmjtjnG3YL5VMfmXJlZUpc=;
 b=sk1vB9wHXD2wI//jjdDtEMLS0YilpbyGqfZkBdHDpPTDkSkG5BcNBdeysHIKDx7C/E
 nbyz/M7jt5xImNZ3YXHGXL6DALiVhaDrn39unzJQrc9OsIH31TS10PgbtjiUPMVIeYes
 KmdFYBnV7jeqeGn958jCa5C+7cOzx4L5intlt4cp5iGBIgVQpGDP9Do2Ze80SpVU81vF
 znO5yFYOzzarVraTzlfdjHGKTpjVFUIQNNdEmp16hDG3zj2UZPiuH+X8L4avoZiggpvp
 T1zULdRvt6U4qOkncEfdbny/Ihe17fud3C0Xtv6sJ0xOBYZ03otDrnQerVSvfTzDucoL
 P/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+hW0z2dd1SHc5BKAuV0zrVmjtjnG3YL5VMfmXJlZUpc=;
 b=taPuWRmI48MZ6e1QzMTVD9rsXuYrIuCY5Q6LrV5zGOwjof/GEal6v7MR6nbGCbo+TW
 QWRC1Kg9JtmGj0wtq6XwiVDSaE4O/c9sMwrPxwVZ2h/BGDSkIJfFWyk3rg8hrTP3j33L
 c0PUBaUL6i5+gPkhjE6SItkUsF9rQfsrraeMaAVyWdSsUq+ds4ih3wL+TV9VZhIn6ni7
 DpvWEVMQcENG3vM5HFCy3l5rRj5O4HqevXNR/o4uWjVlfSKeaGvL1k45nhmUZ2k+6XAd
 1NS0wlbiMbi8dolabndY//3TBL0+XmOs6DaWTdSH76DR+Ao5efSiw1tDHQhYH2SS8if8
 BoVw==
X-Gm-Message-State: APjAAAVgnF/COWwxAt7cm2w0qZPDD5jWVb8cYVb4HpC/aHbPG+QCvngv
 bAh+lPdT21clDiLTg8To3zXct1/6RyGEw9HDohs=
X-Google-Smtp-Source: APXvYqyTSgAtWjpuD6HYTr726bLg4oaK0jMZ6W/z0kpuIXXQUWcHXBsdSm65lvHI1oaMA4/tWR/+MnTKyXY/vE4qe74=
X-Received: by 2002:aca:6209:: with SMTP id w9mr2934595oib.47.1552685093538;
 Fri, 15 Mar 2019 14:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-7-narmstrong@baylibre.com>
In-Reply-To: <20190307151342.7381-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:24:42 +0100
Message-ID: <CAFBinCAa+ZjxJi491_dG+kvLFPLFoLXHFZToGP8W1ECeeqOYVQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: meson: g12a: Add UART A,
 B & C nodes and pins
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_142455_497911_592A3B71 
X-CRM114-Status: GOOD (  17.00  )
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

On Thu, Mar 7, 2019 at 4:15 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch adds the 2 UART nodes in the EE power domain with the corresponding
> pinctrl nodes.
there are 3 UART controllers in the EE power domain

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 82 +++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 2a700bb45d04..50e2cd36e08b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -113,6 +113,61 @@
>                                                 #gpio-cells = <2>;
>                                                 gpio-ranges = <&periphs_pinctrl 0 0 86>;
>                                         };
> +
> +                                       uart_a_pins: uart_a {
(this applies to all new nodes)
we started using dashes for the node names for new pin definitions on
the GX SoCs.
I don't remember where it was discussed exactly but I think this was
requested from Rob

since G12A is a new SoC we should do it "right" from the beginning

[...]
> +                                       uart_ao_a_c_pins: uart_ao_a_c {
> +                                               mux {
> +                                                       groups = "uart_ao_a_rx_c",
> +                                                                "uart_ao_a_tx_c";
> +                                                       function = "uart_ao_a_c";
> +                                                       bias-disable;
> +                                               };
> +                                       };
I'm fine with this part if you mention it in the subject and/or the description
uart_ao_a_c routes two pins from bank C (from the EE domain) to the
uart_AO controller (from the AO domain)

> +                                       uart_b_pins: uart_b {
> +                                               mux {
> +                                                       groups = "uart_b_tx",
> +                                                                "uart_b_rx";
> +                                                       function = "uart_b";
> +                                                       bias-disable;
> +                                               };
> +                                       };
> +
> +                                       uart_c_pins: uart_c {
> +                                               mux {
> +                                                       groups = "uart_c_tx",
> +                                                                "uart_c_rx";
> +                                                       function = "uart_c";
> +                                                       bias-disable;
> +                                               };
> +                                       };
> +
> +                                       uart_c_cts_rts_pins: uart_c_cts_rts {
> +                                               mux {
> +                                                       groups = "uart_c_cts",
> +                                                                "uart_c_rts";
> +                                                       function = "uart_c";
> +                                                       bias-disable;
> +                                               };
> +                                       };
> +                               };
>                         };
>
>                         hiu: bus@3c000 {
> @@ -256,6 +311,33 @@
>                                 compatible = "amlogic,meson-g12a-clk-measure";
>                                 reg = <0x0 0x18000 0x0 0x10>;
>                         };
> +
> +                       uart_C: serial@22000 {
> +                               compatible = "amlogic,meson-gx-uart";
> +                               reg = <0x0 0x22000 0x0 0x18>;
> +                               interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
does uart_C really use CLKID_UART1? on GX uart_C uses CLKID_UART2


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
