Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52A8C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 01:43:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B70A2075F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 01:43:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QxlfV9D2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWUbGOnK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B70A2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UCAXf+TyBwKpJszGDMapwfhncDVEZcGJGfyWz4CEAaI=; b=Qxl
	fV9D2IbjG2vEWzyztMV2jZ+cXVfeVlVS/yf1KmYOl8b8pWahlpMMItct0Pwxn8J+HbS4fPS6S5K/Q
	1InjPobWGYlhy0OuX10qPTiNXzEJdAFzIkoHRtxYCvmP25nvsPf53lA4ltJ2sE+qnOSH9gLBLnL41
	9nEwPu1WpRFVtjiIt+cArOkw2hyiThvSv1E1QHxF1t8I2WHDChuPIDfd5mtWISDu2Q8Qo5kBLDdZT
	MqNfsgcSqKDT7jdQHC+NkJ1DZkNWuMBbXVVz3+k7COS/ON4OhU50zCeVYGSNIh3QwWBLiETMqI70e
	Mco+qFU1JuFjKTc4s4ka27n9OiKhTwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbDlw-00053N-GZ; Wed, 20 May 2020 01:43:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbDlg-0004pu-Tf; Wed, 20 May 2020 01:43:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id n18so1211691wmj.5;
 Tue, 19 May 2020 18:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=b+VrtRTRQbda5F/nBoWdgPtbxBORPAR0TPt2Xyx+4zo=;
 b=XWUbGOnKCkXgHXl7jp7d8APw0c98NN8lMuqbg4CYseGAwUC62wzAW3W5yy1yLOUZDN
 5bPIFG+dqBGKjxITeWBf53MRiahijTiolotvO+SuCxFF++8Bn399qzIr/3prtLHysArS
 whVCvnhKl+R8LCByU2/dU0qznqu/fzLGFR04qnaiObd/x1F2qfddduB2DiLQspCf8GpW
 Lh0pxTd0dFNYUPB12Kg1F6S74oKiU4gi+BsH2MhRLLQhzp7/PVEfXXhJRrP33GWtxh8t
 w6virPox++TBPqoSO/LgZZF9LkPliqY7zraux3W/MqEXgaFm0I5VqnkPyjHxZwyTAy+V
 s+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=b+VrtRTRQbda5F/nBoWdgPtbxBORPAR0TPt2Xyx+4zo=;
 b=BoSJbW6982y1578LlIPoL13KN7kmO9F9j2N757T3Kl5nURch5ce/zfbILGm6MPDQKQ
 tXgi0v8UX/2HTCG6cNi2o5Ob2l5zjMuw0vwVCDHM+qD0z6Y4WpB7Q70Ee3grnoH12U/D
 js0+vlmZWY4n6qye88JcX/sScCo1U/8G/e4GzCv+z8venNjYSSMdwk8gKqMPM2lKWgSN
 HOj3PvgqmOAnG7yIc2Eur20K/LxnItBJcjgLpoIOvLx50QzIXhdt5hoDndqnuPjBwP95
 Ug+xTkj4JvMkyZkBLu07inDx7rshbJ6C7MAj8Gex12hqCxHt/Dg2fAcg9UtW+Rzigq1z
 3dYQ==
X-Gm-Message-State: AOAM532pHKWgys8xeIy9nFUYLSfqnYNcMm4I8WxQlYou2aBZPnW6es2/
 zp0vPj+z9sjqhEWFYozLBm4=
X-Google-Smtp-Source: ABdhPJx9nBW+NDfV/mrgsUts8T80+Hh62UiaVMTnz55H7gHZyY4vEc/xhrq22gkKFKEnVD1Nb20ufA==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr2238314wmi.79.1589939014142; 
 Tue, 19 May 2020 18:43:34 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id z10sm1493351wmi.2.2020.05.19.18.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 18:43:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] arm64: dts: meson: add W400 dtsi and GT-King/Pro
 devices
Date: Wed, 20 May 2020 01:43:24 +0000
Message-Id: <20200520014329.12469-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_184336_957647_1CC9358E 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series combines patch 2 from [1] which converts the existing Ugoos
AM6 device-tree to a common W400 dtsi and dts, and then reworks the
Beelink GT-King/GT-King Pro series from [2] to use the dtsi, but this
time without the offending common audio dtsi approach. I've carried
forwards acks on bindings from Rob as these did not change.

v4 - rebased against Kevin's v5.8/dt64 branch

v3 - amend author full-name on bindings patch

[1] https://patchwork.kernel.org/patch/11497105/
[2] https://patchwork.kernel.org/project/linux-amlogic/list/?series=273483

Christian Hewitt (5):
  arm64: dts: meson: convert ugoos-am6 to common w400 dtsi
  dt-bindings: arm: amlogic: add support for the Beelink GT-King
  arm64: dts: meson-g12b-gtking: add initial device-tree
  dt-bindings: arm: amlogic: add support for the Beelink GT-King Pro
  arm64: dts: meson-g12b-gtking-pro: add initial device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../dts/amlogic/meson-g12b-gtking-pro.dts     | 125 ++++++
 .../boot/dts/amlogic/meson-g12b-gtking.dts    | 145 ++++++
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts | 375 +---------------
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     | 423 ++++++++++++++++++
 6 files changed, 698 insertions(+), 374 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
