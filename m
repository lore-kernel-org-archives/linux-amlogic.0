Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A243C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 17:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4821820859
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 17:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qL3gcUsL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PXuSBDEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4821820859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wHYisT9dM5noCcgBZ75aJgy2wnQCI+m/7awvi0uHRlg=; b=qL3gcUsLt5Ehg+
	nj5zE2rOPED21do1W4Sr765qvEV/gWYsjPVW+qWvoqnnBo78QAZNYkZQLI9DVv0wfjFla5EPB1bPu
	XqXikNC05IQCKu342y1mlHrMUun4wIAWxeNyDsTUdK1cAAuuPB5nzMTocXcc8Mc/umi3BXZTMLodl
	YPAih4tAWu5gCrZ46L2PlBESYv5TPO0PTA9wd1Lwg1M6cUEsGxJDHLDNC1dL08lGG6n6jMfcwzkaF
	9jiEAcxR6SP9g/eE+E6XeM8nKNx+NvzdLvvEQYTpR+t2MrVGDjOI13zFddS/LLnbygt27JgzzsGhK
	t27Hmm/Ui+RF9ITfIYYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjpPE-0002Ab-1P; Wed, 16 Jan 2019 17:55:12 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjpOw-0001Zg-IK
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 17:54:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id l9so7906188wrt.13
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVtN4iPcY9zshcCkTMLevoptOZxFBUuW0e/FWPhm+M0=;
 b=PXuSBDEx8jenUvktfa+dL3KOmAHKnN1f3NXBjaaSO2lYL6p+A4jIJhsB9l/Nl7a5CO
 BatQOv3PqoY9mwywoL4V3ZP3SE03TWdwi+yGYfNReV3NjtmCO44UYXBtep1TKsJQjXdh
 gGYBm6q5BzEhdyklYb6OJAAiMtaqNgIl+SXnXs/1IbaH+vwOboBLJrhKbAROT0rEyXvr
 cSzyz0V59SYh55RCpZxN2McXyK7Ht/lFzw2fKv40lDfnzq03JV4jUl0om2TGQh0cY+VX
 8SjjDch+NxrceCkqrS5fw1TxGs8KeoSlJ5Gia3QE423cUxL1yHRxbtkCun+XQGtCSPUT
 j4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVtN4iPcY9zshcCkTMLevoptOZxFBUuW0e/FWPhm+M0=;
 b=VKwyH1C8P2iIGKxrgmWt+fM0FugCUgEDSC9lNyRQO52y6ecjy8AR1pC30vQtBmFo86
 3EMUastQowUqcPl2WTqPqgFUvGZv2U5/fnkW1lU5WsqMaa85MVI4GC5kc6vdOijYtPeu
 8A6YiZIf1eKO+8ny5r0NXF+prUx29d6hnAAMJ5vzSke7M35BUu92M7h7EtCnvciUP990
 KxmDw9vR3G9+lWfh9Zn3ucCT7dp0GLWg+64xZUaKg7HAUujsszcOTTPJ35KYHG2P8xwc
 VELxVHE0/j8JznD0IkU7JvsiLb8AyzW2/ntLmlg6mw1Jq09WRh5Z/730s+BRPAHk0RK/
 NCrg==
X-Gm-Message-State: AJcUukflSPlov8SyeKvdD5oGe9gPc09tEz/TYkO6ie4jxPcy7dVb3Yms
 4hJDQhMzBGpMO1B2HOKqenpDAQ==
X-Google-Smtp-Source: ALg8bN7k8146w1SKv9w0xx2lsDhIDb65NLp99FCuk6OViftv3063GGkHsaM0phdh5uZDHnV8MeEU3Q==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr8857298wro.262.1547661289277; 
 Wed, 16 Jan 2019 09:54:49 -0800 (PST)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z9sm68703861wrs.63.2019.01.16.09.54.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 09:54:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] clk: meson: claim input clocks through DT
Date: Wed, 16 Jan 2019 18:54:32 +0100
Message-Id: <20190116175435.4990-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_095454_675294_1F052C37 
X-CRM114-Status: UNSURE (   6.99  )
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
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Following the preparation series [0] sent in the last cycle, this
patchset adds clock input claim through DT in the gxbb and axg clock
controllers

[0]: https://lkml.kernel.org/r/20181203171640.12110-1-jbrunet@baylibre.com

Jerome Brunet (3):
  clk: meson: gxbb: claim clock controller input clock from DT
  clk: meson: axg: claim clock controller input clock from DT
  clk: meson: ao-clkc: claim clock controller input clocks from DT

 drivers/clk/meson/axg-aoclk.c   | 22 +++++++++++++++-----
 drivers/clk/meson/axg.c         | 27 +++++++++++++++++-------
 drivers/clk/meson/gxbb-aoclk.c  | 25 ++++++++++++++++------
 drivers/clk/meson/gxbb.c        | 37 +++++++++++++++++++++------------
 drivers/clk/meson/meson-aoclk.c | 37 ++++++++++++++++++++++++++++++++-
 drivers/clk/meson/meson-aoclk.h | 12 +++++++++--
 6 files changed, 125 insertions(+), 35 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
