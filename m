Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECC1C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:22:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5F520700
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TpQNaqY+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CxgFoKZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5F520700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S8jmD7uANnuajaiSx/6Bdsd7+p0fwibk4FYf+SC/x5o=; b=TpQNaqY+E7GS2W
	PLfTzrXUrWMYTtvhPkgPmWCu9bfEPg0V4pIa69523XGH232cN8e2TbQ4345zS3yOS0hcgMmBIE/qo
	Gcf5E2vpMAjor2YnHqSxEmfQ8Oy4b2f1Tf+Y5HyzofWaOTMivQSl6AYvuqDtxaLiGb9JGIOJ1Uv5/
	jdLlKZwUoQ7YjYse9Sad9i4fDJNTqsRXHmSGwV2Tk/tZPp7HCdljT+tfSyx5tBkbPafUGikQFdzR3
	eTU/Et+9693HQJ9WDyl/XtvfsQHFC5HCOeUAoRfhdnt4DQFJmnE4VcMm/h0V7hvCG+VTkjPiUnGT+
	NO7ZBO5DTsyjib0teN6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h95hI-0003MJ-Nl; Wed, 27 Mar 2019 10:22:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h95h6-0003EG-1x
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 10:22:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id k17so9893983wrx.10
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWWk57s1TgVpgIwAlC7p82w8/KGV2Il7XfuLTWHllUA=;
 b=CxgFoKZBE4pi+gLZkGqwq3lguVI2ErX/hnoj3kMUWsDyco6oobgvbBe59CbQEWKmfb
 P4yvskYlZk0frUUFrp5XaPFs1cLK0izzhlRB8tEQItgR5TK9WGpq/i+J/+YXN1cWr9Ss
 HDmNszddeKWDY4Y//N3JuEMR7rRE0dITa4nGgDyBVAcuAyER0t8/WEH5/Z6gNsRiXmFe
 7u7JAZ6qBjNdxLScdXCe9VP5lvs7TYu/kOkQSYVk2rioKczh2YgwgjTB+uUIMcCaNXdq
 YQWPKgiJO48j6FOiu3hzFvzgCj8tMGuTtJkOMYdrGF+HmNW5aZvsTiBrGSOtw3q31pQw
 jO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWWk57s1TgVpgIwAlC7p82w8/KGV2Il7XfuLTWHllUA=;
 b=EUlxO4VlWmv7kc3iKGinxDktI+cVrMyxGxPncbFT/ZIjUGZnNLcPG/0njrDS+FMhmz
 okMLTpiHTkySd38VZN6qIlsWSQQrkvxC3Qyp9i7G5Jjg4okNILa/gpnuwJXdtljheiBV
 NPLoB/aIdPW1jHtOlDaSM7w8Hzop9w6wZZlW/zGlDTAbB1oKf2PvEI/7qcZci13ghGXJ
 QwcBbR9F0PAFSGm90w8jZ+RIb9CiGji6TM156N4qOn+W5JfgYaRm7f67dGGVNLad3uRw
 4zm1loK14XJKWaPKXU23Kc7CFrne3KBfIY6xdW0oWtT15kbfCxqVrNZDXk7f9AY+ein3
 3djQ==
X-Gm-Message-State: APjAAAXZbz/Je06tRYNxZA2wHJJDtD/KD0OP8IhaYyYEl8ArZLlxnoem
 Sxurs424JlDIVBGvrq0m387OnA==
X-Google-Smtp-Source: APXvYqyuXXold9/U3/Pdda9L8ailm5qb0kHNoc9al6XjuI1s2MGFUOjm1qp0Ig+DIA2bWWbPX7QrqQ==
X-Received: by 2002:adf:f64d:: with SMTP id x13mr23839547wrp.298.1553682119705; 
 Wed, 27 Mar 2019 03:21:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm19811444wrw.88.2019.03.27.03.21.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Mar 2019 03:21:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: meson-g12a: Add CMA reserved memory
Date: Wed, 27 Mar 2019 11:21:57 +0100
Message-Id: <20190327102157.15908-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_032204_091188_D2C11486 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to handle Video Output and later on Video decoding,
add a reserved CMA pool with a similar 256MiB size as other SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 8f6f72e9825c..58176b525004 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -82,6 +82,14 @@
 			reg = <0x0 0x05000000 0x0 0x300000>;
 			no-map;
 		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x10000000>;
+			alignment = <0x0 0x400000>;
+			linux,cma-default;
+		};
 	};
 
 	sm: secure-monitor {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
