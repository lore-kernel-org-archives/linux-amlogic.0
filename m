Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EF3C32751
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD81206A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2qefnun";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fYS3Tgnw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD81206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gZ2olXJbxdYSfHzT8Zf32d6BVETxfnfTLP6hvN4Dz1I=; b=f2qefnunB11VRzTgbRZ+08m6x3
	RW4iox8SlUS3leHZZRQSZplIN4pzXMSX9JmGpT0ReH2G9NHj65tor1+Dv8/kzRKONi39ugAhF/aaS
	LBg0lAZVoQffqJZt+LaFZZSYLHZIpWSKyYHrz2EJUlY4sbIL4VdCMB1c65/oj/kq+lErgpXEBGsN+
	4eNVerw7Rb13vOji6pEUc/omun9k7UcVDYehWhzdRXH7Z/v0XauN5wktH0zd+mw46/b8motcrm1rR
	h7Nlcwdq5h3jM+Z7CaS3dCDE1dE0pa2MdnsXCMY7eHm//cZ0HIb2vwwO9sum/W8MLSXd5iVZ8Tzj1
	aeSry74A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsnVT-0006Im-46; Wed, 31 Jul 2019 12:14:59 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsnUo-0005QK-9e
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 12:14:21 +0000
Received: by mail-wm1-x342.google.com with SMTP id v19so59629901wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4dhyanCajCoQ1NdrxY9RmPZmRRskdkUd8pA1FbO4zdo=;
 b=fYS3TgnwrniuqSiM6EH8XBX5NO0WHBVCvOQ0paEeMa5/j1L16S3eMBI475LTjoV8ui
 XZMH/qiesdnDqiwtIhyM1C2/aKEjieF90KHqB6+woi/R04pCoUA/DS7g8FxIvxCnVtge
 CGwXU2VF0b6n9CWoTmUCdsFiMDjRLlu5sziIWWZIkiHdyN0Y/Wsf0v2npxS2fT0fS+lM
 erUXS9kjSafOR4vz6DeIvqCDioiICAfx5E4DG2s8qQ9IObARQnUnjfv1c+5qN9fxljuk
 dnOaSG3+0/aKtms73knvFjaJth/VFSJ1fRgV96ir5bKG0YYN6P1Pt94Qm3nVEVGmD6W2
 8e7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4dhyanCajCoQ1NdrxY9RmPZmRRskdkUd8pA1FbO4zdo=;
 b=da3JToyRIByGMa3/QEdRmOtKTf7c5pwWNQ43bioHj7p6RulokmjLJp/A5rvZidmNoH
 Mon1evsNejyRtZBvKTqVO3n9Raoj0/KviyeDF+Kl6odbsDIdaLLPHqeYCQdLZgum7fjW
 esrw0L3/aNaabOs3i8COnj0HZECaIYuIc37O8ULgVj+sbfjbqA7SGiZIsiYlc/eLTYuB
 UcC/c/WTlXrPeVL7e/7p6r/Zvawg+lUcMGPbhbLGFxzJjxqUXEOEkoZGOEToOWliJhE6
 6m9jLEuvJZGPowPjbw0GvcXN9lWlDNr3ZkYi42brOXjPKYNTJ0KPjBwamwX1uMNQqzJW
 gvwg==
X-Gm-Message-State: APjAAAVdJkBUYmWMSCicB7S+5/xco5XaAYslbtABLkrL/0oX0VVBlISI
 w2kYdvcN/cGsl1n+c707hraPkA==
X-Google-Smtp-Source: APXvYqxRDiGgBTKX4OvpK3DPoOUb/3Cu6lXEUEkKcn4C86RVnIxo9nRbAkWga96jF5qAdQmTIoHbSA==
X-Received: by 2002:a7b:c251:: with SMTP id b17mr37174245wmj.143.1564575257149; 
 Wed, 31 Jul 2019 05:14:17 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a64sm3613713wmf.1.2019.07.31.05.14.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:14:16 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH 4/6] arm64: dts: meson: sei510: Add minimal thermal zone
Date: Wed, 31 Jul 2019 14:14:07 +0200
Message-Id: <20190731121409.17285-5-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731121409.17285-1-glaroque@baylibre.com>
References: <20190731121409.17285-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_051418_334606_335D6351 
X-CRM114-Status: UNSURE (   7.85  )
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
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index c7a87368850b..79ae514e238d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -33,6 +33,19 @@
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
 	mono_dac: audio-codec-0 {
 		compatible = "maxim,max98357a";
 		#sound-dai-cells = <0>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
