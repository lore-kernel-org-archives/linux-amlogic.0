Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E1CC28B20
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Mar 2025 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ThRTdwSNMeDQ9VlFs+Y1z+xhW6DJ0zVYmv3iI5GVgQ=; b=CSQV7YCCxHhW9E
	2e+3xzm20PWop9PkAGaEefkmsQwHwkin0blrWFLR7Vp8v3SI6Bf56L5Zn95My9IL+mGBLNtdEUKQH
	by52wnZstfwn7t4dQqGHfSREpAtKrxwiiSccSmdgyisTdNDaTsIJMlaDOEX6jbE9pkHK1Dn8y5oZL
	LMyT/a5cSt/FGRFQhaa9i0ACOYNqXOWBWcYMQjuiufWj+fDLvqOpYX5L7ahTA1jO8THwz0xVrcP1t
	8qlcypj5JMbU0aDHCVQI5QhTebTg85LRJ3KKdRkYN8Tb9XtcWCzZZ2wG6QFSA/CQp+Chn6jG+qvg2
	/Kl8/w5B/eP1ZK6JWqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tytkP-0000000GHxF-2IFe;
	Sun, 30 Mar 2025 14:34:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tytif-0000000GHsZ-1Gm8;
	Sun, 30 Mar 2025 14:33:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf848528aso32961145e9.2;
        Sun, 30 Mar 2025 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743345179; x=1743949979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDZlBB97sXiBRPJPnnCLtIfRcmpHR+yPzooZ+KfqlxA=;
        b=ahQVdeKABG8FU5y7R9AnA3L+XpKzkGrdcS1GftEAeEOvs3nqmRdyQzWirWYN2Dh7Ot
         CinotaLNEiyfe+1dyGakrmFAAV7L9nRPPUlWIowpE+cvJfQPfSZGRZalZ8cgdlJZlRmj
         bla8FvLZL15EkASPfMk/plkgbFDRXU/AFvQEHb0mEJoAQuXliqn5lrDNKVLrEG+XpsNI
         ++edu7PyDUXtyVz8qG5e2hIpHF26A58+jaYk/tl5ySg7ACyiOpqyuLeqssYIsOxCMbIT
         68Y8FsoFJ1hlTWSJnlHZZ9/XS4LSWTt+Epaa7BNvRXyXQYhPXgjYDWBksLO80ST3umBL
         GKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743345179; x=1743949979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDZlBB97sXiBRPJPnnCLtIfRcmpHR+yPzooZ+KfqlxA=;
        b=fF1VqtFhrdpGRyM0Ouqw+OZpc8mc2uER9N+qx7TYPSOKgg9bbz5p17R5OYadTalQmd
         mvQQur3I0d/HNDxpA34yINPX5fdw6TqBz5NOLYewAs2ZTOEt7wZyl/ysAKLIEW6bCm/o
         AIwGbjrE1OmLGFG54k9ZXo+jhGBboX21aYTaQ78JSqiodnb7mz4XITbEaRZZN1oYEZxZ
         2xIwchzY8OW/YmBc/N1Jr2ThxtQqNRRcsCJIX0Aiq1pLqAl+cnL8vDxUpqvQalmkLVeL
         XCktmj64GR8ug1ShegsuDooXprRqP7LjyF2l0AIisKY15TOVcirsyi3/trVPxThOFziJ
         dwFw==
X-Forwarded-Encrypted: i=1; AJvYcCWuIbZj2LC5XPIFV7TcHV4k6hbigWkIS61b7aTxvOir4hlGhcPJkqoup/B2lxFpu8TyIFyAHgDXLy/EtuM3jbOqfw==@lists.infradead.org, AJvYcCXOeCfZA8rKi6gpD04KrizgmHDnnOAS4djH66MhGgyfQVw68q76nb7YqvHssIkRiLsw0NmPNOiBgIGb+zoG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl6ZMNI06SySbqjwuZW7XAqQdx8X35M05fxvyHMl+hDOiOC7tB
	nWUKf8sv5+xCM2aU5Y0Rwxtg05ynin9SwsjNVO0PRTWLadKF5XD1
X-Gm-Gg: ASbGncuuVIaYN4FHamM/nGJcznN7aR0eDara3972TtzIENOrzIkKeSr9NDr8BcHyW7y
	EGABkwZzS+nrIhiGGT8uxDLpiKSvD/m4bFrc7I6hP3B+s9oQPhintQQdsnqsOYKC6AJu2PQnsoQ
	TkgYSLyHMVwpMhrqoq0xD2dsp6wjoQD4gQiX0d+sakMF/Gl6w5P9ZVCzg+Zlj7EK8b97XIscIrC
	/gocZWopir/mKN6MqGATiDIwwVIB4R5h9kY+zJtLLPci+3mWEr/gfuI4it+X2jKo/jCrkewBy5Z
	W1VJGw/mc2ApezFDtDEmzP8j/XDyLn9bTUr9Fnekj0ZAACZIe8Mw2RnDiqub
X-Google-Smtp-Source: AGHT+IHaSWu6Z+1rDc9SQC310UBhA6tjaaU882YzdNUAhxmwTHuuOQ3qnc1Sxxt+8NnSRPc5mpgrvg==
X-Received: by 2002:a05:600c:1f10:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43e8e3cf6d0mr45291815e9.9.1743345178939;
        Sun, 30 Mar 2025 07:32:58 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66363fsm8999934f8f.36.2025.03.30.07.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 07:32:58 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible
Date: Sun, 30 Mar 2025 14:32:54 +0000
Message-Id: <20250330143254.3159519-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_073301_343570_38C8990C 
X-CRM114-Status: UNSURE (   8.24  )
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

Add the saradac node using the meson-gxlx-saradc compatible to ensure
MPLL clocks are poked and audio output is enabled on the p271 (S905L)
board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The meson-gxlx-saradc compatible is now merged via the IIO tree, see [0].                                   

[0] https://patchwork.kernel.org/project/linux-amlogic/cover/20250330101922.1942169-1-martin.blumenstingl@googlemail.com/

 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
index 942df754a0ed..1221f4545130 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
@@ -38,6 +38,10 @@ mali: gpu@c0000 {
 	};
 };
 
+&saradc {
+	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
+};
+
 &usb {
 	dr_mode = "host";
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
