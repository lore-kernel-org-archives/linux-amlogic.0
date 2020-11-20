Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D216C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:21:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE0A82245A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3TAnjCo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wqHViqLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE0A82245A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oE15mxg1iKjZyek35CuN8hjgj1bms5/aNccNDx+pHi0=; b=m3TAnjCou3M17YvmqkkCk3lrPF
	UMWnuAolY0OSNd+XB/5+6rmCT78duIktnBHX/CGad9S5kNYJES8Aet8QZDUElNvAGTkuMKOXX7lZ3
	KR57PxmQOwSNI39yne3XwxDtnhnkY5+mTx1O03d/PJtweIW5s3EobKAocHFyrl6TyZDoY4jzU0qt0
	N93hMNU9PStcBXJ1DgdrqwonA0jSwfwqGQN6WeXqLd5RDgRBnDSwN6O86c8j3NGXKMvqRj5bFNsoI
	oskx+0qE7Lm1Ku+8p9SBsrR6/9UM3uERGy55caFCLUnAbHodhTS0AEzsbtNYKAhvpyCN1wxnfsKCZ
	wMQwUVZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8EE-0004DN-I1; Fri, 20 Nov 2020 15:21:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8EC-0004By-7R
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:21:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l1so10375190wrb.9
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TXiV9Li6Gzw58hiPq/fubdVlImNlOBK+T4IMOGniTMA=;
 b=wqHViqLZic/xzEGbpNGGWb0aACDCsw7OcBXmPBr3/2kvbpOUHhEEXqnm+SJyncRguc
 Rob18eQ+YH8M6FybIfhdjhf9kgIm3UF4uO5wsJVq1N+oarOz5XcVQCUl/3Ew9sgoxHUH
 1jwmBBun/b9yt5TQdHxRhQQZlQLIgiQuJUNi8UkVmfVzm5CvLn86yd9bfSnxXKvEwqrd
 h0pd62kvfhzEP0b+CgV7oHHBXr5yf98LL2mqdqu3NEhloO0jcuFRfDD5/v63/KqZjiFx
 xoRsj+x9kxRgsgsrHHwMWcLxqdKjvwcGNbHtmo782qlfJb4fQgx+q54+3G6yovLVHzPQ
 V5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TXiV9Li6Gzw58hiPq/fubdVlImNlOBK+T4IMOGniTMA=;
 b=QvAoZjbdqaGpPLyBryO7OBDhOberi+2Ohg1QwHGfP3bIio+oRhQ7FobSRSrllgfUbh
 Gk7O4BO9moD/eIeW9owmbxpPcv+s6hFeQ56fdAg4d9vL8x2Khht3YF4hqGVeOZBPFKxI
 c/I27Cq9BPN7v/MIXjWcjCqblsU5ekkOhqPFJgdhQuM+umPUVvEOqpy2qiMHBQ/gX/lY
 1DGBd/SAx+DNc0fn+eujaXIPRt+zkEJmw9EH90V7j410pBAjQAZARNCmNIrmzS4ZSUD3
 pBK2SrB9C70ZR9yy/4kyU6ESPqnWEAVAB4q/AYSuJiDs6pg6stU8OBvcCYBteIykAgsT
 guGw==
X-Gm-Message-State: AOAM532+eSa5unaG5mcQGa5FpX4GPEusen0di4cXAxeiVaJmmhPVvkMC
 zyXLyuu2nNtFuovus4zYbmVlAA==
X-Google-Smtp-Source: ABdhPJxN8bdbpq5Skc+DT37MUOGZczE2KTzlo7q/cC86uuv4Og4BqMHQ/+ZewWGZwSO6RzXgpgwT9Q==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr16098633wrn.231.1605885694855; 
 Fri, 20 Nov 2020 07:21:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id j71sm4773757wmj.10.2020.11.20.07.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:21:34 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/2] arm64: dts: meson-axg-s400: add support for Power
 Controller & MIPI-DSI PHY
Date: Fri, 20 Nov 2020 16:21:29 +0100
Message-Id: <20201120152131.3918814-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_102136_337537_71310382 
X-CRM114-Status: UNSURE (   9.74  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the Power Controller and MIPI DSI PHY nodes to AXG, since the corresponding
driver and dt-bindings had been applied for next release.

Dependencies:
- Patch 1: [1] applied for 5.11 in meson-clk tree & [2] merged for 5.10
- Patch 2: [3] & [4] both applied for 5.11 in phy tree

[1] https://lore.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20200917064702.1459-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20201116101315.71720-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/r/20201116101647.73448-1-narmstrong@baylibre.com

Neil Armstrong (2):
  arm64: dts: meson-axg: add PWRC node
  arm64: dts: meson-axg: add MIPI DSI PHY nodes

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
