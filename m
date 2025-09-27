Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94DECAC5B8
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Sep 2025 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pn/KKJIwFXkB1n1pDRp6PDB5/aWZo+wnDcGbrvtM/QE=; b=23h1OyOgOj5UAV
	6oZLi8L7Jit9ZhVQlfnUCM3sGKITcC0cu6SkXWE7md1P4cxKt8cZtlbSTsh2Xa+0maN6eRVi+wpsU
	9ivSiHGwj4fBOlHOSiTQFzexHRIaH6vk/rP2b5Oy8nMshwpTS+DW1PeUiBorcxR5MuYnLEEh2GAzD
	j0karNzEJPTkNYorwnlOe2xbY6xzQEOc7VUq1iXw/0BNAZZY0BGBfN8DXidexBZJxjWZZxORLg7WB
	dzPCQpz45xoeBraAkJ4NCsfiP67ArM537q0ubSmBRgcELlTVLa4mqynYwU7n0LMuRsCsR8hBAuc+D
	C07B0QYiN8lcilK29Hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UNU-00000009nOs-0bvR;
	Sat, 27 Sep 2025 12:50:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UNR-00000009nLZ-1iQX
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Sep 2025 12:50:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so2517747f8f.0
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Sep 2025 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758977411; x=1759582211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDIgvocR7eSGyBef7vxMCGlKJolA7WVr3JO0DUc8Zu4=;
        b=cOpra0qOvmkLwgsFs/sEpalecygSBEOMNuVPDSdkl9w4caAyw5rm3YSaUL2jCqAPax
         4ErUsgVKiV8Ch7BMMvqOCKO0fNgT1OdWutDJKVgyyroQQwPyTwQ7j67Nx/Jt4aQ7uk2u
         jRLjfrC1BoZqFvvT7iNR9o6a3OdHYxsJUpZZezkl2TmviTTNCyK0yxyYy6D4KwsKbVt8
         heATUQFHddYU+zRsIsWpQpT1kHoTNZWXBn7P91M4+kbpWm0mOGLbzsgnVFIQBeU4Y8Yo
         z57a80uWrrTroh7wkf4jkHay8Yb7IlzDIuqJyAzwjHJXW3vs/H2uOQxmcgX/d+ubbvW+
         Yrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758977411; x=1759582211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDIgvocR7eSGyBef7vxMCGlKJolA7WVr3JO0DUc8Zu4=;
        b=RIeyLqAZB9MPNq67dw9avQM9GZSq6ZaTtgRIL+NJiFboRbr2bTzM4yF7fANcm8mmAo
         3qG61A6zTQr6vdn3bgw8TQRlCwFEUnPD0L5iuxWKVmxFZojTa25JAF1hM1w4G7OK7z+g
         FvV3cQARoIU08gSdScZlrfekivEmh8rViCGslbtI3IuJD1Ua9xjWVbcTmTgvM5NWAiF6
         c/JS9Lz232vsP6sjMv08WEUgBUEa+ZIXuesyYEWEKQPxJm+D/DPrxHI+kODJhTJvbgjU
         GDqDukDmuIxQka49PW9dufeQrI83Tb5aZc5Dg+PITTXPr+HkrN+lWgbGIGx7dHaOckGa
         GCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU0G499G+I/UW5f2Jug28cfQJ8JN1dtf8lUkWB5GIAb78yzhc/PcqPerFFyOfz7H0thcCYLEeWB5XCMbU8@lists.infradead.org
X-Gm-Message-State: AOJu0YzKxYyChHqFE6nc9EWJNFCNObVmbaHJ+2W1wu43rgAWe69JKunu
	ddtCSTPCSq180IErJGrNBIQdzkXAPHCcz8yb9LXTFQiMjm8iX0upuejB
X-Gm-Gg: ASbGncvkSzFM78i6B2tdLA/L5UPi4VClxgZlK7gmdbtnTvgLlZlE+kqHnk1B0ZAhOUC
	GZtj41Hadhx0ao9TG/+g9cEiZb6k+P/z2V6Oydn+/d+BZZPsGXLrj7/JudszzyvNcmmcmLUiM5v
	vhgekIC16ejD/zQN2eRSJXZY0iXb4o2tNbKwHzSeOBv/6Lv2WuXjw/gntD9ilKrhFCLjPehN3ED
	LDBgAkWPah0mp8P677Rgi/jOZtkJE+5ED+PfVf0CZz6upWe1V68OloYDb+awxhqYWsDIoSFfGi0
	bfMx7arWimhkaE21Hy9TbfrLNdUSZN5PFCC1vW1HT7XRrw3996QFagcsL4Zt1//f2gbipLtLi4z
	yEr31QmzzfyKLPGiFc1YjkAy1IV4OsY6e2EvOKg==
X-Google-Smtp-Source: AGHT+IGHl/MrvnBmwYJlng90W0ae6rxBIE9Nf84TxnL8stOE8Xyl9IXCEHjFwJhjKBi77KUw7CW0SQ==
X-Received: by 2002:a05:6000:1ac7:b0:404:2fe4:3a80 with SMTP id ffacd0b85a97d-418069559cbmr2197982f8f.25.1758977410844;
        Sat, 27 Sep 2025 05:50:10 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bede39sm115338255e9.18.2025.09.27.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 05:50:10 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
Date: Sat, 27 Sep 2025 12:50:05 +0000
Message-Id: <20250927125006.824293-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_055013_457776_E2B6DCA6 
X-CRM114-Status: UNSURE (   7.97  )
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

The Oranth Tanix TX9 Pro is an Android STB using the Amlogic S912 chip

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 2a096e060ed3..08d9963fe925 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -134,6 +134,7 @@ properties:
               - libretech,aml-s912-pc
               - minix,neo-u9h
               - nexbox,a1
+              - oranth,tx9-pro
               - tronsmart,vega-s96
               - ugoos,am3
               - videostrong,gxm-kiii-pro
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
