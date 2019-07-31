Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FADC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DB5206A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYErbID4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KOwU/VDL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DB5206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ywEUMUOBvd45KWBKM5+mIYfJZKlGhzEcXXHBEGLdO/Q=; b=uYErbID4rSu6ivjt95V4DDyRia
	q+FPtPtmHE6d1Kz5tQy1GEKZmf/hfWryMB1iZfl2QUTD14E7aossLHCEzhbN+eRqC0Ipy71buKfzU
	FC11ZTUkxlBhH0Tn40bHTkzKF5J5Zeoa+XuQ12xJ7liaJJmlPUqEafQYwh9oxjoPbUUe84a/9MVZb
	8RtjI99EthrWmO7zWaoWXTQm0WWl0mltB+96W4Q+M4YNNwiiSYbN1O6qE3c1G5Gy7eiTq+u4i+0U+
	x/S/rKqixNiIt4P+rajm8kIgww7VYp10yJqdPu5KOdP0XZC9vlNX5iUCr8Im1Q+v6+sZnIb1d9Ysn
	nQFKeFGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsnWB-0008L3-Re; Wed, 31 Jul 2019 12:15:43 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsnUp-0005RD-CW
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 12:14:23 +0000
Received: by mail-wr1-x441.google.com with SMTP id c2so66204808wrm.8
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BOF17YQQWl12xZ1QhY8MZFUcVRdvZruqxl9AoPVourc=;
 b=KOwU/VDLfH4d9hcV47fA2w/uqwOYT2FS68Y+GEZgeAIxQeMzox1GTF+0nrmfbwgok6
 lFKgs6HQrZ5vHJV79TS3uRpfM7LBBpF/8oOwgSPwJoZn4uSGVeyYfnWNtxTN0cCnSKnA
 fwLcqzDLNkSmAbYJFRKWbisb1VHFrT9BBYe1njiRWWCpIVjSFXkGFjmG8l7ix6YGmBuO
 jmb5mztHtAF8AeFgsBIRAXSHH7dLXHH2WTPiyN1yejHwdxPZrwqe+2OU49FlyeZkQ6rT
 E+OVoUnb/VSTVGanCM84e147CCmhwhG/RaHrkLmA2+q2AMN+jbaHINtHsTQGrCX8cYtO
 lB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BOF17YQQWl12xZ1QhY8MZFUcVRdvZruqxl9AoPVourc=;
 b=JACxFISCV+6mlQFrBhVhH9C9vYp9Cs0zg2DXHiBJxmjbkLoZ+Bi1nmjF5IXZLaI86B
 dgUT72NRjbrbJYCnyrplabIe4SI5bd/mhmZSuZQlqxfUUaP8O0opZWr3fsLSTypCM9eY
 +Rlzv5OijIOPpNMMcE49baNUmqcjmKCY6apg/zY2V8pVLduvadV4EJ5Bxe6G4B+A767T
 pdRO85Kw9c1I8jZEzGHXN+Iq1IQMyk9DPE5JGnQ0fyEVg5+4RMIxsvq0HYkkXIQhUIYi
 udd1mn9RB+8+GUXjnw71pO+GsjsMyOcMunu+AmZJkK1vmTciFv0jwjhCKkQH3e1ZJBa7
 0Kzw==
X-Gm-Message-State: APjAAAVJ264ldy9bAky0J6YgrSL0oVhu3jr69UDRFkejt83Y5DcfnPaQ
 flsTz7V6FOh6qUCjFZm+RfIcdQ==
X-Google-Smtp-Source: APXvYqw5Af6krHH2u8yfiDYnUo0PUK03ieMfQQIWsJDDVp5cTQO8+Z6dt5o79L+VaM5ofBQMkgnbuQ==
X-Received: by 2002:adf:c803:: with SMTP id d3mr61363995wrh.130.1564575258197; 
 Wed, 31 Jul 2019 05:14:18 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a64sm3613713wmf.1.2019.07.31.05.14.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:14:17 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH 5/6] arm64: dts: amlogic: odroid-n2: add minimal thermal zone
Date: Wed, 31 Jul 2019 14:14:08 +0200
Message-Id: <20190731121409.17285-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731121409.17285-1-glaroque@baylibre.com>
References: <20190731121409.17285-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_051419_463773_07E9E6D6 
X-CRM114-Status: UNSURE (   7.70  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add minimal thermal zone for DDR and CPU sensor

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 81780ffcc7f0..4bd8d6d0c972 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -20,6 +20,19 @@
 		ethernet0 = &ethmac;
 	};
 
+	thermal-zones {
+		soc_thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&cpu_temp 0>;
+		};
+		ddr_thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&ddr_temp 1>;
+		};
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
