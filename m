Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AAAC678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFD+CuHnXmq+l0FVU3uoIMsAgzI86KjoLPTNG3CpqgM=; b=AVoHyy94yMO2dg
	iR1qKavA0vQPyG9XuphG+9aSoCRxF365ZaIXdwQlIACuVz2DPymgyGYDsB5k5oo7QLcaqSwMQ0ek6
	6Q79huIaQ3QJPEu68pZyCCr7VmcRZc9IkHaSxU/dtpayXZyAnZYWaHvlWS6ZSCJYeVNGxVD6SkhLw
	4aSsFxrv+3g2myMQ7RfyQQpOCOfcMoBHo4zCsqsQElzOVW0cViaVejJHFM5VnQupJajufU9jLwSi9
	wPrIsNm/HpVsRAlFc3qBHql3XY3xSPwBRqvijxV84f0xw5eU0YQMwYjgp070Rxbj/SAfdV/k3XxyY
	zaGaXsv/YTTqsaWaT3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9jV-00CdbN-KF; Mon, 06 Mar 2023 12:14:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9j9-00CdSO-0g; Mon, 06 Mar 2023 12:14:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so8034275wms.2;
        Mon, 06 Mar 2023 04:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678104841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7p5DGlKwmRimZVfiR93bnlEzszSiteyjzg97cN2oOAo=;
        b=ohuzAEBj9rP7cgYi9TFIIVKq9iKrstPSWqplPOUpVgkFAPM1g0S+Owu+Q89uMSgZyU
         miyftmjCsKqdKyo3SShzaA5NMpP6fOBsBZmzDY8YUTs4idGsdwESoqfudXKnWmqHOg2T
         ID3Wj9DbFOB0LJ2HSDUSw/Xbqj81jDCLeh7SI8tirvEBnU5ASQssCraNjiJLQGr0HXiZ
         njR6J3rrTZhI2gUg/0kJe+hbCvsAnpteUwItyFuAxKfx4DUqRmPSWRe8Vq0ch6+7wfp+
         KKyo/1m8vj0CewJ8I1ZsBWanvUKslJcI0m0V5YReDclx4fm4fgui9PmaoqFtVJQnvjg/
         wElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7p5DGlKwmRimZVfiR93bnlEzszSiteyjzg97cN2oOAo=;
        b=l5Q4R59DFDfZof44I0bgtHU+/dpFbGYAWkwCvF7ZAuRaiJ/fMx2yxPRcvTfSByt3Eh
         fI3+5XGicOwzBWy6VUqP5+ptgS/aCkMHtmzuvXwcH2L0XJz0UZ8w+j05NsClO4RSxdIt
         ilgTO1qYoQUofz+36cbFKetnh4b2fwZcHo8KbF4H8komUlUYK6B5MApnSmK5KkycvERb
         /wb2ftp+akCi/NPwm9kIOEy7A6wOuYKpQ7l6DUbO+pCNeUBoYIv/mW5O16Wtp8S5Gq96
         qaf5hfLk7t3kQ3kMTLzTTMAp0GJJpDQ0f6euv0cLpUo7hCxUchElBG94u4bW4NiLnsDR
         JMbg==
X-Gm-Message-State: AO0yUKUMY3Yze/ZDcy2GrpfI/biPNzvCMksKY9W8nz/dsfDcEtG8Zkw1
	h2nRuLpO7XclX4/nE5I7Yno=
X-Google-Smtp-Source: AK7set9QWbq9KwaBnJ+zVtHzm+bRIjEdMLdmdF747zrVXwb/zaVDARkqjvDvKsJqw+i4hzWGc8KyAA==
X-Received: by 2002:a05:600c:35cf:b0:3de:a525:1d05 with SMTP id r15-20020a05600c35cf00b003dea5251d05mr7296373wmq.8.1678104840984;
        Mon, 06 Mar 2023 04:14:00 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d660a000000b002c70ce264bfsm9814798wru.76.2023.03.06.04.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 04:14:00 -0800 (PST)
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
Subject: [PATCH v3 2/3] arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
Date: Mon,  6 Mar 2023 12:13:50 +0000
Message-Id: <20230306121351.1606360-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306121351.1606360-1-christianshewitt@gmail.com>
References: <20230306121351.1606360-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_041403_098626_73F22989 
X-CRM114-Status: UNSURE (   8.53  )
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
index 73ad0f5110f3..a800e8955c4a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -71,5 +71,10 @@ &uart_A {
 
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
