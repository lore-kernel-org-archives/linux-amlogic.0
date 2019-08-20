Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74CEC3A59D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 12:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD80322CE3
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 12:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="csYlnv5C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yT+s/xI7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD80322CE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk2X8UX4xl666U9313Dx5Aq8PLsjydbuHkFqq8MbNjI=; b=csYlnv5CWB03RO
	nHWA3dj72zyIceIDCSinigwKAsRVQ6Da35nGX+QWTAhhL3Y5NpjkXoZs73NZGi+gOfrPdNujqSCGL
	2qXlBI8SlyrzMeNnbyTFz3z7sbFoZFOmfX3bwgi9FFmCuPC7PNabGHbYn1N6zyrJKPfy3H7eLi2X9
	2MMbRWXnInGbRxYXH3OYq62wjF9vbyAaD3EtnK6AzYpV8gePcHL7PlQuIn1K42S/ojmA5yVdBz+6E
	mQbvgCLxHpXio1lJwmr67CyN62attPfh7X0E2z9F+SvCy1hqUq8FtMtWWqqYkj4MEN646SfoytkHv
	X9AUjU386/99ZqgtGcgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i033Z-00039Q-6y; Tue, 20 Aug 2019 12:16:09 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i033Q-0002sp-QL
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 12:16:04 +0000
Received: by mail-wm1-x344.google.com with SMTP id e8so2272171wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvuewGGeUT01B/0PrJuoxbYIDFO+ELiD26DkNkPy8YQ=;
 b=yT+s/xI7f7jqSEka2HbYP1Ca+8fb1iudKb+dmwrCTBubGSsL/sWcoIYjik0WW/Jnu7
 kz/kA3bD0EOgYW7BJ7bEj5GkawvAVVro/KOhlihWt5/W8T70fM8FG7IYtP4DnqcEV9AB
 Qi1WL9NKFxJ/HJc/S4gLXDy7m0lQixB5hiDDLhfnr0+Ek3xGIvt97SfqoFCQUMd9CJGN
 UwCsnOP6sEtDWfT28E9FfgRjEMsTi0bIhYi4XkRI8VGEti+y5bDj0r90zY+pBIl24Zye
 QKgfuif+pPRIeYNJzWlrZZvIEc2R/RmLkFT32J1IpX40aUc2K/gL9YBGCYlQyzD6vEjl
 exEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvuewGGeUT01B/0PrJuoxbYIDFO+ELiD26DkNkPy8YQ=;
 b=W9NTWTYQq5rJNiiQrysQ4eonLourLuRyRCW2KW7TpEOkYvskpOyJpJRnjW4PR95fGl
 iK4P2FBqdQzjbYUNSwDXmSH97bi0bVRG5nfxrARodCBeLK+k7TpTcVAeyQY3rRtuJPVu
 P/ezs5ye92lU0XtOn2I26N3DNKbJmjtZlo+pmJF1RdQ0k/54fFc3TAjAVLjvuCg+mlI7
 IxW0m4vG24PE4Ah11K3bzk9sFM/VLihK4fhLoRpOa/+1qR2JQs9+1SuOpbnE+4vHD16z
 dzh+vPoWaCdXr2Try2PKkvtnY3eQUF+XhvLpPj+7pY+ppgDUtPjgeMKFZT+liLpRQ+5j
 TE6Q==
X-Gm-Message-State: APjAAAVrYImQKIlttEzIvFLVVl3vg74GZXZ5C5f6hs7ixpLPxt72Yxfq
 eMY3AKyMJ61mHS7v3wAAtgWmOQ==
X-Google-Smtp-Source: APXvYqzKxoixlD4z7bbXYIjSWQg/tednMgenI4632syBMA5hXdJv/DFCE9IYOHH8N1SGrLd1jto4pQ==
X-Received: by 2002:a05:600c:28c:: with SMTP id
 12mr24965602wmk.157.1566303357275; 
 Tue, 20 Aug 2019 05:15:57 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h23sm15300765wml.43.2019.08.20.05.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 05:15:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: g12a: audio clock controller provides
 resets
Date: Tue, 20 Aug 2019 14:15:50 +0200
Message-Id: <20190820121551.18398-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820121551.18398-1-jbrunet@baylibre.com>
References: <20190820121551.18398-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_051601_006041_AEC79A39 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The clock controller dedicated to audio clocks also provides reset lines
on the g12 SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 809f741a82ec..8eb92edb7a66 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1477,6 +1477,7 @@
 					compatible = "amlogic,g12a-audio-clkc";
 					reg = <0x0 0x0 0x0 0xb4>;
 					#clock-cells = <1>;
+					#reset-cells = <1>;
 
 					clocks = <&clkc CLKID_AUDIO>,
 						 <&clkc CLKID_MPLL0>,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
