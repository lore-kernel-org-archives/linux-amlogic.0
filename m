Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F138C7EE2D
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iFVEgp1whaAzxpZ92Pm5e3vn80az5O6DF1GCw1Si0+8=; b=JJJ123vuMyreSl
	W8eYOdaEV4ucQOYyFS9FTm4cgMyAOXNT0FYeK8JZRtZiTbps2BnXGsBJ7qKTa5Qpq5W5pt/RQJrTV
	/ypBkTkFCtzzvqPi4LWdyj2/ORdvIjRls6EUC91NP4HrlDLwocQEaRtsKt6Luo5Z+K9RzrnaKDHSy
	g8NCc9WxDSk6HP8OJoRaF/r75qDX9ppbx58chEyO3C3iVq8p8UnQzQ3nQhkvMVOXcz3gJMPeVBQHK
	23NS1jMUmgIgaTItZIQNODQ9BhFPmdOwrDvZBG2q+hqWWXE0w345viYxXOogRupg6Dv7hV0kGbeVG
	qrVA1xqg3M4QNzyW/6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9R8-00737J-2I; Fri, 03 Mar 2023 17:43:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9M1-0070xZ-Mm
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 17:38:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id p26so2085714wmc.4
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Mar 2023 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677865079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXAgSxR0AuvE1RlyHl2dG9qnudLNG7Z0WUen9Hyx3RE=;
        b=vkdLyLAzlfjGHoHFflYNqeu1C6AJ2M8i7oDRPm4NF4ns4hb3QVl9q8WbtbGkqa/3yL
         ZrGqrcjvBNkVxcov1IyKtlevOrlUML9D1hlgGYmUHIW3UFdFcmbxXjF5iy8I7r5UAOtQ
         axb27zr5JSqBXqkMp7ZID+wOj5pIV/o+e2MKon27vwp3lFB6zf2slnvwJi0GjMwuXJ0y
         i5yw4XUDDA4jTXxJz8dpVRZviKH/X2q9oOH9GE43ZBRDZ2xFZhdkXDiGgraqf4xHS6cR
         T6HnydwjesttCN/5LF230BFO51hxTTuQbiTeU/7gKeFqPkMUANxU4KIHvEUHwFuPnlxW
         6tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677865079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXAgSxR0AuvE1RlyHl2dG9qnudLNG7Z0WUen9Hyx3RE=;
        b=Wh5WtCLeqFR1k22mT5ae5oYujMlDWFRMOcrLB4UDKFYshDDqCHwJrW5GJorafzx8Za
         PCSn36FiB0+vXMgYBKmZyyDh9u0MnTABrCS/+/KUuhTCmVUdIp9hCX3sW4IOt5FU9WJx
         Hiiuw8Z7/A5hi+bwoULBHK8Mlf5/ptl5r9cVoeva8MExGtIg9p/9YPvgIApllkdzXuPb
         cpHUp1cvOgNnnor3PzEx0Te8YMTrNu7xasxo7cjdOEwzoQ6HWQihHM2LkbhJI7EZi/4c
         kw5U/ZoYisgTDysAaFRvZeuhEalwZtQ37Z/vGwnoFIVtnU0d5dd1KwvnAHi/ch+2Txh9
         6+Og==
X-Gm-Message-State: AO0yUKVlMd+gSS2jO7Ggd/mZKrbp9ysbVdm+O+Q/fEev6u6dQBoh1EFo
	h1UDRwnXnIvi/jkcrCZb7ysuXA==
X-Google-Smtp-Source: AK7set++YWc0KYr2Viqi8a+s+yXjDowfZmZqPONnrixxWTi/0ABDatqDREtvS/0B29vq2Sw60EJ6Ig==
X-Received: by 2002:a05:600c:1553:b0:3eb:3f2d:f22f with SMTP id f19-20020a05600c155300b003eb3f2df22fmr2458292wmg.21.1677865079531;
        Fri, 03 Mar 2023 09:37:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c161300b003eb5a0873e0sm2990170wmn.39.2023.03.03.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 09:37:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] arm64: amlogic: Add initial support for BPI-CM4 module
 with BPI-CM4IO baseboard
Date: Fri, 03 Mar 2023 18:37:56 +0100
Message-Id: <20230303-topic-amlogic-upstream-bpi-cm4-v1-0-5a23a1ade6bd@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHQwAmQC/x2NSwrDMAxErxK0rsB1mtL0KqUL21USgX/ISQmE3
 L2izGJ4s3hzQCNhavDsDhD6cuOSFa6XDsLi8kzIH2WwxvZGg2upHNClWGbtrbZVyCX0lTGkG46
 WzHC302McDKjEu0boxeWwqCZvMepYhSbe/6+v93n+ABzNLdiFAAAA
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_093801_803634_CCA073BB 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for both the BananaPi BPI-CM4 module and the BananaPi
baseboard which is comnpatible with the RaspberryPi CM4IO baseboard.
                                                                                            
The BananaPi BPI-CM4 module follows the CM4 specifications at [1],
but with a single HDMI port and a since DSI output.

The current CM4IO baseboard DT should work fine on the Raspberry CM4
baseboard and other derivatives baseboards, but proper DT should
be written for other baseboards.

The split is done so it's easy to describe a new CM4 baseboard, enabling
only the necessary HW used on the baseboard.

[1] https://datasheets.raspberrypi.com/cm4io/cm4io-datasheet.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: arm: amlogic: Document the boards with the BPI-CM4 connected
      arm64: dts: amlogic: Add initial support for BPI-CM4 module with BPI-CM4IO baseboard

 Documentation/devicetree/bindings/arm/amlogic.yaml |   8 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  | 165 +++++++++
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  | 388 +++++++++++++++++++++
 4 files changed, 562 insertions(+)
---
base-commit: 38d2b86a665b5e86371a1a30228bce259aa6c101
change-id: 20230303-topic-amlogic-upstream-bpi-cm4-92e0562f8950

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
