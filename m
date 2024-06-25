Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A0FC30653
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d4oSmYLX7mW3vh5HXDfksaEpjNeL3GmYgVNh/LNhBTI=; b=C28ztk1esaX19m
	scq9qGe8opxB6lB2/hBjFvBzQS0UIJrRr8C+rJLJxmAzNLq/h/UTi41P/kWKW4feSib0byJwD/HIl
	mwdQW5Hep6JStgavv9rP+EudBT3tKCI81L52HaSmvv65wqB3TMm/i6P/Vh+AqyUB5XQeO1QfSmMBO
	I1z77GR3On0ZpyGUZtUWQbD+5UcqH+1fCljruKFOKn6cg9EmPCSRhsCAj7Oo/XLSisBp+39Jxv+Ru
	87J0l09JVNNYEOwUSjRYseumDbEajehwzE79SQDtSPtRuJV1a1G8OD85f0xREuJ/audrdeioJtv76
	kZzOZvVPpJmHl5eo2jcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4lB-00000002cgU-42h4;
	Tue, 25 Jun 2024 11:54:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4l8-00000002cg3-1WXP
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 11:54:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-424720e73e1so44377765e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719316488; x=1719921288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zo/JwLek1zoDmguFxrFNc+yd8tiMt4oeP8zyhyzsa9U=;
        b=DwSI30L/Nuh0r0bxB5wNGp4pjdd665olOBsqbeNuLHmbnttUBLGrWVladSN+y3yyjN
         h74VACKZxq87hdkLS2e8vE1cAaN6pT4xnY41cs9nb0OZZvQcotZyLuUzewvw439wwXW5
         NcWapgzg92fTqbcwh7Kb1Cgc+cfSZEsOdgVUK17zXZgpRYr3S8yI3fQ+rQDr6j7fcCqc
         jScMZwZVahWHblFQz8a8CGWCy4zslG1KeAm6CdV+lyhNrFZCLgC1Vla0iMlBrlmP8Xae
         A7jaaN13xnAKkukzn4nwIYPoXiZWS91QmoHI+cv14u5EIHxY2OWnhB9wajYZcfcLIoLT
         NXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719316488; x=1719921288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zo/JwLek1zoDmguFxrFNc+yd8tiMt4oeP8zyhyzsa9U=;
        b=wnYqazEbjpmO4prt6GzOKWFoNtKEVO3yVk/YUuT+kbf0YBcyLa86fmpaXkWF7Z63S/
         XtwoGs79Skkh91xGqcqeh5OkQ3D72sbRSNHFu6igUI59wPWvwVSXiHSHfZE+DtXfyMjy
         Za7BUsO3WZVxP5uj3nw6Gvh/NXuFdX1bjnjrJCk5oNxaySoMbn9Ytv5auYYqiWz+U8f9
         BQui1WRyyRAt27rndjfTQRcmTJwODxhkGvtFfnYwN/PSahlSZtpR+BQPUMr40mrT2CM7
         CHzFF5Y7uLTYrG/JD5hO92xrg/46lXkF4vkS70VOow0iBb1MSM4RyYhZ8oExjHmmeUaT
         xtaA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1A40ohdd+oOJzRF+Zr+ktQWQHs2u3hD5hfaDj0vGPYYpjD5YwT6IAnkdJDGQZQyfqQL4UV0ivU+AlXh5S1++l7U9s6/Dzc0TRhSp+JSyetY=
X-Gm-Message-State: AOJu0YyV7LsRp/KL6b9ejmm+xBFj9fsrQ3n/xUJtNnyxHfxlsUOA84/R
	CEK9Z4f611ASM2RZPsPYR/4wbClqA1/gf0fREBRoOQ00LOU3fvN/yquKIYvUsvSBOwFd2hafe5q
	o5co=
X-Google-Smtp-Source: AGHT+IFIZVwSrEzsurp736JXh70kVDQzuz2SL8RzFG/oZ2827PEdmqkw9RLl/8WeuoJ60IR9y3yTwQ==
X-Received: by 2002:a05:600c:4c14:b0:424:a5a5:a4a4 with SMTP id 5b1f17b1804b1-424a5a5a83cmr7239865e9.32.1719316487864;
        Tue, 25 Jun 2024 04:54:47 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1b57:b4a1:3d50:32a2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm12747240f8f.39.2024.06.25.04.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:54:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: amlogic: g12: bump spdif output drive strength
Date: Tue, 25 Jun 2024 13:54:41 +0200
Message-ID: <20240625115443.934763-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_045450_427053_EED09059 
X-CRM114-Status: UNSURE (   9.54  )
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

Spdif output currently uses a 0.5mA drive strength by default.
While the result depends on how the spdif output is hooked to
rest of the system, this is a bit weak and signal quality
may be poor. This was reported on the vim3l for example.

Increase the drive strength to 3mA, as used for TDM, to be on the
safe side.

Fixes: 649675db939d ("arm64: dts: meson: g12a: add spdifouts")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 138fb18c6480..4057ee808a58 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -987,7 +987,7 @@ spdif_out_h_pins: spdif-out-h {
 						mux {
 							groups = "spdif_out_h";
 							function = "spdif_out";
-							drive-strength-microamp = <500>;
+							drive-strength-microamp = <3000>;
 							bias-disable;
 						};
 					};
@@ -996,7 +996,7 @@ spdif_out_a11_pins: spdif-out-a11 {
 						mux {
 							groups = "spdif_out_a11";
 							function = "spdif_out";
-							drive-strength-microamp = <500>;
+							drive-strength-microamp = <3000>;
 							bias-disable;
 						};
 					};
@@ -1005,7 +1005,7 @@ spdif_out_a13_pins: spdif-out-a13 {
 						mux {
 							groups = "spdif_out_a13";
 							function = "spdif_out";
-							drive-strength-microamp = <500>;
+							drive-strength-microamp = <3000>;
 							bias-disable;
 						};
 					};
@@ -1826,7 +1826,7 @@ spdif_ao_out_pins: spdif-ao-out {
 					mux {
 						groups = "spdif_ao_out";
 						function = "spdif_ao_out";
-						drive-strength-microamp = <500>;
+						drive-strength-microamp = <3000>;
 						bias-disable;
 					};
 				};
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
