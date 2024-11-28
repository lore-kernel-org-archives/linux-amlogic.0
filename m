Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868E8D69115
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Nov 2024 15:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8ZgyRJQwtQLjP5otkI3+tkifoAN4Iq07epL9DqQPYY=; b=CVKwWYq545LzAh
	47pFH8YuCEUYNmlysyeranhAR5NQO1Waw02AnJhNemAyhT2T0Xcmt3FGkB2whLclXOViK8sSLi+De
	fUUwTlqG92dIjNooJoS6okNzlPnwuTHPf5dJItISfJ2lkA2io6ao2rhm8j+ZXPFKpVaJPg/PXaPGB
	tz7BpBMTJjDKjC4sZnQ629u3EojHTuXPDm8R7V9M0JTclbfJeXe4AeGETawxjqTXfN3R67jzUm+Np
	hLlc6wivsVPnF6QxdMBpjfCbCHe4EHW5cvWDYimFowoyRORM6ci8j8QvXJjVyp5r3p7bYwh9sjUqG
	PYIR4DHkorkS3oTlSc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgKG-0000000Fs0U-1ak4;
	Thu, 28 Nov 2024 15:21:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgGB-0000000Fr5R-1p2q
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43494a20379so8426635e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Nov 2024 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807010; x=1733411810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S42PGEHBHY2kpBVY5qDRZG4XP5aA8pMSU6efiWvXnew=;
        b=hGPm03txaM3qp5tjZhMMMRUHIdwFofVM+JsKrPK/uIJW42ygXPO8xHLF4YwYKiQCof
         kSNlGKKqjkgnaRSUnxcmDxYlZOPU3Od/sPyr8i5PVMXCDa7TirJXCwWKH2s8AtPW39e2
         G9fZmZFOmKc0FIWqLk0YaGkfAukv4KuHzaqw7SfRjqE/XWytQlg3kM0FjLXInq9ZDlwL
         PiqD7qDCZdXaw33o5WyfgoQ6qsPz2onTykyNFO0LrFlwbgfUkuwl99wyfhgyf+hOZSSD
         ALff7xLVblM4GOmQEUCv11YjD6yvJtLfbTdnjds9ct7rOm8RWqoZK3a0ZPvJe+wMX/II
         56lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807010; x=1733411810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S42PGEHBHY2kpBVY5qDRZG4XP5aA8pMSU6efiWvXnew=;
        b=K/7+sXbkzttlpjZOc7BRgOP0e/F3yAufxwg5RlRZwihIdY8eEYfleVoZRLVywF+dlc
         usfSxspSDqYrOccEPA/3wVPSxk29bL4MPfE+i5j6vpCbpkPYQ337aYHawYXiqygqjxMO
         bzimfSxbZsuSJvGqb9r3IcnhuBCwqBhKsgK6Brnwgd7UEeU6lUd1iZhkMibsOeted0ux
         vvbfFzm5etSbo8ZXstTHBgS1MSxgVS/+L9a7BwOPpGV8Rc/rxIHa0jsnfj8SOMenGbTC
         ARA+I8zJJunoniUYMW4YooP2MSTIEWzsPKdAwOILxRg+6TKAQhfode3R3RlPwz/os8YK
         K75w==
X-Forwarded-Encrypted: i=1; AJvYcCW+Y1IxhbhyxktNByIDi+6YBkZkHxlA99vvpKGGsAg/easCwEbYKAkqaY2HNjh8qiMlmu+PuW624icvzmJ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7jGJ3tfH9q1RbgdBxoXcATeH+u5WMSkUVHMBPCNKvtIhMsOOl
	vCVUD6m2AkJ9LREonsFQA/W19Cv5X+6M7Vg/mmZvtLh8XRlOe8I0XVv9w4j/gmg=
X-Gm-Gg: ASbGnctIDQBHmbR+xj+vORco3jXrZ6pfg9Yvm/hkz3scUDRgZmBOBtmBck2nxKUEA6M
	WTXciZZBgGCmf4Zv3VHQBDUY7IxoMXtaw874JHAmlvbwvvJ1C0zcL4hqtikDK1Hd9m2Bny2UQhK
	C/dXSqRcd6/mmujFXva+NUyE9E3/HruagWu2EOafFQI7GeRAWeLD+B7xl1W6nQzXajTiynOmpdM
	6HYNH/EfOU+w5q9Gz4uBuvVDn+KVxYWpYT0REPc5KMUA/UvD+nahK9thpYJARMUTG9ytB4=
