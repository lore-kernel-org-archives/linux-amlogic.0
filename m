Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EC6C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB7B20684
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LPee98HA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MntE3LMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB7B20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/sN2v8RmO7TK9fTqQttqJRVpkkVX7kU45dbc2A7RGPQ=; b=LPee98HAuNyFTc
	sFF8zXXUElPr4taOlisgJI8c90RVHGSsesfDUaPna8oqMIgphw4esLpVtcXRbbuZDhLs127ElLGM2
	yqHb8fiGC6Kb5XE/41Huf8FjqLtoNc6xiKcTBb0MargA8FQu3nG/8XAD72u4NJ3mZt2OTbgUEb3dC
	thaEArVUzwvp3caia9GIKm5AXwOJu4+TLw6Z/+F+7+SUByw4yQK9/oFSanANPV5w5n4jaXcDluSmN
	BUYbZcIPwkCk416HsOJb+1Rr8eL9nrIkJ3ocbKGZ7VlXQHrlzquWl28FW0blbRRZFMQDocWOPs0ye
	+QfEaUVzDoUKqmfLcOag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1tna-000126-DM; Thu, 07 Mar 2019 14:15:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1tnW-0000zQ-H9
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 14:15:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id y6so2459643wrn.7
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 06:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=102m7vigukY6b2r4HXlaV9za2FJR75yPTrUYx8MuDyg=;
 b=MntE3LMdL4WhEyeakqoEbbBDCZnuNWUqFQom72tuwIEjS8DppGHYQmct58TELWCtZT
 Y9OmEDJCTdEnb6M8bVpIsW1HNfbJNQwYBGrzpjzk5YMitJqAtQjg7MKwEfCtS9uANjvE
 oi+iaF15k8UY3mQ0vOlKYHEZAd7tKOr046UooTQdj0hHBuY7MlADQdoD1uNU2b1CwFgb
 VSVlstjyAp7uqIi5WaGWIX6q3nH8JdlZdtVbB4f5nplukWcHn6KL4UxJ2JEy+QA0d33J
 h55Aub59jR3p5VisbfBTG6QyExNutxND8gOKpiuD3qc22Gh12rqHbdug8j1JqRIvO7qK
 JrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=102m7vigukY6b2r4HXlaV9za2FJR75yPTrUYx8MuDyg=;
 b=ZwgbB/eqFm1MwE858gRT0DXsiaXnwGHJMPodIeY2oTiu0s6GZeqZ+Uyk46UhLMSMG5
 uL1JR2WlFnpUwKU+Zd6yd5ssM4xvqisiaNQ46PEBFMpJS86lumZozYJr1x1+oREhqpCk
 e6Fr/1zgarm6u3rv3112AFZ2tCRPkUcoqHzms3LexmmB4dnOAu4i0BKxu7oIl2PJai7X
 BS9KakHyFwE5w1CceV/csv/IrmFac6AR/H5o1gIe406ABZfaWWwqEoxDlYaBTo7EUZ0V
 fT/GisMkYwTk/YzaKm8m/f8LbvO5GW604q2sM39xuqnAA1qA7ZsEUQ25GtsPF43GZH8D
 TPqA==
X-Gm-Message-State: APjAAAWuGcnWE2F542JaUMKnG5CEGBwopL7RdwTjVGp88dSlRQYrnabl
 ZwLMlZzcyI8WP30wi7N3HX0L6g==
X-Google-Smtp-Source: APXvYqxFIGkuc2l23hZhsQeS86bnCNmzSmXwrXIRW2MPpe+DTrSSQZmfekPLccn6gHd1+XuMZzVL+g==
X-Received: by 2002:adf:f711:: with SMTP id r17mr6998984wrp.38.1551968096841; 
 Thu, 07 Mar 2019 06:14:56 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h9sm9679304wrv.11.2019.03.07.06.14.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 06:14:56 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 0/3] clk: meson: add support for PCIE PLL
Date: Thu,  7 Mar 2019 15:14:52 +0100
Message-Id: <20190307141455.23879-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_061458_570710_9A48111F 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoCs embeds a dedicated PLL to feed the USB3+PCIE
Combo PHY. This PLL needs a very specific and strict register sequence
in order to correcly enable it and deliver the 100MHz reference clock
to the Analog PHY.

After lot of trials and errors, and since this PLL will ever feed 100MHz
with a static configuration, it is simpler to setup a dedicated ops
structure with a custom _enable() op applying the init register sequence.

The rate calculation ops are kept in order to keep the nominal read
ops as-in, but set_rate is removed.

With this setup, the PLL can be enabled and disable safely and always have
the recommended PLL setup to feed the USB3+PCIE Combo PHY.

Neil Armstrong (3):
  clk: meson-pll: add reduced specific clk_ops for G12A PCIe PLL
  dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
  clk: meson-g12a: add PCIE PLL clocks

 drivers/clk/meson/clk-pll.c           |  26 ++++++
 drivers/clk/meson/clk-pll.h           |   1 +
 drivers/clk/meson/g12a.c              | 118 ++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   5 +-
 include/dt-bindings/clock/g12a-clkc.h |   1 +
 5 files changed, 150 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
