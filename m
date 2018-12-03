Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7B5C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9070320848
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1Wl8DpZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mJuLSldG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9070320848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnTgPJGqiPSLhe5NziKFSyQe7oMqS7I/+P8wB55cY9M=; b=t1Wl8DpZyq5Vb/
	Ym3QKV6s9mTQQH73PCT6tg5VNcRe7NG7i7GGQnz/lBTzT4jIC1comCTfyLVEkzGbCldrcnQinMCcK
	FZ9UUcF9hozBmxm8wJiwxVAejgA6KV74lIn82lh5+JC1jHrpkRe1N4BLL8duvO6BrzsCcLepN2EXD
	fVL7YYUKNfg9yRYLrQM+kBaGjridcS2kIl+f5kqeAdqg0yYtIeqhtqU4k1IDTDwhsvZh8YoZzSI2U
	VCCl7YJfn4WEDNGAmwe3GPiwhWq+RBXByjEM2sjOAD4BouDXKo16DUYQ0PLkv3RDt35msC2en5jkJ
	cFpft+zjU3/i/fhvojKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTrqO-00054E-Qw; Mon, 03 Dec 2018 17:17:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTrqH-0004wu-M2
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 17:17:12 +0000
Received: by mail-wr1-x441.google.com with SMTP id u3so13010196wrs.3
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xe6dxR2Vde59Kua+p62/ZAkFh7k+BKyeNCE4MaXeE50=;
 b=mJuLSldGAO9/CbJ8V0G/bCDIcD46wesQm1LGPpzYVtxmFzHzFJHS+LEr21j97bNU94
 XfqulbAt3KOVPYfKEiukw9MblLw7QlP1C3MB5/NHrsTBrYZO455Mc0ppRdZ+al3cABN9
 t6BxLKZ50yhk0F4bdFWds5tbs21WP6FT2kma0nbU29CD1eB7wWasIhmLTJhrdMgt//LT
 qddjcUrUJHm3DTV1WnC375HcOiyJUU1Ahx37RN+cmtwwMhocILcHBo68XHJHQnBiQDA8
 yWRd6MomZATRNmY1SJ3dkoGdLkn3piIL/+SqkC/nT9dV89klH8OTxmyZ0rN2Eek0wFOf
 hwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xe6dxR2Vde59Kua+p62/ZAkFh7k+BKyeNCE4MaXeE50=;
 b=uN4Wn4C2Xk5gTYNfhal0eHfPzfoiQTFbdcAKcx807Frd617HySKavd4ycz2qtBmuqx
 Rtt7Kiy0b35ShI8w0GQ5BRo2eMM7A7yBwg3kPZt/NRTvPp7JM1fhOkQTbAP+by1z27pa
 5mYT9yDfoi9YREpfQPAdBiWkXxO/5yew/hnn9P0ZklwoDWRFOIFeHmcChXuUR8pXC0s7
 ieM5G0wBLSMog2jsyzsKEg5kteKMCM/DMDjwSFUpLxiRRsISKEJY0lkKsR2L8Cr37zEa
 1Y5Im+Uwy8WbQJ7TOCMIZAEHgmIoMS5m7l8wpxRepoRe1FF5HfxQjxMYU+GOPNgQaihi
 emEQ==
X-Gm-Message-State: AA+aEWag3+Fr8lqyXTA4Q6azR0qUk+lPlEKiAN6wa4eEe5F5QfzFqs44
 ueihW4U79aMzwfHE8SdIQ4j/iQ==
X-Google-Smtp-Source: AFSGD/URCHA/e4IENh4CAOMvOH4+Eaq6ZSkYjwDbPZzNmEpDZyxn2h74s8XOGYOVDShgbFKcHzy4Ng==
X-Received: by 2002:adf:f28d:: with SMTP id k13mr15513177wro.78.1543857417161; 
 Mon, 03 Dec 2018 09:16:57 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 h203sm22494889wma.19.2018.12.03.09.16.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 09:16:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 1/3] dt-bindings: clk: meson: add ao controller clock inputs
Date: Mon,  3 Dec 2018 18:16:38 +0100
Message-Id: <20181203171640.12110-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181203171640.12110-1-jbrunet@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_091709_811622_44F56A79 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock inputs of amlogic AO clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Stephen,

Since I made some changes here, I did not pick your previous
Reviewed-by tag, in case you did not agree with this version.

Cheers
Jerome

 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt  | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
index 3a880528030e..79511d7bb321 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
@@ -11,6 +11,13 @@ Required Properties:
 	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
 	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
 	followed by the common "amlogic,meson-gx-aoclkc"
+- clocks: list of clock phandle, one for each entry clock-names.
+- clock-names: should contain the following:
+  * "xtal"     : the platform xtal
+  * "mpeg-clk" : the main clock controller mother clock (aka clk81)
+  * "ext-32k-0"  : external 32kHz reference #0 if any (optional)
+  * "ext-32k-1"  : external 32kHz reference #1 if any (optional - gx only)
+  * "ext-32k-2"  : external 32kHz reference #2 if any (optional - gx only)
 
 - #clock-cells: should be 1.
 
@@ -40,8 +47,9 @@ ao_sysctrl: sys-ctrl@0 {
 		compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+		clocks = <&xtal>, <&clkc CLKID_CLK81>;
+		clock-names = "xtal", "mpeg-clk";
 	};
-};
 
 Example: UART controller node that consumes the clock and reset generated
   by the clock controller:
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
