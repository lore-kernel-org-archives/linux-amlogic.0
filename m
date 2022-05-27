Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13362C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 May 2022 03:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucbek0Z/g5f0AfISZ9Bh0BroCIcMeqPu/069xNbZPpY=; b=CXVAkH0+iUfvej
	wraprDZn6Ub8eZV4dZ/rnBmgG18czIV2mVYc1RZfuFFQLPyo3yR5wZqX05eans/dcMi8boTScxL+L
	1VyZT+3cvxBZ5PrsIVSBvrBNbmByDX1OKp3+ZYuMqjYvH7+XR+jYc05eSaYaF0GCRtbBqNfzCR9TX
	Fr0jxLDyCqePZIZNFIotbOeFuZc/4MVlaAzgE+MzD6QJIRML/dgt8mzHQJbVLRf/I873j7CgaR861
	0Cl8mx7zkGcJgPzGCt1QPnwwsnU5sQTMHf6b+HZX2epyNKPMT/8EhCwZ+4dZw3LW9h6mftPn7BEC8
	6f/Enga9tf0pyQYBvwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQXE-00GUGa-KM; Fri, 27 May 2022 03:21:08 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQX3-00GUEJ-8b; Fri, 27 May 2022 03:20:58 +0000
Received: from [10.28.39.121] (10.28.39.121) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 27 May
 2022 11:20:55 +0800
Message-ID: <a71892eb-8482-2905-54fc-dac5e2ba6d51@amlogic.com>
Date: Fri, 27 May 2022 11:20:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 2/4] mtd: rawnand: meson: fix the clock
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng
	<bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-3-liang.yang@amlogic.com> <7hwne88dha.fsf@baylibre.com>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <7hwne88dha.fsf@baylibre.com>
X-Originating-IP: [10.28.39.121]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_202057_357700_E178C6A2 
X-CRM114-Status: GOOD (  10.02  )
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

Hi Kevin,

Thanks for your review.

On 2022/5/27 0:28, Kevin Hilman wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Liang,
> 
> Liang Yang <liang.yang@amlogic.com> writes:
> 
>> EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK'
>> which is defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is
>> the divider and bit6~7 is the mux for fix pll and xtal. At the beginning,
>> a common MMC and NAND sub-clock was discussed and planed to be implemented
>> as NFC clock provider, but now this series of patches of a common MMC and
>> NAND sub-clock are never being accepted.  the reasons for giving up are:
>> 1. EMMC and NAND, which are mutually exclusive anyway
>> 2. coupling the EMMC and NAND.
>> 3. it seems that a common MMC and NAND sub-clock is over engineered.
>> and let us see the link fot more information:
>> https://lore.kernel.org/all/20220121074508.42168-5-liang.yang@amlogic.com
>> so The meson nfc can't work now, let us rework the clock.
>>
>> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> 
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> 
> Thank you for your persistence in working on multiple iterations of this
> until we came to a final agreement.
> 
> Kevin
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
