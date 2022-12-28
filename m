Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A56C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z38bvVISxfh7VzPcT8InnyObVaraPLDIsH3aHxa1vwc=; b=CKzgUtXm2S3QM0
	eTJ3ni5DZrW0cozMdimBnaYEGSbIetWLthWIM3eC1ff4WiEj3NXU1FDGURmsyKqIoTKl5LhnNEty6
	KWN8IbJzF5nLefZ8QPUQXXmxStnYSSx5OpLq2MB792OvfJPWlQPySgBhwYDd1Z7OZ0keT22GXeTqK
	B4EwBV1sb+oQGd/qfznNXc66m9gHApIr3jT7SMwZI5PVvLGswK9jewDoN7XqpMzYbU5l7iWUOJ0sF
	74HTfAy0E8ZpFicXjKB5VbU9+wkLNoDNul61SLfbRzfq1FM9MDcjPpjkEoxpGxaLvMQ5ynLKs1+J0
	86t6BSj8gg8BBasrzeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJp-003vhA-RQ; Wed, 28 Dec 2022 10:05:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJS-003vQ6-9G; Wed, 28 Dec 2022 10:05:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d3so15622649plr.10;
        Wed, 28 Dec 2022 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RV2gKx+ImpgFBjPm9dyBpImlDYC4T4c39ICqJ71RD4Y=;
        b=m7XOWPjkKjPzvRjq/Gd84qiQH3j0ogxyHrKL6mktIATiS7MLRQjNo9Jze14v8qw70Z
         M1jYBiz92tL7+wITxqo3KT31+w5qZ/WlpUR0fjRogyrDBDSuFGMPkP76mDgSPFqI7V2T
         GpPI3jyY3gs7eM8eXYtGZakp1DUgFtNg9rhbyzlEsoDxAdpeQFLZ8LPKSacUJumUHYWl
         F2axCUDA4ItmZkbPQZP5ZeQC8VcBQN67rVkSOD6izwbe27/mIiSRkf99JxnTixTJgSIL
         OZRW+gf3oHGo7Z3d7F3g9ztCY3F3iHt3VDMQ7L/+1N7H+NnUGDwxdSFBZ/REy7xDB6Ys
         EJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RV2gKx+ImpgFBjPm9dyBpImlDYC4T4c39ICqJ71RD4Y=;
        b=Gf7oC5up1iC7qAX3z5mYJ5khYpNQs9H/ldRfMfdIRgga4rrwE6MhGQbchiWy5bphbq
         u1KGDRoztGDG2PJKorBL+8KOiySuM8/O6+R3q8LAkhCWLPdFgDTzvQ6chejGJnUB0ZsI
         5Q4NiaAq37a9QwjYFyZyOJog8VdtmviY3zSQiMr3D7Agzawltk0VJ39lWtIlo/0u9beE
         lfRlqmgFa6iqrVgW/5H9cXlGJVDAyQbj/bSfUnAUgRxqMw5RKsnOOhphUaLjGw1hIwsM
         7gnygm9Qp6dueQW498oj7y1XaMxqZnT8zWuXY7lJpl54jKknNiFp0k4w81cSxcrLRokJ
         XnzQ==
X-Gm-Message-State: AFqh2kqrU26EwD5/BGXE6jga/Vxwt1ub2D8ms26bi82CX0cPpXWz6FgE
	YVYJ/Cpd0Tqvd64PFUbOl54=
X-Google-Smtp-Source: AMrXdXsfi0gBxw2JIb1Q3UK0+j1Lw9FOCcImOnvQgu4ReAtjZbecY6rIn56RYxzdOUvzSa5aabpqPA==
X-Received: by 2002:a05:6a20:8f2a:b0:9d:efbe:52ae with SMTP id b42-20020a056a208f2a00b0009defbe52aemr38715217pzk.30.1672221926637;
        Wed, 28 Dec 2022 02:05:26 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:26 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/11] arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
Date: Wed, 28 Dec 2022 10:03:13 +0000
Message-Id: <20221228100321.15949-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020530_376638_8AEA0E24 
X-CRM114-Status: GOOD (  14.80  )
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

On Odroid n2 previously use gpio-hog to reset the usb hub,
switch to used on-board usb hub reset to enable the usb hub
and enable power to hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 667d2b774924..e5ae885c4008 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -347,6 +347,20 @@ codec {
 			};
 		};
 	};
+
+	usb {
+		dr_mode = "host";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hub: hub@1 {
+			/* Genesys Logic GL3523-QFN76 usb hub*/
+			compatible = "genesys,usb5e3,620";
+			reg = <1>;
+			vdd-supply = <&hub_5v>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &acodec {
@@ -535,18 +549,6 @@ &gpio {
 		"PIN_3",  /* GPIOX_17 */
 		"PIN_5",  /* GPIOX_18 */
 		"PIN_36"; /* GPIOX_19 */
-	/*
-	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	hog-0 {
-		gpio-hog;
-		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
 };
 
 &hdmi_tx {
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
