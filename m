Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD50C77B76
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Apr 2023 22:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d00rOmk0bwC9NpzI+pwiMAGwtByynde3Pwu70nZ/3YY=; b=ligbC7qa+DgBZ2
	pCLX3bMh61eQAmg/6Ow2WOZqCA3Dz+iPnKtnCq30yIu9N2khhaDdc5ZumADetnsPjojcbmHgocVxE
	+YVxYewnuRMuH3K78eK3usg6rzhz8jwvnOvlxM96u2luKDotlJ1IxH/7abCyl2HZIkhLVez0PjCgd
	Wp+pziaaN1+BxUAy9XbZfkqLx49pz3JI85TGHYxYn9/CCHyZj5KEImyisiL8PE0fQJFPV2p0A+v6d
	86+aezF0cC4Z3PU6JW1has8BX4j5BHh+j8TC/zGJgB3yo202MgCMZJrGn1zfX+37pPwNuCq/YLwuk
	+SSS3IbEiTF4fJwWVt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppzIg-00Bxal-1U;
	Fri, 21 Apr 2023 22:32:18 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppzIc-00BxWO-2l
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Apr 2023 22:32:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so16150247a12.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Apr 2023 15:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682116332; x=1684708332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+asJO3lKNpyKewDhntjul2HKZTaQG/ZxnJvEiKtxXc=;
        b=iUypOhzpIKSooSHJrdZ7+29N5xuSi8jpGDsf0mh4IKHSxy9dcHWof8tlwE2rFcTI+D
         DFpns5hbgPcEMJSrAei8O9/hwss05UPguicMCLtAQvMLjJ7y4+ZasYd2JffBbbrNocvy
         ooIdbgk2iS/xI2QczoLoONNdV/gNSQVGqqXQlramZ4X3Q5Ys/llcuePYU4Eoskq0C/8U
         nFt1ir2a/dIvn3BHe257L7JppKYdD2ERkf1SLFqaiet229FAdyEwjGArr+fL+NxkZn9/
         1L3YTPasbI3ztaUt1jR+K5OYlnAJ2FFyblLv7zGm1oOlBqSCpgomp3L3iwua+8fSAAHD
         WZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682116332; x=1684708332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+asJO3lKNpyKewDhntjul2HKZTaQG/ZxnJvEiKtxXc=;
        b=WbxmwcF6b1Lor9rQMpQKrAnU6F9QJaOs0WEWp4O+HqeRSQcVgmnxWALf/uF4wFHCtE
         A8wTxRKtVgsDf9S3t1Ul5dApu7dikg93JTtg70Sxy0pKqqhQlBB8cMUoyLf1HUSNPzr7
         9OAmrsMmROpdQY3TZPxG3IQB94UPt1/SdjI38zwih8/JIpjVR42GLriQTOb3ZFG0TNrd
         +bXBajbk7Bv9p3QvIcKkzZsLChB91/F0EJShc/YldnfpOYxMsnk4HAim767ZbqtJBckH
         Nlt7yiuBs5dnW6b6spHwMLD2r++8EhlSzOCPca7YKb3GukU4hiamDgJDTew3L7afEFKd
         zy6A==
X-Gm-Message-State: AAQBX9d8j4gIgBAveGpd+tbifXv/NvDVQlMYUC9BHrOBTG3g/ov7rub0
	74pF8SuyN/7GRsldjD8yFcGeog==
X-Google-Smtp-Source: AKy350bgR3ssd8qcJxiCwGuNeiC4063YsIgtI9oaMySRyGQu9S/ZxI+sVcBFW63gvJ012X1SwdtH0g==
X-Received: by 2002:a05:6402:711:b0:4fb:5fe1:bc3b with SMTP id w17-20020a056402071100b004fb5fe1bc3bmr6313735edx.0.1682116332767;
        Fri, 21 Apr 2023 15:32:12 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id g7-20020aa7d1c7000000b005068fe6f3d8sm2233947edp.87.2023.04.21.15.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 15:32:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: add missing cache properties
Date: Sat, 22 Apr 2023 00:32:10 +0200
Message-Id: <20230421223211.115612-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_153214_938352_51DD4E22 
X-CRM114-Status: UNSURE (   8.77  )
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

As all level 2 and level 3 caches are unified, add required
cache-unified properties to fix warnings like:

  meson-a1-ad401.dtb: l2-cache0: 'cache-unified' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please take the patch via sub-arch SoC tree.
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi  | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index eed96f262844..c8f344596285 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -37,6 +37,7 @@ cpu1: cpu@1 {
 		l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b984950591e2..768d0ed78dbe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -106,6 +106,7 @@ cpu3: cpu@3 {
 		l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index f58fd2a6fe61..543e70669df5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -51,6 +51,7 @@ cpu3: cpu@3 {
 		l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 431572b384db..86e6ceb31d5e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -106,6 +106,7 @@ cpu103: cpu@103 {
 		l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 11f89bfecb56..2673f0dbafe7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -133,6 +133,7 @@ cpu3: cpu@3 {
 		l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 617d322af0df..643f94d9d08e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -89,6 +89,7 @@ cpu3: cpu@3 {
 		l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
