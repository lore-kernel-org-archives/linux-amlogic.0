Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D2FC07EBF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 18:10:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABFD20823
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 18:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rNOvQDgQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABFD20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGFoYxeBxpGbcqMKPrmwjqIXQpl2p2Su7XQgewg9D8Y=; b=rNOvQDgQAPRe3r
	M+eRzBgkPSzoF73AoWZX3FRwOn3VaYq/1KFrcpkVWOpTO60C3rhxZHBWYPJT3PbMOwB6OBeWXX6dF
	70Q/rpkNn3B8WL6t0K2qRsyUXaGyT8b6VUkqhfXreUre0HSpBPzhOS+BAErHFOiMsGeBoNipRDCvI
	FNZIQYWtXFbibOnMwevkdT5nWxz1b7C1Kccrp2qzH22h9E4lygIGrlikrTr00Q1nc6u39AVnPZyvo
	7PCZxu2rCZJ+dntUuPWFH7DZblx7JZ6wXhq9cZ6+JXpa/BvFqlYpz+Epz4AqAB9ExFtc4dCpjwtJc
	gH5f2xGCBG1QEju1Jybw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkYaV-0006iE-T7; Fri, 18 Jan 2019 18:09:51 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkYaT-0006gz-9h
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 18:09:51 +0000
Received: from [192.168.0.111] (223.166.104.240) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1591.10; Sat, 19 Jan
 2019 02:10:02 +0800
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet
 <jbrunet@baylibre.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
 <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
 <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
 <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
 <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <98166e2c-f5f8-55b9-6acb-7374bf10d80c@amlogic.com>
Date: Sat, 19 Jan 2019 02:09:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.2
MIME-Version: 1.0
In-Reply-To: <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [223.166.104.240]
X-ClientProxiedBy: mail-sh2.amlogic.com (10.18.11.6) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_100949_340841_37F7E2D2 
X-CRM114-Status: GOOD (  12.70  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi Martin and Jerome,

On 2019/1/18 5:20, Martin Blumenstingl wrote:
> On Thu, Jan 17, 2019 at 9:39 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
>>> OK, but we had incorrect documentation in the past. did you check this
>>> with someone from Amlogic?
>>>
>>> I'm curious because there seem to be two different approaches here:
>>> 1) hiubus name and offsets are being fixed within this patch
>>> 2) aobus is being dropped here and re-introduced with a different name later
>>> on
>>>
>>
>> because hiu exist and aobus does not, for which both the name and size was
>> wrong
>>
>>> approach 1) can also be used for the "rti" region (at least in my
>>> opinion, the patch doesn't explain why it can't be done):
>>
>> THe patch remove aobus (instead of fixing name and size) because, of the
>> multiple region documented covered by this 'made region', I did not anticipate
>> which one will be required and I did not want to add them all.
>>
>> Better to add them as needed, which is want I done for pinctrl as you pointed
>> out
>>
>>> rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
>>> (both values can be found in mesong12a.dtsi from
>>> buildroot_openlinux_kernel_4.9_fbdev_20180706)
>>
>> RTI is added here:
>> https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com
>>
>> I don't really understand the problem ? result is the same
> the actual problem is "me" as I have conflicting information:
> - Amlogic's buildroot kernel (for G12A) uses similar bus definitions
> as the GX SoCs (for which there are public datasheets) - this is how
> Jianxin added it to meson-g12a.dtsi originally
> - this patch does it different - but cannot check if this is correct
> (no public datasheet is available for G12A or AXG) nor do I have a
> "big picture" of upcoming changes
> 
> Cc'ing Jianxin: can you please review Jerome's patch and give some
> more details on the memory map on G12A so further contributions can be
> reviewed easier?
> 
1. "aobus: bus@ff800000" describes the following registers:
ahb	ao_reg	reserved	980	FF80B000
ahb	ao_reg	ao_mailbox	4	FF80A000
ahb	ao_reg	sar_adc		4	FF809000
ahb	ao_reg	ir_dec		4	FF808000
ahb	ao_reg	pwm_ab		4	FF807000
ahb	ao_reg	i2c_s		4	FF806000
ahb	ao_reg	i2c_m		4	FF805000
ahb	ao_reg	uart2		4	FF804000
ahb	ao_reg	uart		4	FF803000
ahb	ao_reg	pwm_cd		4	FF802000
ahb	ao_reg	reserved	4	FF801000
ahb	ao_reg	rti		4	FF800000


2. "cbus: bus@ffd00000" describes the following registers:
capb3	cbus	reserved	872	FFD26000	FFDFFFFF
capb3	cbus	sc		4	FFD25000	FFD25FFF
capb3	cbus	uart0		4	FFD24000	FFD24FFF
capb3	cbus	uart1		4	FFD23000	FFD23FFF
capb3	cbus	uart2		4	FFD22000	FFD22FFF
capb3	cbus	reserved	4	FFD21000	FFD21FFF
capb3	cbus	reserved	4	FFD20000	FFD20FFF
capb3	cbus	i2c_m0		4	FFD1F000	FFD1FFFF
capb3	cbus	i2c_m1		4	FFD1E000	FFD1EFFF
capb3	cbus	i2c_m2		4	FFD1D000	FFD1DFFF
capb3	cbus	i2c_m3		4	FFD1C000	FFD1CFFF
capb3	cbus	pwm_ab		4	FFD1B000	FFD1BFFF
capb3	cbus	pwm_cd		4	FFD1A000	FFD1AFFF
capb3	cbus	pwm_ef		4	FFD19000	FFD19FFF
capb3	cbus	msr_clk		4	FFD18000	FFD18FFF
capb3	cbus	reserved	4	FFD17000	FFD17FFF
capb3	cbus	reserved	4	FFD16000	FFD16FFF
capb3	cbus	spicc_1		4	FFD15000	FFD15FFF
capb3	cbus	spifc		4	FFD14000	FFD14FFF
capb3	cbus	spicc_0		4	FFD13000	FFD13FFF
capb3	cbus	reserved	4	FFD12000	FFD12FFF
capb3	cbus	reserved	4	FFD11000	FFD11FFF
capb3	cbus	reserved	4	FFD10000	FFD10FFF
capb3	cbus	isa		4	FFD0F000	FFD0FFFF
capb3	cbus	parser		4	FFD0E000	FFD0EFFF
capb3	cbus	reserved	4	FFD0D000	FFD0DFFF
capb3	cbus	sana		4	FFD0C000	FFD0CFFF
capb3	cbus	stream		4	FFD0B000	FFD0BFFF
capb3	cbus	async_fifo	4	FFD0A000	FFD0AFFF
capb3	cbus	async_fifo2	4	FFD09000	FFD09FFF
capb3	cbus	assist		4	FFD08000	FFD08FFF
capb3	cbus	mipi_dsi_host	4	FFD07000	FFD07FFF
capb3	cbus	stb		4	FFD06000	FFD06FFF
capb3	cbus	aififo		4	FFD05000	FFD05FFF
capb3	cbus	reserved	4	FFD04000	FFD04FFF
capb3	cbus	reserved	4	FFD03000	FFD03FFF
capb3	cbus	reserved	4	FFD02000	FFD02FFF
capb3	cbus	reset		4	FFD01000	FFD01FFF
capb3	cbus	reserved	4	FFD00000	FFD00FFF

3. In public data sheet, I can only found memory map about sub-regions of each bus. 
And no information about the bus itself.

> 
> Regards
> Martin
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
