Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB9BC48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 19:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YOpeZ+hPSRXAzPFHMUuApXvBv1rAeTbeaP+h2X2/OAE=; b=KE1EsQgLEJGgQEBXNvrSfTM2Vl
	kOTXv5gWfsAYO02WajVWsani70I/kGYNomLpRzgGkC1M6ZSI1p9sUvv1YYtkrVvp3YwvVOTLJR458
	2AaORQOoLGB9sQrVpvNniqAhS7n6Y4zaSZwmOf3E9nstCWl1anjRN+HlHYHpQcJh16e+kxquN5DKo
	R7VZaT7rFVlscOE2+aklZUxwJxHVkvnidt0By3y2I02xd3ct6cxyU+uB+0EtDK7t9gooIRzZoxcCs
	L75b/FkZAwNG2Hv3A1Xbg5dGm5F9jCqEy91l8A1HxpU0VjnaYSyXxUFYa12ga1Bnna+Nyzi2qTzZg
	N17+LPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc90F-0000000Bq3N-2ZvF;
	Mon, 19 Feb 2024 19:08:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc90C-0000000Bq2L-1ZX2;
	Mon, 19 Feb 2024 19:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 314B460F36;
	Mon, 19 Feb 2024 19:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE033C433C7;
	Mon, 19 Feb 2024 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708369709;
	bh=Qgm4yRczBnXgjpxAD+i1bsbP2xXCEc56/SoGjrcpzPo=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=atM/CvQ3iM2Anizb1lzybkxvKx4jL0MqzynEc9xfeXYO4jST8XRzcHkXWB1rVSoXm
	 QzyUkIxjMCH9R5YY/PaB5tsF3NM1FDm8ykl4d3vXKA5asaVD7k3T/dyEoh1VZZzkjV
	 kIr74/S+E61h0sUkZdHfsYrdNzab1k3HMtQZRRFEGMUr+2ET8tOcs0ZuNnfT1ZRisK
	 aGWGhy6Ua4SklPFh8q/0UhO+nzJXgQ6wsbcSkaoqa5RFwR1fvwJmxCB+5UNPA+m8me
	 VnACdEWHC3NqCsBvhJZUamXJbuuKbNyTaBxaPGys8l0JPiznLYdaSAmdLDp4bqSWW0
	 hCsk3eP26kWrw==
Message-ID: <e760847bd911671f1e364271888481fd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <02461595-16b3-4fea-a029-54190e10e6f5@linaro.org>
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org> <38e7e80f61f7c67c984735cf55c3dfb3.sboyd@kernel.org> <02461595-16b3-4fea-a029-54190e10e6f5@linaro.org>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of of_clk_provider
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Turquette <mturquette@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-omap@vger.kernel.org, linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com
Date: Mon, 19 Feb 2024 11:08:27 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_110832_512501_ABFA7BE7 
X-CRM114-Status: GOOD (  28.25  )
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

Quoting Krzysztof Kozlowski (2024-02-15 23:12:29)
> On 16/02/2024 00:12, Stephen Boyd wrote:
> > Quoting Krzysztof Kozlowski (2024-02-08 08:37:10)
> >> None of the implementations of the get() and get_hw() callbacks of
> >> "struct of_clk_provider" modify the contents of received of_phandle_args
> >> pointer.  They treat it as read-only variable used to find the clock to
> >> return.  Make obvious that implementations are not supposed to modify
> >> the of_phandle_args, by making it a pointer to const.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> > 
> > This will almost certainly break the build once it is merged to
> > linux-next. What's your plan to merge this?
> 
> First problem is that it might not apply... I prepared it on next to be
> sure all subsystems are updated.
> 
> The idea is to get reviews and acks and then:
> 1. Maybe it applies cleanly to your tree meaning there will be no
> conflicts with other trees,
> 2. If not, then I can keep rebasing it and it should be applied after rc1.
> 

The struct clk based version is probably not going to be used in any new
code. If you split the patch up and converted the struct clk based ones
first then that would probably apply without breaking anything, because
new code should only be using the struct clk_hw version.

The struct clk_hw version could be done in two steps. Introduce another
get_hw callback with the const signature, and then update the world to
use that callback, finally remove the old callback. We could call this
callback 'get_clk_hw'. This is probably more work than it's worth
though, but at least this way we don't have to worry about applying
after rc1.

Or perhaps we need to cast everything and use macros? It would be bad if
the callback actually did something with the clkspec and we cast it to
const, but your patch shows that nobody is doing that. We would get rid
of this macro garbage once everything is converted.

---8<---
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2253c154a824..8e5ed16a97a0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4818,7 +4818,7 @@ struct of_clk_provider {
 	struct list_head link;
 
 	struct device_node *node;
-	struct clk *(*get)(struct of_phandle_args *clkspec, void *data);
+	struct clk *(*get)(const struct of_phandle_args *clkspec, void *data);
 	struct clk_hw *(*get_hw)(struct of_phandle_args *clkspec, void *data);
 	void *data;
 };
@@ -4880,8 +4880,8 @@ EXPORT_SYMBOL_GPL(of_clk_hw_onecell_get);
  *
  * This function is *deprecated*. Use of_clk_add_hw_provider() instead.
  */
-int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *clkspec,
+int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *clkspec,
 						   void *data),
 			void *data)
 {
@@ -4914,7 +4914,7 @@ int of_clk_add_provider(struct device_node *np,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(of_clk_add_provider);
+EXPORT_SYMBOL_GPL(_of_clk_add_provider);
 
 /**
  * of_clk_add_hw_provider() - Register a clock provider for a node
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1293c38ddb7f..bfc660fa7c8f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1531,10 +1531,11 @@ struct clk_hw_onecell_data {
 	}
 
 #ifdef CONFIG_OF
-int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *args,
+int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *args,
 						   void *data),
 			void *data);
+
 int of_clk_add_hw_provider(struct device_node *np,
 			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
 						 void *data),
@@ -1559,8 +1560,8 @@ int of_clk_detect_critical(struct device_node *np, int index,
 
 #else /* !CONFIG_OF */
 
-static inline int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *args,
+static inline int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *args,
 						   void *data),
 			void *data)
 {
@@ -1614,6 +1615,12 @@ static inline int of_clk_detect_critical(struct device_node *np, int index,
 }
 #endif /* CONFIG_OF */
 
+typedef struct clk *(*clk_src_get_fn)(const struct of_phandle_args *args, void *data);
+
+#define of_clk_add_provider(np, get, data) ({				\
+		_of_clk_add_provider(np, (clk_src_get_fn)(get), data);		\
+})
+
 void clk_gate_restore_context(struct clk_hw *hw);
 
 #endif /* CLK_PROVIDER_H */

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
