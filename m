Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11B2C3271E
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXWwvOje3YIoVBZ+4zXSSZw7QZFd5uNgRxIoo2ZK73M=; b=ckdfqwApkSVCS1
	vik+EZXy3tupp40Z4ZvY7W9HziYZyEWcdxtRhYDgAWLqbD+QnOKzxXrn9mJof9uc5vTvFIsmmdJMW
	Gt8WyA6lLMvJWMweauONWmRZXU1b7MLKSG7kjW4qs0aH5/SnZUaTSj22KCs0lfFNlAnSaqcGbKmRt
	VzJCGpl9K223vUvynDeJF4ZSt5F3Sc+vMZnUrq/bUsnb3Z9gnitkqCU6TYypdIXB1jtiEr/z+H5sW
	sIO6CSp/dFgs3Mvmn3Y3jObt19t5uUEKhj4fjOkeykxX50z3uTPoou/hCOKNjEjg9lAAy7sKTvUHg
	YBs+GYBOlMga/op0E/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRnlz-0000000Cxk4-3PpO;
	Thu, 11 Jul 2024 06:59:23 +0000
Received: from smtpbg156.qq.com ([15.184.82.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRnlw-0000000Cxes-0S9j
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 06:59:22 +0000
X-QQ-mid: bizesmtpsz11t1720681090th3mvk
X-QQ-Originating-IP: bSVVFY8/91zRJ0m7UHcUYHAwbF4BR0zePOfCPrJv3bQ=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Jul 2024 14:58:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16758398603850431300
Message-ID: <DFED8CF3B42049F8+44664265-ab1e-4d45-833c-41c370e4360b@radxa.com>
Date: Thu, 11 Jul 2024 15:58:07 +0900
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
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <1fece7cc-fa01-4bea-ac73-a975e042c669@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_235920_799690_28E399F1 
X-CRM114-Status: GOOD (  10.00  )
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

thanks for your reply.

On 7/11/24 15:24, Krzysztof Kozlowski wrote:
> On 11/07/2024 05:40, FUKAUMI Naoki wrote:
>> a while ago, we changed product name (hardware is same),
>>
>> from: Radxa ZERO2
>>    to: Radxa ZERO 2 Pro
>>
>> this patch reflect the change in dts.
>>
>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/Makefile                        | 2 +-
>>   ...-g12b-radxa-zero2.dts => meson-g12b-radxa-zero-2pro.dts} | 6 +++---
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>   rename arch/arm64/boot/dts/amlogic/{meson-g12b-radxa-zero2.dts => meson-g12b-radxa-zero-2pro.dts} (98%)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index 29417f04f886..5694ad0edcde 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -31,7 +31,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-go-ultra.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2l.dtb
>> -dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero-2pro.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2pro.dts
>> similarity index 98%
>> rename from arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
>> rename to arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2pro.dts
>> index 8445701100d0..5514ca9a62fb 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2pro.dts
>> @@ -16,8 +16,8 @@
>>   #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>   
>>   / {
>> -	compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b";
>> -	model = "Radxa Zero2";
>> +	compatible = "radxa,zero-2pro", "amlogic,a311d", "amlogic,g12b";
> 
> Keep old compatible.

which is better?

compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b"; (no change)
  or
compatible = "radxa,zero-2pro", "radxa,zero2", "amlogic,a311d", 
"amlogic,g12b"; (keep old one)

Best regards,

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
