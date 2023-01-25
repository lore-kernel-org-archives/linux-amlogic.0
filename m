Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E51C27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 08:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKFceQemqW8XKqriJb/gCg/KLVkyP/2i9P1N60QOr50=; b=tUNld4FC3CPaSp
	VY3evMu9JM4otfcuO+uwJzVNk0Rq3PlcuhyU8aYhnO+R0NYGASklddXbUAWhJ5hoo61eUKBdnqTae
	M5tD/GFl7pmQdsYICIyjIzGM9UIov3nfdrO6aL1VXoJeWBMmLz6jP+ADILV4rz7epvttmKh5CnF6W
	iuFCUy/AnCruvW3v5RUQO2mzHCItGj2ulxhhUTkpyxqd5P+xDL7EWvmhHhAComk4ekhrd8DBmgum1
	hytLhSS3J9HnIWSplW9Qj8u7aJYA4BK6x9jg1MayMi0QwvZEkonufIMCNcPvnTNo3Q7OVw/XVrWYk
	ZGB4IjWafTebxXjhxtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKbCu-006RbL-2z; Wed, 25 Jan 2023 08:32:36 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKbBM-006Qx2-LQ
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 08:31:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id w11so5632472edv.0
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 00:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/2KTSGN5IAeMFBli47Es0k1+cSysqbM8kohqinsDBA=;
        b=vzaEoNAZ1w3bluqKDelP9gk/naJuO8gK/wAaU1zCFhstolQV3A86OCkE0nPWTEwC+5
         Z3B1DdIvtQBFhOeMbprsPS9ke6cKmJ3DewYtTmK1eR4SBwrGJuAOrHk/Y77RDQPDdxDi
         Ccuq81jum+5A4SCoIB0Vtbn8mTCLL/a4vT+AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/2KTSGN5IAeMFBli47Es0k1+cSysqbM8kohqinsDBA=;
        b=a/4DjQ4ixXCedcxwn6lG0voSywZ3tPnQJgPseE5WfXgHzXdPnYHzZUvAYFUVG1WEkR
         PMr3LqxXsSQAbjZGQE2xVrIcDsD2/hz+6jHuin83kdxKqr9//e6GsJo/d5p7stviirhK
         spXjIxWOrQn4xBE1i/Z++rbLHAH6IqVZ4rUXFs4e2MoMzmkN/t2ut9tmxw6WdkzdjuTM
         aS+rbszcUdEEq97E50VyegYciynz0dhFZdL/yic03AChO2q0JfCjhVB90M4PvhCootWk
         i5ojkS8j3GjUFds0BspzdjNsNNyL+qMmbY18cvu4dbqv0zW2KtAuJNku237g7eXco21d
         gGWg==
X-Gm-Message-State: AO0yUKXX+rT2gu97JB+fCD8yKyheh9Tow3u3cNn8CaTiUSski3kkA6Uz
	gZVZ04QI5JLCdG16eRY695/Oi/2tsV94SRDpJrTfhg==
X-Google-Smtp-Source: AK7set/yTTBo8oOKFbj5yO3WHAJZiuqAMWxcrSTT16gHXva4l7E857y9sQ7SjqpBYzuiiG3Zk3m6t/Cbf73C534AuAE=
X-Received: by 2002:aa7:ca42:0:b0:4a0:8fd6:34c2 with SMTP id
 j2-20020aa7ca42000000b004a08fd634c2mr753572edt.67.1674635457251; Wed, 25 Jan
 2023 00:30:57 -0800 (PST)
MIME-Version: 1.0
References: <d9b72573-a59f-989f-a752-1aa8517cf8dc@gmail.com>
In-Reply-To: <d9b72573-a59f-989f-a752-1aa8517cf8dc@gmail.com>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Wed, 25 Jan 2023 09:30:46 +0100
Message-ID: <CACMGZgbtX7zgy2USO5O0qY54tGW+d2cZ6qcUUbb-uOFAtfqOVw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Fix SDIO interrupt and make it level-sensitive
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_003100_718328_7F66D18C 
X-CRM114-Status: GOOD (  21.71  )
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

On Wed, Jan 25, 2023 at 8:00 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> SDIO specification defines that the interrupt is level-sensitive.
> Fix the interrupt trigger type for emmc_a accordingly.
> See comment at beginning of the file wrt which is the SDIO port.
> mmc2 = &sd_emmc_a; /* SDIO */
>
> The usage of edge-triggered interrupts lead to lost interrupts under load,
> see [0]. This was confirmed to be fixed by using level-triggered
> interrupts.
>
> Note:
> SDIO interrupt support was added in Linux just recently, however other
> users of this dts may be affected too.
>
> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
>
> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
> Reported-by: Peter Suti <peter.suti@streamunlimited.com>
> Tested-by: Peter Suti <peter.suti@streamunlimited.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - rebase considering recent node name change sd -> mmc for sd_emmc_a
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 1a931d5c2..c09eb9f6f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2324,7 +2324,7 @@ uart_A: serial@24000 {
>                 sd_emmc_a: mmc@ffe03000 {
>                         compatible = "amlogic,meson-axg-mmc";
>                         reg = <0x0 0xffe03000 0x0 0x800>;
> -                       interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> +                       interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>                         status = "disabled";
>                         clocks = <&clkc CLKID_SD_EMMC_A>,
>                                  <&clkc CLKID_SD_EMMC_A_CLK0>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index a79a35e84..ae1a5a568 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -603,7 +603,7 @@ apb: apb@d0000000 {
>                         sd_emmc_a: mmc@70000 {
>                                 compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>                                 reg = <0x0 0x70000 0x0 0x800>;
> -                               interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
> +                               interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
>                                 status = "disabled";
>                         };
>
> --
> 2.39.1
>

Please also change arch/arm64/boot/dts/amlogic/meson-axg.dtsi
sd_emmc_b because it was tested on that platform.

>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
