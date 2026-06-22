Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18F5CDB470
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jun 2026 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O28kisIGSGHMNRf1x6JN8JjBgojzz6fi6cfauPQPYRE=; b=2gsvv6M3DxH4ha
	zM2/eVStn1obremwlQj6WVkxn7c+jL1zpHr2v1YaZMz6dRMJr9nH+JDopJt8rPxDslVkx3sOL2QiA
	9NMDsPN9mBynY1PeWO/tm2NWS3LQAyARJW9xlifSSAecUXLY2fsuZNv0wkYKa5X2TSEpj861MNqcd
	FdYP3RJO1Sz5w1C3rIH8hIYhjqmtUJG1cW2ketdm2vjPWQflEob1Wa+n7f3Q66IIvqwjFUbCBuhPh
	5EP59ODS3bqrM27JOac7sS3nGsgvLhjQQTJGtdj3ntiI6s4LHcpB2ZetFX6j5JnDKoaFY6sRGvRMD
	wWF16E+33CaGcBA13rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcfI-00000004tBU-2tvW;
	Mon, 22 Jun 2026 11:18:08 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcfF-00000004t9d-3dlx;
	Mon, 22 Jun 2026 11:18:07 +0000
Message-ID: <dc285387-b0f9-4f48-a0ba-c544c5af11fb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1782127072;
	bh=HdtF2G1DsaD29ZHA5Zc/J92hjynpjVG3JfparU9m/WE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=fg+m3CxDeoTsbMdqm2wMyM+Wbgj9ubSfZ8BENBPT4sEkGL0IJQbisZ+QP2SKFzzpq
	 3zjM5GUOik+0hVIXsy/39O4ttmgoeIaIqOkVOi4vze+ZBQ+ym/NssY2JStDRxu6bro
	 8kya+zJceqbC+keEof7DdOjBn1R+fApT2BGfb354=
Date: Mon, 22 Jun 2026 13:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v5 1/8] dt-bindings: thermal: amlogic: Add support for T7
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
 <20260424-add-thermal-t7-vim4-v5-1-9040ca36afe2@aliel.fr>
 <2e2a93c7-6bf9-49f2-95ed-f44cf767e9fd@kernel.org>
Content-Language: en-US
In-Reply-To: <2e2a93c7-6bf9-49f2-95ed-f44cf767e9fd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_041806_370956_8699F4E7 
X-CRM114-Status: UNSURE (   7.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 6/22/26 12:02 PM, Krzysztof Kozlowski wrote:
> On 24/04/2026 17:45, Ronald Claveau via B4 Relay wrote:
>> +  - |
>> +    temperature-sensor@20000 {
>> +        compatible = "amlogic,t7-thermal";
>> +        reg = <0x0 0x20000 0x0 0x50>;
>> +        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> 
> 
> This wasn't ever even built! Really, it fails immediately. I will send
> fixes, but quite disappointing that contributor does not test its own code.-
> 

My bad, I thought that `CHECK_DTBS=y` was enough to test
`dt_binding_check` as well. I add it again to my build tests.


-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
