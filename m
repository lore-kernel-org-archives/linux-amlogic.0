Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B89C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75C52186A
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fc5biIOo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Odq5GSjd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E75C52186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AR9bH6EoGJuM4lGGpIz/XeQd/jirQt+JS9+m2IFpRFA=; b=Fc5biIOoVhrr9G
	cXEPSiBZFZ8aN7iUGPz5+XI41GU5Nk6hfly2UbkY/KwTtjM9qSWiBjOrYJX3dEreqSMfo5sfDLlxT
	9lOL+3hSZoJ95HXOB3CsLRBlY76BaqlaoLc5Usms8O3eSyJXIQhqz+sKcLFK1AENb9lPiQQ4THFD/
	NN2J7WDop/sGrMN26PCQmOFZhqbuMAn25dppW5uOVzHRszH50adnCo4NM3B40COFKxFXEo9PVTxhg
	QYoO/Q4EU5etgsag0KY7NHJyCKMyBCs6qDMdRngZUdzFO8zIaOWntXZgH5F8p5T3EXpnXNdd9wan4
	qw1ExoY1H/DPasqW6ioQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4nDA-0002ec-Rm; Fri, 15 Mar 2019 13:49:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4nD0-0002Vd-7v
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 13:49:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id h99so9630520wrh.12
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 06:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6dkimrea4AT1s+E1iMTXSF4jCCI3pHk/sEomO/wsiE=;
 b=Odq5GSjdCdv24A2JQH1SJUovV5jeyfw14Cw0Xl0yto2OdVZNVzjX7Up/HFAsW1a2TW
 cZsev3KQ5/6BsSSx/1zIW41fa6HnUjip1ByaRFRxqnhJLRQZylb4ukV70BTrrshwwI+S
 4ii36AkxQLA9BE0fmgtJNdA0KacbOZMebFw+go3aMcwJgEv1Q4168G5dcaWQZWH2oQeh
 3f7f+6BhmuovZroziorJvgiU3x+mF7YVadBjss9xAwHXxFTd8OrqFv4X5Qo4lsZ5gBVq
 IC7EZqCz9FUywj88J7jjzW/vAKbJQrH2QXXRfLYImHeCI28CU9yVOPibAAUrd4cGuevz
 f8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6dkimrea4AT1s+E1iMTXSF4jCCI3pHk/sEomO/wsiE=;
 b=N9G1WZEuyy7BxqYx1KQ+f/GNxOik7wmhY8EfTI2gE4xUIauQVnAz61bJMKZ1a4sJlY
 68RIGPmF02ZX2ivj6pFyuXyqAbaP3+neeC7Ncx5TE5F+RSLUhfTDh8ZXdWjffp0qYZHe
 eTKtbLMsr9gF+Gf+dcQXkxdMIN6ZhomK3u51tJ3pMNL1vN2BzDFnHLGKVkbHk4ZyoK7f
 TAuamS2DCGtJtdGPp1P90B++MhiV+AprphHpUKcvVrhmMbRUzwe4JefkuCuhXnvS/fCw
 Tr5CtD4jjxYhjoCzJcrCeZgSrtUl3DQS3emQB4lIko1RAHxDVpXC+A61ZIodbOCcyOI3
 KvVw==
X-Gm-Message-State: APjAAAWLH5gweO+sVUFXG7RmZEvsAvBeCO08h6npP+JdOzGU9iEt3afA
 daqNxQPADab4k4QHDOlwbr9PaA==
X-Google-Smtp-Source: APXvYqwLVrPlvJDRPQXhEzqYkuwMsZU7+fV+CXG/F+V/ner4sGg6/AUD7uvM7eoF/IHjWsH4PzQ6oA==
X-Received: by 2002:adf:f70c:: with SMTP id r12mr2734678wrp.54.1552657751176; 
 Fri, 15 Mar 2019 06:49:11 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a2sm1630516wrr.60.2019.03.15.06.49.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 15 Mar 2019 06:49:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-gxm-nexbox-a1: Enable USB
Date: Fri, 15 Mar 2019 14:49:09 +0100
Message-Id: <20190315134909.26721-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_064914_295111_A51D7A18 
X-CRM114-Status: UNSURE (   8.12  )
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

Enable USB on the Nexbox A1 STB

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 8acfd40090d2..25f3b6b14043 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -178,3 +178,7 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb0 {
+	status = "okay";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
