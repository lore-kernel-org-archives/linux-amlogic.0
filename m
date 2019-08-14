Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5966BC32753
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B8F72083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cbkK/Vl6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NgiLNEQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B8F72083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEhDQfOKH5I/R3iWCJLgiUr2D8/9GAld2qS1vSLvmXU=; b=cbkK/Vl690G4O0
	kBFULW71nO7ABWymJY2G7cTh7Mgj5h4ox8awSut3NJcvNPWVQepC5Oct+p8rS6mf+FJSShMQ/wLjD
	mCThdf6w7lqEignKo3XlePx+t78mNFR+iFJsJMFw9aodmOy2nH8OtdDE8aKQkwbL8oCb/69CFkqkc
	qtK8nGE7nxvMMA7egbbYy00UgAdrAysG7TYtR9KXsKlE7iUroFUu3LWDzTs1WNrDGnr1tSC4V885k
	u+dqU2IU/h0c3F5m6zpDn1jEttpwsZ2Kt1fbCeBgk/XBf1dyHo9h/OUrEAcpc7ER/9yB/KIUrnoQP
	X+ZpEVSCm3feDu/FoBmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuKz-0007eL-7Z; Wed, 14 Aug 2019 14:33:17 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHR-0002lE-8J
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:38 +0000
Received: by mail-wm1-x343.google.com with SMTP id o4so4643813wmh.2
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cjZFeXutoTQ9/qwc4S4Gcm70WvgFxAPchw/gNgg9Wa0=;
 b=NgiLNEQtWUqX8P0Ei3iD8b+27RBLhfEvXaGa5FbFEKc8Bv5yrBx19Hhi8CxjN6q0Xy
 p0GFoQiVrVzNKOYiSNdP/YrNCYo8faWlX/7+qB6ipIC316sqZX+3E5tSEWls1PjjHbEo
 MOm/tL0LaspddVNdp0JWBIwuJp/aYgydIuRb024JoEm6xYNON8zIhaP/O6AjeXe5W5mH
 wXoXCkVcAlK/QpG26EUfCdQTlzKCNSHSZ46l8A8Vq553cSLbNMjU8GjL3DXxrJmNWBIQ
 7NVFnG1NIjtTDdOqlmM21h4P5i805AIMNsyvPqi75lnUIMaJXb+GFE26bJLzamvBZdV8
 ovbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cjZFeXutoTQ9/qwc4S4Gcm70WvgFxAPchw/gNgg9Wa0=;
 b=N9tAeiGTyjxg8/zKGSWXffbcrLJJ9vso9I/dkcEt+1FSEcJ2mVRmJDVxAbHDDtZtmz
 Ke0wwYxouPAB5u4hQlfd0zBJEeYnAOcQex3aw26jmEIAke+UnFAEDc9FL3fFA1rsDa7Q
 DSecY1cSunP1Cjh13wlV+6Q+12ra5lxgBGhZ6UAJO38Sw6nJiAv6zgDeRkldDpfVgPmK
 3VMxagakB86iaCkSi3moxwjSG88ENsKbxq/eH8z7SrPsXPZS28WYS97gfbQt327dduFf
 /dq+UdHHPmL0i0KmncohNhYWbiyn6gCJFMabs0pFSWPpftgvZ1G3Oj+jU8tCmbLIuRnz
 rWFg==
X-Gm-Message-State: APjAAAVRl8AatOp4dhpGtxCrohTxfJrLPY42baO79Bx0wUFup6C5cwar
 jY2hTWzyC1WmeNXk5RXYVAHmVA==
X-Google-Smtp-Source: APXvYqwnY1gffUMlCVMUCn3kHuB6YdQrHQx7tWm9YoFB/Jk+tK27whKhtRCrnI7ghOzZMtc9UWOcYw==
X-Received: by 2002:a1c:494:: with SMTP id 142mr8635972wme.12.1565792975630;
 Wed, 14 Aug 2019 07:29:35 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 12/14] arm64: dts: meson-gxbb-nanopi-k2: add missing model
Date: Wed, 14 Aug 2019 16:29:16 +0200
Message-Id: <20190814142918.11636-13-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072937_363955_4FC34A09 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-nanopi-k2.dt.yaml: /: 'model' is a required property

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index c34c1c90ccb6..1a36d2bd2d21 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -10,6 +10,7 @@
 
 / {
 	compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
+	model = "Nanopi K2";
 
 	aliases {
 		serial0 = &uart_AO;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
