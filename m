Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B040C43612
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Dec 2018 07:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A5802173B
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Dec 2018 07:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LqQ4aLV1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A5802173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SqCYla34yZtbbUamAh76cDw9UPrJOktmW28NPgHSR88=; b=LqQ4aLV1kfZN79rse7QJcYID0
	yWhKYCL4gVp3fqql0147fQpUx29AD25lDFE8KMSITHcJXOSsZncokFuMfgwRXC1G+h7RAoQafj5aI
	x9fkYOuWPPm4+CC04A6dT6J0/SDk3weWJzPVoH4tqkajw7TlJCZaaIS17HUpooiq+fLc+OXgWUrCT
	1ppGdgbCkZ3VG08/SoJEJcZNC8Rk/4RpPt4yI+tzYh4CGVgG+Q6aMCUCSeo2f6HIlBc6FS1CsN5vF
	vOOWGe6BL8xEOpRIeIQGprYxcCcosbNdNoC65O7N5JHELEuLLvx2j1lKb3GbQHFdmNKAt0mmNtiAh
	8HK9waWfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gbhZ7-0006dS-VS; Tue, 25 Dec 2018 07:55:49 +0000
Received: from mail-sz2.amlogic.com ([211.162.65.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gbhYt-0006UC-JZ; Tue, 25 Dec 2018 07:55:39 +0000
Received: from [10.28.18.115] (10.28.18.115) by mail-sz2.amlogic.com
 (10.28.11.6) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Tue, 25 Dec
 2018 15:55:16 +0800
From: Liang Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH RESEND v8 2/2] mtd: rawnand: meson: add support for
 Amlogic NAND flash controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>
References: <1545392724-6637-1-git-send-email-jianxin.pan@amlogic.com>
 <1545392724-6637-3-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCAeDtu-KTy=4bmAtBY9hGK8rRo=OW70tgEOyRBnQcdz1g@mail.gmail.com>
Message-ID: <081f7986-0f8e-bd42-bae2-17058c7da301@amlogic.com>
Date: Tue, 25 Dec 2018 15:55:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CAFBinCAeDtu-KTy=4bmAtBY9hGK8rRo=OW70tgEOyRBnQcdz1g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.115]
X-ClientProxiedBy: mail-sz2.amlogic.com (10.28.11.6) To mail-sz2.amlogic.com
 (10.28.11.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181224_235535_646199_B9882E0C 
X-CRM114-Status: GOOD (  19.54  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, Jian Hu <jian.hu@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,
On 2018/12/23 1:07, Martin Blumenstingl wrote:
> Hi Jianxin, Hi Liang,
> 
> On Fri, Dec 21, 2018 at 12:45 PM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>>
>> From: Liang Yang <liang.yang@amlogic.com>
>>
>> Add initial support for the Amlogic NAND flash controller which found
>> in the Meson-GXBB/GXL/AXG SoCs.
>>
>> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> ---
>>   drivers/mtd/nand/raw/Kconfig      |   10 +
>>   drivers/mtd/nand/raw/Makefile     |    1 +
>>   drivers/mtd/nand/raw/meson_nand.c | 1468 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 1479 insertions(+)
>>   create mode 100644 drivers/mtd/nand/raw/meson_nand.c
>>
>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>> index 1a55d3e..d05ff20 100644
>> --- a/drivers/mtd/nand/raw/Kconfig
>> +++ b/drivers/mtd/nand/raw/Kconfig
>> @@ -541,4 +541,14 @@ config MTD_NAND_TEGRA
>>            is supported. Extra OOB bytes when using HW ECC are currently
>>            not supported.
>>
>> +config MTD_NAND_MESON
>> +       tristate "Support for NAND controller on Amlogic's Meson SoCs"
>> +       depends on ARCH_MESON || COMPILE_TEST
>> +       depends on COMMON_CLK_AMLOGIC
>> +       select COMMON_CLK_REGMAP_MESON
> I believe that "depends on COMMON_CLK_AMLOGIC" and "select
> COMMON_CLK_REGMAP_MESON" are not necessary:
> the driver should build fine without them because it's only
> interfacing with the common clock framework.
> the common clock framework is enabled by ARCH_MESON and for the
> COMPILE_TEST case the common clock framework provides stub
> implementations inside the headers.
> 
>> +       select MFD_SYSCON
>> +       help
>> +         Enables support for NAND controller on Amlogic's Meson SoCs.
>> +         This controller is found on Meson GXBB, GXL, AXG SoCs.
> you are explicitly mentioning GXBB here but you don't add a "GXBB" compatible.
> I suggest to shorten this sentence ("This controller is found on Meson
> SoCs.") because this driver can also support the 32-bit
> Meson8/Meson8b/Meson8m2 SoCs with minor adjustments.
> 
we only have tested on Meson GXL and AXG platform, but it should support 
GXBB and Meson8/Meson8b/Meson8m2 and the differences between these 
controllers are only the base address of register and some SD_EMMC_CLOCK 
control bits.

i think "This controller is found on Meson SoCs." is ok.

> Regards
> Martin
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
