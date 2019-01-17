Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D29C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:48:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567F8205C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHiOHZY8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LQUkGwZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567F8205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GG5x+YOBeUPjzfUR2rnRKuvUtD0h3KcgWX1FtcLlY5E=; b=KHiOHZY81iPhou
	bq/cPNJqTQ5Mikt8ZmCZEAysQpqyV/4K2CSwEouLTlJOIDyx3pV21Gn7OJrEobq8Zsg7DNtD03nXB
	/xja3x8iRzJVjJztSD55quVAYjdH3vsHITIU5cvJKeNdXk1INvQtOZWtIFMEceyF/18Wfa80QhH8R
	oKlGrelF9VEECi5UoUy/JhgheI4Irs7bVRbrCDlxEJAWBmzWHB84wDC1BLMe5YMTd+jKQSBDnboZq
	fpH7hQ7qHc6UQ0EsTCyl1jXWfctjKHNtSK62UTvtDJonPXbO9CxNARbj4GrGxFR6OEvEihCurOd9L
	MSoor4AwBn/tkdev5+qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkAqY-0000OK-6k; Thu, 17 Jan 2019 16:48:50 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkAqV-0000NS-LX
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 16:48:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id f188so1764969wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 08:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=znrXYk8dBPzxU9mLzuO6fFMb5fFxzkslrN+ov26/0TM=;
 b=LQUkGwZlrxn2Db0rdRATMM2jt97hWwIE5HllGD/SbMb/f1JPbPCiQS4fiyJpRj3B5y
 YC7nH0puaa/232uqIy77ejZ7gjZIHPkMZo6jc14OfvpVCo9ap5HMW9m1F5jUCM/NZ+lq
 5oandNG/41gEfiwSi6X+kErqwfseBrkP+obl2TeGEltpMumjF47oODvZDUPY53mAf3WN
 T0kFxQ4G3i2NXV0D/d94EvLhw/FB94EveuV6PGAsbaXrMPwTbLQnf2+4C2dnQ2FdlTw4
 gPmko4A1ukxmQ6VTjm91a0fs9ssTT0UXWp7hrOLzHAofOU2Qbs0qhnINwpn8yGTwWaxm
 A4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=znrXYk8dBPzxU9mLzuO6fFMb5fFxzkslrN+ov26/0TM=;
 b=jS7P9/O/SK35/37A1FIg2TIKsRWcxW3T8pAqmDLfm0TOYSKYyCyimuEHsAh1wIMM1I
 xyGAwp45d8q++io4OhGrQUZeR9pNJLH0GwWRW9honqN8zMjYplVbb4UBsixSQswNp+ja
 Yj8lfOhemUZFmzUEIWcW7/8finz26yOV75Qu6BNy6LZTVcC8G8XPRZjFP1WkN2L94Qmm
 1kUVPJpxQlRToRMGuGL/+KEaH0IKsbdQluJOXeJ7IYWnb+FXhUvW/3nnHuA6ALD4ZV14
 6L1IFbD+5p8cCUdmsRPhfN9L0AOCEanJjtQXz01ldJIlufZRcpibShxiNfAttOqMf9QF
 +Nkg==
X-Gm-Message-State: AJcUukeT0K3mE0lhE3XTa3C1xzEy83ixD+y2aMGCniMdWq/zgBgOoFDs
 2DN9vIiqepLQ4061lwThOqDQOQ==
X-Google-Smtp-Source: ALg8bN4QLWzdGhKeSAzAVzFQCji7fLjIm6x6AhEzwUwBfsYnqeWzpEuQJ2U2fbN4qie6YruSqwEYaQ==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr6165373wmf.97.1547743725769;
 Thu, 17 Jan 2019 08:48:45 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j8sm99263199wmd.0.2019.01.17.08.48.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 08:48:44 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/4] soc: amlogic: clk-measure: add axg and g12a support
Date: Thu, 17 Jan 2019 17:48:34 +0100
Message-Id: <20190117164838.8008-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_084847_779777_8D0978A2 
X-CRM114-Status: UNSURE (   7.16  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the axg and g12a SoC family in amlogic's
clock measure driver and enable it on the related devices

Jerome Brunet (4):
  dt-bindings: amlogic: add new compatible devices to clk_measure
  soc: amlogic: clk-measure: add axg and g12a support
  arm64: dts: meson: axg: add clk measure support
  arm64: dts: meson: g12a: add clk measure support

 .../bindings/soc/amlogic/clk-measure.txt      |   2 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   5 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   5 +
 drivers/soc/amlogic/meson-clk-measure.c       | 194 ++++++++++++++++++
 4 files changed, 206 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
