Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25430CFC267
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 06:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3MVITELqqX+Ir/bS3atWtco/hD0DwriEQUgUjhh490=; b=vDBn2zWxOQbYZl
	CZ92+XQrsOwlFtCbVLg8U3nNgRiIZwNIJvjNI8nA4415z3yGmEF1e8VzYsu6u8FKqJUzQGieQqxLS
	v/3oYVF/nsdrEcQYB77OE8T/Wbfynn/HJ1SOvsfmebIOWcLql7S9sJuP3ljavcGvAUZDmfX30RYaf
	51dVgg9DKMfCRS7noB9OjEMmDIlGDswkk7pubZtgd177lTBaQK3ljlzVhT56e3wpIybvvO3NfrcYQ
	9ZBxIGnsnwWX5L/K1Bj8342iIQZWN1fFOhjM32SY24PjC8P3qKiTsiMrqH70HgDxronGDnnh93Sac
	b/egUVVwDxFjgFkN2V/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0acZ-000000079yr-44EM;
	Tue, 15 Oct 2024 06:01:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ac4-000000079ti-1S4L;
	Tue, 15 Oct 2024 06:00:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 556C85C5BF8;
	Tue, 15 Oct 2024 06:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A05C4CEC7;
	Tue, 15 Oct 2024 06:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728972055;
	bh=I65itk5tddOgMYfVz3UQOHCfBTUHhlq7vfZDyL3fcQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DI1KDBJUcaBr9CSyMBck5GpJD9TG5a0+PQwOyTESsMavt6Uczjun7LyGw7ScerhqA
	 tE4bMfU0RS77haf3CSePYATpvA6HFbOcUJRxp/HUYQJSLnlCV3oCjDl5CV8+mIpi/X
	 tJWEyiDTGdPxE5RPh3AGZOkp8igNstcGhjUxrr016trcYNwyXtxxtdW6z8/Oi2MgGo
	 C70dABJN0Y+nsIkXXUc9sntWnr3Emm8HsANhmR6rRsd9XgW/JYoaTJ/0KHygJWQMGB
	 NrvLHffFSE5kRds+J8e6BLND0Hr+ZaAe/h+IcU8mpQ2XCL1DRL/nsyN7acv0D/Z8Zc
	 1W0+DacygJgQQ==
Date: Tue, 15 Oct 2024 08:00:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <nudqyugprp757romcrpkydvqbucqrww4olclsns5zgf6j2w5xi@y4vdst76qkqr>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_230056_454672_BC61DA7B 
X-CRM114-Status: GOOD (  13.61  )
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

On Mon, Oct 14, 2024 at 05:05:53PM +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index de10e7aebf21..a748351e8b1b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include "amlogic-a4-common.dtsi"
>  #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/gpio/amlogic-a4-gpio.h>
>  / {
>  	cpus {
>  		#address-cells = <2>;
> @@ -48,3 +49,38 @@ pwrc: power-controller {
>  		};
>  	};
>  };
> +
> +&apb {
> +	periphs_pinctrl: pinctrl@4000 {
> +		compatible = "amlogic,a4-periphs-pinctrl";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
> +
> +		gpio: bank@0 {
> +			reg = <0x0 0x0 0x0 0x0050>,
> +			      <0x0 0xc0 0x0 0x0220>;
> +			reg-names = "mux", "gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 0 PERIPHS_PIN_NUM>;

Really? Number of pins is coming from the binding?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
