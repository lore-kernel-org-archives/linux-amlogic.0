Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8621AC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:58:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2FF206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pEpOTRZh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BI8hfDTg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F2FF206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNHD/iEoqP/QNhYB+VT7QULTKlgJACy0Py6CrEv7x0s=; b=pEpOTRZhPuaU7K
	U1S7mlCOaynPgv/+Kj8hwd1BqUMMWoY/oiVz61QEfCO7ACh6F29FRKmAfhH6QUOa7PYrK09fjDXTB
	LbbNhKSJz62U4YMHKG+HY7P12LBBawafW7u+9CKKrszJS3u47peLOpcL+T0ZZ0X6QCoOMgWgkwCNa
	S1tPVDPJtSk1YhNNo8DHQyLUyuDnKBfkXgd1JPr0CmH4aZP8jhViu04TrbdN63TFoCKseF4T+8ryX
	qU0ZNnl4yX7U8Ufx+dM5SwUYcMPEHNDZZ4dw7lQ4E3KX2M2d97+LmD9ndKWJ19aaYKHywXVxFw/39
	qI8QQk59OKceY86AR3ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3HhV-00038m-2R; Mon, 11 Mar 2019 09:58:29 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfX-0000Ld-G5
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:37 +0000
Received: by mail-wm1-x341.google.com with SMTP id j125so3602596wmj.1
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mJeQHwni9G1PzZz5IxpYbYbaw1ul62/qW1dc9n8A+I=;
 b=BI8hfDTgA3BUB9GXbu8XPCGETjf8O6HsG4ogOamCLJf2tvdduYx2oEKDyZsQ/YCamK
 0pW6/jZ+29UlhZ/irKE+O3aLEHuH47hi8NHN9UT8tLZzZrITbnFxABF7pA0ALQaD3U8V
 eVqjfu3xxBBfWfY75yLjBAPZSRkzTWpRTBP3AabT3MqrKDxgSc0GGvwFqingzUhKs9t2
 DbsMRYuqeE3W8AfvpVeoEDwkMwHsImlB7dGXV8jNyDeoix1X+d7R1w4FsXi+JUegJiub
 FmYBkpyZoDxXVi+nRY2VuS+kxoeMG2pz6kL/eRU0DEmnmbyyo6JqU8/ZotfAtBAZgqFL
 62ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mJeQHwni9G1PzZz5IxpYbYbaw1ul62/qW1dc9n8A+I=;
 b=EdTkUrK2k83zdh2d7aKHMRRRcfGdf+NNMeOSZwatKNHaC3qwwU7r5Oms94AFnHOBWr
 9zTzWZHPou2avDO/ZGdvfF7hLKqnK7SOF/g9Cl47mJUgQ71H8pq/qfPcQFM8dR6mIZOQ
 njDJrkiKIENnyQGPRo34PXcZBVCRvKtEbHkVlXpW4/mFVaIYEv5/eTUCsv5J/ghMT/4j
 ktAikOBDQL+1dKQAbtqK+w3Pq3lfbJDpLafX/BFKvAelXfQ6ajrr6hq9BL7OcJ6188VR
 wvdBwxqNzEN3DxBJ+zdp6zyuMsBwU4KE3RJlhrlZ/bMjoPZx6XUnw7JCSWaATw2V5nI+
 RjdQ==
X-Gm-Message-State: APjAAAWi19GoRl1S58rCNQtdOJjjFk9KbLMA+JM11WLDy6LvaMpr1GGl
 IiKv/MbTotGBeKwTIQhbBG9H/A==
X-Google-Smtp-Source: APXvYqzY1e7HfD50NbpmHvvqk/UaIQzx/xAYjtIZJE9tz8zYC4d1mvAKgN11dAaV18IcIkmuOtk1gA==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr15972691wmc.5.1552298186022; 
 Mon, 11 Mar 2019 02:56:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 11/11] arm64: dts: meson-g12a-x96-max: Enable USB
Date: Mon, 11 Mar 2019 10:56:13 +0100
Message-Id: <20190311095613.11371-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025627_941774_FD3D0F6B 
X-CRM114-Status: UNSURE (   9.21  )
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

Enable the USB2 and USB3 Host ports on the X96 Max Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 61606601fb4f..625e240a9c09 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -105,3 +105,12 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&dwc2 {
+	status = "okay";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
