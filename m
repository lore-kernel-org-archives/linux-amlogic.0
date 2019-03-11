Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5230C10F0C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56F9206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lWKFPKUt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1+gXhw+2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56F9206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yynl/ktSah72Ajy8SVBW7h0glb2bGMIiUsOIYIDdojw=; b=lWKFPKUtU9ueqf
	U1gxZlTi+IT1BIauoWvevf6UkgK/Q0sZBHSa4m9wr6ZUj0+G2mYlR3SP5oQsmcF/sKQsjaXd9VBqS
	90xvl2p76RcG/S4DN+OqH6siw7SpCzhKFZj0sYDRluZioTviTX/zTxubgx51IBqS3KZBNXqmTQ2Ar
	QcwCWnYjFjio6rwGMbz1wV4/XJ160okMOZU7cuxOBNzPKHwyQ1Gf47adP3UG+cG9bCzRQ1tgtMmVl
	M1Pj3N+BYj5A6eiTa15bDh6NtaaT/+jasxiu6x/xRFLHNNOPgKscTTYXUM5d7fZJXOVYgtS8KoB17
	+RQ6iyKXreN52OYPOhWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3HgB-0001Mp-R5; Mon, 11 Mar 2019 09:57:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfP-0000DE-82
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id n2so4307459wrw.8
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5odumMPqXsJ46+A7zdstiqux6E3Cw2T3fnx8yG9MXA=;
 b=1+gXhw+29l+0dSa+z3z7JYPFdgfOrGVsZDRLbi0tKX/1OSMbfD1UQ1mKD/pXxyNP/p
 Z87hgrqil/yfsLhYMw89JIFvZ2tBV2OpI18EzDNpINXwpCTgtwkGxcDIOqNRlrMF/HYv
 1yhmhTz715ShEmbAeAyQ986PjRvq+agKlPwqPMTOBcYMUSv3llQn1qRx3xfEJahogozP
 bQmB58oPOen4lET+Ac5x4yrZ7BvfuIwAX5QLBJBsMfNhi1YiqTbqW7W7BUuZuHwn1Zne
 qAXj6ITTZ8F9697EmyTBCwt3puxmEVn/ek7yXlIeV28mRM++2e97eJstRDbOJv0p8zQ6
 2AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5odumMPqXsJ46+A7zdstiqux6E3Cw2T3fnx8yG9MXA=;
 b=r3X2dUCGXI2KvZMaotBSwwm2OURTHH+zy7kMtbjjwjnqQV0ONk6aYDMZwm6q2J1P1z
 A0p8lQjrzz3RD+IGCorI8bwxRYwUG4g4O502AoIv//D3iyg7jA8cgtlQDEJTZiB7uyu4
 S61fj9D6z2aFc6vqkFJSW+1aTRWloHq4eKe4rYic2kXmQghB8fEe1qFFLzTAeZ98gszR
 AYGR7uBhGt+X6ZCP/FX5WxKzBhTM0eLkTFdZe1/np/VAaaQsaCEuRRf/eJJtMHdSDC7J
 m89FTe+4B9Xo2aZ13XGVuCRdkmVeGJturwOIRSBN0oU6NvSxUySqAbMPG11ZyjNFAVNQ
 bE/A==
X-Gm-Message-State: APjAAAVeQ66QKQaYSELHSjHXfD2VQxmOq0sUou2wdxO1lS07bCci84Te
 X3xM6bk+8sdQ0sUvxx3N7QujQKNFTUXM4w==
X-Google-Smtp-Source: APXvYqxL0XcwZmofwI221hhIdt6O80Bqt79gm2QFbzYhqwx1hpUIU84Q8dJKd6XSOixysjSZV1KKCw==
X-Received: by 2002:adf:f690:: with SMTP id v16mr19993596wrp.139.1552298177009; 
 Mon, 11 Mar 2019 02:56:17 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 00/11] arm64: dts: g12a: Add boards peripherals
Date: Mon, 11 Mar 2019 10:56:02 +0100
Message-Id: <20190311095613.11371-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025619_422179_FCA392F0 
X-CRM114-Status: UNSURE (   6.30  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Following [1], add regulators, bluetooth, UART and ADC keys on :
- meson-g12a-x96-max
- meson-g12a-u200
- meson-g12a-sei510

[1] https://patchwork.kernel.org/cover/10843095/

Guillaume La Roque (1):
  arm64: dts: meson-g12a-x96-max: add regulators

Jerome Brunet (2):
  arm64: dts: meson-g12a-u200: add regulators
  arm64: dts: meson-g12a-sei510: add regulators

Neil Armstrong (8):
  arm64: dts: meson-g12a-u200: add uart_AO pinctrl
  arm64: dts: meson-g12a-sei510: add uart_AO pinctrl
  arm64: dts: meson-g12a-x96-max: add uart_AO pinctrl
  arm64: dts: meson-g12a-x96-max: Enable BT Module
  arm64: dts: meson-g12a-sei510: Add ADC Key and BT support
  arm64: dts: meson-g12a-sei510: Enable USB
  arm64: dts: meson-g12a-u200: Enable USB
  arm64: dts: meson-g12a-x96-max: Enable USB

 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 97 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 97 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 88 +++++++++++++++++
 3 files changed, 282 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
