Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50512C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jan 2022 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne3TQFsaI6Fe7FiTVE2re3PRooHbCRK6y2Q6XRNrJr0=; b=t272fI0bMpq53G
	3D/QlhgPFPSYjB1YKyilfnY2xknCC4b5FvrkverE7Aw6j3l+HacVWaJSEJXobInHik6Dy63aY0Z+A
	4q435aUIrsylr/EZcjfalE0MTf2Mn/elOzbcxpO7iBU08NDQj4qat7TUv/zPfK5AowHfZc6qBJukV
	T1UVl3Vueh9WvBMk9I3GaEqeUc3JOvlFIjWu0zr90ROgzi17vssAFEhKwppOj3XPAuC7I7srieecU
	MZv7OMhLScG/cIEbeOOf4nkvY22v0WZfcMW/Q+9WbFmWT2SYZOsHGYLsu7mxbLFSVN7FsO2yC2ooF
	gILcO2SnTqYIYjBF/80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBAtG-00Gifk-GB; Sat, 22 Jan 2022 07:32:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBAsv-00GiaJ-Tr; Sat, 22 Jan 2022 07:32:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id u15so3773515wrt.3;
 Fri, 21 Jan 2022 23:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vQPxP47/SI1S5KWtgWG+VbRHmE9OA9+/Jfo9crf1SUM=;
 b=VYkOYhzeDSKuwhEEvi+w/G4AoJ4AwR2N66fCvdT80WOuzy68msz8FaG663DO+TruuJ
 0U9G80k757Rjhs2GuvbTTKhTrxQpCyRf8hMQCFTPQ7pzIHF53nOklvGkNQnI7QqPb2Y3
 oI29WF96Eyy75ElMMKVones1q4BlWeAkvsfyfod/wEKt0P5MPS0qf48BfXAdnOzcX/R1
 YtketIMq0nFtU4trK1Zezy9bbBqBPPFCPY82MpPqn+i5pLHmMsi7Ea4XapMM7okkr88p
 DWGpg0++o+q7qqNIjCVRxfPyy0oJ11Kr1ZBm+1xeeu1M4zOdRl/Ey18Ud79nsRzOCmUo
 m5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vQPxP47/SI1S5KWtgWG+VbRHmE9OA9+/Jfo9crf1SUM=;
 b=cgtCIW5HTNv02k4r8McX2ryzCBB4CVM3IEpFbSJrK2mIWYlrOPwO3fN0mA3SVFKAQw
 zXIEzupJclWfGMNmKuNrkd4i/tcaFKypNs5+fhfK47TDstORmcQY5XqKhedDtBWOBzl+
 jJQxLDvoAsHDtY01BOCL9Ysj4Gi5e+zvlLbRBOOmwKweDiVzfqmqvvNoT4QCKbIo6VDR
 2NTX9glR2N4my11UmEyuL0AWzYGfcFRT+XnFuhPd8ew89rw1nqwIs6B/40fWDBxRSzH0
 5Qs96atAE39DNTA3LJ+9F8tnWqGI5bXHn3tslEgzycgEA0iAtCiAerqFuB9EKaMP7dNH
 hdeQ==
X-Gm-Message-State: AOAM530p6uXA04mPEnskk2YDPyjvqG+v7rloEap7pUOxidx/xKHkIr73
 M64Mor6P/JTSAhs8Ekv29v8=
X-Google-Smtp-Source: ABdhPJyHVe7oK5iQ/081jmH9XrPsNUo/9dNQ/COldDs2uJnD5Z1Q5FUbsF4G3/d1kz0/AJnVWwJPAQ==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr6747530wrs.490.1642836748058; 
 Fri, 21 Jan 2022 23:32:28 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i8sm8970485wmq.23.2022.01.21.23.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 23:32:27 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Furkan Kardame <furkan@fkardame.com>
Subject: [PATCH 1/3] arm64: dts: meson: add BL32 reserved-memory region to
 GT-King
Date: Sat, 22 Jan 2022 07:32:19 +0000
Message-Id: <20220122073221.2398-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220122073221.2398-1-christianshewitt@gmail.com>
References: <20220122073221.2398-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_233229_984107_546B86FC 
X-CRM114-Status: GOOD (  11.16  )
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

Fixes commit c5522ff9c729 ("arm64: dts: meson-g12b-gtking: add initial device-tree")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
index 5d96c1449050..58a300d6b545 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
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
 	spdif_dit: audio-codec-1 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
