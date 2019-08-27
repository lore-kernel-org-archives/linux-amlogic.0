Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADE6C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 10:04:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C69C206BB
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 10:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fy/JtTrK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FkPmcXAR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C69C206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BWRfF9RF6l3jlc5EwHLtyH5bNzF5vxDQKJ5U/rc7XM=; b=Fy/JtTrKrZbM7U
	S5idwSqpRYVTtKfjnXZ8q6SSFnV0wKBcCcKCfWcTTFctlYwnrl0Dj+/TWA7BDDk1wlOmBR6r18T+j
	+H6GbqXIrC7KsJE+J0AAxv/CEUFkS2+UO5azxLYjcOxuSXpIVUbtiHWCq31fmXssyrfkI5q4igY/E
	m7FbOgTFaE1vYGq0S75zHH5nkhlNIEPPiP9pmIDbpOPfAYe3gOLaHX9KLSABjyVsRah+7IClKDvXl
	PaQSRFjGxBC6jrvF4E+1UZIwWJ+YAbtjRCEQZV2WfvqYMWA/9s19BxkPZ1LvWyu7WNEzRkkcNtZ+E
	P2F1ZwfHs+SbjBndZ52Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2YKx-0005TK-1o; Tue, 27 Aug 2019 10:04:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2YJm-0004VC-7n
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 10:03:17 +0000
Received: by mail-wr1-x444.google.com with SMTP id z11so18175183wrt.4
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceHNjOjYXXqKJbeAE7JQVGIbYL1u1AYoPi0HEmNDPSc=;
 b=FkPmcXARScleAA98yh1f0hvd5zGL3cap9/yDJQXtGHNOjJ+x51S5P9/OnrVC99ODXV
 H4enT2hrCybB4x2rM/H0KuMJsda8I0SKMgZ6uYSaqmO0ao5hzZq02mDDCIXX9uX0SOmA
 cmOtHZqMLfB0TDlJVfbXjnUHg8XwxCwNHij6go1d/I6YxMZtS05Rj2iBd90fqe6OhSex
 m3aofztGTUYBhOY9k3aumMwZglrjYSaC3SHMdXBkS6OGRQo95sldJVbxALu/LJ6yFik3
 U3Tw+NIDIsHXOZSUFSX4yZDJ8sp7mvyu9wY22BcF0PPmQqkfsm9y5cdrqagpdwLpoQ++
 xF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceHNjOjYXXqKJbeAE7JQVGIbYL1u1AYoPi0HEmNDPSc=;
 b=uPYfOrBeqDDMfDZrUjxr5wtlAa8/poTQ5gbu+uDtVcHXuV5Ay5AETlC6O2EtN2f2gW
 vxpbUQmmHN7Ys5ette0jC50TIMX++6OpTrhnVCo/jc7dLG3IaRRtjwpnoijfApv4iQIN
 3qytccVosV/ZPY6p0n2x7qamVG7NZqMAVMVW6bhG0RyB4H8fw0f5JaNZppXrYYuXS+Vk
 wEwqjcZo2ZuIjI82T74LaFLrQW3Cl412jUOQX6h3ZeTS43xPmcDn5qHnmPuP1mQhDOso
 ZPwqHB9CV7zM9vTQwHZWq2A9XpMYsVdiz+LkUlHo0F9iX6BDu6yPhYwgQnoDLpZDJCYO
 NdFQ==
X-Gm-Message-State: APjAAAUjwIg7wPX+CY67xt/WFSNy84yo8Bh4DlyoytvW4VGHSs1rTEhG
 uzu1rXL44JrmGr5B3cFtYj56Fw==
X-Google-Smtp-Source: APXvYqyHrsjIv6iA69VxrzeSvvkWJVA1ZCYStwgFPwlD6yYAE9WHbvTRzmgTR7jqHjpRqAb+QBnU5w==
X-Received: by 2002:adf:fe85:: with SMTP id l5mr26701545wrr.5.1566900192806;
 Tue, 27 Aug 2019 03:03:12 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o25sm1816289wmc.36.2019.08.27.03.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:03:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/3] arm64: dts: meson-g12b: specify suspend OPP
Date: Tue, 27 Aug 2019 12:03:07 +0200
Message-Id: <20190827100307.21661-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827100307.21661-1-narmstrong@baylibre.com>
References: <20190827100307.21661-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_030314_687930_3D7EC86A 
X-CRM114-Status: UNSURE (   9.07  )
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

Tag the 1,2GHz OPPs as suspend OPP to be set before going in suspend mode.

It has been reported that using various OPPs can lead to error or
resume with a different OPP from the ROM, thus use this safe OPP as
it is the default OPP used by the BL2 boot firmware on the 2 clusters.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
index d61f43052a34..00ea181bc018 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -39,6 +39,7 @@
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <781000>;
+			opp-suspend;
 		};
 
 		opp-1398000000 {
@@ -99,6 +100,7 @@
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <751000>;
+			opp-suspend;
 		};
 
 		opp-1398000000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
index 046cc332d07f..d68323c6c780 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
@@ -39,6 +39,7 @@
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <731000>;
+			opp-suspend;
 		};
 
 		opp-1398000000 {
@@ -99,6 +100,7 @@
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <771000>;
+			opp-suspend;
 		};
 
 		opp-1398000000 {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
