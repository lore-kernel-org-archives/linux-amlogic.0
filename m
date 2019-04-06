Return-Path: <SRS0=b9va=SI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E88C10F06
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Apr 2019 06:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B104218AC
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Apr 2019 06:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IouNTv8U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="zK3sf5ey"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B104218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+8rEHuglL+rbuct9GrezhKG/Y13Q1d2Oji83DVpHv00=; b=IouNTv8U5BdVVz
	JtL0sRmldzriTFm3LX2+EOVe4gk7OXCztiqEHuzEnk/AeDLj/21r40Il7zSPmcBffYliFaCI3XLPG
	NVRjtIkkX+dtRFztHCk+ehq12kMyAOms62f8zYhcJaRsv0jnPJ9JEhkXsAOIlQtfquZqNIgpHJwNl
	wcbdXmH4CHn9hs+6cQVCyyx/mG1tT1R2k+z7IG3iEc0UJQVn1z5kbkVGL3HSZh/QD2qmwF5PBg5mi
	caQit4X96GJiTaUdG1MMGhXpuE8ncB3BSj1Y4J2usxQH/A1poI11HMWAjy9/ro9zOWuZwYtnW1vpE
	0VDyam98q4usC8mZMg0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCekd-0007jn-3l; Sat, 06 Apr 2019 06:24:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCekZ-0007ii-4n
 for linux-amlogic@lists.infradead.org; Sat, 06 Apr 2019 06:24:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id y197so9258555wmd.0
 for <linux-amlogic@lists.infradead.org>; Fri, 05 Apr 2019 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=Z2ZMBmLf5H7LCVZIEoHGY0nbwwyjgL/lWhAJjSfUtaM=;
 b=zK3sf5eyo3xRdsPPJ/62NdCo0f4jC9MIU08rhhdZpegZD/CX2Wzml01F097nqVW2D+
 zrNcvZdeLu2Tibf0wPge3bhfPo+orOIn1njT5M8XvAyc1jH1pWNPxoZUhxMAhuWHS4CZ
 Y4AHwKehQQwYNSZ2ru3PPBz+KVAm6aaY05aUl1oi8WsyORyf+FYoc/3vYD7pi7jTrg1g
 46r6YTyDFRSB31ZvS0UsaqoBsfDuQcmPIeioaYhBRt9njfcZQF/3CVX74hkA47GJHudV
 YwCqYfaNwJsqdRExlC0AwTrei6T3W8f3IRGC/ZBGIcOiXrfmK0LyP1dLCMKyYYM7jum1
 N9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=Z2ZMBmLf5H7LCVZIEoHGY0nbwwyjgL/lWhAJjSfUtaM=;
 b=OROH9fPYbY8y8Db3dUOJ/dEmNdNdwdaTN2QtqE89NdDlLA8IKriyO87wupadBuqcW8
 w7Amsf9gB/7HOjj5iEP+n02qbm40gUstF4bmO9FSMFnF+FyW5CZiK0XxDNKWSgeyE4jE
 Pxh8cpraDg4omXMCHcvf6r4mZBnbEXE3i88jtKFW2hgLa2tF+D7ERxuZmxSvuW5seKDU
 Okli9AwaMW580UaY1AhscqcE8itRj2z2V9yqdB6TwbJ6hq5LbooV5oltYkQButHoeRT1
 OcFCZnZMPTAJ6ZJzAuyLeJwnUhyHLUyBiqSKG+kDVlYlQKDJdMJqHK5tTNbn0gKx4o/G
 yQeA==
X-Gm-Message-State: APjAAAXrREFM1GfCVFAzYS2Y+IffSOsNYuWsJJzBDUCo6F5Bxcix/0x8
 QKedyHLPZwa/H5n8KrbnjKODpA==
X-Google-Smtp-Source: APXvYqx84WcrdCZw7xcJcBhhnwS+nDR++bNRGswqBKQnYvX38PPMzk3gKvt0OMDCmhAIDhWY/Eh6rQ==
X-Received: by 2002:a1c:9ad6:: with SMTP id c205mr10692405wme.46.1554531861469; 
 Fri, 05 Apr 2019 23:24:21 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id z140sm7394764wmc.27.2019.04.05.23.24.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Apr 2019 23:24:20 -0700 (PDT)
Message-ID: <5ca84614.1c69fb81.e2ab3.2e61@mx.google.com>
Date: Fri, 05 Apr 2019 23:24:20 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Kernel: v5.0.7
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: stable
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Branch: linux-5.0.y
Subject: stable/linux-5.0.y boot bisection: v5.0.7 on meson-gxl-s805x-p241
To: tomeu.vizoso@collabora.com, Sasha Levin <sashal@kernel.org>,
 guillaume.tucker@collabora.com, mgalka@collabora.com,
 Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org,
 matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com,
 Jerome Brunet <jbrunet@baylibre.com>
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_232423_244586_F2B0C5D3 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

