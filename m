Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B245CC001DE
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 21:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eluU4A4RLVr2FqO5rHBzixKKuSdYkvpKfaOuUjaV/o=; b=VyIOS/KrWQW0vV
	t91KjKCYNKINkzM6elN4Yq7LC0xU2Wh+wWxTeYS6J9wCAqW/iVxpPX6+KvhNLpZV/X0cuCOrQZ9R8
	Q+UDVjj+vYnLPDGP5KSM7ScpuR0TnfqG1fjKLkdkqbkMUCgFGx/9dhNSRmwNvHA+Zf8cCP1SbZfkL
	Jh2cTSi3T49q5ZRxqTr8qTlryZ+f/rcFQkT83RMw0tRkpbBWC1cGEoF87X4byOB0ZoZORJM1UsMda
	nMSKqpXOEmTy/2PEdj/FJsxVSAIoJCxYi1b7sOdeTfO1LcZRWLM4BD1wKkxzyt6MP7x19jWNQG+Re
	+7mWtFsyMO5tV6x7LcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTr9e-005x2w-2m;
	Wed, 09 Aug 2023 21:55:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTr9b-005x2H-2c;
	Wed, 09 Aug 2023 21:55:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20C1A602E6;
	Wed,  9 Aug 2023 21:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4C7C433C7;
	Wed,  9 Aug 2023 21:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691618142;
	bh=GBr8tP2xiR6kjAiKJjegxph8j+qf/XK7FEXmUzHGfvw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cNf7z67Owtgupg9IttvWd1t/X9qF1l4mmgKeGs80EmheYnbCsDypIuDu+/DnNuqty
	 Na93XYJKdBf21P3iZrhKeUwCmgYbeSTujeGxg5zL8ImEby++YRSud1bhw06ozyo4PD
	 cffqsGTr86j+OM74cHhsE7xMFsjXxJz0en4E2AyYuncRb2dvCXL7d+t8RJCjTDKeZz
	 2iG5B+WpdmkHNLkVORs/VCg9y/42ynvS2csdXDKMIMY5SnQAq4QzpTF5ZXcMSjYfJT
	 ihcq2nvjzDbP+YGCA7d6rRnfoyUeLRG8AHF9cWkq0dqtx2StELpz9LbyPwp7sZhZqK
	 duFuLxyVUAxnQ==
Message-ID: <0dde6d95f4e92da68ad3a3122056bfbd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jpm3xoea9.fsf@starbuckisacylon.baylibre.com>
References: <20230731042807.1322972-1-wenst@chromium.org> <1jpm3xoea9.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH] clk: meson: meson8b: Simplify notifier clock lookup
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Aug 2023 14:55:40 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_145543_893840_0C622902 
X-CRM114-Status: GOOD (  14.31  )
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

Quoting Jerome Brunet (2023-08-08 06:21:46)
> 
> On Mon 31 Jul 2023 at 12:27, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > @@ -3847,9 +3846,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
> >        * tricky programming sequence will be handled by the forthcoming
> >        * coordinated clock rates mechanism once that feature is released.
> >        */
> > -     notifier_clk_name = clk_hw_get_name(&meson8b_cpu_scale_out_sel.hw);
> > -     notifier_clk = __clk_lookup(notifier_clk_name);
> > -     ret = clk_notifier_register(notifier_clk, &meson8b_cpu_nb_data.nb);
> > +     ret = clk_notifier_register(meson8b_cpu_scale_out_sel.hw.clk, &meson8b_cpu_nb_data.nb);
> 
> Hi Chen-Yu,
> 
> Your patch seems valid, as CCF stands right now.
> 
> However, I believe there is a will to drop the 'struct clk' instance that
> automatically gets created with each 'struct clk_hw'. This change would
> not help going in this direction
> 

Yes. Use clk_hw_get_clk() here, or introduce a
clk_hw_notifier_register() API that does that automatically. We will
have to put the clk on unregister path as well though, so maybe struct
clk_notifier needs to be extended to store the clk_hw pointer. The
notifier code kinda needs an overhaul to be clk_hw/clk_core aware. I
think it predates the introduction of struct clk_core? It's a bunch of
work I've been putting off.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
