Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B79C982D2
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rlflbz1aVqQ96IslMEOAaqrxRW3UZsftrag2NWgf9+w=; b=Gb6DWbgm5xGMPi
	zjCZuxCW7ydyYO1VnQNKgE570c1yfJqlYdPFn+4SkLmHzE30qYpR8O3cCkea2CcsNS+RB+5EKYtrW
	b2l/Miob1WygYfJw/WgPBuDqD9srUUUR2Ga2GjQ/AAOfvg2etfZQwo1d5iBbTLM3AoRzV0HTOfU0P
	P1RVUc8U2/1xZ6XEja3jdvHI5a5XR3n04bS5LjGIg0Fa9d1Hoh8Zg8Njt/PSz1L4tLmIKeE0OslS/
	D6wyizqUm1rnnzCSaUsRta0kl01e4BEfpLndesAKdbTPZNu8hEqpGtiwOKpvnfRZQItlpLfLCmqKl
	hWc2htdmZeQDpPv/9iag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UMn-0000000Drug-1DTW;
	Fri, 18 Sep 2026 08:54:45 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UMj-0000000DrtT-0hSF
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 08:54:43 +0000
Message-ID: <1a28af11-54b9-48c3-a31c-85d9edb74af6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1789721675;
	bh=wootcnjICb9Pb80ss9CdhfZQ+wLHzPPOFwtZ9cXT/hM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=In82j0zvEK3hJimjjrv+sWhPH5Uwgst67ZnXmyNOvLFZyUMYAywbwQQfCDN8CqyEM
	 1S+ORVhzruWrMHbMyESVCSuRDtdR1SWIfaz3kHwoGcG/B7MeUFk0aHNTFdngobTFG+
	 9gD+vlf+4IBApqaTyruXJ56OjFFsMNzbq9h9mwIQ=
Date: Fri, 18 Sep 2026 10:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org,
 lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 neil.armstrong@linaro.org
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
 <20260917081309.8FBD21F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260917081309.8FBD21F000FF@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_015442_536272_4A46E1E0 
X-CRM114-Status: GOOD (  17.10  )
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

On 9/17/26 10:13 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] thermal: khadas-mcu-fan: OF node reference leak in probe
> --
> 
> commit c3a0644be46518f47124644a90235d26979c4299
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> thermal: khadas-mcu-fan: Add fan config from platform data Add regulator support
> 
> This commit introduces variant-specific platform data including control
> registers and duty-cycle levels, while also bumping the maximum level.
> It optionally acquires and enables a fan regulator supply at probe time
> to handle boards that gate fan power.
> 
>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
>> index 21b3d0a71bd0d..1da639d054971 100644
>> --- a/drivers/thermal/khadas_mcu_fan.c
>> +++ b/drivers/thermal/khadas_mcu_fan.c
> [ ... ]
>> @@ -76,22 +82,71 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>>  static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>  {
>> +	const struct platform_device_id *id = platform_get_device_id(pdev);
>>  	struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
>>  	struct thermal_cooling_device *cdev;
>>  	struct device *dev = &pdev->dev;
>>  	struct khadas_mcu_fan_ctx *ctx;
>>  	int ret;
>>  
>> +
>> +	if (!dev->of_node)
>> +		dev->of_node = of_node_get(dev->parent->of_node);
> 
> [Severity: Medium]
> Does this leak the OF node reference? The probe function explicitly
> acquires the node with of_node_get() and assigns it to dev->of_node,
> but there is no corresponding cleanup mechanism.
> 
> Since there is no .remove callback or devm action registered to call
> of_node_put(), and the driver core does not automatically drop
> references assigned directly to dev->of_node in this manner, the
> reference count appears to leak every time the driver is unbound.
> 

The if statement make it safe to not be incremented when not needed. At
the end the `platform_device_release` will call the `of_node_put`.


-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
