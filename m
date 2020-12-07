Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434F5C4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 09:32:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5522B23122
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 09:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5522B23122
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QAfISYsDLBlb09aQvmm9AKXCx8JOk190LAz2uZatY1k=; b=R17RjwgqRw+ndFscbVCJFI1tB
	V3wfPLbjfNIHzqmJUzAFqUgUCFZy7aw1zi5Bk7XKoHlNqiN7H1cXjfxeHTUv4S797RQZ2DzAUYEr+
	GQtF7USfpOECkbG8zbmyc1gNpkjC23qQLixE0OJlJGXHjYgPnqMz0Yx9UR7sUX9Xm8ieyrJEGOuRB
	OH7QAzO9w9gwNHqppzkk1K4YU+24ap6Lukx7++Evyt/YURqw/YN2a9MumwfdODOcEbaNQIbr9K8q+
	T56X/R4Rmiv/gcgmpjZzj3mGKTaI8zDUjBqjrFPpEMdmjJAwmNi8txNebiAOKaO0lXZhjWGF+Oqoq
	IO/an+mSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmCsA-0004b4-Bn; Mon, 07 Dec 2020 09:31:58 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmCs3-0004Xc-CZ
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 09:31:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id 3so12935844wmg.4
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 01:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=GLuU4c9odSxFrnOuGet4+6CjpgyrMIWPZsUZq/PreGk=;
 b=i0Yc5QA90bEFBhwG6hH1g28TISmrUpKKqy2tRuXZIKguMBG/kBKv49AJWqGmNlgWXK
 uUk2WVKjmEgACcqYUvwAdPy7RY+jUaZeSbx5AeFS0JMNUwURxkbW+Kfi+olqbWTFqZnO
 D2uPXUc2baCQ2KMw//MjQL/+BZ6osDZlgQzE03l/aCcTikXeX9BWQp786HvpJ3N9Vgww
 S+ImKyqgUny8XZiooKdMpc9pk6opwrdQux/WAQiHKa3ZsvUjBz0bhHJxAkRgzQXZDORw
 4d8LduMwaP8LaT2vgNQGVSGIn7spsXDHE5r5YwmXJRhq1wCLQjTOjbKgabX3l7wXkeVi
 ahkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=GLuU4c9odSxFrnOuGet4+6CjpgyrMIWPZsUZq/PreGk=;
 b=eGibSYl73h76sFW5zNQ9PQHFrgoZe2F+bVXP2Nc1QF7fGpVULensgOrthD9Xwedqoj
 H26FBWivqr8xWnnsiNwvNDxEgEGkWKcr7+zSkY4E5XvQEvgHvvqxLYl9GiWPjBvytT8n
 0JwvqM0lp/3qE9MAp2af9aF8YXlBrsggmf9yka50mO72swocN1ee+0xsWlr5rw+toSXs
 8htRQzZUi44xDDcbukvoCYQgIP78GeYzV+PqQS2CNaY1GrQBs2Zf6sJFyCCEQsN/IEjF
 6BLCOe5PopVkCcl2PUcR05SXd+ZkkYZ+hqZ/1MiF2BrMPwqETNdWo64aBUy9xXAXktpX
 40FA==
X-Gm-Message-State: AOAM5331+XAsM+4aM/6dsgH9UTsfyQq5ZQBgAezG5MEHZiTwuUqK4Hhc
 H45H6koSfw4bAzEEYBy3+m//nQ==
X-Google-Smtp-Source: ABdhPJw4vyyf2WIkP9E5DrBKTOacvbXpy3jjxOnALxt8z3HsQ49xyCYXLUlrFZfzyjlszQINDzHQYg==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr17600666wme.85.1607333508343; 
 Mon, 07 Dec 2020 01:31:48 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id k64sm12889681wmb.11.2020.12.07.01.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 01:31:47 -0800 (PST)
References: <20201205213207.519341-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: fix mask definition of the
 m250_sel mux
In-reply-to: <20201205213207.519341-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jo8j62c8t.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 07 Dec 2020 10:31:46 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_043151_554012_E3D6E27F 
X-CRM114-Status: GOOD (  17.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 05 Dec 2020 at 22:32, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The m250_sel mux clock uses bit 4 in the PRG_ETH0 register. Fix this by
> shifting the PRG_ETH0_CLK_M250_SEL_MASK accordingly as the "mask" in
> struct clk_mux expects the mask relative to the "shift" field in the
> same struct.
>
> While here, get rid of the PRG_ETH0_CLK_M250_SEL_SHIFT macro and use
> __ffs() to determine it from the existing PRG_ETH0_CLK_M250_SEL_MASK
> macro.
>
> Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index dc0b8b6d180d..459ae715b33d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -30,7 +30,6 @@
>  #define PRG_ETH0_EXT_RMII_MODE		4
>  
>  /* mux to choose between fclk_div2 (bit unset) and mpll2 (bit set) */
> -#define PRG_ETH0_CLK_M250_SEL_SHIFT	4
>  #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
>  
>  /* TX clock delay in ns = "8ns / 4 * tx_dly_val" (where 8ns are exactly one
> @@ -155,8 +154,9 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
>  		return -ENOMEM;
>  
>  	clk_configs->m250_mux.reg = dwmac->regs + PRG_ETH0;
> -	clk_configs->m250_mux.shift = PRG_ETH0_CLK_M250_SEL_SHIFT;
> -	clk_configs->m250_mux.mask = PRG_ETH0_CLK_M250_SEL_MASK;
> +	clk_configs->m250_mux.shift = __ffs(PRG_ETH0_CLK_M250_SEL_MASK);
> +	clk_configs->m250_mux.mask = PRG_ETH0_CLK_M250_SEL_MASK >>
> +				     clk_configs->m250_mux.shift;
>  	clk = meson8b_dwmac_register_clk(dwmac, "m250_sel", mux_parents,
>  					 ARRAY_SIZE(mux_parents), &clk_mux_ops,
>  					 &clk_configs->m250_mux.hw);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
