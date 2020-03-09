Return-Path: <SRS0=Mql2=42=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC4EC10F25
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 20:54:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B406B20873
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 20:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q5zX1Fpd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="smc1nHTe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B406B20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n85Gw461jpsmZV5Vs1jShDpE7uWUsigp1b3jpcrZAXo=; b=q5zX1Fpd6YY8Xh
	BuiLpB7I2cBNpOax1+oH1fVZdNldRKDSHQwzZGZbKx/ixUSBx+DF5GgPoUeCCjqZLd5ZNdMAvxoBu
	ZOI/9RYunBJlTXWU+kqhl6mgwj31f1i1aGwwo2orKt4wEiqBLGdlQrabRPBrkx1FndzG5bffZRbtu
	o7Ui3sJsNTENipvM9SAI21/cEmdb5y+Mn+zFoIIbW0ay8E0Aj9/n5EUKsoLeyXRJnlNd3wyn5sjjY
	rZp8rQVdBtW3UqTFkQLcaEsx7XqTHTNMlagFaYtq22Nr4OmbJA2Wdjoh3q5He2iYvw+iT5lC61uVd
	Q0jDzYat+aA8V07+l88A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBPPq-00072x-9L; Mon, 09 Mar 2020 20:54:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBPPU-0006jE-6H; Mon, 09 Mar 2020 20:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=SDsaTXgn8OfnRde4B1U3Q4l5GuNOok7RrJFAf43ZfcA=; b=smc1nHTepCF8nznko0+ulTrifV
 Mk6/OXQORqDZQk50xogPu+9qpjFZdYtV8co5Z16eWEl8lGRA94ogtldSVDGcsKeldZ1piMcMyd6LE
 /NQOBJ/TTr5IgRSjJYm5k8YA9VAfCdbQBkke2Tdp2cybsf6lbXZ3WFqRTPkx6pwkMKGnVP665xN3m
 M99XLE0/Mg0JE3wau24dkvCDkEGtEVaa7PQhtCtjsNaaNblUBtyatpvmeAZMSYjsfrnmpNvVjDKxN
 YiFZZvcovoW2b1VRIchN3HufUXj1PVIlY09UOOmfTzVBlkB4DI3oUnx02q8xlWAWXgPhroMx5qiRo
 QzOZsi0w==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBPPP-0004zc-EO; Mon, 09 Mar 2020 20:53:58 +0000
X-Originating-IP: 82.66.179.123
Received: from localhost (unknown [82.66.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CC5E720008;
 Mon,  9 Mar 2020 20:53:23 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/2] clk: meson: axg: Remove MIPI enable clock gate
Date: Mon,  9 Mar 2020 22:01:55 +0100
Message-Id: <20200309210157.29860-1-repk@triplefau.lt>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_205355_664834_EB9CA848 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: linux-amlogic@lists.infradead.org, Remi Pommarel <repk@triplefau.lt>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As discussed here [0], HHI_MIPI_CNTL0 is part of the MIPI/PCIe analog
PHY region and is not related to clock one. Since MIPI/PCIe PHY driver
has been added with [1], this region can be removed from the clock
driver.

Please not that this serie depends on [1] to be merged first.

[0] https://lkml.org/lkml/2019/12/16/119
[1] https://lkml.org/lkml/2020/1/23/945

Remi Pommarel (2):
  clk: meson: axg: Remove MIPI enable clock gate
  clk: meson-axg: remove CLKID_MIPI_ENABLE

 drivers/clk/meson/axg.c              | 3 ---
 drivers/clk/meson/axg.h              | 1 -
 include/dt-bindings/clock/axg-clkc.h | 1 -
 3 files changed, 5 deletions(-)

-- 
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
