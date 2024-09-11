Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30590EE498B
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi00jbI/Czm242SYwYbvulgNFzzxBzPaeut56/NybGE=; b=uv4LKazsAEz4D0
	6kaAw/kUrYmK9PnekKeB+Lmc5Ml3XPaaI4K0XR2jh883kKDUl39Awf9HECvZRoEmYjsmPQ7v6JeDi
	KeY0e95cLMwz3KWNBlX87b4JccNxHnBJa62gYJGfJApE+amhQnLPTrmViLA4hgmd0ZaPGrrDCYOj6
	87r7GSGy5j+AbZSHSEMP/zSn7Dasts8dZIKAO5ssiANKqozWCvpN8TsH8N3ZgH0gBox/tU4nQ9aAH
	xKeZfTqUoZZK1AaueCXIUGV8x6vJTY+jI+XYjBk1t3tTs6iyxHP49dkqAuSgdMRWgF+5nblIffmIf
	KPptT4pS14mYuPm6wquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKT7-000000093g6-2lND;
	Wed, 11 Sep 2024 10:21:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKS0-000000093I1-3bnw
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:19:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cc8782869so12631945e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049991; x=1726654791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rsbSiyM71mODHTPu9JLHGloK45uN6FAOdQl+nPVppY=;
        b=xnaG3Ix10f4aSwKZ10Mirv08/UP9IGjK5shQlDAVuFN3s0XJcCOwNhTldHkLNXfG6r
         WE1jjUpL1c9yX6/+rfnILeJ2QN+h7VEiVX1rYYZcBNnJlu+9HjQ3mUxwdwTok8ls9y09
         //iKrA/tPU+LPQhNSv2gdjBLN0VjyL64YSLRQn1XbcBdgLVmB66V52RqHVTZyGQ0weNv
         Wvmabo/kapS5ZVDinCSOqnTXZKnZujG/JvT7+V5AwW1FQ6SM+OV1qSfa3VjVQRfgJooR
         AC8btXs8/FZmPYptEKKW6UNY1szCGb3phkqgCA575Xui+dgWjwlUl6MVY2AVr7QRc3hh
         Ek6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049991; x=1726654791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rsbSiyM71mODHTPu9JLHGloK45uN6FAOdQl+nPVppY=;
        b=WeBRFxxR1JFIRIox+EEgFCcUm84jPI4gXm4UCfULvYt8JO57wMqXWOcgYgA9A/AksP
         0+yj4mBSIngGkpTwfyTwHh4XXVBROeTOOWGBtZT7g00z/2fWyPIJARRxM5R/3MsHl4ma
         1vgNPOfLRnjzoPYnQNGuVdgjwp2T2rPYTSo0bVLpbi/htwkPb5GynNn88st8YBE+vsUT
         YJ3HFO5lh2szk5ZR/bXwTHwbsIQeiTS59fXIL8YPukcph5GeANAyYiXpLDolpCnBm8f7
         WzTET6MQHaj7WYYkjfUYI7wLhcI5Rw5nPL0bLs2epH19q5RahQ8qt1HTRODrmrByIU32
         KMmA==
X-Forwarded-Encrypted: i=1; AJvYcCURUPnavVn2e7fVZzKE8hcG9YyTeqE1rA9PMKj9gP8YRZTPZZSh1FkfQGrvMoIDusVF0KFzU1pBj9wufBxF@lists.infradead.org
X-Gm-Message-State: AOJu0YwEYAP6NHqEQWnRLTHfR+YUXcZI4fGcpaKbMcgsWtMQQRaRHbsQ
	s6pg+9b/Tj92uAD9UIo2fxY5nhKJfctnhLuZFWUa7x1zZZePnucsaPq1s66povg=
X-Google-Smtp-Source: AGHT+IHOmZQW97APpOJq8ZXf25e/+UVrWZ4mm4OzPbzXjCPjUnvBy6UlRCzzMumWzaBMjPHGS7EvDw==
X-Received: by 2002:a05:600c:450f:b0:42c:be90:fa23 with SMTP id 5b1f17b1804b1-42ccd30c13dmr21835785e9.2.1726049990742;
        Wed, 11 Sep 2024 03:19:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a4esm139349125e9.7.2024.09.11.03.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:19:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 12:19:40 +0200
Subject: [PATCH 1/7] ARM: dts: amlogic: meson6: fix clk81 node name
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-1-feaabb45916b@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=885;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pMewlYYDF9agGKPA3HCGL/qAhfwWWF/OUrcnBP2XiME=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4W7CAUtbmQZ6Iaz++U2H1cY8WkP1YFJGNRGgAQQH
 v++TdaqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuFuwgAKCRB33NvayMhJ0QQUD/
 9Y/RSQtbW8UkCfoEUha1rdfpkcWbPH9iDVW1744HyRtQT2ugSQgVRcJlhibv/7iuX8DcmQAi4+usE4
 pxOp3DWYO+B5HhMZ/PwJqN3DLgCS/2249YpMRO4IXEABTx/85oVCVuZ3E/BoF6yRHGQiaJBVrmFblo
 IfDvxTex8/y/5co8dN/CzZ49kR7mHJytoSYBOt6I5pqo4fpwpg4tLhrPw6BmRxM2fNG5oTYwnN8uUS
 gksgjc0PSqZ4B7qAv0EWl7OmPI3be/+vrJa52V4k261cvjuXzvcoI+RXSbzR+kU5GK0MyZbaHZwtej
 yOsl0bo0nSdqU6zdB1EjKCLKxaAGrHhWDQFB/z4Hmt9cSiZrR8FpfSVdQi6FgqJHiYlu63zIn1wBUL
 5m20iF+IknnsBre9qUng+RuStgFBQFJIp0SRzuU6F3AyTubFwHfPaz5i1D8rmVG3qgoxZTiFPLO47g
 uQbQi3qeN+zv2y9O5cfzHus9RJCS+PywOOF8NtqLSfTNH46cBWEbkIYuJ+kWMmOkJs44RhSccjb1V/
 WNDFfRTuGGXHnn0jFNhzFNxQ6xFCjav9mpzsZao+1aB3vO3J+VSULA2ExbUKGcexl2eUvnRtx024YW
 ZPBxmDosXIeOJNieP7XjiFeeRchZ0isnH6I/htHq1cZxOm6eRuvs5yeZJQfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_031952_985416_D4E24BE2 
X-CRM114-Status: GOOD (  10.17  )
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

Use the proper node name, fixing:
arch/arm/boot/dts/amlogic/meson6-atv1200.dtb: /: clk@0: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson6.dtsi b/arch/arm/boot/dts/amlogic/meson6.dtsi
index 4716030a48d0..1c4ea7266f66 100644
--- a/arch/arm/boot/dts/amlogic/meson6.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson6.dtsi
@@ -36,7 +36,7 @@ apb2: bus@d0000000 {
 		ranges = <0x0 0xd0000000 0x40000>;
 	};
 
-	clk81: clk@0 {
+	clk81: clk81 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <200000000>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
