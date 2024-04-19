Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56708C04FFE
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2024 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXNrTw95Irsq0R6HkJEpUVkqJB6uaCbiE+aL+9hTtIg=; b=Fm6GuZ/3qGrxoU
	ANPpdWG2pQfeU4oz5NYExRuRQKKBIGAJO4QBP2NcEpHzwBz9d7LLZfSsu5x1IiTL6VANwjaBZCGbU
	QKNhqj6+KLnhMqKvB59LJRiv1pQeLGioMp+s4eHQqMu4qqhR2NkUZvcA1o/BaqcaRYzHGrrBITaGS
	Rzy4RBuO+Zd36zF/SeUfbKSbPqCxxPZ46/KLW9/L1B8jkIpZGs4D3Xl3lJoM4KWdNvid4O6wS0Qww
	CskMoF5oeIN7ZA3czuqpPJkoe8smyZVrgIDI8LroEQcZZgj1eOBSEjAPEzKR0tcGpBlBRnNhxrU9x
	fJL22/I0AjOQcUw8pViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxvUc-00000006zMu-0Byo;
	Fri, 19 Apr 2024 21:09:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxvUZ-00000006zMC-16lU;
	Fri, 19 Apr 2024 21:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A459BCE16E7;
	Fri, 19 Apr 2024 21:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06124C072AA;
	Fri, 19 Apr 2024 21:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713560991;
	bh=GCzclxZJWdtU2QJtBJyOMVjTATOp6d+Ec7EbDgAUeng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnxsxPzyZ3dJPAKcq4cF9uOQE/sl9utZo26jG/Tit6BcMQr/AoTwWES+NDFgkZ0ig
	 bMOAXacUhQTihh1hMipxDINNet9tJ8CyN1DgJUP+XUpDg4tx2iIRWcxyDz/g/Go3NX
	 6AT0JLKPySKUVymiIRPe/lo3vBGoxUhzDkTMifzQg6C1aXQaLbfYolqqHxyMc0pLcv
	 1PH/9JldpM1li2/p5BzW04N769oWuCTHxq9da/3YzoB7EnhW+dQPMX1eEbz/C7wsPW
	 j3OKmLtmOq0pVUzuLLi6muprtTBxHwjNYT03uUNMLUVi/juEf/Fal9aGggmVolwg47
	 r/7sq/pLYhD8w==
Date: Fri, 19 Apr 2024 16:09:49 -0500
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Message-ID: <20240419210949.GA3979121-robh@kernel.org>
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_140955_690729_974B5808 
X-CRM114-Status: GOOD (  14.95  )
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

On Fri, Apr 19, 2024 at 03:58:10PM +0300, Jan Dakinevich wrote:
> Add device tree bindings for A1 SoC audio clock and reset controllers.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
> 
> This controller has 6 mandatory and up to 20 optional clocks. To describe
> this, I use 'additionalItems'. It produces correct processed-schema.json:
> 
>   "clock-names": {
>       "maxItems": 26,
>       "items": [
>           {
>               "const": "pclk"
>           },
>           {
>               "const": "dds_in"
>           },
>           {
>               "const": "fclk_div2"
>           },
>           {
>               "const": "fclk_div3"
>           },
>           {
>               "const": "hifi_pll"
>           },
>           {
>               "const": "xtal"
>           }
>       ],
>       "additionalItems": {
>           "oneOf": [
>               {
>                   "pattern": "^slv_sclk[0-9]$"
>               },
>               {
>                   "pattern": "^slv_lrclk[0-9]$"
>               }
>           ]
>       },
>       "type": "array",
>       "minItems": 6
>   },
> 
> and it behaves as expected. However, the checking is followed by
> complaints like this:
> 
>   Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
> 
> And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
> do it right?

The meta-schemas are written both to prevent nonsense that json-schema 
allows by default (e.g additionalitems (wrong case)) and constraints to 
follow the patterns we expect. I'm happy to loosen the latter case if 
there's really a need. 

Generally, most bindings shouldn't be using 'additionalItems' at all as 
all entries should be defined, but there's a few exceptions. Here, the 
only reasoning I see is 26 entries is a lot to write out, but that 
wouldn't really justify it. As Krzysztof pointed out, you either have 
the clocks in the h/w or you don't, so saying they are variable is 
suspect.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
