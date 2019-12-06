Return-Path: <SRS0=jD7o=Z4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA1FC2D0C1
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2019 10:02:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D79312245C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2019 10:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VxGR17IX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DFttMATf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D79312245C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q4L12G8kPEnyvPnMWstJFDrZSI5tuPBEPuk54FJxsWo=; b=VxGR17IXHBA1gq
	Bym/wZT0MZyIINRC3kGo5y3aWxRi4AiJbgfR6hqWoLG2JEREnsCknTCMbFls8bisi8NfxjasRAwj9
	KIkFC3nqStUPsTn16k6ra4UWkPr2KeE8KQxhgY5dryNDmi/OXZEKXEdCHB+l7pTIEl0hcOxy3liSU
	OXgzV8NdxbM8jErg0XGW6KhFBJhj1DvQR+EDeVrymNYMaxZ4xftQVxHGCWldP0ViLRBBcRELWJWsg
	36F6hgFZ4Fv6TK0EX5BZR7TSN2SM0blymvE7eZybXOa2Y90nl5/uGrqTpBYnGMU9HS6Ao6kXczgG+
	RzEb1BB9mMj26nKpwo/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idART-0003JJ-6L; Fri, 06 Dec 2019 10:02:31 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idARP-0003Gm-IS
 for linux-amlogic@lists.infradead.org; Fri, 06 Dec 2019 10:02:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id g17so7118224wro.2
 for <linux-amlogic@lists.infradead.org>; Fri, 06 Dec 2019 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EAvJfWkyWR+AqwH45vb7OdQ/ejgJ1D722M1KzKBLqNU=;
 b=DFttMATfsmSCeQvvYWYUxpzer6Vkitii5nW2aHuvNNv3pS/l2CnW//0LmGe2d/a5JX
 K3ntKEfzHD8h3ey0yht5svU93Lnu0VvACpK49dJ5c5Tk91ozdJi0CVXT/3lYKtdxU20M
 NrrkunhxObUHN1OpeafvG3rSGaZRZFNT844O4mljiWQWH2gDrojjy2ueiElHYV4y4Bsj
 JsAwhPN0uOtK04Re9e/Einc4uIZ3VeU1ctXKl/9b+DxFtL85yfTRQ9z/YkYagIxv8Y9C
 wvsFIWhwMA1zTeV0aK7dkEVmfH245dWAiPvqNFDvdWjhKLNNp7fV/bZa6UiajtYYJLnS
 b0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EAvJfWkyWR+AqwH45vb7OdQ/ejgJ1D722M1KzKBLqNU=;
 b=s0pFRnOVCn9K064Gqka68oFMZn6tkoqkd05MRz6ltaw6BpeLXzcD+EE5/yTi0ZQxrW
 difx58aFq+VyuU8q+DLI7Rtwvl1+qI/hEr5uTVDcz4K/hrK4hG63OmYAXeIzB1LLSqtL
 xlluPJvxqmaE8JrWM/odmiL7UnzfV3HbqATy21stL4TJXFNL5tR9uBc9rCSB8LF9clGv
 ZZaaOpyMCifQooAo+nhZKbf5IXAegSgNX30OVs0kVwCheZXReN9OfXP9ddA8YuSBKHPw
 itq1y49iVGk21bJ0zN4HZN7ZNCtr5GMEuQC9/ngcyiwRulFX2eHzwlWCLN4O72i/fTLn
 X//g==
X-Gm-Message-State: APjAAAVQC4uB5XxetdYKYLm1mYd7vQ2tg4TqJDxEBp8Z50+mSq3JYdo/
 WB/I1w2WvMdihXOhaZe+TTJslPAPCCI=
X-Google-Smtp-Source: APXvYqy5SQAlBOFPQ3Lsgyk1faem3zPDe6yWaPFjquElixuLqt7HnpG11CnVZHLnBLUCdj5tUMuRNw==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr14587402wrm.210.1575626544415; 
 Fri, 06 Dec 2019 02:02:24 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id d14sm16372314wru.9.2019.12.06.02.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 02:02:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/4] arm64: dts: meson: add libretech-pc support
Date: Fri,  6 Dec 2019 11:02:14 +0100
Message-Id: <20191206100218.480348-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_020227_608140_47F57E7A 
X-CRM114-Status: UNSURE (   7.86  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support the new libretech PC platform, aka tartiflette.
There is two variants of this platform, one with the S905D and another
with the S912.

Jerome Brunet (4):
  arm64: dts: meson: gxl: add i2c C pins
  arm64: defconfig: enable FUSB302 as module
  dt-bindings: arm: amlogic: add libretech-pc bindings
  arm64: dts: meson: add libretech-pc boards support

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    | 362 ++++++++++++++++++
 .../amlogic/meson-gxl-s905d-libretech-pc.dts  |  16 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   9 +
 .../amlogic/meson-gxm-s912-libretech-pc.dts   |  63 +++
 arch/arm64/configs/defconfig                  |   2 +
 7 files changed, 456 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
