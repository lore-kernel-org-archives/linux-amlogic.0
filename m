Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F02C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jan 2022 07:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvyLAV+Z2jtBH37wx1uAMWDCS/MPpQi5d0Q7m2ZZw6E=; b=QepJOOuwGMUaYB
	aqzQ5T4hjLQCJFsUQ9D+EWAh9JEBV00e6ErNB3c3SCxqCq8tPp9B7pePK2oXhXiryxCmhJz1LpJ7w
	Qpb/aovHUPQYCqJoSyzXDyyueSdE5m8a9x/kSaaYRgrJhqHdLKQkNrFffwg5jHQBY1mmX+mwzXIs3
	StsZ+24cNUk2bWSo7LW5PDfwdMesmlVCESO/CWP728XG/FZXxItdtzFrn021b6HJVVmLA9hwbWjBd
	MqEZVOQ3whqMrCkPWmRR89L4oYhVtKuZp67r//IMz8gQJNxQNMGgmYVcpSjsy+rnraIqtVIsljaG6
	96WorRRhlAtY+jeP2OUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBAtS-00Giji-0Y; Sat, 22 Jan 2022 07:33:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBAsx-00Gib5-Ko; Sat, 22 Jan 2022 07:32:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id a13so3782730wrh.9;
 Fri, 21 Jan 2022 23:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qkDZRQEWdk0lu7bNuQSV4AkBZ5HIfgnjrIjv3tIsJzY=;
 b=AzVZwg0k2W6CP3Fh8Xm/bAgl911hncaM1uIGZIDornrKOcgHJsotYAIwvmmZ68Tj1m
 uocBG2841Mm541VA8qWEOfyWexZg/MpLw2+DBYtxMUIb69sNn+DdpTKGPNfL9w8PyqSx
 W5tBDu8hgFN2/ySIFn5ncsh19EpWlow6J2xjjYv16qMq6dj9OpIxsBsaEMkGV++9at5U
 MfkunTXl1DZa8TIEQJVsKuJCqMyI3jf9gnpqu8ZHhUR9X+7OnBj+V07BA8btKQNpum9H
 Zv8mKZhv76sq8hw2BqzK2MPcSJAROENmXlNVn7whiOBYhx7J0BGTBZH5Bw6pEldZDxYi
 RGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qkDZRQEWdk0lu7bNuQSV4AkBZ5HIfgnjrIjv3tIsJzY=;
 b=KbctdcpSQRFarhmkHF9iMmWGTgn41f4Oh2LWIX+DjZ5pQNl6qqK8IpVRVQ/AOgf0JI
 jYVWdatKTvpGXBz+bxnDdAik//CKt7XInPL4CpOctUw6xOSzofaaZQdDOG1gL3M8V+DJ
 VH9Et1BBzbEHxXmxAOli9nmvEw+7Lp2CYPsTS6jraR/tXdA4TVN/Xu2rL4ZH7zCMalGV
 KigRZTQjR8u4WnT6U+1XCH7AMiYzgw2XxoYQ3bEvqry4nU1FxuPRYnZm2TyoRzYL9GNE
 BkFxusEapzJM0V8vA2wQ9SYvHLgU0868D07ewpEL7JD6LepgZygxx1YYGLXUXAjO49gS
 LTvg==
X-Gm-Message-State: AOAM532uxl/vtHOX7egKuY5nAoeYnncQYJrt9vaMxs3dSUSmaRkV1Q2z
 oGJ2XiLRjiVmmF8Wu897sqA=
X-Google-Smtp-Source: ABdhPJzE6hu9cKNLdsUd3UjqpvEmHhwfp8Pn9fuydve0X9sJ/0BrRmpM9JHCzgaX2iCUlWGFFlf97g==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr6336244wrv.13.1642836750180; 
 Fri, 21 Jan 2022 23:32:30 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i8sm8970485wmq.23.2022.01.21.23.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 23:32:29 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Furkan Kardame <furkan@fkardame.com>
Subject: [PATCH 2/3] arm64: dts: meson: add BL32 reserved-memory region to
 GT-King Pro
Date: Sat, 22 Jan 2022 07:32:20 +0000
Message-Id: <20220122073221.2398-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220122073221.2398-1-christianshewitt@gmail.com>
References: <20220122073221.2398-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_233231_714263_FEF69B80 
X-CRM114-Status: GOOD (  11.19  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add an additional reserved memory region for the BL32 trusted firmware
shipping in Beelink g12b devices. This fixes a long running issue with
boxes booting from Vendor u-boot where the board wedges during boot or
soon after due to the (un)reserved region being overwritten.

Fixes commit 0b928e4e412b ("arm64: dts: meson-g12b-gtking-pro: add initial device-tree")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
index 707daf92787b..7782fc9fc12b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
@@ -19,6 +19,14 @@
 		rtc1 = &vrtc;
 	};
 
+	reserved-memory {
+		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
+		secmon_reserved_bl32: secmon@5300000 {
+			reg = <0x0 0x05300000 0x0 0x2000000>;
+			no-map;
+		};
+	};
+
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
 		#address-cells = <1>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
