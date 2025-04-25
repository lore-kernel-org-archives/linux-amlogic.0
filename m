Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B1CC369C2
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Apr 2025 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pNNDAA0DmqnbwaMnwDwalMPgg2uOo6I/Lj7yUrmwzKE=; b=cyhDH/kzvRB8/c
	6edvRh+dM0NmjrsGJlzB+e0eKcCl7M3INi9NwJDGMx6H0WUKSSlqfBNo8RGZo4djN7kyJp8ZG6AhG
	K9gOzWUDj5YgdGvShWPCE37zKegOSmHdYNNDklzeiWdumzaSWHzPlihqSmlbzcrQOG7GSJkMYR54t
	JqauG+EnDAHaSF1ZA1O4IxonLR83/wSFao8qG71rM9di9e6yd4YPOVoHif3i83qwRRK+iSg7+nYgf
	rxTTZcfk2N/dU00NbJr98QGVb8AEFr8Hh5ihvEeM8W6eonI5IhIAjCZ7KyUvIE0nAzi1TiZrscDIh
	VyrYrvfPWt9n8pfcmFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Pig-00000000o0T-3IrJ;
	Fri, 25 Apr 2025 20:32:22 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Phh-00000000nsi-0Ayn
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Apr 2025 20:31:22 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c546334bdeso251590085a.2
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Apr 2025 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1745613080; x=1746217880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GF1xjuBmQCLqhbqJW9dfNwD3/0r4qJdVkbILuVmlmn8=;
        b=FwlwR5m/WwmgNyplais4t5w+swHqiHsI8sNn/vzZMskqx0OY5vKhKHgcRCKtQvDV9z
         YrFgOlwWQYT6Xlap6lnqPkUI15gqnE9I2YbqLne/8qovJM9jYls821mNWm7bW3Y1nMVO
         ZCgiGubdUM1g7PERG3neaYkafNDcKKo16n+Q0ZHW9NtAuVF9d/cH04jhuu5CuWTbG6fZ
         V6gKhUGF5Yo4IhAYTTaCxSDdmiwXHchgSAmBaTWJqO1b4gshJU8RinYvGw0ehySeCJhd
         nfk1euyEv3AWvOP5XB/j3j9bmiN3P5knByLMOxj6q0GFjSkhUks/VUQeQvOWN75hBn61
         kDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745613080; x=1746217880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF1xjuBmQCLqhbqJW9dfNwD3/0r4qJdVkbILuVmlmn8=;
        b=tp1M7Dzx1CO5CEegHpJ6+jFyYypiXo9/J7B8UiQQDlJzKEKnd7yvQPVXWKVrzSdp4p
         UapfZ7hCaSEXnlSj/q27QaC/h+cvoq3FR3Bwpt77cRxow4bKNPnOhFoi/X3k4PSS4nIr
         QR/FYjYQCDHsX6EYMdIv9glosiYioZ/ZTFPz5O1vnRmQYCfB9mrkvWkpHXwPyupEC1Lz
         PjB7vB8txzxLTEzq6WemZPjSfnt1DXOnUUs2YSwJD17VLOKPGHIJfU7XE2gyEScitVcM
         JlnLGxkkL0NBngOpjZtM5pGI/YQVuRrk1dtuA7OFrm24+MXIRdZuvokwFaQL0eVoTTtG
         PQWg==
X-Forwarded-Encrypted: i=1; AJvYcCXWxogEcrz2+oK4OzHA4n8jyzQLRsNpUKCC81Wt8EB9xBNHUGGRcr/Trr8+QF7k56Q+TuhEJBNb5/tStoOr@lists.infradead.org
X-Gm-Message-State: AOJu0YwjI4b5/YugFNwN47jFaYJm1DOQLNwqDJwLA8G/2HPSPnEcbPi8
	GNiYZtrkeRv2JzrGMlWqZglhYWf/y3QEDOhvL7t1YVz2yrUmzLzRnWZvLB/FYg==
X-Gm-Gg: ASbGncsH8mt5XY2B6zeU+9xJacd8XBZjnV2Jux9SgdIYfN8wpTmUf5JbiQktaefUy0z
	fLIBp6jIKxN/tcdib5cVa8BG1z17akK5zCDYDCS6uz+o7kS+skp2L/o1I+HG3tTcbQKSxzcPPmn
	DyzammFCnVB9wzv4JJLf/rmhxOtLO8qo7fI6arrdb/hzCaVwfZc6a3Cv29slKLyGQq/5Ax3wMwh
	XNAhe4FS54pQqWKqod0Ql9UEskzhkI5Hny+fZ7LRSKl9xtFX1O24QVXwtd2z71qk5HgsBDQ6CLg
	XkOPq6C2mIOjtlEZuLzy9OWoqcIqayDvDMQN
X-Google-Smtp-Source: AGHT+IExy7byNjnzr61Qn1ql3vlbeCJFkmt8dfGkcDuwiloO0OM0ew357yO9XtgDpkXGc3h67FnjWA==
X-Received: by 2002:a05:620a:27d6:b0:7c5:56c0:a8 with SMTP id af79cd13be357-7c9668634b0mr182306685a.1.1745613079619;
        Fri, 25 Apr 2025 13:31:19 -0700 (PDT)
Received: from localhost ([2607:fb91:bdd9:47ad:b39:2164:cbe2:1695])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ce4e97sm263041685a.65.2025.04.25.13.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 13:31:19 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
Date: Fri, 25 Apr 2025 16:31:18 -0400
Message-Id: <20250425203118.1444481-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_133121_206750_CEE7C0A1 
X-CRM114-Status: UNSURE (   9.75  )
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

GXL I2C pins need internal pull-up enabled to operate if there
is no external resistor. The pull-up is 60kohms per the datasheet.

We should set the bias when i2c pinmux is enabled.

Signed-off-by: Da Xue <da@libre.computer>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 2dc2fdaecf9f..aed8dbfbb64d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -214,7 +214,7 @@ mux {
 				groups = "i2c_sck_ao",
 				       "i2c_sda_ao";
 				function = "i2c_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -576,7 +576,7 @@ mux {
 				groups = "i2c_sck_a",
 				     "i2c_sda_a";
 				function = "i2c_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -585,7 +585,7 @@ mux {
 				groups = "i2c_sck_b",
 				      "i2c_sda_b";
 				function = "i2c_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -594,7 +594,7 @@ mux {
 				groups = "i2c_sck_c",
 				      "i2c_sda_c";
 				function = "i2c_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -603,7 +603,7 @@ mux {
 				groups = "i2c_sck_c_dv19",
 				      "i2c_sda_c_dv18";
 				function = "i2c_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
