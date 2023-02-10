Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC59C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 17:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvPSYiB35EI4Q7M7P+To3BFqYxKxh/5R0gwntOzTqhU=; b=BzBZ1kThP/odf5
	DAWUcyx4m4d2vQuIh6IF8JPQK0Bt+NS6/AZVHcbn6F2TRzM91izg876AF66o4xRJb7TOHpMjMmvH4
	waAaF5qEAPdj1c0h6NcNyeNIsVfIyF4LCjc7ft/Cw5E3W6TSVzyTMG/QXjrx3cnmEWhpLFtRud7VJ
	GDPVoLC3+5mVCzHHwR5q9UggS8hFGEzwvZC3Efo/X+DVgbUS6TY3ygBpEwXDiQi02BmAX/ZQlam49
	x2o2RN0KhhC6nHIRsinN7qBwN2pio8ufYjXEgOdBs8HbU1+hQ52ZjVC3mGo05gIzbz3BaHeWEr1Pa
	165R0LvJRntPS2xylkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWsO-006fqH-PK; Fri, 10 Feb 2023 17:07:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWs4-006fgG-H2; Fri, 10 Feb 2023 17:07:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id j25so5713890wrc.4;
        Fri, 10 Feb 2023 09:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NShXRZ//vQQKtuVXg+FNEbyRHYKUYaCN+nMk9xF7QT8=;
        b=JwUX0eWxUb22c/W1Rd79586QKOgA79JbHl85PxJ02XMrWaq8ajpRNZKj34tLSdRpZv
         hXsDQ7Ulpdr/XpbqCX3XtacFCLPbotVxFiUmFBg2pOihgiEvOkh/u3c7oYfV7kNloIgf
         eYBW+CqEQ+p7ykFl98rXNTYaJCDpe10b0iFh1/LBGBgQP60EVYIq+DaB9py8uXzAztvl
         /7aHWnwMcDlV1F/4CYOAzukoYY4JtGObuthixAncdXepCQMqKmf15yl55xi7e/arjPrF
         s6zc59yqX4EnJgFtYrbWVMutfcG+KNYE4QX+ZrVugh3sBZ9oPPosL10sizWl0nhMJ4Qx
         6gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NShXRZ//vQQKtuVXg+FNEbyRHYKUYaCN+nMk9xF7QT8=;
        b=yNx7Gz6dKaSH6R65yUH9AMFp0hrwiyd5lUJzIbjZkUd1hbtxmdttf7rRxSMug/+bHN
         h70zFGNHS5umzBQyKN97RDBBS7ouSKqPKyv3ImiJPATwmiyfDrDapv7OW+tIOUQsJzic
         t/2uYlqz05hEOB3dMiOSiCjhUN2CTckMqN0kAAYt4Gz4G97QyZmguQ3LoX1San6Pao30
         OfQByLx4MlMU0nuPydYxn3tZVw87/eebXZaH+/OLmy3A88bSzz5n4YwERVKdgXyM4nlE
         Y1NAmNam+9Y1bun7+QAZIsVofamB+/HXOn7XbwFLj41VrkdoSPWJ8K9+EdkzGM78kxZl
         ZxoQ==
X-Gm-Message-State: AO0yUKVb5T9f+Tm0CRXi1j95yVne55mTbTgihd2yMjD6mCuenbp56mr/
	jAnRMV0GOeG2H12Qokn5SCM=
X-Google-Smtp-Source: AK7set/zf30D4z7uo6XAFo0iaaixvySpn6xO4O7pHkonAWBs++Ll7qHK6srUdwjQKspCgca9vYhNlg==
X-Received: by 2002:a5d:508d:0:b0:2bf:d776:1c97 with SMTP id a13-20020a5d508d000000b002bfd7761c97mr14126761wrt.43.1676048851945;
        Fri, 10 Feb 2023 09:07:31 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id x7-20020a05600c188700b003cffd3c3d6csm5351531wmp.12.2023.02.10.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:07:31 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
Date: Fri, 10 Feb 2023 17:07:20 +0000
Message-Id: <20230210170721.1285914-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230210170721.1285914-1-christianshewitt@gmail.com>
References: <20230210170721.1285914-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_090736_602453_8D213770 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Cc: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing content to the bluetooth node to align it with the content
used in (all) other GXBB dts files.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 9bfdb54d912a..435ae2aa404e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -72,5 +72,10 @@ &uart_A {
 
 	bluetooth {
 		compatible = "brcm,bcm4335a0";
+		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio GPIOX_21 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
 	};
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
