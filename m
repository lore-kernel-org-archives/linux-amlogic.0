Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146F0E98FB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Apr 2026 06:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/thk8OrkuhqkV0fg9sFyRtiv9GqgTPUHRIm52t3j6M=; b=q0BvFm95H8dw/d
	gncZdhH8Um88swwyuYl9yz7plMxeLBA454hpNeDQc8ulYwrpVKI7JOXIiJkqxdwH2HNAAGL4FG7hB
	lftk7kwMqq2FB1KKOXAb4aXl/qaRmvDFZGh36Aqc+Dw7u1l4MyuGlJCrvkLbwNcj4dhRCQjJYqu/C
	mhP4FHuNSOifGUfQ5D25vb5TD/T3EG6e+yfJivR3z3sXFDySzf8cNkVT/5Y7GF4UpZ9bPEkoc/h4g
	E7jH7DpmOt0sntSoPMmq1JZhqHm+aOsT18Uu1bM5ao9ppwBmLMDX/EqystTrxIvLuLfEN5MJ02KpN
	COmLqKNE0LoyvJwyOnWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAicd-00000009kvY-2bIS;
	Thu, 09 Apr 2026 06:12:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAicb-00000009kv0-2lZ7
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Apr 2026 06:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC53A43BF4;
	Thu,  9 Apr 2026 06:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F920C4CEF7;
	Thu,  9 Apr 2026 06:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775715128;
	bh=OMh46ORI4PU+osUPIisdcpwLBCZ1bfwWTNclxJgOQu8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mSzM66SXVJtkb5qw5RkOpsgcPsaUNag7a9PVLQnXo0s563o8D1C+4B/Tc+cSLdgyI
	 ENYGzL2cOGE5N/ZRCu6mpLkI++zqOoUZtRiPe8St/sXUT1ALRQwZElIMEFtbu5mquL
	 aRlYfaN/oKWaNDLhHsLXGhlrimUi2Qp3T+4t8eAhwxCyp+L37bWzLeJneM+e94Etul
	 5SpQ3kBrBNe7Ius+HXUC3aYDcAu+K09E5Y6e/7hZLprFo6qNus0B8kX/fiG9nNOPv2
	 C6pJJQowgjRiMhC7v4UYTr7yhK2tYNAxLebW2ca3tqCg2G86jdicQrVkXm3XcKTDjR
	 7Chujglif7qsQ==
Message-ID: <b97c2e64-8a43-498b-a447-6a5b67c525e5@kernel.org>
Date: Thu, 9 Apr 2026 08:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: amlogic: Add basic clock driver
To: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-4-a9198dc03d2a@amlogic.com>
 <89cc0724-32a8-4da5-8070-c128cafcfc82@kernel.org>
 <76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_231209_744642_7A343219 
X-CRM114-Status: GOOD (  15.11  )
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

On 08/04/2026 16:32, Chuan Liu wrote:
> Hi Krzysztof (& ALL),
> Thanks for review.
> 
> On 2/9/2026 9:17 PM, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Implement core clock driver for Amlogic SoC platforms, supporting
>>
>> So how did all existing Amlogic SoC platforms work so far without basic
>> clock driver? Really, how?
>>
>> You are suppose to grow existing code, not add your completely new
>> "basic" driver just because you have it that way in downstream.
>>
> 
> Firstly, apologies for the delayed response. I had intended to 
> consolidate the V1 review feedback and come back with a clearer plan for 
> V2 changes. In the meantime, Martin has provided many detailed and 
> valuable suggestions - much appreciated.
> 
> The original goal of optimizing the HW based on A9 and introducing a new 
> clock driver is to reduce unnecessary complexity in the driver. On A9, 

Nah, you just don't care about upstream and it is easier for you to
duplicate new code.

> we optimized the Clock/PLL controller HW to simplify driver performance, 
> complexity, memory footprint, and reusability. Improvements on the HW 
> side can also help drive corresponding enhancements in the driver:
>     - Performance: Encapsulates sub-clock functions, reducing call paths
>     - Complexity: Standardized register bits eliminate a large number of
> bit definitions (~1/3 of original code is defined register bit [1])
>     - Memory: Object-oriented design avoids copy/paste for repeated clocks

Object oriented design? Sorry, what?

>     - Reusability: Same controller works across SoCs without driver
> changes (or with minimal changes)
> 
> The old meson driver required compromises to unify legacy controller
> characteristics and driver styles. On A9, we want a fresh start.

And maintainers don't want that. We expressed this many times already.
Not only in this thread - that's one of the most known feedbacks.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
