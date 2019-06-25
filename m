Return-Path: <SRS0=SHiD=UY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262FAC48BD6
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 20:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5F6208CB
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 20:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmRB4yYw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GU5ThImR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5F6208CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMp6YicFU910q08xF4o07ClvjWkQnwyNVWWEC0swd7k=; b=YmRB4yYwpTWIla
	BvSKogfxspEN3ryqOFIfZju43br9eJIwpPBzR3t6phTccD9rCMDB29a9c6BE/lS8ZUbzfZf/pO7AU
	fkzZOHXBbyTVxeKUK++j/Sn5f+yNquUWdWOP7bR/1IQYsJpkHOdlJrULTSSdJWdqaYF37PqUIJ0K9
	Dkkui7ALtrZCxRYj7OjRGOZKDqP0i0TRJ9+ebwN1oNkrw3o39hXY1Mh6r9sXRKczV3XGHHormDyf3
	5mV5THYpYYIT8lUUIdw9/LK8yp2O1YZzuzlbSlUOvqqS4Rwki42Dzm3G5quIqT9l0THstqWsvapwa
	tC90Hhb5UJJSX+dBRZaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfs6d-00049q-VZ; Tue, 25 Jun 2019 20:31:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfs6a-00049D-QV; Tue, 25 Jun 2019 20:31:54 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6060B208CB;
 Tue, 25 Jun 2019 20:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561494712;
 bh=PhNXcpudBmWa/NVa9dShnW6rshjSaaf0Do+2ljruiAI=;
 h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
 b=GU5ThImRJH8AROMqBLKE+k1fn6AEaAgbB3CzxWCYNgzR0oUGpOKyPyeC11e76VA0n
 hSABmFfwS0F9YPJT85+0jvUTSx/w0bxJONeY2SqV/EBdufjAvJBQ6pW/cD++zBNnC2
 M3dCioW3RObardaTUQ1BYk0xEkjKbGRr/1V/LsjA=
MIME-Version: 1.0
In-Reply-To: <20190620150013.13462-8-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
 <20190620150013.13462-8-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC/RFT 07/14] clk: meson: g12a: add notifiers to handle cpu
 clock change
