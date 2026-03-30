Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBF6FB3D15
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PETv4l9i16ZdEYV9nxAGanPlWdZMLTFtIk2cijl5RlU=; b=H87hyRCJ5chmp3
	pNNZtWK/9zXCagXxED3/9/c8LSSrOI84FpqDuWcRHXaw1ArmmY4pSBWErsc9h9YM8CX8cB/bmE3eh
	CNdwZ/gKaSRN/pv70DpdW/RLbxp6hA1SR2XRSXhelYQTmQS5eQbdu8sQ+EBjVKN66LvudQq+lWNQ5
	MbwTTpyCzUA4pZvvTZgpG2i8w3DTm7eHwSJwjBbFxbpLGYcntKH4znMgRXq5J20faz/LIfHGU3iOD
	IqZfvP93N2SYSEyo5+zkHdQx9cUI0mDmr8Ven4NhP2OqkyiBOzi2UQKRCtaQI589ajDyMkXclUswo
	PubVE6Co9NfSMnPcyPyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AN6-0000000B7ok-3Ppc;
	Mon, 30 Mar 2026 11:01:28 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AN4-0000000B7nP-0f9g;
	Mon, 30 Mar 2026 11:01:28 +0000
Message-ID: <02927f87-fa91-457d-af2b-a7610ef481e8@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774868480;
	bh=gPOPxtR9dBImR4mZtM3pZ8L7sTxbCUXJst9ZTpej2H4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=I3kEhhRbqYk2rPZmeCBhucqJlRJGW1f5ryoQGi6LsiJFIohGgdVQFL46R59CPh37J
	 wgqLajLhrX5Lr+7+7TrIqpe7I1kaVanF5nxpUqDx5oU4vTsYy50JfFTL9RF5WWmNJ3
	 Cz1hY2y1ivnZpewbI0vTBLB4WCPSkVk+sb/HYm00=
Date: Mon, 30 Mar 2026 13:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid
 property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20260330-fix-invalid-property-v1-1-e829c4d806cb@aliel.fr>
 <36822ad1-c73d-4903-bd39-091874558f10@kernel.org>
Content-Language: en-US
In-Reply-To: <36822ad1-c73d-4903-bd39-091874558f10@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_040126_638721_F63D0E3A 
X-CRM114-Status: UNSURE (   8.05  )
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

On 3/30/26 12:38 PM, Krzysztof Kozlowski wrote:
> On 30/03/2026 12:21, Ronald Claveau wrote:
>> Fix introduced invalid property for Khadas VIM4 sdcard regulator.
>>
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)
>>
> 
> Fixes commit?
> 

Thanks for your review I will add a Fixes tag like that:
Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add power
regulators")

> Why there is no such change in recent next? Was it just merged?
> 

Yes it is in next-20260327
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts?h=next-20260327&id=60eff75ac67bbf5445bdbd2842b0109ac591441c

> Best regards,
> Krzysztof

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
