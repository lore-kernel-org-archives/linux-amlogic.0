Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD88C4828F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Feb 2024 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DxSzi2aROlu9yMI2eUPKPbRlk+k9HMCX3cr5KH0KuFg=; b=Otp2hz+Wlj6/EL
	9KJua/qnMf6mQQwJdnQzjOGBs5viNsQeGhW+WmfYhE7PdIXqCoYIUvHffkyGedIeCg/6xDfAdMOv4
	SPN3pBckqhaekHUaZ+/8QmyHfOYlNP1sLC+yj9SZzBFFq6h7TC230mjQU+MThAflK4el4wr/PbyfG
	xi6Dwu6pGJU/iU7coIZ1KrsZUSNI04pSjnQY3bfnwbQea2BQ1XNdS/a06pZsSwJzaQ+Ve9id2ihva
	40oNPKVaZWaKKziPHGkX/gl2bXb5aaHnOnI2DmAPKm7N12Dzeo/Qows13nQgatPhIj0kSgS7pcnlC
	G7cMuZdPxgCgldNdRvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY21c-0000000DRHM-2itT;
	Thu, 08 Feb 2024 10:53:00 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY21Z-0000000DRF0-3Blk
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Feb 2024 10:52:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-51168addef1so2229457e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Feb 2024 02:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389576; x=1707994376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LwcF05L+fXBiJV1GpPE6xGgwy1t7z4SIG9mmsA+zggw=;
        b=wC1KJculmI3+opkbHtG0nRMk7FKMpV/kjJmF6PdNn/ZFjTx4DQGGpeBvZ0hBmiZMJC
         IccHHa/TbeyODsyeP9h7XHdJebWQKjztXffQfkKMi1AvpD6O68ceWUzJur24Q9P1TwKO
         auMLnCXkPALJ1gpAPsXEmPjho6C9DJzQbTmQbI/Xf2fzO0oMItx+Wz0PkhkjXgOcxRZu
         1aBw3FrUrJi4ZloILEwZb0v67wT74Sb0G/SSHTJN2bEXmGXmoY5m0koH+4gvl/J1zM6y
         Q8+xAqo+fhqALneRwx60fXDnh/Ev5fT4WAOoPf6bm5ADIbLwyCABFddjU14ZjE8L1ZvK
         zHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389576; x=1707994376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwcF05L+fXBiJV1GpPE6xGgwy1t7z4SIG9mmsA+zggw=;
        b=t5wk3pyP36qro9NkDAGFGlsm/atUpUvxxsYeI1jDBzaZLm8q2b6ewPlK5XcY+7nXWJ
         d/j/Q6awaAo86T4bRUa+lLL/gUbijL4ZaUu7nrUbrOV/yOW6gbFx1YXbYEzcltDrFVHJ
         vMlWfLR2zKsUIgVA6M2MpCXGWHDzRq+Cie5mu8zfF6XIHbTYHWCpPeFLH9kbV56C9jhS
         A0la44oVi2zASPA9fwRHrcHqM/2NujrZlvWmwey5w0BhSajDwhzOIomiFw1dX5HuzcNL
         W3W0S7TwQYfYEqANLR8o4BGzTzTtM/2Udzsd0SYHDb9UWcLZFF8FDZ6FgYZ62lnZb7Th
         gPiA==
X-Gm-Message-State: AOJu0YxAmtJJ2xz7Kzou84F/LwfjOONPB72BhrUSRI+/VYQkmodpqmqN
	lBbichsZ38JetdGbRg5wFFsKUiICEvAK0LwCHOSkWZk+UZxVQ1/qgz3HnJ/HVae9ofEQpNX8kCe
	k
X-Google-Smtp-Source: AGHT+IF7SoBpfJLUAQTlCDbQmMFs3tDOLUeO3epZth2CubWuvqQRNpyFU+S1j57S0lq1m4dhfkdHQw==
X-Received: by 2002:a05:6512:3241:b0:511:5ac2:eea1 with SMTP id c1-20020a056512324100b005115ac2eea1mr5543383lfr.41.1707389575875;
        Thu, 08 Feb 2024 02:52:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYggYozqIHxub/rHyLV7NoI/RNeHx5NrdQkQ5lFEdug9JLFt3K6AdyVejBBLUbHLJ8CEluIIHVwMQLebhRE9VIRfzADdvqiRanQ6QEBlUoLKcfrgWQLd8xNcSWdnRt30DDULqnDfAQzEeLve0VOG2FeTBvujVzN8JypBRN/a6rHKhN7KzhjiYF+vRmzvhyTgiJrn0/FmUeg7KHTSBtNq8XmHe8qf7PTl3/zBYvzPKkgfWo87QM7w7uLeNIPKxhEqN3KqLYUZHerlqUsJlHUBQyUMdlc/KSwZkuUjggT/T8CyRH25wKXTCS72282niDgny/8Q+XBGO6xfbPkEDqvDZS/O8yCSI1CUbAyKRsAmdpzMWvlSEEY7I8ruWkGG2jAGvnjStZqtuq
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c204400b0040fa661ee82sm1214991wmg.44.2024.02.08.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:52:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: t7: minor whitespace cleanup
Date: Thu,  8 Feb 2024 11:52:52 +0100
Message-Id: <20240208105252.128940-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_025257_822050_049249EE 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The DTS code coding style expects exactly one space before '{'
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index a03c7667d2b6..ad1cac42e9d8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -54,7 +54,7 @@ cpu100: cpu@100 {
 			enable-method = "psci";
 		};
 
-		cpu101: cpu@101{
+		cpu101: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x101>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
