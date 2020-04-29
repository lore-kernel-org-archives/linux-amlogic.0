Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BFAC83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:20:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095622082E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BZjBTuUZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="I6xBJ2Sg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095622082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOEtNDASR2LE/ZvOqRZ6irTSNelA7KlDV+cXKxHptK0=; b=BZjBTuUZj6mGQq
	NmK71+3iuIe9r0+mjR+zIuByCod5LMWM6fNC1pl12Twyaea5GUAYLcsNlAN7iwxlVxW/Roozz0/kO
	sGfUv8UKLDe8nj+bpJ7zTEBh9FCXFCR5sTyHigdVwCt59Jb6CXHNAsyDLYqtG1OJmltfPEUxSsHaB
	ZN9B7idXVwpZhqOF/Mz4fw6177/5sVEs0Z6lY5nF/CArXLKvqFvpl6gZ+QUjTInLhwy0vIyVI40e3
	iHJITSpL6hmtl81dArunTVX25vYxHIjSZQWbECEovxX8+kao1vtFyUL1MkfOeNFETVmuy2We5Y1Ur
	dc7P4rBp8npIuF/rJjMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTtBT-0000ua-JF; Wed, 29 Apr 2020 20:19:55 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt92-00075O-Uf; Wed, 29 Apr 2020 20:17:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id x18so4129811wrq.2;
 Wed, 29 Apr 2020 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ML06J9nAXnrGfb8Sw/sNjsFqqfba47oOWTFdhQokhaE=;
 b=I6xBJ2SgUjpuRy8PYgy88Vghn+35By2xz7BMjry77ASag5aKvIV0Qmf2JES6q8lIqX
 joPBLtr3A7Ztb/TQSlS0ammJAasQdIgPRAH9n6KVnbv8Dg+5MLX9ei/DI5o+4YgsLvjQ
 e0l//7Tok7gTPJYBjWFNKCwMX2VAfyYxxsbHmoCF2dWyNperl9l1u2w4O+Rqxi2v21P/
 vUDnGMSfqpvBfQ37f+oiepTpjsxV47f5ElwXR8L9zEMP2XwFpS4HgevSrzEs/DkOjxZ7
 1Q99zESKfDfl/IUuTPxbjD4lipMhJEsIj3HMKV83VbQbSl9DuCSGCXMrJ+SpJ2VeKacU
 ymSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ML06J9nAXnrGfb8Sw/sNjsFqqfba47oOWTFdhQokhaE=;
 b=uWUkGgXq6ZGN+2jYsfKZKXIv783OPGMmpY6h0fcLOwt3p/y/kQeszjDEQqj4HCuGC9
 8VeVlC7EP8EhKGvLG/iBuLvaSxUWrW3djtNf6nNedQjvYGUTvmKl9icLn+c/rk215QSA
 6NU0glxjCvIPtZF7kNVtUdPidUizFjxOMSBklTcA9tpluSbpo3VPaJU96otRy6DeyhUu
 OE1P0kORAlCG3VG6sV35xuwvxMyjlJMkryVDQH7jPv7mo7YEHhgIt0uyOW2jWgKWq2Cj
 IUR/T5+5xH7Kaon6Udh0fOaEJy1Yde1T4ydyMz6mRgdUdHxePgh0iCVCSk6P7MAlIEJ5
 iYrg==
X-Gm-Message-State: AGi0Puae0FYF+tG4u/WOibP54fGrDg1V5KtlJCEv2noimw4a3LY7sS8H
 5FfjxVe8cf+LyOKJ1kc78ak=
X-Google-Smtp-Source: APiQypL/Ts+PnYJmzQA093RS5PL9mTk8d7JdiY46vyorm6USMdg0g2olx5OKhnYkn4+1TCd7ozkkOQ==
X-Received: by 2002:adf:84c1:: with SMTP id 59mr41790968wrg.350.1588191443643; 
 Wed, 29 Apr 2020 13:17:23 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH DO NOT MERGE v2 10/11] ARM: dts: meson: Add the Ethernet
 "timing-adjustment" clock
Date: Wed, 29 Apr 2020 22:16:43 +0200
Message-Id: <20200429201644.1144546-11-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131725_356869_88F0FE6C 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the "timing-adjusment" clock now that we now that this is connected
to the PRG_ETHERNET registers. It is used internally to generate the
RGMII RX delay no the MAC side (if needed).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi  | 5 +++--
 arch/arm/boot/dts/meson8m2.dtsi | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index e34b039b9357..ba36168b9c1b 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -425,8 +425,9 @@ &ethmac {
 
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_MPLL2>,
-		 <&clkc CLKID_MPLL2>;
-	clock-names = "stmmaceth", "clkin0", "clkin1";
+		 <&clkc CLKID_MPLL2>,
+		 <&clkc CLKID_FCLK_DIV2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
 	rx-fifo-depth = <4096>;
 	tx-fifo-depth = <2048>;
 
diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index 5bde7f502007..96b37d5e9afd 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -30,8 +30,9 @@ &ethmac {
 		0xc1108140 0x8>;
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_MPLL2>,
-		 <&clkc CLKID_MPLL2>;
-	clock-names = "stmmaceth", "clkin0", "clkin1";
+		 <&clkc CLKID_MPLL2>,
+		 <&clkc CLKID_FCLK_DIV2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
 	resets = <&reset RESET_ETHERNET>;
 	reset-names = "stmmaceth";
 };
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
