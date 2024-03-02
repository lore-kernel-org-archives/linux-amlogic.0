Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFDCC5478C
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Mar 2024 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WmvOQCycD/v7Ig4OlAky/y9c6Ji5J2rxSDGWezp+to=; b=ecktF5ArVqOW5/
	vnc3GvTCHlthN4Hbejo3SPWgMw5DAyqfzv7p1pjizaWGGqV3MMjelvVUlXQ0pFtLCiF/iVg8tO80J
	7pQ0tusrw3+VH6BLghNXfxHpjxyTVVYVg0SHVxhVkyo8q68iWdimTmVFTOrw67JhXwnfozSJjvLHL
	yw7iEoPeYWUkP+6Fdx8+k3KL9Ytg2qNb24wQHS25XjxPSBgKiSYGwLKqg/AVLRP6K2SKVHxevmqhN
	cfK6AcARB4bnSNYEEXWwIhoAAeX6qvqIw4MJAGCA7Q1rXafKAXH9I7ExMdIz7Cn98rh/krgV4+5wt
	huRawJax4kg8zkVgaOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgTmM-0000000483s-3d1H;
	Sat, 02 Mar 2024 18:08:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgTmI-0000000483I-2ORW
	for linux-amlogic@lists.infradead.org;
	Sat, 02 Mar 2024 18:08:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-412d6906338so3048675e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 02 Mar 2024 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709402885; x=1710007685; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLF4zBiiy5eYRgAOdWp9waqGpl1ho9XW/EYUvyzsnOk=;
        b=ErOKeyV3nPE5FEg7LmtQCDFthEMq/E/GlnS4+6GzIheG+s0q8R41ysnqcf/XopBWnr
         xd1q4x1jdsU5LvqHWRDVOJtDByyJw4fgv/9AGIAd71BJJwqYS8UqnymUIFcyg+JP6Gbu
         XAPuYv/t8kzuI+x4goOgHyGR8ZrlxNikcmi/ek+Tu8iRgj4Uxbn75StCBwQ3l+qTrhMJ
         pD/RHGBgBocTAVW/Un7OgehM0o+XE7a/4ehFwiDesfjJ98DaKsvqq5jqS8dufnZ3yMUD
         jhSAfcf8bWHnJ8uu/T+KJeE5j12lnzRw9IPExZJYvsTcqOIr2hCNwsWjNwR+1Jqfj/m+
         4VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709402885; x=1710007685;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLF4zBiiy5eYRgAOdWp9waqGpl1ho9XW/EYUvyzsnOk=;
        b=OKM1sqOHZv2odZUYIOew0y9kenYZ8oFg9UO68GSok0Qc6tmT5UneSIxf2EQVACz5BJ
         bDf/h2yBDwZitDD83dPmtq3usAhHOBWKLsUk0/aecWuAUsFPoiiLzv+AkcQfBr573Cym
         6DZoyJPg6dSC8DUOVRpNw+6d4JQT3zr4PWrTcPOW5Vz1xqKWEuMQZcTJ8kx1MfrvDPBt
         TosI6DHy3wNJmS1T6p400ja3PtEPmsS/dwV8oVc15ST4NHcUlaGDzupv/jk+o319WsxU
         sl3PPazNrKBcxSCPHmEMeUfKyuHbowUGYeaytDjyQuJXZy8OCz7hSo1VcTRPGGKtbRMI
         sB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUXmEVUW/HnwkJo3XsgWgNaBTQeAqczaHp4AjSZycojS9cF71hWxN9IvxSHVcEgm4fMTeAcUYk1vsi+o/LSGWsqpD9kGcoGXtef1XYIVBDnFg=
X-Gm-Message-State: AOJu0YxtUx9AKHfy7FMJTPFqKhlHquHV4lLM0OikADZ5H+vLJ1xzdGYl
	RBgXUujup2StZeSG1bJo6CINlI052WBuY8Xl8XdL5WaDcXaY2Nhg8fXiNM96ciN7S+oXFxl0cE6
	U
X-Google-Smtp-Source: AGHT+IEbL3jTWkPW+uo1Ej4/lozCj4JVhQZyiD+Ne6++oEHswf94tzRS6s3mj9W8ZGpuyzV3P3Y73A==
X-Received: by 2002:a05:600c:500d:b0:412:cc3b:dcc7 with SMTP id n13-20020a05600c500d00b00412cc3bdcc7mr3266201wmr.8.1709402884509;
        Sat, 02 Mar 2024 10:08:04 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:605b:c894:d600:8038])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c4f8600b0041273fc463csm12496889wmq.17.2024.03.02.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 10:08:04 -0800 (PST)
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kevin hilman
 <khilman@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.9
Date: Sat, 02 Mar 2024 19:04:03 +0100
Message-ID: <1jle70se0s.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_100806_846831_361AEFD0 
X-CRM114-Status: UNSURE (   7.08  )
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


Hi Stephen,

Here is the amlogic clock update for v6.9.
There is just a single fix for an Oops happening on the axg when listing
the clocks through debugfs.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.9-1

for you to fetch changes up to ba535bce57e71463a86f8b33a0ea88c26e3a6418:

  clk: meson: Add missing clocks to axg_clk_regmaps (2024-02-05 10:06:21 +0100)

----------------------------------------------------------------
Amlogic clock updates for v6.9

* Fix clock listing Oops on axg

----------------------------------------------------------------
Igor Prusov (1):
      clk: meson: Add missing clocks to axg_clk_regmaps

 drivers/clk/meson/axg.c | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
