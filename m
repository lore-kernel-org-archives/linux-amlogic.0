Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C486C43444
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1310205C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AG6bhBva";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KyO8h6RY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1310205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17wk25NSOPRwnnQfRruWrp0hjzRkfOXe34E4MIQFyFU=; b=AG6bhBvayHeW4/
	wrVmA5jZ3t79mURlCRGHwtPEoZvKOmleOadc4PYsm7fZwp6W3PmKPEB8utRWT/YOEjC9xo2ngzWdX
	GFQCjiuKIUeAmSbXgSbTneDQAnMyjWLmxqMVlNZrZpNUOG67iQkULPyXQB22LOd3zKweOqY/d/Ep+
	1UlqxUoan5U9xdr+jUF6mT8XBfW99pMoXukzvyeuzdlkBZPzc12n1iP7C3posdsAFJQwhQGY0TK7A
	TXgpG0USdbjUjDLpvjyGf5WCTD/5IuBpdBWqz+NTG/HaeLu6L4OZa/lXVkr+wMd2BC3fgQX+A7L+m
	cIqeTdDX2AXQOqo7rByw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkAqe-0000VW-L1; Thu, 17 Jan 2019 16:48:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkAqa-0000Ps-Hc
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 16:48:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id f188so1765294wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 08:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U5kKnhrUsQPHyQ+0YJxeNdxVGK9txanOHvWzSakbx6g=;
 b=KyO8h6RYgoIqTOPoGdr/2d0Ia0JJ4qdN5Y94PTfhh8RxgLhziGNbbDZ53O4bfVGrrJ
 G3tHix/VFk6KEmq6i/YtidqB5woSuLCr+cHQgaztQPC6s4nUZOVzqXmaF4YjuNPWNxa3
 3LrcnixfmHBVO74tKCKgS3D2wTIS5klW+cLCEIRKN1lbLDEI7/39ks3Df6Rg+d9FqB3W
 xPYDPx539RHZdHPkulDGC6gZ2iVBnifxyR5A3yGhdGzzgBNWT8AbeO5Ecsl81fD0JJyO
 n5QddVNAXPV3bpNtiv+NvRoJ2W+Mn0SONODxrGklUepUP9ZLm24xJSkD9CynKB4MdSll
 LxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5kKnhrUsQPHyQ+0YJxeNdxVGK9txanOHvWzSakbx6g=;
 b=k1lNN+Nr7ATMaSXHL8x+DWDhk+ea528Ky3uGV6172OuwuIDyEPadmfffLBQP4MVnJw
 pBmUEBHU/K5EBem8PI6EA8vgs2ClumhaGhOhfIdSnN/cNaI/0o0S1dJNEUig2vs9RRRQ
 HDU3PIzB4rJThivGIKo4QqQmtLw/p2HPurZhw9EC/En3QFNztzYPowLow7CzUka7kjj6
 t5CtxViTgmAWWgqO+VqCaVPECLbhRGglBw7NufIdwEhp/wLJj3I0F2uDaL3ayVNl3mxm
 Pn0usfBTt3TzaSKtWng1GGGgTvUR9mgHWJOYLvSertbLCa4U4g9HtZCVTUgQnxWP2DOW
 AmoA==
X-Gm-Message-State: AJcUukfSu+Rht3HrVHI4kCwBZgfO0FbFIPHi9v82Mp30I06lWV9nXSFP
 RoA2sMRG9D98rAlqR9ygV9Yf/g==
X-Google-Smtp-Source: ALg8bN5iLOBIeyg3tJAX6YLzPh9uz9NM17cF2SeHZAIopd7OFysZjCBuNSNtFaVCsb/mFDZEG/aOfg==
X-Received: by 2002:a1c:2d08:: with SMTP id t8mr10600578wmt.5.1547743731193;
 Thu, 17 Jan 2019 08:48:51 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j8sm99263199wmd.0.2019.01.17.08.48.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 08:48:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/4] arm64: dts: meson: axg: add clk measure support
Date: Thu, 17 Jan 2019 17:48:37 +0100
Message-Id: <20190117164838.8008-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190117164838.8008-1-jbrunet@baylibre.com>
References: <20190117164838.8008-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_084852_592336_CCB5E65E 
X-CRM114-Status: UNSURE (   9.25  )
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

Add the clock measure device to the axg SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 0e0abb1a03e2..94ea36a2417a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1611,6 +1611,11 @@
 				status = "disabled";
 			};
 
+			clk_msr: clock-sensor@18000 {
+				compatible = "amlogic,meson-axg-clk-measure";
+				reg = <0x0 0x18000 0x0 0x10>;
+			};
+
 			i2c3: i2c@1c000 {
 				compatible = "amlogic,meson-axg-i2c";
 				reg = <0x0 0x1c000 0x0 0x20>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
