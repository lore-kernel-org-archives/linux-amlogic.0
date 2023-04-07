Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3176C76196
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Apr 2023 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bIVnznaI6MlBb2rCo7umhwk2KyhWmkYLQAiFogpK8k=; b=XpDU1G7ihjVtup
	uQJijEJVw8h4zwXS0rELzb6No/QmbmaCymBC1wtNqTPim2lXhcDgJy4X5EdxrgzUYgc0fXhScEvmT
	AaDZic2VTdKxVpcF5rh8B/OP5lb494DcpfqkmDGrXa+KqPIX0LC658EnKaQMtBrrZfngvW4OC7Rof
	BLFn2M5QstI/m0b4gfKMLL10YLEPDq4Zn2NTuyYYbnwaN/ETjDLFCtaMksxGYCfVy7BjKxFCykP+E
	52frxeVH7ZSOvofm8s596WY468MGeU7600MatobCcnFNzHtiottax3B4SJmfz5s63QR2iiJ2pHPmN
	T2tWcsRJiHCpIAmKbSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkg3z-009Kxi-10;
	Fri, 07 Apr 2023 06:59:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkg3w-009Kws-1r;
	Fri, 07 Apr 2023 06:59:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2810160FB6;
	Fri,  7 Apr 2023 06:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53201C4339B;
	Fri,  7 Apr 2023 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680850747;
	bh=6bQMsaag/8RMtodYrSbGD3QPkfdn9ox50RbVRIp5JiM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NvXlPqI2kWT7MZvV/5BeBDBKAk6CaxXVKlpObQ0r9AeWn7yWA/QC2uz5qVbLFAj+g
	 ERQdD1wpGBlekKdSG/EwD0/4xgFk2hScLx5PAxUIadlr1nvY+N1H4v9o9/ZnfZF1B4
	 vZsf8OQLEjog5LV6TYMZ3YCaKS6Ux5JS7d/dzeeRzMucGW+q2q8OaCKTxWz+9wkpMY
	 iz8ENaIFFeGxFc2u5pKfjwSP8XLD5NSXkV1WRg3EiXOCkDzAfjMTzbK+gCHnljFzbC
	 PLmiYmVl4Qgfns7a4iTXp0l3QkKsLzNgtfqry223WAMWNTikKjvvXURViimZtl6EsS
	 G+kyTr3XStETQ==
Message-ID: <ef8c686b-dcc7-c423-cc9a-009d10056134@kernel.org>
Date: Fri, 7 Apr 2023 08:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] [RESEND] ARM: dts: meson8b: correct uart_B and uart_C
 clock references
Content-Language: en-US
To: hfdevel@gmx.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <trinity-76c5c0b4-a6f7-4679-a1ef-74e745649355-1680811577008@3c-app-gmx-bap69>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <trinity-76c5c0b4-a6f7-4679-a1ef-74e745649355-1680811577008@3c-app-gmx-bap69>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_235908_653184_09F75155 
X-CRM114-Status: GOOD (  16.57  )
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

On 06/04/2023 22:06, hfdevel@gmx.net wrote:
> Resending this patch with proper subject line, corrected distribution and reference to what the patch fixes. Thanks, Neil and Martin, for your guidance!
> 
> commit b3b6a88d2347d2ec9075603920e616836cb46750
> Author: Hans-Frieder Vogt <hfdevel@gmx.net>
> Date:   Thu Apr 6 10:21:49 2023 +0200
> 
>     [PATCH] correct uart_B and uart_C clock references for meson8b

That's not correct patch format. All this above is not part of patch.

> 
> with the current device tree for meson8b, uarts B (e.g. available on pins 8/10 on Odroid-C1) and C (pins 3/5 on Odroid-C1) do not work, because they are relying on incorrect clocks.

Start sentences with capital letter.

> This trivial patch changes the references of pclk to the correct CLKID, which allows to use the two uarts.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

> 
> Fixes: 3375aa77135f ("ARM: dts: meson8b: Fix the UART device-tree schema validation")
> 

Drop blank line

> Signed-off-by: Hans-Frieder Vogt <hfdevel@gmx.net>
> ---
>  meson8b.dtsi |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
