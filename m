Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A509C2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAXKh+2JWugv4uSPPZ0DAbFIM+aGxt+9VCCCr358A40=; b=lO0l9HI8oC8T2n
	I08YgpJMGv6gFUZnDqx4DR0qg93IU5NwLUETYFJj7e9wfTMcJNux+iH+UVe8PAuBQcxmUkyADhIs3
	nsLtT7q4z+BrOShV7PiTrBqasDXbD3xWqUgqg7xtwcG/YKx2VoFt7Czn91bKArzTIJHKGHs2MA7qe
	vDtVrhwXEP7+Z5BZmzK8IQSxaE+MI5wWUerADZEzaSgZbthD9PSl+PrWpw+hp+AHBIuxwQbvfl9or
	WE4XPX1zPhfrkvSMzFe1fCkJMn/cBQb2t6+DCJgleGNkPDEMLB2AFcHEV1C39b2brERopqWyabmMz
	QceDeTx8ZakOC8hoJ/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBHV-0000000GqGP-2LCo;
	Fri, 12 Jul 2024 08:05:29 +0000
Received: from smtpbg156.qq.com ([15.184.82.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBHQ-0000000GqF5-3w41
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jul 2024 08:05:27 +0000
X-QQ-mid: bizesmtpsz10t1720771461tzwli0
X-QQ-Originating-IP: U25Ln5tkiuUt138GSqd1mm4npz0kzR4zil7EUz9M3so=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 12 Jul 2024 16:04:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18202029709574962704
Message-ID: <FA45EFF197FE5160+55491767-a64b-4520-8320-1b1a4308b75f@radxa.com>
Date: Fri, 12 Jul 2024 17:04:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for Radxa
 ZERO 2 Pro
To: Krzysztof Kozlowski <krzk@kernel.org>, neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20240711202013.26573-1-naoki@radxa.com>
 <cb18f4bc-ed81-4a4c-8545-94a2950af0b2@kernel.org>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <cb18f4bc-ed81-4a4c-8545-94a2950af0b2@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_010525_606379_C9494FB1 
X-CRM114-Status: UNSURE (   8.96  )
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

Hi,

On 7/12/24 16:52, Krzysztof Kozlowski wrote:
> On 11/07/2024 22:20, FUKAUMI Naoki wrote:
>> Radxa ZERO 2 Pro is a ultra tiny high performance SBC[1] using the
>> Amlogic A311D chip.
>>
>> [1] https://radxa.com/products/zeros/zero2pro
>>
>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>>
>> Changes in v2:
>> - none
> 
> That's not a correct commit msg. Apply it and you will see... Also,
> won't pass SoB or checkpatch tests. Missing ---.

oh, I see. thank you very much!

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

>> ---
>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>> index 0647851ae1f5..66745b4f5eca 100644
>> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>> @@ -157,6 +157,7 @@ properties:
>>                 - bananapi,bpi-m2s
>>                 - khadas,vim3
>>                 - libretech,aml-a311d-cc
>> +              - radxa,zero-2pro
>>                 - radxa,zero2
>>             - const: amlogic,a311d
>>             - const: amlogic,g12b
> 
> Best regards,
> Krzysztof
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
