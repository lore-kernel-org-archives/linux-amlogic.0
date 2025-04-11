Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73A6C36010
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INRGbr+tcUbhPRlwIxFEiSVbmQHwy6K6f7E/nhSBY0c=; b=Wj39dNSplXQCh6
	tWEDiFCI2szAninrnCGZz/lXijmGBiRdsesK8cEbQfAmFKtx1G5iv8Omxcjyi3TFdBBTRHtXvaVch
	9KnjWFBLG0+uaVi/eJqEg7ij9NlyysLhqzMFdnRJEW8TwKXT/Mh2JIvq+UY5S5uP1l7nBCTSvbvzD
	AprsEuVjaaQFyTW7kXiVoN/b81B3m0O/HLuS11ldR7Fl6InSWviVGsjRB8mcVY8wlZ4e7Gy1Mtbpz
	mtx43NL6iPIbs2TC6/pSml8zeSmRysJH8AFZGJxubSkmp37wGvUBitDtEXffbkpNu8JN8w2rY/BWV
	ZKDcFShvkXEJG4iSuirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DMH-0000000DiOS-3X36;
	Fri, 11 Apr 2025 12:19:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DDs-0000000Dge4-3AI8;
	Fri, 11 Apr 2025 12:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D5085C684F;
	Fri, 11 Apr 2025 12:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478BBC4CEE2;
	Fri, 11 Apr 2025 12:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373463;
	bh=EVla19k7Xz+stoAyJo+yqYuYF6XV6eRPPI+AlLJ62TU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=qT6QbywFqYsrdZFdqe20nIlTmNihKMZ+lrEgG5/C7gEaUewM5LBELkTBrqpdZjuRI
	 O/DjsxQpgNfd2xZrhmjeGVszCnpmAFkEgA40zr4Nhm9ZsGgIzup3Qir7rbxSSTpL3Q
	 xpGU7cToXWwkXxApwWT3pxdwEwwnzu1ZY3U3ftgWvnKiK1IGW78X6c6kVAVQ1l/REu
	 RFNrCBsL0tHgiXPkCRBdmbGrpCLc3j82Yr9wXGp1HtaBQAdF4j1DKsmrmdfA5XssOS
	 gjXithieX0VGwQFLQkNqVLZwNguljxQcmOgMTbf62mw/LL7k4lusUfSR9xMhoacxKC
	 euYyM3VAwNCyg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
Subject: Re: [PATCH v1 0/6] Messon: Simplify error handling with
 dev_err_probe()
Message-Id: <174437346092.673939.9321583863717790007.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:41:00 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_051104_850258_26A63D0E 
X-CRM114-Status: UNSURE (   4.85  )
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


On Thu, 10 Apr 2025 19:03:15 +0530, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Note: The following patch for RTC:
> 
> phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie probe
> 
> [...]

Applied, thanks!

[1/6] phy: amlogic: phy-meson-gxl-usb2: Simplify error handling with dev_err_probe()
      commit: 05457917e50c3d6bf75d2e3b99c7e6709a4a6844
[2/6] phy: amlogic: phy-meson-g12a-usb2: Simplify error handling with dev_err_probe()
      commit: 9bff4ef29a6409850c27df705da54277a8e836f2
[3/6] phy: amlogic: phy-meson-axg-mipi-pcie-analog: Simplify error handling with dev_err_probe()
      commit: de39730f9258e9984892c0af68a3e884ad19acea
[4/6] phy: amlogic: phy-meson-axg-mipi-dphy: Simplify error handling with dev_err_probe()
      commit: a77e2e899841937798bff0924c03d4d0e4963aa3
[5/6] phy: amlogic: phy-meson-axg-pcie: Simplify error handling with dev_err_probe()
      commit: fef364bd4c9cf712c91e0013f5f304f4e7f09198
[6/6] phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie probe
      commit: bdeff6d8a211c832f5ce1a65aff17f4a5e6de00f

Best regards,
-- 
~Vinod



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
