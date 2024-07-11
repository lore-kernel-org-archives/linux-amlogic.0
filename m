Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59ECC3DA47
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uq1v20pB/vdExWWMGbsrdJTn3kEOlH91LAp0H31W6zk=; b=Gi6nDeoiYIvoYm
	rGA115CXSDkiilcid+dqoHH5l8AdRWZwEp731CF1787aQ38AOAIctsOdofU5te1TNjdfdIpF5bsom
	+qpPby9aDF2QbFzwcNf9obOWxiB9MYfLknkrVXcjQ+nuFOREkU21W+ISyexqTgmSsSPkoHZTgJLzY
	3KkQ0oj720wJOJo8603oZ4TFPxDrQkPLarwzPC5iO31i/0ducIa2/c4nqJyd8wB4u0foETIIInVdw
	IoqNQX5mqtfr0zcZLEWA619A/9eojVUVnYOfNQumSAsdcrjc7s5/oBg61psv+LqEaNIOktxORuVUm
	bDtvEpPsmLXFbGVMhDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpYH-0000000DG89-45WK;
	Thu, 11 Jul 2024 08:53:21 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpYE-0000000DG6h-39TW
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 08:53:20 +0000
X-QQ-mid: bizesmtpsz10t1720687928tuqqho
X-QQ-Originating-IP: E4fZjx0lwKjVA+66NREMxLTii2Uo+tFD1SBVSKoINNo=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Jul 2024 16:52:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4651650904875580075
Message-ID: <895267B189BD693F+7a2f3db5-2e67-4905-b085-5726b56bbbab@radxa.com>
Date: Thu, 11 Jul 2024 17:52:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: change product name for Radxa
 ZERO 2 (Pro)
To: Krzysztof Kozlowski <krzk@kernel.org>, neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20240711034035.3921122-1-naoki@radxa.com>
 <20240711034035.3921122-2-naoki@radxa.com>
 <1fece7cc-fa01-4bea-ac73-a975e042c669@kernel.org>
 <DFED8CF3B42049F8+44664265-ab1e-4d45-833c-41c370e4360b@radxa.com>
 <0036cb62-7621-4458-9011-cae56208eefc@kernel.org>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <0036cb62-7621-4458-9011-cae56208eefc@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_015319_107090_9BFE50B7 
X-CRM114-Status: UNSURE (   6.05  )
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

Hi

On 7/11/24 16:45, Krzysztof Kozlowski wrote:
> On 11/07/2024 08:58, FUKAUMI Naoki wrote:
>>>>    
>>>>    / {
>>>> -	compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b";
>>>> -	model = "Radxa Zero2";
>>>> +	compatible = "radxa,zero-2pro", "amlogic,a311d", "amlogic,g12b";
>>>
>>> Keep old compatible.
>>
>> which is better?
>>
>> compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b"; (no change)
>>    or
>> compatible = "radxa,zero-2pro", "radxa,zero2", "amlogic,a311d",
>> "amlogic,g12b"; (keep old one)
> 
> I propose not to change anything, at least based on your
> explanations/rationale.

I see, I don't touch anything which already exists.
then, can I add new "Radxa ZERO 2 Pro" product?

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Best regards,
> Krzysztof
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
