Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CB4C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:03:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F7121744
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:03:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S5Uph5Yn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ay+Hq9I1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F7121744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1X/7WZs2yqIqtymMxz1rlPZmL8eNa2AYAQxO3esJYdM=; b=S5Uph5YnSvpr1Sb15Vlu32RBnZ
	eWg9/oUQIdCxO3plUjm6BqHa4QZxHjhp5VVTRG3qSEFtZyz75vipiWB+Jc7ckxjITku7pxaLn2Hwc
	hykqgTMqzLxQgk52m/NSYpAB8pWjhANekL/2B8unPVDKxiPkJdwOCOcYulgaH26edTRLiGxsdlcKy
	DpKts1H4pZWDJaLoUiP2ibgtwjalfoDkOlAR2LWXeOCwqpUZXz6lnhyETOsJP8bm7EPacMbnMvXgP
	/K8vRoMmVBQDC/tF3hovK5CtqqONz0QKOx+74CfG9I7L7Woh24d45REEVUYJxs5Fmw4A+0KEa+sMp
	+QmsrIdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1jkZ-0006QX-Sk; Sun, 25 Aug 2019 04:03:31 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1jjU-0005eu-GT; Sun, 25 Aug 2019 04:02:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id k1so12370254wmi.1;
 Sat, 24 Aug 2019 21:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E5nNhd18MvwU8IC7GxybIhRsED8y+5jrB7YM1thtsV4=;
 b=ay+Hq9I1SH/G7X2WBWSkTU5FtlKBlJPSNA7Naj1Cj4ThMxpMKFn0csUhA9ucx26arS
 EbkmTSYQUxj3zfsdmkVxsRVdFmJX2R74cThGlcbaWLK3QkRFxv5IcBDI9oKaxoUV2s20
 y5dLzttp22mFpshuwRoKWonptKX5EaMDKgLSJldSR19p4q93vQcFQ+CjGQzGkGrEWhkE
 c1dTdREt1QTy90HFJoWi3ZTzC62Gaz24VGEhEOU3MlfAzejSjZHqMTFbNzBLmQZ86cMH
 zNhQE2HEGN2ahhWbsv118AURzWO2dhwi+gFXoky7l55+2ZADU3n8hhjpq19B9Bjs2t1E
 5Xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E5nNhd18MvwU8IC7GxybIhRsED8y+5jrB7YM1thtsV4=;
 b=m6cV2LhE7BnI3ATe1YWrUQi4CLFr7H5tHnxHVjk3qm6lVIhYFgoFc+ZkCrasD/orM2
 6g3WemrD1uvByrm4yozDiLiBGp66HqYzP5oxNnGuqOfj6ahjiyupMdJxlIUFtm4YybCP
 NzeH9aLtbkEkYOc7ASAGuhLBmjm+DPmkjxuYcuk0o/fSn2OlVp+qC+G7j73a4NXzFwjG
 qxUE0ODMwrPuRikQm32o7gt9VUpX+osEeJjbW036uWogN/5InJNSnoTx+MrnOpCa9pzV
 eRUe6s5nAblH69XDy3QuCKgOuGo0TISVrpdV0Y03XiV1tpnqILIvcF0QNLH0ww1SVZkR
 q8Ig==
X-Gm-Message-State: APjAAAWQCjuG2YgEKoQtUKS/qvW1hIL23/v2Ob8KAZGHoJPgsIkOAvGX
 VH7C+9ip7+J9aid8XNtAgY0=
X-Google-Smtp-Source: APXvYqwP+cAgov2Lv/Km0Kd45gqctZDqhITi9FE+8G+wJU7Xj+jePJhogxyk7XN3R5IIeLoyr484rg==
X-Received: by 2002:a7b:c019:: with SMTP id c25mr14337691wmb.116.1566705741664; 
 Sat, 24 Aug 2019 21:02:21 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id a6sm6820985wmj.15.2019.08.24.21.02.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 24 Aug 2019 21:02:21 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: meson-g12b-odroid-n2: add rc-odroid keymap
Date: Sun, 25 Aug 2019 08:01:22 +0400
Message-Id: <1566705688-18442-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
References: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_210224_545453_438596EA 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add the rc-odroid keymap to the ir node

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 81780ff..35cef76 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -314,6 +314,7 @@
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
 	pinctrl-names = "default";
+	linux,rc-map-name = "rc-odroid";
 };
 
 /* SD card */
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
