Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A06CC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:29:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DDC52083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFowV9HY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I0uu0tb7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DDC52083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQwAS6B6RFlGO5pnuSB9FwyGodLTG9bqIlXvX9Qz33o=; b=hFowV9HYgATW92
	SlBLjKcb890m44xwtExcXmIan92l7lmciR16rwhGHW54iTEByKlU9caAe11RD9t4OQTQKLF7O5Xix
	MamVmVIFD1zF4Z1Jutm9UA5hJN1UhkyYUtkzimLdp5XEh+B5o5bFjXlIwDevsU5Miy+T2H4OhOp81
	L6mc2rh4PXju57x8a6jY5Qvx8831oj+qsv5wovSJovcSjLrX1Qfzjovo3PTYutir7pW0WxF1shxgm
	2A1fV0KwmBvpd8lUYoEGN34h7xeI9+vA1edD7awF4fPZOUvlaDe32v7EkaCy3RGMrO4KYnEkpsMDM
	RVmAlxZrvvkcRe48oO7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuHh-00031x-Q4; Wed, 14 Aug 2019 14:29:53 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHH-0002Z5-DZ
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id t16so21185711wra.6
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eAFiTbS9tUsX23wvX/LxXnBM46JN5Jo6L8dXcPl3X0s=;
 b=I0uu0tb7hCj7NOzVQ9cxQqyxLj2ts/mcabRUsP2x/js53uYLjxjpmy9xUxR92i0vVk
 HkjNwwuBeSllIocHQNIVn7rVWwgfNk06xctYCAUklo05hcWc0h3ZMMtX1L4/YjEtTirl
 auQJ9EqjnJiEVyUw7UD4xZxTQAPQe4AtCltZgS0FsPzzE48Adn83e951uj63o4dLj4ak
 gpZ5LU8pKqnDwcj5Z2iFXdGO9/FcUWZWE7NOJcLwnekcZNrtLVUGB4ABOl6i9idkZCnu
 Ccy13esI8dtih+gCHB6bRKtJMIip975/2Xb9nAhp2/NYFe0A+I8FlDGoeWiNRDcEPB6I
 55Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eAFiTbS9tUsX23wvX/LxXnBM46JN5Jo6L8dXcPl3X0s=;
 b=jKKign2WlnWi8QwgoPNZCs44HpnjMETyARIfk1JmhPgc72Qx18+CnzySVO8ydU6Uw8
 eNjbFR1oS/kHjWglfOSIgDFa7coM0qVDFkK3txENn+iIvV2+Ex/PAIK3jHud4wkW7Wea
 39OYyEYXMF//PdSOFH3MZE/JMPdDrsvDjU/tVKVOaRJ6Gsprbwjq4l3+4HgX48G0eP70
 G0+SgU29RT+GXpNCSBYdYe31A7xwOU0nvBnxLoT40XtGEOhUBasiOUPlDacDfAkcaAjM
 hCRT67fSjVO519WqVjl9crNdiNxrtFtlQt+k5XJ8N49QnOjusjbRKv1N47kITEC3+LJ1
 6wBA==
X-Gm-Message-State: APjAAAWRB89ImB46pyU28SPHt75uqf6YHwWWpTn1SWtni0fQlsa/rhQ7
 Lyan95nf6mSIRCq+jvHslq1zrg==
X-Google-Smtp-Source: APXvYqw2v0j/k9m0jX2dRH/od4sgZO9K4GyqV4f6kOpOSECtwsplxNzyoaB+k3+nqd8UXQjoU3OmrQ==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr8286783wrb.172.1565792966037; 
 Wed, 14 Aug 2019 07:29:26 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 03/14] arm64: dts: meson-gx: fix reset controller compatible
Date: Wed, 14 Aug 2019 16:29:07 +0200
Message-Id: <20190814142918.11636-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072927_458276_4618BB69 
X-CRM114-Status: UNSURE (   9.83  )
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
meson-gxbb-nanopi-k2.dt.yaml: reset-controller@4404: compatible:0: 'amlogic,meson-gx-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c2d3fffea8a7..5b3dfd03c3d3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -220,7 +220,7 @@
 			};
 
 			reset: reset-controller@4404 {
-				compatible = "amlogic,meson-gx-reset", "amlogic,meson-gxbb-reset";
+				compatible = "amlogic,meson-gxbb-reset";
 				reg = <0x0 0x04404 0x0 0x9c>;
 				#reset-cells = <1>;
 			};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
