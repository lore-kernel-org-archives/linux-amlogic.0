Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E5FA3744
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ALvN+RnWPjVz1BOqpgl7/zYMqXISSFUBV1mwaDOHXY=; b=CLHlZwnw/chUvv
	T03pmC36H0sIDsmV5C/PDtX92Ac3NfZdM+YmJEsRQvsjaZOvkUUloxHs9lEGEM3otzhSBcXZXY7mx
	DRNhqAgmBJRQIEahqyvaa+x+8yW8D0a6QpfsyWHoiNZ6fmXISlQZ9qi5TC7yQQVNtPep0lsm9iDpo
	krqQcrV8uFR3qedUq6gTvyfmcled78pZHAHYS6enNxjLpbPgHtZnDz1UNAmK10sziJoOdyfDuG7r+
	Lx8bVh1Ff3t3BzBqCN4z/pcMjmtXFIgAYKE9QKk4CKCtd+PHUv7ek8vbvz4D2XMqwXkwePokjnetL
	hcUghsbplcmdDbKw7ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUvP-00C5NY-Qr; Mon, 31 Oct 2022 13:33:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUvN-00C5Mf-MV; Mon, 31 Oct 2022 13:33:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70881FB;
	Mon, 31 Oct 2022 06:33:59 -0700 (PDT)
Received: from [10.57.7.114] (unknown [10.57.7.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D2FB3F703;
	Mon, 31 Oct 2022 06:33:50 -0700 (PDT)
Message-ID: <3c54db0a-44fe-ee24-1833-7637e249ec79@arm.com>
Date: Mon, 31 Oct 2022 14:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 02/20] arm64: dts: Update cache properties for amlogic
To: neil.armstrong@linaro.org, linux-kernel@vger.kernel.org
Cc: Rob.Herring@arm.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20221031091918.531607-1-pierre.gondois@arm.com>
 <fac3eae5-687e-9eb0-ddfb-c659d3816d81@linaro.org>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <fac3eae5-687e-9eb0-ddfb-c659d3816d81@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_063357_857841_C7748BE1 
X-CRM114-Status: GOOD (  15.06  )
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

Hello Neil,

On 10/31/22 10:51, Neil Armstrong wrote:
> Hi,
> 
> On 31/10/2022 10:19, Pierre Gondois wrote:
>> The DeviceTree Specification v0.3 specifies that the cache node
>> 'compatible' and 'cache-level' properties are 'required'. Cf.
>> s3.8 Multi-level and Shared Cache Nodes
>>
>> The recently added init_of_cache_level() function checks
>> these properties. Add them if missing.
> 
> Is this tied to a bindings change ? Since I'm only in CC to the 02/20 patch,
> I don't have the context here.

It is not tied to a binding change, it is just to align the DTs to the
DeviceTree spec to potentially prepare for having a common DT parsing code.

To avoid cc-ing people to DTs they are not related, the get_maintainers.pl
script was run on each patch individually. The cover-letter is at:
https://lore.kernel.org/all/20221031091848.530938-1-pierre.gondois@arm.com/


> 
> Neil
> 
>>
>> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
>> ---
>>    arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 1 +
>>    arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 1 +
>>    arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
>>    arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 1 +
>>    arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 1 +
>>    arch/arm64/boot/dts/amlogic/meson-sm1.dtsi  | 1 +
>>    6 files changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> index b4000cf65a9a..d2f7cb4e5375 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -36,6 +36,7 @@ cpu1: cpu@1 {
>>    
>>    		l2: l2-cache0 {
>>    			compatible = "cache";
>> +			cache-level = <2>;
>>    		};
>>    	};
>>    
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> index 04f797b5a012..1648e67afbb6 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> @@ -105,6 +105,7 @@ cpu3: cpu@3 {
>>    
>>    		l2: l2-cache0 {
>>    			compatible = "cache";
>> +			cache-level = <2>;
>>    		};
>>    	};
>>    
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> index fb0ab27d1f64..af23d7968181 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> @@ -50,6 +50,7 @@ cpu3: cpu@3 {
>>    
>>    		l2: l2-cache0 {
>>    			compatible = "cache";
>> +			cache-level = <2>;
>>    		};
>>    	};
>>    
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
>> index ee8fcae9f9f0..9978e619accc 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
>> @@ -105,6 +105,7 @@ cpu103: cpu@103 {
>>    
>>    		l2: l2-cache0 {
>>    			compatible = "cache";
>> +			cache-level = <2>;
>>    		};
>>    	};
>>    };
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> index 023a52005494..e3c12e0be99d 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> @@ -132,6 +132,7 @@ cpu3: cpu@3 {
>>    
>>    		l2: l2-cache0 {
>>    			compatible = "cache";
>> +			cache-level = <2>;
>>    		};
>>    	};
>>    
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> index 80737731af3f..d845eb19d93d 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> @@ -88,6 +88,7 @@ cpu3: cpu@3 {
>>    
>>    		l2: l2-cache0 {
>>    			compatible = "cache";
>> +			cache-level = <2>;
>>    		};
>>    	};
>>    
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