User-Agent: alot/0.8.1
Date: Tue, 25 Jun 2019 13:31:51 -0700
Message-Id: <20190625203152.6060B208CB@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_133152_896292_B5541653 
X-CRM114-Status: GOOD (  18.82  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-06-20 08:00:06)
> In order to implement clock switching for the CLKID_CPU_CLK and
> CLKID_CPUB_CLK, notifiers are added on specific points of the
> clock tree :
> 
> cpu_clk / cpub_clk
> |   \- cpu_clk_dyn
> |      |  \- cpu_clk_premux0
> |      |        |- cpu_clk_postmux0
> |      |        |    |- cpu_clk_dyn0_div
> |      |        |    \- xtal/fclk_div2/fclk_div3
> |      |        \- xtal/fclk_div2/fclk_div3
> |      \- cpu_clk_premux1
> |            |- cpu_clk_postmux1
> |            |    |- cpu_clk_dyn1_div
> |            |    \- xtal/fclk_div2/fclk_div3
> |            \- xtal/fclk_div2/fclk_div3
> \ sys_pll / sys1_pll
> 
> This for each cluster, a single one for G12A, two for G12B.
> 
> Each cpu_clk_premux1 tree is marked as read-only and CLK_SET_RATE_NO_REPARENT,
> to be used as "parking" clock in a safe clock frequency.
> 
> A notifier is added on each cpu_clk_premux0 to detech when CCF want to
> change the frequency of the cpu_clk_dyn tree.
> In this notifier, the cpu_clk_premux1 tree is configured to use the xtal
> clock and then the cpu_clk_dyn is switch to cpu_clk_premux1 while CCF
> updates the cpu_clk_premux0 tree.
> 
> A notifier is added on each sys_pll/sys1_pll to detect when CCF wants to
> change the PLL clock source of the cpu_clk.
> In this notifier, the cpu_clk is switched to cpu_clk_dyn while CCF
> updates the sys_pll/sys1_pll frequency.
> 
> A third small notifier is added on each cpu_clk / cpub_clk and cpu_clk_dyn,
> add a small delay at PRE_RATE_CHANGE/POST_RATE_CHANGE to let the other
> notofiers change propagate before changing the cpu_clk_premux0 and sys_pll
> clock trees.
> 
> This notifier set permits switching the cpu_clk / cpub_clk without any
> glitches and using a safe parking clock while switching between sub-GHz
> clocks using the cpu_clk_dyn tree.
> 
> This setup has been tested and validated on the Amlogic G12A and G12B
> SoCs running the arm64 cpuburn at [1] and cycling between all the possible
> cpufreq translations of each cluster and checking the final frequency using
> the clock-measurer, script at [2].
> 
> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
> [2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
[...]
> @@ -418,6 +458,35 @@ static struct clk_regmap g12b_cpub_clk_premux0 = {
>         },
>  };
>  
> +/* This divider uses bit 26 to take change in account */
> +static int g12b_cpub_clk_mux0_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                         unsigned long parent_rate)
> +{
> +       struct clk_regmap *clk = to_clk_regmap(hw);
> +       struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
> +       unsigned int val;
> +       int ret;
> +
> +       ret = divider_get_val(rate, parent_rate, div->table, div->width,
> +                             div->flags);
> +       if (ret < 0)
> +               return ret;
> +
> +       val = (unsigned int)ret << div->shift;
> +
> +       regmap_update_bits(clk->map, HHI_SYS_CPUB_CLK_CNTL,
> +                          SYS_CPU_DYN_ENABLE, SYS_CPU_DYN_ENABLE);
> +
> +       return regmap_update_bits(clk->map, div->offset,
> +                                 clk_div_mask(div->width) << div->shift | SYS_CPU_DYN_ENABLE, val);
> +};
> +
> +const struct clk_ops g12b_cpub_clk_mux0_div_ops = {

static?

> +       .recalc_rate = clk_regmap_div_recalc_rate,
> +       .round_rate = clk_regmap_div_round_rate,
> +       .set_rate = g12b_cpub_clk_mux0_div_set_rate,
> +};
> +
>  /* Datasheet names this field as "mux0_divn_tcnt" */
>  static struct clk_regmap g12b_cpub_clk_mux0_div = {
>         .data = &(struct clk_regmap_div_data){
[...]
>  
> +static int g12a_cpu_clk_mux_notifier_cb(struct notifier_block *nb,
> +                                       unsigned long event, void *data)
> +{
> +       switch (event) {
> +       case POST_RATE_CHANGE:
> +       case PRE_RATE_CHANGE:
> +               /* Wait for clock propagation before/after changing the mux */
> +               udelay(100);
> +               return NOTIFY_OK;
> +
> +       default:
> +               return NOTIFY_DONE;
> +       }

Maybe convert this into a if statement and then have a default return
of NOTIFY_DONE otherwise?

> +}
> +
> +struct notifier_block g12a_cpu_clk_mux_nb = {

static?

> +       .notifier_call = g12a_cpu_clk_mux_notifier_cb,
> +};
> +
> +struct g12a_cpu_clk_postmux_nb_data {
> +       struct notifier_block nb;
> +       struct clk_hw *xtal;
> +       struct clk_hw *cpu_clk_dyn;
> +       struct clk_hw *cpu_clk_postmux0;
> +       struct clk_hw *cpu_clk_postmux1;
> +       struct clk_hw *cpu_clk_premux1;
> +};
> +
> +static int g12a_cpu_clk_postmux_notifier_cb(struct notifier_block *nb,
> +                                        unsigned long event, void *data)
> +{
> +       struct g12a_cpu_clk_postmux_nb_data *nb_data =
> +               container_of(nb, struct g12a_cpu_clk_postmux_nb_data, nb);
> +
> +       switch (event) {
> +       case PRE_RATE_CHANGE:
> +               /*
> +                * This notifier means cpu_clk_postmux0 clock will be changed
> +                * to feed cpu_clk, this the current path :

Maybe write "this is the current path"?


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