stable/linux-5.0.y boot bisection: v5.0.7 on meson-gxl-s805x-p241

Summary:
  Start:      8b298d3a0bd5 Linux 5.0.7
  Details:    https://kernelci.org/boot/id/5ca7df3959b5141abafe6036
  Plain log:  https://storage.kernelci.org//stable/linux-5.0.y/v5.0.7/arm64/defconfig/gcc-7/lab-baylibre/boot-meson-gxl-s805x-p241.txt
  HTML log:   https://storage.kernelci.org//stable/linux-5.0.y/v5.0.7/arm64/defconfig/gcc-7/lab-baylibre/boot-meson-gxl-s805x-p241.html
  Result:     9b0f430450cf clk: meson: clean-up clock registration

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       stable
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Branch:     linux-5.0.y
  Target:     meson-gxl-s805x-p241
  CPU arch:   arm64
  Lab:        lab-baylibre
  Compiler:   gcc-7
  Config:     defconfig
  Test suite: boot

Breaking commit found:

-------------------------------------------------------------------------------
commit 9b0f430450cf230e736bc40f95bf34fbdb99cead
Author: Jerome Brunet <jbrunet@baylibre.com>
Date:   Fri Dec 21 17:02:36 2018 +0100

    clk: meson: clean-up clock registration
    
    [ Upstream commit 8d9981efbcab066d17af4d3c85c169200f6f78df ]
    
    Order, ids and size  between the table of regmap clocks and the onecell
    data table could be different.
    
    Set regmap pointer in all the regmap clocks before starting the
    registration using the onecell data, to make sure we don't
    get into an incoherent situation.
    
    Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
    Acked-by: Neil Armstrong <narmstrong@baylibre.com>
    Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
    Link: https://lkml.kernel.org/r/20181221160239.26265-3-jbrunet@baylibre.com
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index f965845917e3..258c8d259ea1 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -65,15 +65,20 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Populate regmap and register all clks
-	 */
-	for (clkid = 0; clkid < data->num_clks; clkid++) {
+	/* Populate regmap */
+	for (clkid = 0; clkid < data->num_clks; clkid++)
 		data->clks[clkid]->map = regmap;
 
+	/* Register all clks */
+	for (clkid = 0; clkid < data->hw_data->num; clkid++) {
+		if (!data->hw_data->hws[clkid])
+			continue;
+
 		ret = devm_clk_hw_register(dev, data->hw_data->hws[clkid]);
-		if (ret)
+		if (ret) {
+			dev_err(dev, "Clock registration failed\n");
 			return ret;
+		}
 	}
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-------------------------------------------------------------------------------


Git bisection log:

-------------------------------------------------------------------------------
git bisect start
# good: [820c1fa515010d280551075da59fc2668ba8b3ae] Linux 5.0.6
git bisect good 820c1fa515010d280551075da59fc2668ba8b3ae
# bad: [8b298d3a0bd5feeb47129c4889356b38b78ab231] Linux 5.0.7
git bisect bad 8b298d3a0bd5feeb47129c4889356b38b78ab231
# good: [55d7152d37dccfa9add45df82fd45c373e032f46] cgroup, rstat: Don't flush subtree root unless necessary
git bisect good 55d7152d37dccfa9add45df82fd45c373e032f46
# good: [8b3b22aa7c558e713a179710a6f1e2fdbef44b20] block, bfq: fix queue removal from weights tree
git bisect good 8b3b22aa7c558e713a179710a6f1e2fdbef44b20
# good: [ebd0f3066c35bd27d3a4b224135e638eeaf70b8d] netfilter: physdev: relax br_netfilter dependency
git bisect good ebd0f3066c35bd27d3a4b224135e638eeaf70b8d
# bad: [9b0f430450cf230e736bc40f95bf34fbdb99cead] clk: meson: clean-up clock registration
git bisect bad 9b0f430450cf230e736bc40f95bf34fbdb99cead
# good: [bfb59eabe2c940c6869f128200f2047d46215845] drm: Auto-set allow_fb_modifiers when given modifiers at plane init
git bisect good bfb59eabe2c940c6869f128200f2047d46215845
# good: [ab79dc3ef0244c9b3d712d0cef17b74c363d6069] brcmfmac: Use firmware_request_nowarn for the clm_blob
git bisect good ab79dc3ef0244c9b3d712d0cef17b74c363d6069
# good: [c8a8dd1d85ca715ec65169feac54a7a06b8d2a29] x86/build: Mark per-CPU symbols as absolute explicitly for LLD
git bisect good c8a8dd1d85ca715ec65169feac54a7a06b8d2a29
# good: [a644d2d28baf8472368903b28823cf85c9a13a1d] drm/fb-helper: fix leaks in error path of drm_fb_helper_fbdev_setup
git bisect good a644d2d28baf8472368903b28823cf85c9a13a1d
# first bad commit: [9b0f430450cf230e736bc40f95bf34fbdb99cead] clk: meson: clean-up clock registration
-------------------------------------------------------------------------------

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
