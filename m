Return-Path: <SRS0=Cl/A=XE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC39CC4740C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:03:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC96C2086D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlE+YSa1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2l6LxPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC96C2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tgGmerhbXlMGxd7SBvMZc6hAY9VsDS376Kql+vFudcI=; b=RlE+YSa1oHmj+Stehkmj41CnG5
	iIrwFVYPNRaKFG2ix/RCZ1J2fuKfgC3GSXUtM9PnB9Q7nIl/gznuLoxpxusJmHnWVvKBmUC+JX9e3
	PJnCjD66UmHtOdsqViLBQXgduhxx0VyEGdwty8Cs/tpxd2jI4EDBkgqSwRIgxHHBSn8L5YXg0PZbA
	LTUeKq8CRI67oYSGS9hRhQaDRQETl4hrDHIKshCrQ1Br4nO2gbLPlpSIkxxEUmy0Iz4Xjo7Kor8w/
	XURddi7l2iMYdWZ3CdVela2o4XdfslGhtzbw4XzYKMT3mGp750vaXGObm5QjxGuWPe58BtQIRijwD
	RHonpwYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7LCa-0001zr-4B; Mon, 09 Sep 2019 15:03:36 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7LBU-0000yz-Br; Mon, 09 Sep 2019 15:02:29 +0000
Received: by mail-wm1-x343.google.com with SMTP id 7so4639799wme.1;
 Mon, 09 Sep 2019 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5xqEYreEBmZYyAfTC+RKgBu5G8ylv8O/lVjj/QJ6gcw=;
 b=F2l6LxPMIDzdfSFMzT+toWLV47+x4sa8AwBmE6Hzu0V7pxptBR1Ne0ukW3Og2JE9nO
 7lWiTWOUu4QihXaYX+K9E1qdXUdT6i27Ep+3kNlmyeqYW5z5Hiu3soyJGhD9gA3GKltL
 f+X4rrMXmhBM8e3PhA6Y4RS41qVCksT9xEUkVv4dtlVkQZ80rwbY3GPmZ0WAkLbnYjc0
 p/dNp2mvpP4h9eSFEef9fl0iXGxt7ARatCyF3h9i9Zt6HhSxZVldJ4Kro1lzGAF0swj0
 nH/vgwboS35iDkZn50CIqf8s+yAJQJaitlqHsKnXpfALCcNIz1tEFNI+vtYBMH7fw6Tx
 eYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5xqEYreEBmZYyAfTC+RKgBu5G8ylv8O/lVjj/QJ6gcw=;
 b=ZxP60FHKRdK5KTEnK08CluJHqFFxzWPVXGmv7G2tbfEqO+B6Y+cfzU46lWsvHr3BdH
 sQS/5SWsD3+eFeztGNDaoj4Mp5MkUTa70hA3QXICWPA16l81hAAMC90rhxVMj4FC2+r3
 tuO+M3CziGK7yzbXmozFk/2HTZXxp323vP8NgwLyZRMRwUr4Z0fIJ/dCPZsvSPzBYnhS
 q1sZOMUKfBjiUN5eJCNc/iWX2N+gR4YVlrzLW9f9JdcWpV/RZWHUcePuOdgHK5zG4K5O
 o41ZHITmPign6OvhO7snkQsUXUODFDqoKXMgISRhgh7KteDHJ377RsqSxOYotPnEtbwY
 4S7Q==
X-Gm-Message-State: APjAAAU5wa3HzVVgnPoYfpyV3XaBwmLmOdOnp/M7uXKcVHzC+3tPaBfF
 lc3KrtkshNZ66h80ebrFBEc=
X-Google-Smtp-Source: APXvYqxUDRLwK+SyWE8xuL/itq7LA23ccybuU7D+8c2JjcNssmx+4Hg3o49fxC7xXs89sGfOZc2KRQ==
X-Received: by 2002:a1c:c1cc:: with SMTP id r195mr20418891wmf.50.1568041345217; 
 Mon, 09 Sep 2019 08:02:25 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id s26sm27755397wrs.63.2019.09.09.08.02.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Sep 2019 08:02:24 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: meson-gxm-khadas-vim2: fix uart_A bluetooth
 node
Date: Mon,  9 Sep 2019 19:01:24 +0400
Message-Id: <1568041287-7805-4-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
References: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_080228_413227_00EEC60A 
X-CRM114-Status: GOOD (  10.77  )
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

Fixes: 33344e2111a ("arm64: dts: meson-gxm-khadas-vim2: fix Bluetooth support")

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 989d33a..d392062 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -409,6 +409,9 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
 	};
 };
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
