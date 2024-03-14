Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCE3C54E68
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAyInsFWgSjfjsSxEvN2hTlIgUskvo4jvVtzcThrYCQ=; b=Bh2QwIGdENKTT9
	DvtHiQ9Sowd+eqc2mFjbrRdck1e0xf5x4Xyk4q//BGoPEfOcBOvfrI7u7yVohlaS6ozL7Ir+y8lMJ
	xdsNfYHuQkLkJVkitOTdNnRHbTSckhh2HLbl2BT87z+KOonooYKAPjkoc9IHwJo9hPmsnYqGI1Vef
	7t323FFdUgW6/7hzdTShRoFySF5X16MLn6COTjgDR4Bw9CfpDIsybxF6QyatF3/addQjRS9kl7Vb7
	BZn2csj395klCwCAYToSvUMhy/ZOltJHCV7UVAGuJZ+ulMttsvO9sADAR5ibFNvTXYhPGNQAaXvUS
	jRmPjpdk/rRxMl4qtU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkiWC-0000000Dwqm-2fou;
	Thu, 14 Mar 2024 10:41:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkiW9-0000000Dwo6-2zpl;
	Thu, 14 Mar 2024 10:40:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0E9EDA7;
	Thu, 14 Mar 2024 03:41:30 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CC3D3F73F;
	Thu, 14 Mar 2024 03:40:53 -0700 (PDT)
Date: Thu, 14 Mar 2024 10:40:50 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3 0/4] soc: amlogic: add new meson-gx-socinfo-sm driver
Message-ID: <ZfLUMoN_ZU-xLfpA@bogus>
References: <20240314070433.4151931-1-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314070433.4151931-1-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_034058_177505_4857E9CB 
X-CRM114-Status: UNSURE (   9.21  )
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

On Thu, Mar 14, 2024 at 09:59:50AM +0300, Viacheslav Bocharov wrote:
> The Amlogic Meson SoC Secure Monitor implements a call to retrieve an
> unique SoC ID starting from the GX Family and all new families.
> But GX-family chips (e.g. GXB, GXL and newer) supports also 128-bit
> chip ID. 128-bit chip ID consists 32-bit SoC version and 96-bit OTP data.
>

How old or new are these SoCs ? The reason I ask is that it is really
sad to see vendors still creating their custom interfaces for such things
despite the standard SMCCC interface SOC_ID introduced in SMCCC v1.2 some
time in 2020.

Hopefully they migrated to the std interface and just use the driver in
the kernel without needing to add this every time they fancy playing
with the interface for no reason.

-- 
Regards,
Sudeep

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
