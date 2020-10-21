Return-Path: <SRS0=FfFd=D4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9C2C5DF9D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:39:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E30CB2242E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XDad990G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cusYKGkT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E30CB2242E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vxmvMEWeAVnWExCdW774HwxC8Li2Cd/yVsKK5IEkUKI=; b=XDad990GCTyrQ6EHk/ueOC7fgD
	XEVIjNJdQFBxwkiaoOFBi7zgnb6S6tS767eML3ZDAqy6Hyf9k4N62f6AxRU2JZliZmTgx2EBOdQ05
	Fsk6C5usOWCLLcFl+Tb4mL7Br/gAHoDHSCy4baQHKfA02DpP0ikayI2QH7guMBt1mB5dXsv4xo49x
	VdP/2WNnCd0p8i5FgV1w7k9FY3I2TCqvmAa3C5quNihJ6VlflbOAo0Om4fcy7tdzRxHE6yAlZbrEf
	uyjtNXaKjPFlVDVf2iP6exNcybu41JsZunrc98mvdpaI1RytlZ94JHH0wanr6tnnktjsIJbNng1bU
	TIslEWUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVH8a-0005tC-DO; Wed, 21 Oct 2020 16:38:56 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVH8X-0005rj-GE
 for linux-amlogic@lists.infradead.org; Wed, 21 Oct 2020 16:38:55 +0000
Received: by mail-ej1-x641.google.com with SMTP id p5so4195839ejj.2
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2020 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uEj2dtHf+HnkoupGy9xjTu6l00O4rrG2/m0FBk6LmZo=;
 b=cusYKGkTIwI9uDRArPoxsPYgtC0mWm56iG0865ZA3IhoHDIqFs/EAzX+zyGG/z3e/T
 RMVISkIpP2NTz/McTpiWynxFhelUGwWaDwRppi0BOqJRx/Gx+yJ1x146SW/k4JfdftKk
 lJ+Ri94ZaPq8sAmSrnw8tiBwf/Sk7l0piWFlMFR4pS+FG+woZoYuq62thqe2jSCkrRtv
 aM7GVbuERHoHFyn0DFlTGlv+RPVF2YZM+WrxZf0aScigWLVkUUtCVj94HpF6nQUzni2c
 g0h2wevwOQD2LIZsDhQmz9nOmuXYxJgEIuEeDA3QMeJbmAAHGDZH877TMYYLEQll1Of1
 U14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uEj2dtHf+HnkoupGy9xjTu6l00O4rrG2/m0FBk6LmZo=;
 b=SmyS2Lx7+20fG7nO2RZT7ngFkHC7PHyolA5NyOjv1UghU+gy+VAXqMospxW5zm4kc4
 9vzEu0VXpSg6GRn1nfkAwwLIrTXsZZch28RoHhOkZpCVf8/rht9jmdFjRjvqrR6wFrlV
 tELNnKPaMnW7W4qvZlivao0yvEdANTyGKA64UPHNB8AVTPghhcv/qp0NpY5er0s3ovEj
 4cFFJiheGtdM89NUKfcO841gxWdSvowH48nkRVnV8+nbqOo38GImUArcIzwE+f5ZvDvK
 uThpzTkXDhYbzZJUyllvdMQVNazTylY/XGT4LwGFy7aIhhvhvacd7kgfzxOmSMKRfdhs
 ePrg==
X-Gm-Message-State: AOAM531keGjycvmMZilsh7Q+epmRcXaomr6XE8dx/dEZAixrjc2TBsXo
 AkiMRDbawzFxKdRT+qJyi4B7vA==
X-Google-Smtp-Source: ABdhPJzxYoh8vi5BHrv2k+io/DSMYqitDUc10vHXq6uKSsyqTQW320C8E0qpi/qiJaROGdWmub+2lA==
X-Received: by 2002:a17:907:20b2:: with SMTP id
 pw18mr4225896ejb.159.1603298332372; 
 Wed, 21 Oct 2020 09:38:52 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id f26sm2549747ejx.23.2020.10.21.09.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:38:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 0/2] clk: add devm variant of clk_notifier_register
Date: Wed, 21 Oct 2020 18:38:45 +0200
Message-Id: <20201021163847.595189-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_123853_553068_E16C9CD4 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds memory managed variant of clk_notifier_register and
a first usage of it the amlogic clock controller of the g12 SoC family.

Jerome Brunet (2):
  clk: add devm variant of clk_notifier_register
  clk: meson: g12: use devm variant to register notifiers

 drivers/clk/clk.c        | 36 ++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.c | 34 ++++++++++++++++++++--------------
 include/linux/clk.h      | 18 ++++++++++++++++++
 3 files changed, 74 insertions(+), 14 deletions(-)

-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
