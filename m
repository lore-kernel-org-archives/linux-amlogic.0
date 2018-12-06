Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AEEC64EB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B6120700
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFKfr641";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K5LNRQ48"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59B6120700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zw6Z3sQ3OV90Dgwd1/frOk4zE30MUZM2+eg+12gn3CA=; b=DFKfr6412Rodmb
	rGo7NevuanzmSJodR9P01Le3TOs3OWtUS0t/zBnFv3+lAOsuHd3j/eHjWkVQDj7cUn1i4ZPXGTVTz
	k+NaRVRT/0jxqj8EnK9SEtLzg0qdgwCp5hZwyDgbB2EWBsJmM3/vu3y3r+EU+TRPutqiGtQT9I0zb
	JcTE87NfVrdAvJGe9eo2dhsrW5Yf8lVXLp17CwaIiH/RddqxUvfT940lATPwPvY4IlKoXXXWffTdQ
	gVOssIoi3IWwV3qr7r2946xLzuYRuNZU6c0TbVMq2c/n6KS5OZtTu4zzvDsiQugnQvDlHr9jVuTtW
	XEtXLTKFFgOMRGQfLkZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvQQ-0008C8-PU; Thu, 06 Dec 2018 15:18:50 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvQO-00089h-3j
 for linux-amlogic@lists.infradead.org; Thu, 06 Dec 2018 15:18:49 +0000
Received: by mail-wr1-x443.google.com with SMTP id r10so831370wrs.10
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0kxcYZ5L42j1jO324rbmlL1PwuJ7eyUnUniDRBwVrQ8=;
 b=K5LNRQ48nxsm8TNpfFObhraZlNiaal9mG/dOUMgnwy1V1b0i1AsZU8BHZJi5yCzKwF
 VfGjxv9Ou7KEDaVHic1wqxVHwuPdBaK/qNXDAboM/J25qxuHLJNWWPYHG0YFMYJKh5fz
 AZqBG7SnFBAsk3chjySj1OrrXq+2pJmIsvjwsbAeb4zlqST4yqSRdJd8Js0BRW9KfehK
 RC8odlWu39Z4IlJzGevJecbUqS69eYMxg5hgJZoXRisc7sI0nuWzos6+4WTJ88aFM+lY
 VT0qyLWVlbLp71O8cKGAhSphmk7MOgHPnx9Ih58oG7ItleJ5L8Xj8iU4lMk8+R+0+BI0
 SDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0kxcYZ5L42j1jO324rbmlL1PwuJ7eyUnUniDRBwVrQ8=;
 b=l9z9yp0+xMpWl+2U4xnKHSYRTt7lAzX7hkAakHd12SONcxuwR8vGROURtvsrs4p+i+
 LDwqeDJ/HdwD4mtMXkdeFlHgs6jtjydm1UeSWWxZMuNlH20YTJ8KbmPrkd8QDqVP/rDa
 hJlWBZc2juTaESNLnkMvvkoAIghWlsAzy9+294grbSQ2ZEw5TRhMBwWfIWWC/tVT1IVn
 EBdQ7ITYuldI/t7asPrJ84rinrg+m5TsVyHX3meHYIaSCPMNKBVgQ9kIpHtVCZQTVuSU
 eP6hG91Orj1AXE5zfACw6Q0tMB91UWD8XaWXDIL6WEVBnW2ufoDxQNg7G1bmu+dQ+PsR
 7b+Q==
X-Gm-Message-State: AA+aEWZRIgeQ6zt1S6OTKiibTHMi0A59gMmjVituS6Il1sgDOTF6vMwp
 x31SJE9jkdHXLcE7x0q2fQ28rENIRz65kQ==
X-Google-Smtp-Source: AFSGD/WXgD9EMDbWVRhpui4eQTBX20TrL6Kx7h59E0LnRduCTChVh5v8N3zP1LQdeWBAiYbJ7qdLTA==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr24836376wra.282.1544109515959; 
 Thu, 06 Dec 2018 07:18:35 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j33sm939652wre.91.2018.12.06.07.18.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:18:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/4] mmc: meson-gx: chained descriptor fixup and improvements
Date: Thu,  6 Dec 2018 16:18:24 +0100
Message-Id: <20181206151828.24417-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_071848_233680_B0DFE75B 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The goal of the patchset was mainly to address the following warning:

WARNING: CPU: 0 PID: 0 at /usr/src/kernel/drivers/mmc/host/meson-gx-mmc.c:1025 meson_mmc_irq+0xc0/0x1e0
Modules linked in: crc32_ce crct10dif_ce ipv6 overlay
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.1 #1
Hardware name: Some A113 Board (DT)
pstate: 40000085 (nZcv daIf -PAN -UAO)
pc : meson_mmc_irq+0xc0/0x1e0
lr : __handle_irq_event_percpu+0x70/0x180
sp : ffff000008003980
x29: ffff000008003980 x28: 0000000000000000
[...]
x1 : ffff80001a71bd40 x0 : 0000000000000000
Call trace:
 meson_mmc_irq+0xc0/0x1e0
 __handle_irq_event_percpu+0x70/0x180
 handle_irq_event_percpu+0x34/0x88
 handle_irq_event+0x48/0x78
 handle_fasteoi_irq+0xa0/0x180
 generic_handle_irq+0x24/0x38
 __handle_domain_irq+0x5c/0xb8
 gic_handle_irq+0x58/0xa8

This happens when using the chained descriptor mode. If there is an
error, we call mmc_request_done(), loosing any reference to the cmd. It
turns out that the chained descriptor does really stops when we do so, at
least not completly. Most of the time, it can be seen with this harmless
warning because the descriptor will raise another unexpected IRQ. On rare
occasion, it will completly break the MMC.

This is mostly adressed by patch #1.
With this fixed, I took (yet) another look at the ultra-high speed modes
and the tuning.

I came up with new settings in patch 3 and 4. I've tested them on eMMC,
sdcard and sdio on the following platforms:
 * gxbb p200
 * gxl p230, libretech (eMMC only), kvim.
 * axg s400

So far, these new settings seems to be working great but I think it
would be nice if others could test this and provide their feedback.
This why  patch 3 and 4 are RFT tagged.

Jerome Brunet (4):
  mmc: meson-gx: make sure the descriptor is stopped on errors
  mmc: meson-gx: remove useless lock
  mmc: meson-gx: align default phase on soc vendor tree
  mmc: meson-gx: add signal resampling

 drivers/mmc/host/meson-gx-mmc.c | 100 ++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 25 deletions(-)

-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
