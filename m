Return-Path: <SRS0=1Qmn=2P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD30C2D0C3
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 01:07:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634F120679
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 01:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jES4KS7M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="msRtbZFy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 634F120679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9g+biFvzFjPkCZg17M5b8oYJ1RBwCpM2KalI/KdYxaM=; b=jES4KS7MvzpstC
	0LdTbVeOWmFF13zqClFYWmYH6RDEjFnl0Av0EC0GUkg7wj5ZPwFXPiXsart9GxTkuY44z34rsT7lz
	f6VkL7i0mXTUyVe7jBXq48T88UaYGc4BAoUBGZix21rUipVg7IQ87sGq27W5sWHbtKNtNj19/1bJ9
	iOecdvK1nW4MYZQ6+niViJZTZV9PuWCVSO2CzU+PRPYodS8A/ZUIql0xlFAMwC9qfk/vGMR1JGfTL
	FtFg43oTMJxM1dvTV36ExW4LXhR+qG90eSmBbbailZKwU6kO2NO0QY9snQEKUBcbu14rWgQ61Ej9O
	qChl4Oeq2WVPm3WIUnEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijv8v-0001dG-HT; Wed, 25 Dec 2019 01:07:17 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijv85-0000de-O3; Wed, 25 Dec 2019 01:06:27 +0000
Received: by mail-wm1-x344.google.com with SMTP id d139so2807649wmd.0;
 Tue, 24 Dec 2019 17:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4iZPYSHcETHrh5Mkc153Wxpky0z21UUEkDTh50Atls=;
 b=msRtbZFynJxyeGYd1lLRmtThZVgLm2dEpIET/tJJqL5w33Yudoh1KnAI1z44ZUCWTp
 xfufU2VgGKTFimD++HDIvcWWQR3OpZB7AgJRoxq3fNf7Ln/ggHPZTHrk+WwEPdIRNeZu
 +xLf1p+b2bOs8UbWJ9s6M8XNAEkfZbJPCdf6frKrEf6HlfBAn0PSKAaZscsdrtItC+dB
 zRermTHOfe0Vk2AfNHPwJKJsbRrXD4ZGEFJaWBHMzc0/ezn21ZBi+2rkJ6lC3xHMaX6a
 zkKUrI7kSAt4tpv8DxJVICRBIwZgUjJes8tlIe7yNyJhHIyxkLf0foj1DTnc8K6siX4R
 Xl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4iZPYSHcETHrh5Mkc153Wxpky0z21UUEkDTh50Atls=;
 b=YE2W7Y54EEedT8G2wtPo5Pt8bWOYACEIJQHBiUv5GYI5P1ytt86/T5t1UunyMoAT0I
 1jbcqj7sWwBrRy6gXkcFl5CUj8/m/YHD2XyKU3xLiHwIBQPTb+ZAoWYnkGxtl/DQCH3c
 yEpSSi2UyTxLdtYJaX/m/fVqjKUPG8k4jL6zRfdJEA1oddqx40jCeKY0mc4Zvw7LBpSP
 SIdwDuG/4Iu5DOTybi8QmXSl3O87oPND55upYguLR5SxZcsRIyAk8jxAeL5lctlJzzwk
 o+YVM6sMXi7VZY2RWT1pmjwt+umUJgeKcHkE+Do1G3Ap6xFwT3+5IOZVMqeUjN3VKqaS
 BiqA==
X-Gm-Message-State: APjAAAUZAXgi7Xxcti7l2tWTCxweB9soe4kokNQy2xgN8cvTG2oxX1Ac
 2OOielPO5dqqXqpcAT1I1L22xAzg
X-Google-Smtp-Source: APXvYqx49sT+9J+WOgr59XRUu/8x5Jzm+pok9R0Glahlhx8JQErqlHoMTLJicMdzR504M8AdRVZ4Dg==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr6508859wmb.150.1577235984382; 
 Tue, 24 Dec 2019 17:06:24 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x26sm4066127wmc.30.2019.12.24.17.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2019 17:06:23 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/3] ARM: dts: meson8b: use the actual frequency for the GPU's
 364MHz OPP
Date: Wed, 25 Dec 2019 02:06:07 +0100
Message-Id: <20191225010607.1504239-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
References: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_170625_803728_A9BC6E12 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The clock setup on Meson8 cannot achieve a Mali frequency of exactly
182.15MHz. The vendor driver uses "FCLK_DIV7 / 1" for this frequency,
which translates to 2550MHz / 7 / 1 = 364285714Hz.
Update the GPU operating point to that specific frequency to not confuse
myself when comparing the frequency from the .dts with the actual clock
rate on the system.

Fixes: c3ea80b6138cae ("ARM: dts: meson8b: add the Mali-450 MP2 GPU")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 5b5791924753..e34b039b9357 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -126,8 +126,8 @@ opp-255000000 {
 			opp-hz = /bits/ 64 <255000000>;
 			opp-microvolt = <1100000>;
 		};
-		opp-364300000 {
-			opp-hz = /bits/ 64 <364300000>;
+		opp-364285714 {
+			opp-hz = /bits/ 64 <364285714>;
 			opp-microvolt = <1100000>;
 		};
 		opp-425000000 {
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
