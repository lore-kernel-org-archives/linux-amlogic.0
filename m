Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA039CD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YAXQwnPDXiIjjbaG2Ll9wIpGn6/fTSssBBcByrkTEI=; b=AkXNudtwhZoCyB
	KNyrKWP/b5J7IoOo5MyVXBQw4QYICuCUOaSDdcjfYnfdN/4sjgLANVbdzdtABAwvAepYz9eM6ihAt
	WSCsQbZTdyuPOFxknAkDRn3rfnHu4CJP49fHRxCSW3m5Le5g95VfMa9G3tTaTrULdalbO+D0bMPjX
	8bv4TUm5qmzAHdHUQ+fUjl/91dAnt+cZuQ8JjUS6dILc66S2M1axFiFxuxE49mHgpVLsg8V0WJ93m
	V1EzzO8hlCg/ed6rTwTPhjmMJSXUgbsxkvX6M1qqjJh8/YHvizTZk8Id6qWFdML32WGdncr/hKCG0
	0Ii++paiWoDKL9uXynFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVn-0000000Gnkn-1Jic;
	Wed, 17 Jun 2026 07:16:35 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVl-0000000Gnir-1rD3
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:34 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c858cc9870aso252436a12.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680592; x=1782285392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=rEqzDdV1Jd8JjsIJblAzricJdihf1c0jGpClFdRlDnEbbdIZSwC092d9X3h/l8vk2E
         aH/okCqeg+N625bNhCG14cqdgBmCAFje94JSpPVLT0HBB0FMZu48vDd4uflih2picQLq
         6PpxbTkKlg+7OBlzVyxhorLMpzAXHP5YfoHjIGX7aB2LghGSyHLGgExMaBNid+Ee85BL
         WF2BGYuiLNsjmOPqwNwawMpO+3beXy35NbQaQXsdc9nVF8BrKqpntXKnwtcsx3FGxNQp
         Hpu5nW2S+0mffOa0x6y+Rlcz1qkD4gsbzQntvmvk0pEuCXow5UemQZSBnWhKqMdfp+pe
         HocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680592; x=1782285392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=XvF9WVIpXQRcYIUqn6TXY4WBUN2vuHIxPI2cHQxK415D47QRNSKZtOcsMIkdRwou0I
         b25IsltJayOTNzhc7/W01ntBOcDK2KCZDcZ+y47nYAtii2Bq6u/g/XBMaleBsz//sZPW
         L02m/iGntGrixweDxr1rFVKOZwCDgOmzyLxfFb/HpmNycasV9YhBHIdxTESghh0BgfAF
         PN/0Q0Yga4HcGmxu3K02/T4FNtWv3ruFRjsOpiGkAfH6jrYYztICerf9qXbWpGk+ya6+
         rF2KBOzbOElR6EREtKeV/bgYGQ1LvZdLdwCbvlh9pF2NWa/pIKtyalKORRtoktZ3I+za
         3Hyw==
X-Forwarded-Encrypted: i=1; AFNElJ9hwtU6WsWU5Gge1+gyKeZQWDVKmhMi81U3Eh2bOF6/X1ciAlQM4ZuuCmrjfrKfnW1JpZxmCWDK+siaGyTf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7t0627ze8g3M+gb9WYQXMZBwfIB8xpvlUO1npY2Z8U1VEPsQ2
	Mo0os7N3S5kguhuII9esDCn10g4fQ3azbCcdLbxQ5eU+rYpSroKNvtZU
X-Gm-Gg: Acq92OGAW6Mzn1o4iW6RT/DStekXzIXPHLs79mOepen8npX8P4I0RQU3fRly2vziDiL
	bwu5txiVP7k9n3RW09CN1dAXmKpkkqUzfDu9TjZLqklQDCM0nFJ4dM/dEm4dVMIRPeuqhZPQXIL
	m00AdYkeFYhrfaJghrfugO6kgdKFn01fn9BQcpE8NcP+ZF8dH7x4HKkwHxOgexQ1jw1D+Gen7mE
	d0aaYQuks6UIFE201eXTcg9Dmpok1AJVSdQL7oNh4j4ffRYMYw5dNumYf8eHND/hmM+wThE+PGw
	d98zGv1jLfopN1eSDc35lMsIWNKm0EKVggOZYywP+CvDlTrmAnvmEsmdmgqShCQ64pj8k8T9+Hd
	7CWWF++TVn9JVM9tuDvzQK0nDqgr1z+P2A2ggoI6nLRrJsWOgqGB66srpxmMBq2zdSQe+7bS9Wd
	Nm51djB+0OjQ==
X-Received: by 2002:a05:6a20:3d1f:b0:3b4:640e:f6c7 with SMTP id adf61e73a8af0-3b8dc83dedemr1795872637.14.1781680592429;
        Wed, 17 Jun 2026 00:16:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:32 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 17 Jun 2026 15:15:57 +0800
Message-ID: <20260617071604.635627-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001633_492373_B4039923 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6457667d974e..8ca3ac09b306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
