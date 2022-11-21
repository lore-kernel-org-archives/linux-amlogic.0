Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D907C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+annsLwHtmLAsHgyT93qm+y5nmVOVmSnd+WJRahHbw=; b=mMoCWWiQhf3ws5
	YARrQCUQZ0hscgED3fGpFbiSr2rrGTcbUYGO1B0uRVESpMrZBGz1LgkZImPRycyCHp7Cp7MH/3Di+
	/QxB/EnHju4rTYP5PhE5otD24S5xaPFR0K5g+ugjdXHU1hj8J3hL/Zhi9tGYes3DRNf58/zSrdZT3
	0ql+R4U2O0ZyxMXVJNyb8oU2vgVQoFVGlcFxtnmpM6fmkmkV7segPz6/ZZD2qN3/VKKULcWnG/Qbw
	CuBnupNOqPy0mn2YZJqMIW9NeAkVa8KcbT+Qy7cXFzheHd+uExwjia76BkujqoJ3Gk/TRrJOO92qZ
	z/Toqcpw66s/07uZVdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxCaD-00HHli-C1; Mon, 21 Nov 2022 19:35:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxCaA-00HHkl-34; Mon, 21 Nov 2022 19:35:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 88461B81233;
	Mon, 21 Nov 2022 19:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55530C433D6;
	Mon, 21 Nov 2022 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669059351;
	bh=Ydai0dK5/lA9XsnNpEEKTSKHyWesOJQz+aHZGyTNcyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YkSlNMOfijh48oFzDf9jLR0k2E1O47vr+ZI0KV9FNZmEHbLxIE9oPkRvFqZAHEpUJ
	 8SsBwuVn9j2PKIknKUs7G3kPiFDsIZTv9RHFVak3efCjvtfhyhCx/8LXNVh6VRPvhn
	 /GYsGMwyLvExZnjXvasuVpdjLDeuNeIvxicZIrko287zZV6s8AkGu83wmRZMataxpY
	 1IvXfEmJiwmGgp8tQz7S4GrnH8dWlfbj+6SutLBrPvtm4ehTOT/9VJ86ZZryuk9MUI
	 3VjiXopqK+nV3D12H2MVQDebRJ048wGn2EjQLGTaAuZk7CDuG+LlHUwy8KjxWJHD86
	 WyFQrTf8kwWRA==
From: Will Deacon <will@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Chris Healy <cphealy@gmail.com>,
	Chris Healy <healych@amazon.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: Re: [PATCH v12 1/3] perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver
Date: Mon, 21 Nov 2022 19:35:13 +0000
Message-Id: <166905532981.1405312.273554952969305840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221121021602.3306998-1-jiucheng.xu@amlogic.com>
References: <20221121021602.3306998-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_113554_295334_F20DB583 
X-CRM114-Status: UNSURE (   9.03  )
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

On Mon, 21 Nov 2022 10:15:58 +0800, Jiucheng Xu wrote:
> Add support for Amlogic Meson G12 Series SOC - DDR bandwidth PMU driver
> framework and interfaces. The PMU can not only monitor the total DDR
> bandwidth, but also individual IP module bandwidth.
> 
> 

Applied to will (for-next/perf), thanks!

[1/3] perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver
      https://git.kernel.org/will/c/2016e2113d35
[2/3] docs/perf: Add documentation for the Amlogic G12 DDR PMU
      https://git.kernel.org/will/c/537216e59f0c
[3/3] dt-binding: perf: Add Amlogic DDR PMU
      https://git.kernel.org/will/c/fd9678d3beaa

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
