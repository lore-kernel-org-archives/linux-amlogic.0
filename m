Return-Path: <SRS0=vTSx=TM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68B0C04A6B
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2019 19:40:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8459E21019
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2019 19:40:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I2BZK4Vp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="P1GAUOYh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8459E21019
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpmskmlFyciO4PY7jXDgK7Pqt+rv1VxAptzPoIWmXy0=; b=I2BZK4VpwlbKn4
	jmqgvdsdp68ymWeS6aafIYS3HrU0nlX2nt4AkM5urJgXhg4Z24CQV/mu/MaswcQAKF/MDxanAw+C5
	/YPX0f5/w2P2HgNlvaWymms2I4OtCj8sc3xKAEtst4rflMjBx+jeKvqWlxvmqnqoHdNMMr4SRifhR
	KC4KV9tuKWmkgmftF2mmFmXMiUGo6fvwY+I19eeW+Jki6Uk/iVcfYlLAX9NyAbKrkrq+23ZwkmS9i
	ufd1DIEOi7VuCy9KGiFYVgwI4SfIU6+Rp7PqneDKX/dNYt12oglgvMgGCxV6cauvLjw3ij4yfIP6/
	h4s2aOEZvMvsWkYG6lUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPuK5-00012Q-1B; Sun, 12 May 2019 19:39:49 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPuK1-00011D-Ls; Sun, 12 May 2019 19:39:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id 198so11785685wme.3;
 Sun, 12 May 2019 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1xqj/Zo3AUFkVy0zRgFkVBz4uDdS8LIxp09mdTlXIys=;
 b=P1GAUOYh6F5NDr6P/o2VZYBMKNU69JrmKXjrv0mJrQkAzO5Gr2ZqK2J5fTuim4vqug
 4fAfYWtolMpC1tPgmmCeJglHw1ly3XD42CqglWnjR0o6WnnBX7XK/OJ2Rog1OXts6Djj
 MNiT9SsNubOhKeCkH0Y354TJDzax+BPcAScpczaUsvHB2Fj04fBNbHVB2IRxuctX1jYv
 7R6bKG3KsE9L5q5frbaVkYqo01SIA+WhGqv/dFkPRShaJvcjBQfrF+9iHUbERptfJUgv
 p7sGaWqgfX9vK+od4cEAWG+x2fOZZnFDs2SkKhn7wxelYRAIoQnuXOIO9/k+ab5SZ3Tg
 X6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1xqj/Zo3AUFkVy0zRgFkVBz4uDdS8LIxp09mdTlXIys=;
 b=bJKip5Kb6F1zV/VhNScZ+510ax2Fq9jVjmYmrgOlr93mHxe9+ix4l+6UPU2aayivcW
 4tDNcH3G8U2e+w9h8ci8O1FsLsc79tts9PCBcy+O9FhmDJfJgAyvUHRcz7Yh5ZUnVGo5
 xh9m+nKVWxM7jJUtzyqCgjPUHIsBLMBQ/hFqetBhUaHRT03SxXaFT23n+/ylC02O+0zF
 n1kMeKzh3PphZCkIWRBamMSFa2XuHrsAi0SWNhxc9IgFKR6ajn2STEAvwWU4fpOt2H9d
 NgR1M6c7HyaXh2akjzPJ/rO05XGzDGyojjD2f4Cu42TiSyhTlgN3fJVmXBpVysiHKM2C
 GsbQ==
X-Gm-Message-State: APjAAAVULw1qMJOaHk77LbgODkJIevEySPMrDhKTP5jtfsaOZIVull4x
 xcwWgQdmU8vmJV/HVLr9Eak=
X-Google-Smtp-Source: APXvYqyKsuCV1ihDzofQdBkbz/XAwhXROCx9jK/t1SKZit6sN6YlPxvB7us/FY/5Si4I7kbAyR9Omg==
X-Received: by 2002:a1c:7e08:: with SMTP id z8mr13877489wmc.36.1557689983139; 
 Sun, 12 May 2019 12:39:43 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD00ECBE9107EA8EB108.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:ecbe:9107:ea8e:b108])
 by smtp.googlemail.com with ESMTPSA id c9sm8127719wrv.62.2019.05.12.12.39.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 12:39:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: khilman@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/1] ARM: dts: meson8b: fix the operating voltage of the Mali
 GPU
Date: Sun, 12 May 2019 21:39:36 +0200
Message-Id: <20190512193936.26557-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190512193936.26557-1-martin.blumenstingl@googlemail.com>
References: <20190512193936.26557-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_123945_712046_AFFA91A1 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic's vendor kernel defines an OPP for the GPU on Meson8b boards
with a voltage of 1.15V. It turns out that the vendor kernel relies on
the bootloader to set up the voltage. The bootloader however sets a
fixed voltage of 1.10V.

Amlogic's patched u-boot sources (uboot-2015-01-15-23a3562521) confirm
this:
$ grep -oiE "VDD(EE|AO)_VOLTAGE[ ]+[0-9]+" board/amlogic/configs/m8b_*
  board/amlogic/configs/m8b_m100_v1.h:VDDAO_VOLTAGE            1100
  board/amlogic/configs/m8b_m101_v1.h:VDDAO_VOLTAGE            1100
  board/amlogic/configs/m8b_m102_v1.h:VDDAO_VOLTAGE            1100
  board/amlogic/configs/m8b_m200_v1.h:VDDAO_VOLTAGE            1100
  board/amlogic/configs/m8b_m201_v1.h:VDDEE_VOLTAGE            1100
  board/amlogic/configs/m8b_m201_v1.h:VDDEE_VOLTAGE            1100
  board/amlogic/configs/m8b_m202_v1.h:VDDEE_VOLTAGE            1100

Another hint at this is the VDDEE voltage on the EC-100 and Odroid-C1
boards. The VDDEE regulator supplies the Mali GPU. It's basically a copy
of the VCCK (CPU supply) which means it's limited to 0.86V to 1.14V.

Update the operating voltage of the Mali GPU on Meson8b to 1.10V so it
matches with what the vendor u-boot sets.

Fixes: c3ea80b6138cae ("ARM: dts: meson8b: add the Mali-450 MP2 GPU")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 4b919590dae5..ec67f49116d9 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -163,23 +163,23 @@
 
 		opp-255000000 {
 			opp-hz = /bits/ 64 <255000000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 		};
 		opp-364300000 {
 			opp-hz = /bits/ 64 <364300000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 		};
 		opp-425000000 {
 			opp-hz = /bits/ 64 <425000000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 		};
 		opp-510000000 {
 			opp-hz = /bits/ 64 <510000000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 		};
 		opp-637500000 {
 			opp-hz = /bits/ 64 <637500000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 			turbo-mode;
 		};
 	};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
