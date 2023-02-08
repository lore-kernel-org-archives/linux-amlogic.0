Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEF0C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 06:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCw0UnET1oJD29BnG3I5wMD7BeLIxFdiLtRgcnrUp08=; b=0BYuD8iu0RQRWl
	0vEY7hYyA6/p6507316bx1r9N1XbNbOWaop6X5fTNCZgrvtdFoWZqqgUtNl35/1CQHIQT54Qr02R7
	inyiWGkO85FkweklFZGiDWc1qAHf8HTLKXULTvtBtBBOOEgh30SuHVW4hZvazJTLlFklO4wlq/BGa
	7eOeaAWFOYjYNmI+axCMAQe0ZhIhfk70WrVBJ0ya3lAGzAhhazaNawUG0RUjceqRoI4MM43WulvNK
	cGE3K9FATtkYP9WZSqgF3cFRdDvFLbOOw5eQ6pJslsf6YjGFmxqFEJv6LBjSHeZ6hpgXJ2ZrRxwK/
	TlBfFIaSakMXR/OnAFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdrD-00EI7F-16; Wed, 08 Feb 2023 06:23:03 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdr9-00EI6E-Si; Wed, 08 Feb 2023 06:23:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC4EB51C43;
	Wed,  8 Feb 2023 06:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1675837369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Aa2PV27eIU54WaO8k3b46WwPSvf5JQjc0zNAr1utOQ8=;
	b=sI1Xkn0pAxy3Z6Io4b5Jo5vlgZLjmjdgAd4dceBJrf0zJ3kPscN+H1DscQ491SBb0pCNEq
	H5Vm1ijuwna1mwmTKhDJjCbeqFEOL23gDWsLntM93uLA/njTCni8rfgokU6zGmvL7l13wT
	Im+QAv0TZHb4MulpNzuaWLnoZkpS1q+N9y6gi/ZLo39OCwQszo2e/EJU83vj1hS0KVxSrI
	YfiogRii6P/E3KKlzLi7p3nnv7E0EAGHYy8e+EFDnSuafZxnDQAJdJPlqLjjkhm+QwuuPg
	91rcHK7gSA7+4wuCNGx+7pg4zDwfkyrgQj7Eo7w1ShcnDUF4n2wkDENSkjsYfg==
Message-ID: <430ee3ea-3a24-b3f2-e798-3bb5352b70cd@lexina.in>
Date: Wed, 8 Feb 2023 09:22:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/8] arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx:
 remove invalid #gpio-cells in onewire node
Content-Language: en-US, ru, ru-RU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-3-93b7e50286e7@linaro.org>
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-3-93b7e50286e7@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_222300_134599_F47B8502 
X-CRM114-Status: GOOD (  13.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Thanks.

On 07/02/2023 18.07, Neil Armstrong wrote:
> Fixes the following bindings check errors:
>   - #gpio-cells: [[1]] is not of type 'object'
>   - 'gpio-controller' is a dependency of '#gpio-cells'
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> index e1605a9b0a13..db605f3a22b4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> @@ -159,7 +159,6 @@ map1 {
>   	onewire {
>   		compatible = "w1-gpio";
>   		gpios = <&gpio GPIOA_14 GPIO_ACTIVE_HIGH>;
> -		#gpio-cells = <1>;
>   	};
>   };
>   
> 

Acked-by: Vyacheslav Bocharov <adeep@lexina.in>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
