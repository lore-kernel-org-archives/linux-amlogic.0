Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83D6606A31A
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 08:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SAbtwb/F;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=uaZ6IZxL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mTIBV4lUkznGJSkVaQUQ49Iye0fyKputoQS5cR0ucxM=; b=SAbtwb/FbsZtm66WAt98SmCiEj
	ADHDu+bBoKhRMgA3kQyi2rQ73BdRn//P/HIgjj6OX7zGlCu0VLwISqWswFWNrH2b5tfPW10Y/ffIs
	8BH/3Vuxo4/+Nwd4QJ+wtiDmD3FBbOvxLQjUm3/e1gLveFAWbfpFZ6+JnT5WWSXyd9E1Nf2ZcQS/t
	UncBQRDQFZz3U74FlpF4z/t9CcpHIFiAnaW/TggGgPjtBoRyjdJ312ui6BH3uB4AaKgkoXzyWzcEA
	XmE8TdLsIQyzpa9FNquOPE0JAJUppMxoGu8/3JFvCm6LWSLS8IJqjDb6HRkn56rDLNdRWH+Mo/IPD
	X5/TgQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAin-0000000FwGA-3wmI;
	Fri, 23 Oct 2026 08:33:53 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAik-0000000FwFK-2V2Z
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 08:33:52 +0000
Message-ID: <023fc2b8-274f-4ecf-a10f-b4948ff431a3@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1792744422;
	bh=wJPa3CPJhe0TddsJiu6BCdY+b+rdCFFUmUqxMimWaOA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=uaZ6IZxL9gE7bSep95BjOc1cp/cqmZ2TvfO8pIyR2Xt0hTTFtYx5Qav5ZCQZmraeC
	 8aFxL0IzFTfom9g9UrDvKWFxbtFkZZMtS0rZymwrfsOCETtg5Zt9RgDmF3VO7M6pZL
	 jIExsL5/BkaUL+SiHMWCzGEk7V4pCNezCsLiawhk=
Date: Fri, 23 Oct 2026 10:31:14 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/4] clk: meson: g12a: fix fclk_div2p5 multiplier
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 neil.armstrong@linaro.org
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
 <20261022-fix-g12a-clk-v1-1-e2bd8f3f1afa@aliel.fr>
 <sashiko-outbox-182086@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-182086@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_013351_107404_75B03718 
X-CRM114-Status: GOOD (  15.22  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/26 12:00 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: meson: g12a: incorrect rate for g12a_fclk_div2p5_div due to 4 GHz parent
> --
> 
> commit 63eec9c39f2ccd77037a929408928c357e150075
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> clk: meson: g12a: fix fclk_div2p5 multiplier
> 
> This commit changes the multiplier of g12a_fclk_div2p5_div in
> drivers/clk/meson/g12a.c from 1 to 2 so that its fixed factor ratio becomes
> 2/5 instead of 1/5.
> 
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index d0d4c7b6dc827..4ec5f15daf980 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -995,7 +995,7 @@ static struct clk_regmap g12a_fclk_div7 = {
>>  };
>>  
>>  static struct clk_fixed_factor g12a_fclk_div2p5_div = {
>> -	.mult = 1,
>> +	.mult = 2,
>>  	.div = 5,
>>  	.hw.init = &(struct clk_init_data){
>>  		.name = "fclk_div2p5_div",
> 
> [Severity: High]
> Won't setting .mult = 2 here cause g12a_fclk_div2p5_div and g12a_fclk_div2p5
> to report 1.6 GHz instead of the expected 800 MHz when clk_fixed_factor_ops
> calculates the clock rate?
> 
> Unlike the other g12a_fclk_div*_div clocks in drivers/clk/meson/g12a.c, which
> use g12a_fixed_pll (~2 GHz) as their parent:
> 
> drivers/clk/meson/g12a.c:
> static struct clk_fixed_factor g12a_fclk_div5_div = {
> 	.mult = 1,
> 	.div = 5,
> 	.hw.init = &(struct clk_init_data){
> 		.name = "fclk_div5_div",
> 		.ops = &clk_fixed_factor_ops,
> 		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
> 		.num_parents = 1,
> 	},
> };
> 
> g12a_fclk_div2p5_div is parented directly to g12a_fixed_pll_dco (~4 GHz),
> before the g12a_fixed_pll post-divider divides the DCO by 2:
> 
> drivers/clk/meson/g12a.c:
> static struct clk_fixed_factor g12a_fclk_div2p5_div = {
> 	.mult = 2,
> 	.div = 5,
> 	.hw.init = &(struct clk_init_data){
> 		.name = "fclk_div2p5_div",
> 		.ops = &clk_fixed_factor_ops,
> 		.parent_hws = (const struct clk_hw *[]) {
> 			&g12a_fixed_pll_dco.hw
> 		},
> 		.num_parents = 1,
> 	},
> };
> 
> Because g12a_fixed_pll_dco runs at ~4 GHz (3,999,999,938 Hz, as also seen in
> g12a_mpll_50m_div which divides g12a_fixed_pll_dco by 80 to get 50 MHz),
> dividing g12a_fixed_pll_dco by 5 with .mult = 1 already produces the 800 MHz
> rate (799,999,987 Hz, or g12a_fixed_pll / 2.5) expected by consumers such as
> gpu_opp_table in arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:
> 
> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:
> 		opp-799999987 {
> 			opp-hz = /bits/ 64 <799999987>;
> 			opp-microvolt = <800000>;
> 		};
> 
> With .mult = 2 and .div = 5 on g12a_fixed_pll_dco, wouldn't fclk_div2p5
> report ~1.6 GHz (1,599,999,975 Hz) and cause downstream dividers such as the
> Mali GPU, NNA, VDEC, VAPB, and MIPI ISP clocks to program a /2 divider and
> run at half their requested frequency?
> 

You right, I misread the parent and will drop this patch in v2.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
