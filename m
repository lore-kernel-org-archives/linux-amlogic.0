Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C821C4829B
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ABT/1nm7Z+L1z6uZp1Me+sRIIst3rVdBsD5w0rz3Ko=; b=oPnoz+Tv2hOoGi
	h/TBMAqlVyDsGCix0LYJ9AYGP9fNLtn76p0vsQegnU6Z/OnL4NZkEVvxB+mMuMI/tKIgfvPpYANuE
	i1tlpMTCiE4iL9sUKOw4fGI01NKtJkm7w8VOo8CHvWi5Sc6/W13pVGDKuthkza6+dUNGVB4BCUOpL
	6WUalVd/zZxcngUJUXIWWiy9qIKoXlWQrdYT65O2YB5wjR9EaycN96P5E+6uHadqfMW0R9aKhQ32C
	pHTYXB+jnSCk7PeLuDW5o50X59WA4R1fg0VMo7HrXRWU0V2aSCBBckFKQG87iZu+8zoFe5LIzc/qM
	MPvIMKkNXAxI8cO8ElzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZT9N-00000004oWP-14uW;
	Mon, 12 Feb 2024 10:02:57 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZT9K-00000004oVK-1ebG;
	Mon, 12 Feb 2024 10:02:56 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41C7sVo4016307;
	Mon, 12 Feb 2024 04:02:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=WLF2X+j3Bn92Q1D
	DaV05/unswsO5ahBS+1WWPqaApW4=; b=LWzQNVJn8q7dcq0Bd+TtMxT1lIBoGiw
	yD0TsejCsoABuy8AggRDJW06Q1z2xJlky/ztkU9ADIkffObtOL0UuCQv3Beh4nhA
	Put6Ypu2vVivviEJ6Oil+cEfW1Q27QM+O9ltZ623dvQO4anhr/dZNovMzxP3lw+a
	LhOj5jub+y3fjAvlvXTHjliMbTrYlMFuhJHFxHorIs5Vl5GjaGvKHU61HqyF2Ni8
	oMyxoPUphkMgU1KFNxi+kfuEZzYoo4jyVm3Qy64lf8Glce+CGjlLDllqFwliGFC9
	RTpYBk2a8X7avMhCql6FZ7NmoU/tVg544Z1TluPmt36M8g8y3w06Uow==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w67e21nee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 04:02:21 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 10:02:18 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 12 Feb 2024 10:02:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 70E1F820242;
	Mon, 12 Feb 2024 10:02:18 +0000 (UTC)
Date: Mon, 12 Feb 2024 10:02:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Peng Fan
	<peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Nishanth Menon
	<nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Russell King
	<linux@armlinux.org.uk>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        NXP Linux Team
	<linux-imx@nxp.com>,
        <linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
Message-ID: <ZcnsqaIftZXcNaUA@ediswmail9.ad.cirrus.com>
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: NzDJLMtFiatrdGDskmwX3IMPmG4MYizJ
X-Proofpoint-GUID: NzDJLMtFiatrdGDskmwX3IMPmG4MYizJ
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_020254_449389_BAB27BDE 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu, Feb 08, 2024 at 05:37:10PM +0100, Krzysztof Kozlowski wrote:
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/clk-lochnagar.c                   |  2 +-

For the Lochnagar bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
