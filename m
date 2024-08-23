Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8B7C531DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ve7BL1Jc3XXJn5fc6a2Lq/gpw3QX6Tu6doAejkfxoPY=; b=YI4aV2R7DZxK9Z
	uviFelR/fTNc350Cmc8LOIFKsIpN9CZjVKGbqlnC3A49jbSNf4D06K1KnFFF5dai2dv+izLMZkU5t
	cn+PpCAB2SkK21OUE9iGMt/IzZaIvY+LOjju9fx3EZzh7Hlb6oPnJ3GxRejjr9woR6NESpKQblCsX
	pyh8ybxouN8kP2WhRTkNVVLbxeWMA5vcTfz583MUZsATjmzLKRuQsas3f9Vxm36pDMHFbaS5vcJOy
	F9eWcHiIIump4tPU/NR4UiM+5XLDUrHFYIXpSCRxQFbHOQ3erpuyhHH50GcUE0D4IhcGs0wckOcAA
	YTSYvY37A0UVMjPzI7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shNzJ-0000000FUdm-0b3V;
	Fri, 23 Aug 2024 06:41:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shNzF-0000000FUcE-3rjD;
	Fri, 23 Aug 2024 06:41:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF9A3CE1093;
	Fri, 23 Aug 2024 06:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1595BC4AF09;
	Fri, 23 Aug 2024 06:41:19 +0000 (UTC)
Date: Fri, 23 Aug 2024 08:41:16 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuan Liu <chuan.liu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: fix C3 PLL input parameter
Message-ID: <5hghvuv2hy4l2ofve4ghb3nhvg76pwpilulznzja25hurxxwcp@2idkyyomv5w5>
References: <20240823-c3_add_node-v3-0-3648376037f4@amlogic.com>
 <20240823-c3_add_node-v3-1-3648376037f4@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823-c3_add_node-v3-1-3648376037f4@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_234130_154685_96AE20C7 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 23, 2024 at 10:29:17AM +0800, Xianwei Zhao wrote:
> Add C3 PLL controller input clock parameters "fix".
> 
> The clock named "fix" was initially implemented in PLL clock controller driver.
> However, some registers required secure zone access, so we moved it to
> the secure zone (BL31) and accessed it through SCMI. Since the PLL clock
> driver needs to use this clock, the "fix" clock is used as an input source.
> We updated the driver but forgot to modify the binding accordingly,

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
