Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C354BC88E75
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dymjR9juu3UXCdRAP3okwqb5O0FZ73mWyrJH/ga5tmg=; b=HcDysbDQs8tjc/
	TIblJOIXY4RUiTSZnvA3WrCM5TXf4t1oCJxC9xiFp6CQSLT6xjfppIq0BBWkrfcVVFnanuucCWIly
	9HOTJVXwi0zfSZGwmXmwFCGG+wuTJQS3VwdaqGTZz4r9BJP8d2VJOIBV7kgwc05w99ep66y7kKYZE
	Dn2piG9hjDRS0FmTOx8qQ8mDbsM1s3xwthF0xhWgLyChPP208DAuFaSU3+p5+tqSQUJ2MK3bPJP1n
	op6YXQN+QTDbk6DFnTB5C40IU2ouBTA2Leo50miRfccYZzKGAyKmAyXCkjKkHjx6G7hVaHSsZ2FcJ
	rrUyWrIjUyqsX4OomqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UG9-0000000Dr9p-3TQ4;
	Fri, 18 Sep 2026 08:47:54 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UG6-0000000Dr8c-3Z0R
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 08:47:52 +0000
Message-ID: <374d55f4-d6fe-4819-adea-cdf87f067e92@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1789721262;
	bh=uzDOTI5KVAzWKNu0eBTWVl0dvaIek3tznA94L1LoMqA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=P8TRtR9Yde9QOQE4ih8DvAskLhk5y4qGQiFjytQGZ7ceAoA0LRl59r+IfEoDkIzeJ
	 /JM5hvKWdPhmEKfyRB7Je/urGx+vfFG3CKwRLdIQJuzeHNOXuT1eRO/2uhV1NiquJt
	 CQwDyPsvSpJHnBbQzzDqivLooWhZOAeGiMoyG10M=
Date: Fri, 18 Sep 2026 10:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v12 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 lee@kernel.org, conor+dt@kernel.org
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-3-497cd543a148@aliel.fr>
 <20260917081118.835FA1F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260917081118.835FA1F000FF@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_014751_352149_71FC192D 
X-CRM114-Status: GOOD (  11.34  )
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

On 9/17/26 10:11 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] mfd: Incorrect writeable registers in VIM4 regmap config
> --
> 
> commit fc44329d7ee6d12a0077930b2632df3554d1e38f
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> mfd: khadas-mcu: Add support for VIM4 MCU variant
> 
> This commit adds support for the VIM4 MCU variant by refactoring the
> probe function to use per-variant values. It introduces a dedicated 
> regmap configuration for the VIM4 MCU, with its own volatile and 
> writeable register checks.
> 
>> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
>> index 0e74efe14f367..4b37e74e2b04a 100644
>> --- a/drivers/mfd/khadas-mcu.c
>> +++ b/drivers/mfd/khadas-mcu.c
> 
> [ ... ]
> 
>> +static bool khadas_mcu_vim4_reg_writeable(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case KHADAS_MCU_VERSION_0_REG:
>> +	case KHADAS_MCU_VERSION_1_REG:
>> +	case KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG:
>> +		return false;
>> +	default:
>> +		return true;
> 
> [Severity: Low]
> Does this function omit multiple known read-only registers defined for the MCU,
> such as KHADAS_MCU_MAC_0_REG and KHADAS_MCU_USID_0_REG?
> 

Those registers does not exist on VIM4 MCU variant. So it's free to
ignore in my opinion.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
