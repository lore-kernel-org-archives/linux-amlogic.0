Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B0EC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veYNQ3omJtrZe5TrLTOLsN6B2KqDyQVu6hyPgeTrFxc=; b=0Yak55VuaFeSP3
	Yvu9o1tdAL1ZS2L/CYMlSCt8QZqO5+hUA2oqqct2OKEuc4A+AhzgiVSoSi1/Hdu+AwIJSheX3pRHY
	AJCw7xxh8AzSVhCAgLxiJ0FVbrM2SZAjgLCu5qBFWkSvDr4KbnN4U+3Og7YwfxVcoyVb1fowu3PN/
	JkNPdPL9ZjXtCHIlhEWrFC3DwPB9+W4x75SBlmMC0GM7p7itj2h/y3/9qygOQcX2t8+DLlNWEEfAW
	J4vw7xDBw5ht5hZhZwl8kHNMKul1lByOs1sCDVvKAz06VT+XuzjYOo0SpCvqEN29GmOkzQQodStjg
	AUJ3a+zBKJgoy3W5XL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRJz-008Jd6-WD; Tue, 22 Nov 2022 11:20:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRJw-008JbB-OO; Tue, 22 Nov 2022 11:20:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2640BB81A27;
	Tue, 22 Nov 2022 11:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AAEC433D6;
	Tue, 22 Nov 2022 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669116005;
	bh=i4J5FHDHK6FCBPcJTTxl/xqJydn58nU4CXF1PjVmZ24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LYxVKte3hIvg7TkmtGRk56llE9V3S2o4MVgEhFlGstyN+bAeP5XMNn07DhhnkmgK4
	 PVRQ6K10gXzWsIN+jg7JuENVCCiZ/1AHLnistLhHrQ+Aqw4aa4i1xf1jAyecYY0f/v
	 w4uZdfGTCsARRwlXCPNu1PxQT/QTxGHp4jEdo5dDEJI2IWCVXCv5VVHHRRDEu4kRIr
	 PEi1/6P1yxOIWenkPXHFYnliXBni6oAhd6uJFPJ7HU3gSc1TBJJBDTbff0J6i+a7zb
	 BQhqd5Xu2R/6hErwsy0KCoKMWUOQh+3AHCYQNwh42DQZxGNjazEv+yNAq8SJ/An+Zi
	 M9RcaxAZD/qrQ==
From: Will Deacon <will@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-amlogic@lists.infradead.org,
	Chris Healy <healych@amazon.com>,
	linux-kernel@vger.kernel.org,
	Chris Healy <cphealy@gmail.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] perf/amlogic: Fix build error for x86_64 allmodconfig
Date: Tue, 22 Nov 2022 11:19:57 +0000
Message-Id: <166911295884.1006209.12453209108880298807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221122084028.572494-1-jiucheng.xu@amlogic.com>
References: <20221122084028.572494-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_032008_953171_A2BA5FB3 
X-CRM114-Status: UNSURE (   7.87  )
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

On Tue, 22 Nov 2022 16:40:28 +0800, Jiucheng Xu wrote:
> The driver misses including <linux/io.h>. It causes
> compiling error "implicit declaration of function
> 'readl' and 'writel'" when make X86_64 allmodconfig.
> 
> Amlogic meson G12 SoC DDR PMU driver")'
> 
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/amlogic: Fix build error for x86_64 allmodconfig
      https://git.kernel.org/will/c/9d1d5cb32314

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
