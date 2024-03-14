Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C921BC54E67
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3p6ZH322ypD0TRg4wYfiEz+zxCe7h7THz7gkuF9N6qU=; b=mmoBhfZpujh3hX
	/pm/KBCdF5D/35ele/Ytsnb6er8K4M2oQISCG/JxqSHh6CPqTRaBJWfDQ1xJh8q+WdHL5Jkk7uC1b
	G84kmcT6+zvgHfUeJtvPURfC7cBjVBlhRbM3+PnTe/7VVPy9TmNZvojH2crmFFtHvYzS2pE9LvgEf
	Aa2IuDxPuPXxCg2YOoEjpk3mbN2iaWQtraZZe3fI+AotRTkTE+wOo2T5gdYy3Bn+2FneQLMusiVVV
	xzapjxcCI8e8kiqrDf//VqYDqJGmmBMZcPGRvy3UN1Jb9DtKmSFxgjhuIMw/7xmwCtZio4JdF+jrx
	rw3J00YnO7LP+88dt+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklc5-0000000EWHP-34LZ;
	Thu, 14 Mar 2024 13:59:17 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklc1-0000000EWGG-3sKP;
	Thu, 14 Mar 2024 13:59:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4300111FF8E;
	Thu, 14 Mar 2024 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1710424751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=YZ3rbrGjha02UD0mhfO3FCamNF+pYQ8Ho++Y52tVh1E=;
	b=Md0swrBj3xps/eY4kwEchUDXfJz0FpK7fkri6MsvOE4gzA2MZ6ygs727fv3U4+fFHFf7Mc
	abV1L2yzhxDdwhYV+g3+ca+usHS+dRCig5RNwkaFwtjoJLQqa0W+bTST3Kk3endYVoGP0n
	S4kLFfQFm1Yty4SfCax4Dj6UhkJJCtlCyc/YGftn/b5U8IUt4S0Ku6xgmn6reigZgQu3um
	SF7LEGYVa3EA3fdgvSH3d2+Qvg5l1wTnT0S3KUQ6gCkO2+VYTJ4drKr9RKjtgab8GkJJ7S
	VOTDwxs+ImxmgS6R2sR+53v01oGq0mguMRk63aIVoJB2wVeXdhQ7YC+Ct3ImfA==
Message-ID: <c0352b99-ca25-4357-bc26-470d802dbf71@lexina.in>
Date: Thu, 14 Mar 2024 16:59:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic
 secure-monitor SoC Information driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20240314070433.4151931-1-adeep@lexina.in>
 <20240314070433.4151931-3-adeep@lexina.in>
 <111346d3-8357-4ca3-9249-a43ebc225fcb@linaro.org>
 <9292d2ee-138a-4a59-9c96-31c1b4473a4e@lexina.in>
 <df615536-8034-464a-8dba-c890b70edc1f@linaro.org>
Content-Language: en-US, ru-RU
From: Viacheslav <adeep@lexina.in>
Autocrypt: addr=adeep@lexina.in; keydata=
 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
In-Reply-To: <df615536-8034-464a-8dba-c890b70edc1f@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_065915_346043_DD350FE0 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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



14/03/2024 16.31, Krzysztof Kozlowski wrote:
> On 14/03/2024 13:22, Viacheslav wrote:
>>> +
>>>> +	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
>>>> +				    GFP_KERNEL);
>>>> +	if (!soc_dev_attr)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	soc_dev_attr->serial_number = socinfo_get_chipid(&pdev->dev, fw, &socinfo);
>>>> +
>>>> +	soc_dev_attr->family = "Amlogic Meson";
>>>> +	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x:%x - %x:%x",
>>>> +					   socinfo.v1.major_id,
>>>> +					   socinfo.v1.chip_rev,
>>>> +					   socinfo.v1.pack_id,
>>>> +					   (socinfo.v1.reserved<<4) + socinfo.v1.layout_ver);
>>>> +	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "%s (%s)",
>>>> +					 socinfo_v1_to_soc_id(socinfo),
>>>> +					 socinfo_v1_to_package_id(socinfo));
>>>> +
>>>> +	soc_dev = soc_device_register(soc_dev_attr);
>>>> +
>>>> +
>>>> +	if (IS_ERR(soc_dev)) {
>>>> +		kfree(soc_dev_attr->revision);
>>>> +		kfree_const(soc_dev_attr->soc_id);
>>>> +		kfree(soc_dev_attr);
>>>
>>> That's a double free. This was not tested.
>>
>>
>> Please, describe the problem.
> 
> Test your code. What's the point of arguing over it if regular test
> would show this?
> 
>> I don't quite understand what the issue is:
>>
>> - kfree() releases memory allocated with kmalloc()
> 
> So point me where is kmalloc(). I don't see. I see only devm.

I missed the point that devm_kzalloc is automatically freed. You are 
right. Thanks!


-- 
Best regards
Viacheslav

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
