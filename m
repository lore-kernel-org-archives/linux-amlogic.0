Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05660C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 07:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hy6HG6aQeSreuLLeYFtc74Dqoip6LfYUgBED6PbnuZM=; b=JZom5OUyMHM1Io
	jXTUke0CetMdB+iBKkNNYR69fix0hzWKBR3+sD+joLzEbW4Ktn1LuzEAT8USGr03+cNXP3+89Umev
	M7vvmrfjNXjWtqHA8MappXlq4oUhS1ZTISnRKBi2XvBbd37W59txP2cvcLbpQf5ic8yg6kWrN6Jny
	18G39sCiIZan2FmrSJYsuGVjEuy3uiPTlQpGw7mM2aQSBjBBrJipxA2a7gqB6KoB29JQDuA6WEIME
	g85yFIja4W/JEn1TeuC13uGnKvfYZDbBZgoScwUJ0oAnhJ0BbV6FEy82w8ek1jMIUpplluAjPO9wP
	aay8RLBgBWXeFl0wKdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9M3d-00Djrn-GK; Mon, 17 Jan 2022 07:04:01 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9M3R-00DjqW-KR; Mon, 17 Jan 2022 07:03:50 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 17 Jan
 2022 15:03:47 +0800
Message-ID: <8783eb66-16ee-3b8b-5d55-73b49deab3a2@amlogic.com>
Date: Mon, 17 Jan 2022 15:03:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 3/4] clk: meson: add DT documentation for emmc clock
 controller
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob
 Herring <robh+dt@kernel.org>, <linux-clk@vger.kernel.org>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao
 Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-4-liang.yang@amlogic.com>
 <20220113212957.768FFC36AE3@smtp.kernel.org>
 <5d99ac02-a246-5bcc-2ecb-371b0d193537@amlogic.com>
 <CAFBinCDkNk+Ba340vshhL2rE76U9qb_dZ5ZsgWnMgFYpL6i1jA@mail.gmail.com>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <CAFBinCDkNk+Ba340vshhL2rE76U9qb_dZ5ZsgWnMgFYpL6i1jA@mail.gmail.com>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_230349_729910_0C179BF2 
X-CRM114-Status: GOOD (  15.44  )
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

Hi Martin,

On 2022/1/15 8:09, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Liang,
> 
> On Fri, Jan 14, 2022 at 4:06 AM Liang Yang <liang.yang@amlogic.com> wrote:
> [...]
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - "amlogic,axg-mmc-clkc", "syscon"
>>>
>>> Why is it a syscon?
>>
>> The register documented by reg is shared with SD/eMMC controller port C,
>> and it need to be ops on NFC driver.
> Can you please share an example how the .dts would look like in the
> end for two example cases:
> 1) using the sd_emmc_c MMC interface > 2) not using the MMC interface of sd_emmc_c but only using it's clocks
> for the NFC
I think both EMMC(although it is not implemented by 'axg-mmc-clkc'  yet) 
and NAND clock have the same way in dts:
		......
		clocks = <&clkc CLKID_SD_EMMC_C>,
			<&sd_emmc_c_clkc CLKID_MMC_DIV>,
			<&sd_emmc_c_clkc CLKID_MMC_PHASE_RX>,
			<&sd_emmc_c_clkc CLKID_MMC_PHASE_TX>;
		clock-names = "core", "device", "rx", "tx";
		amlogic,mmc-syscon = <&sd_emmc_c_clkc>;
		......

> 
> Initially I wanted to suggest the usage of a sub-node with compatible
> = "mmc-slot" (see
> Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt for an
> example) to decide whether the MMC controller is registered or whether
> just the clock controller is registered.
> However, the mmc-slot compatible string is not documented in
> Documentation/devicetree/bindings/mmc/mmc-controller.yaml currently.
> Maybe the MMC maintainers have any suggestions if other IPs have
> similar requirements (for IPs with shared parts).
> 
> 
> Best regards,
> Martin
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
