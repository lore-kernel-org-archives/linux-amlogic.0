Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD01ACCF2C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Oct 2026 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8elODrS8t/iWj4LpIdqw9QM7ZsQIiCcyzKSE4hbj8W0=; b=2IAWmuiqy2JhOX
	1ZTU6Qjuz9bm6TzS2IXLdB2w986cdFRC5FNiMjSRCk4K9/bO/2T4odaR4OvSOjc/wFGQANlD2+OyU
	5ksaAUlB3RBwUmU7XjFbi2IYMQ/qIP+lhStpQ4N59Jf2bUDZ2U1Vn6QnHikiucnSGy0i9M8NBY/Yw
	3JxwmONzj1B9S5K5upVfYOb0EbEVglEZGdBEx4pjMlb0pZpl9xiDiA2xmjc/vExgMlAFsa7EEyN+R
	jUp/OqfjJOu4bliWts4w6B4/4iKLvZYhtnX6l1EWwMpW0xdKX6vluzgv6AdPZ/1Qf1naNi0RleMV7
	O9Z9bgog7EfmDRq5d53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIMor-00000005iLY-2qTA;
	Sun, 18 Oct 2026 09:04:41 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIMon-00000005iKj-3eln
	for linux-amlogic@lists.infradead.org;
	Sun, 18 Oct 2026 09:04:39 +0000
Message-ID: <dda4b297-6dd1-42ba-8332-80c22b741e29@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1792314262;
	bh=7JSwmRHMeCpoRpZ+V304C3rcHX1ouKohB9jQ8dpXb9U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=WAHDuXaE0WHGgKo+PmYG9T25fFEMovyLJcTPtnJRvFdFYtHYf3YTdflYEMIh8zIE3
	 +LdKHLcDAOMgJhkAdDnijhoIpaC3Oc5MazTWCdQTqTgR80D37gwRBPdfTQt1dEuA+d
	 EVK3r6qspQ7JhJSQBIcUT+3+ReekxuqYYj7tfEyI=
Date: Sun, 18 Oct 2026 11:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v7 2/4] arm64: dts: amlogic: t7: Add thermal sensor nodes
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
 <20261016-add-thermal-t7-vim4-v7-2-6eede5450fd4@aliel.fr>
 <sashiko-outbox-174722@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-174722@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_020438_368739_03831FD8 
X-CRM114-Status: GOOD (  13.28  )
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

On 10/16/26 7:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] thermal: amlogic: system hang due to MMIO access before clock enable
> --
> 
> commit d943dedd550441fdf5ee6b1eb6eb97f02aac1ef7
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> arm64: dts: amlogic: t7: Add thermal sensor nodes
> 
> This commit adds six temperature sensor nodes to the device tree using
> the amlogic,t7-thermal compatible. The nodes include references to their
> required clocks and calibration data from the secure monitor.
> 
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index 8aa85aab30469..c81632d3984e8 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -696,6 +696,26 @@ sec_ao: ao-secure@10220 {
>>  				amlogic,has-chip-id;
>>  			};
>>  
>> +			a73_tsensor: temperature-sensor@20000 {
>> +				compatible = "amlogic,t7-thermal";
>> +				reg = <0x0 0x20000 0x0 0x50>;
>> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&clkc_periphs CLKID_SYS_TS_A73>, <&clkc_periphs CLKID_TS>;
> 
> [Severity: High]
> Does adding this thermal sensor node expose an initialization order bug
> in the driver that causes a system hang?
> 
> In drivers/thermal/amlogic_thermal.c:amlogic_thermal_probe(), the thermal
> zone is registered before the hardware clocks are enabled:
> 
> 	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev,
> 						   0,
> 						   pdata,
> 						   &amlogic_thermal_ops);
> 	...
> 	ret = amlogic_thermal_enable(pdata);
> 
> During registration, the thermal core synchronously queries the temperature
> via the driver's .get_temp callback (amlogic_thermal_get_temp()), which
> performs an MMIO read via regmap_read() on TSENSOR_STAT0.
> 
> Since the driver enables the required peripheral clocks after the thermal
> zone is registered, executing this MMIO read before the necessary bus clocks
> are enabled will stall the AMBA bus and hang or reboot the system.
> 
> [ ... ]
> 

This is pre-existing and can be managed outside of this series.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
