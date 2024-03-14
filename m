Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D807DC54E60
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWVWMLvfU3ZQ+2UZ29ulU+arSM794glJJxGgrKJZuiU=; b=O3dJ+knYXHLEi/
	bN7Zp1FTRAbpGwUoOZMZmG2sbbXBr3KPRUSNGbL0oKBcCJQRZ8YoQLDUzG8PcvZ3aNeEGMTUf6pD8
	VAbtstumm99Dee37wQtUTqga7NouHzx3ZFGThjKFinE7TDpykIRl+y4i56kaAdBICOJfjgIBsDD26
	BFKOAiV7ngL/h6jh1nZ1HZkejdL35eY4ijyD1aEjzwP7zBWNtfNDzlvzjrR6sZGch0DPKJOYAkv/Z
	j/IU3knzZaHxh8Kl37SRXGlXRZZbHOAh1FcNQVy6aQcrRUgxfxnHe8jbOhdvcy7SF5IYM7BwKN0lQ
	px/g0+QQP2D4PYvaLiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm6K-0000000EeFx-1nai;
	Thu, 14 Mar 2024 14:30:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm6H-0000000EeFI-3s34;
	Thu, 14 Mar 2024 14:30:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D95E81007;
	Thu, 14 Mar 2024 07:31:01 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 231BE3F762;
	Thu, 14 Mar 2024 07:30:24 -0700 (PDT)
Date: Thu, 14 Mar 2024 14:30:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viacheslav <adeep@lexina.in>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3 0/4] soc: amlogic: add new meson-gx-socinfo-sm driver
Message-ID: <ZfMJ_Z07QkwFbOuQ@bogus>
References: <20240314070433.4151931-1-adeep@lexina.in>
 <ZfLUMoN_ZU-xLfpA@bogus>
 <62d45d81-1366-440f-81e1-e66395707eb9@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62d45d81-1366-440f-81e1-e66395707eb9@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_073030_025855_09B11169 
X-CRM114-Status: GOOD (  11.62  )
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

On Thu, Mar 14, 2024 at 03:25:02PM +0300, Viacheslav wrote:
> Hi!
> 
> 14/03/2024 13.40, Sudeep Holla wrote:
> > On Thu, Mar 14, 2024 at 09:59:50AM +0300, Viacheslav Bocharov wrote:
> > > The Amlogic Meson SoC Secure Monitor implements a call to retrieve an
> > > unique SoC ID starting from the GX Family and all new families.
> > > But GX-family chips (e.g. GXB, GXL and newer) supports also 128-bit
> > > chip ID. 128-bit chip ID consists 32-bit SoC version and 96-bit OTP data.
> > > 
> > 
> > How old or new are these SoCs ? The reason I ask is that it is really
> > sad to see vendors still creating their custom interfaces for such things
> > despite the standard SMCCC interface SOC_ID introduced in SMCCC v1.2 some
> > time in 2020.
> 
> Most of these SoC were created before 2020.
> 

Fair enough then. Hope they use SOC_ID on newer SoCs.

-- 
Regards,
Sudeep

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
