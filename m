Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC18C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Dec 2021 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+v3S+s9iSMMigm3UMORe2wND1jC6NHnMtAhAi/FrxyE=; b=o1LWXlLDUvYZFF
	nWQhBY/TgOs25kJ4YyB8FYLEPkeL2FOANxnTvqfnmGxetSKEjZywD0PY+CmVOzqpXE9pCmSLuWY75
	fQL+WRBOLeeoM2+3Rj9bFq5nN9BcptNYoVKn73/cpXaJ2fYsTDDdYWCFNQZQ5jyD3Vv7j5yDIHjjR
	5Tw6di/U/6IEmyJ+GT8XLUsgYhjzZt1AgCHbn/QeZxmjECdW+r+I0cRFzbnUrnkBcZMFZtg33Cc/E
	EnxGubIxjME+d3eLI5dK6a5Y7zRLCrGaShMCVY2W4rvUQ8noF8Ny5lDoCYdTfNHF3Db2Fn2ck8fXy
	ILBPeyyX80k7aotkUcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msN2e-0088B5-9e; Wed, 01 Dec 2021 10:40:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msN2a-00889L-45
 for linux-amlogic@lists.infradead.org; Wed, 01 Dec 2021 10:40:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso771331wmr.5
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Dec 2021 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=GryEuUZgiwqNPWZVOVqstgCbzW0+pZjjdZ33gd6/PgA=;
 b=xtZT2LnZd4/ll2NLack8wsnhqQ8T3uJEjWri0PFJsKIhZu3+3X0AzaZfq+A4oWoUAW
 wsovzfgDz93CvUdhqKc7CF64oxJaQ7dLKuDqJcAkMNi0DEoQbCOYZNPY3qDNpOepI4pt
 jfjdOmqggXH5znYs/p6HOSpZarkTk16X5MjVvUPKYJb4HGN8isfQc4of3F9rFhOOKgsz
 AZum2cDGhPMBPRJspyXtCrGkJUkAWTMiarjh+roCgugYyx9g6JsXGv/EBeXREABcCOfU
 Bs+N7i5aXA7TAWKH9mFlLcEPnUG9qeVnz7pm/nxATMzP8hvuv+W5Fqta36Hiww1iKcOj
 InPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=GryEuUZgiwqNPWZVOVqstgCbzW0+pZjjdZ33gd6/PgA=;
 b=VZ1m+3NA+n4+DZ/CYGHYbPQGfgf9pge11wu4xzWmrr1nOSR+RarxjEet1Q+cwTWfVS
 DCFtvJLfCrmg1oz86DmGDJYCW8GPXqFq0poJ9BmwSHCV2wJrENEvw7JVgalEgwI7M8l6
 hiZErO4sZ5/Tr8RAJxhs2LjLHdHnot7/ukz/3GUiGA08/s5ZnRdqjStaB3e1XCoxBDo3
 9q3VVVL81bkk4/bUQ8x+lPRE2gb+01nTjfdpel8Y1eI3NSZO8KfHrqzlmTvA3vGg9HJh
 BaCvrAPYTokoJxCMDqnn//0zBR8qINxtIiq0fp4t7DauxapQ9X3Q3FYoui81C6D+whOd
 joEQ==
X-Gm-Message-State: AOAM5308f7t/HD7uen8erQ2apvHQFaF+ATcGcfc82J68ek1m1Ob8uN+F
 NKu4Dy9ez38/nkxULz84eemAhA==
X-Google-Smtp-Source: ABdhPJzxnrcP4L5CRE1ziVrMBv92OiiMDBEhdjbM9BkQG4tkIwD7pHLv0iZj30rf6kAfHu7gnO+zLg==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr5969187wmr.45.1638355241590; 
 Wed, 01 Dec 2021 02:40:41 -0800 (PST)
Received: from [10.1.3.24] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 10sm24641423wrb.75.2021.12.01.02.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 02:40:40 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.16-rc
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <ab9f066f-480b-84b2-248e-953f2f2b5f59@baylibre.com>
Date: Wed, 1 Dec 2021 11:40:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_024044_258969_AEC53533 
X-CRM114-Status: UNSURE (   7.06  )
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

Hi,

Here's a couple of fixes for v5.16-rc1, one for the amlogic Kconfig and another for the JetHub D1 DT.

Neil

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v5.16/fixes

for you to fetch changes up to 5ad77b1272fce36604779efe6e2036c500e6fe7a:

  arm64: meson: remove COMMON_CLK (2021-12-01 10:29:12 +0100)

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: meson: remove COMMON_CLK

Vyacheslav Bocharov (1):
      arm64: meson: fix dts for JetHub D1

 arch/arm64/Kconfig.platforms                       |  1 -
 .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  | 30 +++++++++++-----------

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
