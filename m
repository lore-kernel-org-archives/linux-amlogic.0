Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD0FC27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juIU78aNdc6r9xf33+ZPLhhg6eIKJMeb7oj5ZsZBfBw=; b=38pClUv/+6Z9hs
	V3rLQzMINZYGSBS/4x5DAldMbIIIkFBOcchc34E+GBP0vTvXN0r+0wj4NhirbDqXUo+zafw2EXTEk
	4J0tZC/VKumXEVcSgtv3hWvqhudGpLfVXsJ2p9flvXfP1afb+wrce0XT97gax09ks+N7sfS5rp6AK
	UBkjQc0lYWpzst+8JLHZwv5PcN99fZPd5Hvl/6eIf6ceeStUdZkVN4siTc9pKrHxuaxjsW5k7Rtuf
	+RAQ9NBGfvcguTJFyjgq3PxKWPEScUSb+VypY6bORQPIJf1FCUZ3MsVFKREYK2hZ/W4aqASeSXHqf
	URAQP1w85p6nQu+mTBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrR-007ZEB-Fl; Wed, 25 Jan 2023 14:34:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrA-007Z5v-Ri; Wed, 25 Jan 2023 14:34:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so2265143pjq.0;
        Wed, 25 Jan 2023 06:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33aN1+zq+dtGXTv8s+/MpRCqjJHz2bZNw6EwNpZ5/gs=;
        b=iLozZ3cVYSp4JjjD9M6HZ07Vkkb/GR0WSC4kr5msX83zFWR3GhxNJbFTof2XV64Cs7
         CMv80Mg5SeISZ5NfGCnVc7qmBAdSNRzpkocz/CfHUYboPAjodRwQ3XT+ZidpCMM01NwY
         HUgSE+DkOWy9DpFJuCsRKfyss7rEOzwbM2vk7bGL17bUXWAdzyb8mCRhGbmmefPkqFet
         qZpcDR94XPGje0AbOLa4TGl2dtQZsZjzOqYpl7V7nfSKK4AndZbXLPVkchi8kUlBdvWk
         LKdPaiGLe5yQjMjOz7R2Zrb1Fen25FtqEMVbtMP5tWrD5F/QFOI/MSli1P7psWw6HBwY
         xtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33aN1+zq+dtGXTv8s+/MpRCqjJHz2bZNw6EwNpZ5/gs=;
        b=rVtwMN3PVqD3nBT12tGbNTVP1A6TZ81VduG+x1utn4EHLmoLMH7sK2EPAAP9IUeiLD
         q/YkAv8RQYqTD9X2R2Q5vvKzPVzDyx/XbYkswWWRDFZAG8ssuXCnh0EOVlH5rhaQQCZw
         mQ8AYYw33ZTj7PDyXUVCfZBV3sSHFnF3UTyol2PIBr1asmbnopJFaqNnyrdBo7B63YFX
         WznmDJMTdEy6v7JWHVoKDZq4hgVUnswhlpsKvBdSgbc9EwaLggduY8/kM4OHV/waWdPy
         S+NPPR3Mu5X9HfrTmDxvJpAH5kvo2YKoNt+/69jU8YcjUtWZ2tP+9STq0Z8E1uj97tfK
         OF3w==
X-Gm-Message-State: AFqh2krRIUm//5PV/PAebUhPZRvnn73wijSZBKMV1nNg0YdI2W1/2xGx
	eYWjH6nHPu8o6yi9Hb/96cg=
X-Google-Smtp-Source: AMrXdXsY/wVDY6WEukb45cQqDY/MfOUK+zWQCinkzelc/bRkU9wbTDUAVi9BrOqGQ2CrMjFHC3eIpg==
X-Received: by 2002:a17:90b:1c0e:b0:22b:b5c7:4fc with SMTP id oc14-20020a17090b1c0e00b0022bb5c704fcmr19566154pjb.46.1674657272085;
        Wed, 25 Jan 2023 06:34:32 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090a1d0200b0022c033f501asm1671465pjd.41.2023.01.25.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:34:31 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND linux-next v4.1 2/4] arm64: dts: amlogic: Drop superfluous dr_mode in usb node on odroid c2
Date: Wed, 25 Jan 2023 14:34:01 +0000
Message-Id: <20230125143404.1424-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125143404.1424-1-linux.amoon@gmail.com>
References: <20230125143404.1424-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063432_915717_61D532D6 
X-CRM114-Status: GOOD (  12.55  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Drop superfluous dr_mode="host" as it is the default in meson-gxbb.dtsi

Fixes: f24859bbec8a ("arm64: dts: amlogic: Used onboard usb hub reset on odroid c2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 01356437a077..70b10934a811 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -399,7 +399,6 @@ &usb0 {
 };
 
 &usb1 {
-	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