X-Google-Smtp-Source: AGHT+IGXMYu48cPlDHDHNCoxhqcYpYyTwMeAPAwgUmvro+k2EYbKaSdnX+mDxj6JuEry5M6D4bK2CA==
X-Received: by 2002:a05:600c:3146:b0:434:9fac:b158 with SMTP id 5b1f17b1804b1-434a9dbbc0bmr59715305e9.1.1732807010027;
        Thu, 28 Nov 2024 07:16:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 16:16:43 +0100
Subject: [PATCH v4 3/5] dt-bindings: mmc: controller: remove '|' when not
 needed
MIME-Version: 1.0
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-3-11d9f9200a59@linaro.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ctm1v2XGG+ucVjPxKUudaikXrk6rMN3i6qsDbqS9Y/Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIlcJoLSEYYm5MQW4xLgZnBP3eyGyvSOl/0RZ/9K
 JJyjN+qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJXAAKCRB33NvayMhJ0TLaEA
 CH9I1Fa8qcZ3MWsgMhStJ0f/PPSyNF3vE8CX4dw/J/iF5BymCoCST2eaL3P3SsspJmCQBSU/GbYxRj
 osLZTWfI3J+EDSUOn+HdBdMXs2rYhYq5bHboXwtxFm1iEN7VTQNNOx7Fnaud9YZ3aGTIv6ION4fueg
 Sf4RzG6+sJwrAEIO40zuPr1buajpoO6hJtY4miAwwmjf7kW9B4u7GPv2X79yt3g0m8wFSRgaYn53aD
 lMAHw3kvclnOqYcB+YFbMUPKZee3WO00M04oIiFL7wYq124TUo5pL7o5rKjw2yMx9jHLLRdDTBs8Qe
 eXlNvggZc75XwfmnZNnnInKvrV3iEKqYdhQOqnnLgb87N7BT7GEsqHjQJAiEPecUnRGUtl5frhEhUe
 TPttFVP8KaD6wJ6uf2W0J8hPCLAhyMx3pH9ib6qY++XZHCSAThoxixtSMngbGEOuDuamG1jQqTv8jC
 evJPfaU7uk4kYkU6bjB8iZADcLJfHgz0zUxFLzcdJAPpJ6yWbYNf7X1DylnBjkhpr7+JythyuK3CSJ
 EhoVlvkReBXAuyz2dFzUEi3E3JBOYwzuXx3U0V0BljQ1s8EVBIz38l6P6ZjBL9bc/uZDnisOtFDRsY
 p4H3Llh0+QOUwqjyflnJvR+Sf3NdMV2cRWu4mjtqZKmE7QJ8n32BoU1vkuHQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071651_504230_E46E88F2 
X-CRM114-Status: GOOD (  11.94  )
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

Adding "|" is used to keep the description format, remove it when
not needed after the split into mmc-controller.yaml and
mmc-controller-common.yaml files.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 6 +++---
 Documentation/devicetree/bindings/mmc/mmc-controller.yaml        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index d8297af578049b2bf71cf6e06f45aac1e42bde56..9a72354397591d9648e80806c2f93797abdc70a0 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -9,14 +9,14 @@ title: MMC Controller & Slots Common Properties
 maintainers:
   - Ulf Hansson <ulf.hansson@linaro.org>
 
-description: |
+description:
   These properties are common to multiple MMC host controllers and the
   possible slots or ports for multi-slot controllers.
 
 properties:
   "#address-cells":
     const: 1
-    description: |
+    description:
       The cell is the SDIO function number if a function subnode is used.
 
   "#size-cells":
@@ -321,7 +321,7 @@ patternProperties:
 
     properties:
       compatible:
-        description: |
+        description:
           Name of SDIO function following generic names recommended
           practice
 
diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index 99c01ce318d3e5aa914ed9b1b71e620538eef29b..9d7a1298c455434a0848dac32cbe77eb8f71c065 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -9,7 +9,7 @@ title: MMC Controller Common Properties
 maintainers:
   - Ulf Hansson <ulf.hansson@linaro.org>
 
-description: |
+description:
   These properties are common to multiple MMC host controllers. Any host
   that requires the respective functionality should implement them using
   these definitions.

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
