Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548CEC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:31:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27FA32083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L+9RP8pb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="csK7yN+G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27FA32083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJ72FhgDoG+LpjL0yQRJ9LUA6kOflqTAbDQ1bQl0BFY=; b=L+9RP8pbqpDmIu
	5pSfncnwgqIFJ6j82I5lWhC8+k4t560o7XJBoTV1B8yHjYxrrBJjJlR/2umV2mTZMGEXbD9PLJwfL
	Sz2rUlCyg88BzrGxorjhyXzyJfAJoABfZjRdSc76sZ4SUGr0WScRkKxai+tQ2MQrTjcLwPy8E0XwP
	xla+nLvK+M0UPUvjJvV1nKT8L/zRDIs09mXHam3eqQyvLfeG8Poi+ZXTRv9e0U1M++3NwBebgrLAn
	UNad0G7b77NvdLlbC6bHJlu6+6bwjV603ehGDrxbJN0IIwSEypUxFHalVOV4Hgge53yO8XkO/k61P
	Tli7gWH7D/NqbT+eCYpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuJ4-0005Se-SB; Wed, 14 Aug 2019 14:31:18 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHK-0002bY-DS
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id 31so111343016wrm.1
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YiVmfKlzhX6+dDL5MvsL5C8YsLLtVButKhe8QPNlosA=;
 b=csK7yN+GeTcXYTnUyWBLpWwT90bVsW9CnrykngjaAFulP+2ph/cZiCA5Iz1qBoOMK6
 QtZKWBNs0LVwpPhx6cq93toXileCBw/kNEFauKOb7n9za7X+5qPaM0rvb5gQc6zx00/1
 jGOUm00Ht2YMj3VZSKONgPAvQBpIKNZmb8IJ8ZFvQ902oAWtO9uc3RIuh2XvdKwp0VJl
 SU88TOqp1Cxftoc3rE6/DK2N144uTnEPa6jfD/gGeFoAT03qv9p1+entlTbLiLJraSXq
 LB5NolkJk9nCAK8K55wFYn0bFlIgrfUvA6gIf8BjqNgElVYI7bwRWKuaackaovIOxiyH
 udMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YiVmfKlzhX6+dDL5MvsL5C8YsLLtVButKhe8QPNlosA=;
 b=oyUU5/iyEd0sa9HsO0RgeKcNB9YL8WkeZlWv93nHUxudvTGWFtwBUY0GHRkroAaY4d
 UgHbU5rkwE+bjCode5NqVxNo1sbueA1G2Hjg6/OTj4pZC163YX3vHYm4ms8dkb6QP/y4
 iopMMCnizXUwjVXqHV0TG7Fa9SBhlvoqndy8ShDy5CoDkRPGoL4YZHiVkhP1Hdo3Htcv
 ZuSc1lVLPJ6H6kpOmYcVuRUVhh3l+oTR12BFtAXLUOWZ3E574/tr4yJna7+Duwsax85F
 aniXd5Xqr0Lq6BZpxiL7xGCWYa9ysI41jQrF1leedsNsRVm/rxHTZkjww+nbzk0Dt7dP
 3yIA==
X-Gm-Message-State: APjAAAXMMDdZCDHtyUtuoCT8mCAgaGJVBFfh1cUJVYAEPhz0kj+EkEKa
 iiOzD+q2ZU7arrFuFOB92mMUdA==
X-Google-Smtp-Source: APXvYqzUmQ4NrprEAKzwOd9KP+SVF5yie8a+CcXGRUd2PL2sQJQhOLqGqF9b/mFFsNAf9yfCt7f49A==
X-Received: by 2002:a5d:63d0:: with SMTP id c16mr789wrw.22.1565792969011;
 Wed, 14 Aug 2019 07:29:29 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 06/14] arm64: dts: meson-gx: fix mhu compatible
Date: Wed, 14 Aug 2019 16:29:10 +0200
Message-Id: <20190814142918.11636-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072930_479972_E283F271 
X-CRM114-Status: UNSURE (   9.70  )
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
meson-gxbb-nanopi-k2.dt.yaml: mailbox@404: compatible:0: 'amlogic,meson-gx-mhu' is not one of ['amlogic,meson-gxbb-mhu']
meson-gxl-s805x-libretech-ac.dt.yaml: mailbox@404: compatible:0: 'amlogic,meson-gx-mhu' is not one of ['amlogic,meson-gxbb-mhu']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 00215ece17c8..d8127f863b55 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -476,7 +476,7 @@
 			};
 
 			mailbox: mailbox@404 {
-				compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
+				compatible = "amlogic,meson-gxbb-mhu";
 				reg = <0 0x404 0 0x4c>;
 				interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
 					     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
