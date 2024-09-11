Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77A9EE0213
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=meNACne0tW5za22VMDPGvZFOCxmAkEgOBBnyvvoKdJc=; b=WYSvHPqGGPe9wy
	Nj6mfCSFJhSOjzguyXGM0YkymQ3Tu6EIn9GcX+ARd+/zTvUDs+4Fqbp4S+MMXJboloN0mTCrxokPL
	963lvnHPP7w5LR6M3LuvSUqIQE8Mo5izajRg18RYnYRuhrsnpRRmDSsF+f3QgwvscSZcS7qU34gUO
	gMQZHQgCOQlNLi74BHoaEA7fEYlDP51Tddhlwgunog7IppXT0Rre/pUF4GeW6ZtTThWbGDpEx6hL+
	1i45mjj6lqcwtEUoByZtwFtNmY/9dQwgJoC6oSayWjrgvhI8ZG7nudKamDmwJBlTY+Ueio13+9p3s
	dDX3HheVmHYPf0jTBH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPgU-0000000AFgd-18JJ;
	Wed, 11 Sep 2024 15:55:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPI5-0000000AA0w-2I3p
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 15:29:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-374c1120a32so1543071f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068596; x=1726673396; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfRS3UxW22sduJXP9jrSw+q2lbc7nwzux6vD9kVr8wk=;
        b=h+4sJdwTjCy7dbpmGSRJlbx5JVXCo49hUxmvkDVfSRgT9CHigWOrru753u6T4V/jLm
         q9B7MBB3HIzD+6Exyw4GUgWWY342tLpWR1MUXxJiOE+KreDAM7qwaaGdCTK1yH2h/mqp
         9lK8Y13hfHtEkeLLB96dfnuKZ3VCRxaG4JfqIo2t5Iok4O1loK77qSeJTyZehdRgp25U
         8YJKsEBFKcUxGoGAlGcC7QC6rTjIZ7svO+2np7eWGXk6ZFKSBv/Z6+MrW+1tXcrC0/K+
         VXhyYvYs5y3SULPqJnv0XLh5NVH0956VyNHX51KcvSPQH12xV/ncwWqjemQP91ZvJK2l
         I/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068596; x=1726673396;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfRS3UxW22sduJXP9jrSw+q2lbc7nwzux6vD9kVr8wk=;
        b=sGfc+vewnwyEtmkR/XxJsWBAYDn50c1JB5tzY4MWo2MLk4q53+GTY+f6I6WunTKNkD
         LiLqdqaRdb/JIrIarEKXzl4WN8ZnQUEEE2EWL83ykj0PR3ujpXbp4D/UdJCqrXP/sNcy
         nmaWCCO5H/CR816ZmGHYcbRWlUaDK+U9cD5ry7qWcitxR/CPXzRCwT+SumMx4h1WhkOw
         vXwG5ECQyuiiYC86sLAOKvzJGxoAkegI+g5U/FThPeiW75gOoyJcvMJXcfi5yL9I2nEH
         eORJk2UJv9TbPwyTc16HzD5ZXH/Pwbalt85fFwqv21m3nLCrR91SY8ufpO5FaUDHTpyl
         f+4A==
X-Forwarded-Encrypted: i=1; AJvYcCWdATcVjMZOfeeuHOcTZYzYfXBPwJpVCBTycB/t4PHfZoANlLX2CLReNNdU0ZHRZ670U8Met9yi8vMI0Y9a@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcuh7Oumm75ALvFQ7LAZUYwFEftfw4273bYEOKr4ia15xpZ897
	m9MvPjbUUJhfto3wcfgcXM92vVIBEAzbG2NKLAKkaGT3Eei1enaB8D7M5PbQTBOSCA/oF346Hvv
	x
X-Google-Smtp-Source: AGHT+IGXQ2hzMBDnhXevYTh9vr/JVyyGsAeL3MCHgdYs+l65YBoC0mUZXvxW5mC5O341xNev+eDcRw==
X-Received: by 2002:adf:e502:0:b0:371:6fba:d555 with SMTP id ffacd0b85a97d-378b07a4f81mr2082539f8f.18.1726068595751;
        Wed, 11 Sep 2024 08:29:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564a2a5sm11848151f8f.17.2024.09.11.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:29:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 17:29:53 +0200
Subject: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: also allow
 meson8-saradc to have amlogic,hhi-sysctrl property
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-v1-1-b8c3180b2fba@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHC34WYC/z2NywrCMBAAf6Xk7EKTCKK/Ih5isk0Wmge7UZTSf
 zd68DQMDMymBJlQ1GXaFOOThGoZog+T8smViEBhuDKzOc5nraHXRh5cXmv8krM18GjSGV2GO5V
 AJQos9EL5VykRyFt85xW0OQW7YAiLdWpcGuMvHpPrbd8/O/WHdpEAAAA=
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FvRMeg8VsdpoP/BLOmFCJS+wsAKQAz6onvwzeSLjZWA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4bdy5dYmWprgV8yKo6RDGvHopOezlwCqDA94NBK2
 7ucG7laJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuG3cgAKCRB33NvayMhJ0QD+D/
 oCZXtvlJpopNSOeaiN/HNflqJvhcMgF3z8za55rHrwG9nv1L7XnvbAMuTqf0bW/Lu11vb+8pyBUcCt
 bJJSYXryAYkgdua17hP6A1M6ar+AGrvexY+RPt2PGT3F1uSv9qx/EVNmYucyGgWSA5IKyDbAknFpYr
 akFCW/Wm5OuW7oG9C68eu4aP2VHVUne3s0aUJCnUmbv/W6WtFoVcUO5Ap5CdUozjMruqLba5TXfy/s
 iZ5UvqwQbFCekJoIIm1GtWWYmZWhWDoF3P+A37Tw9Sd0mbloJqSAaQQYJol+HNN2r3pkhHLtcAbmB7
 r1aubh9DJ0+iVhtZrpDpd7eEjT8/pbD8mhfkqlbhPVoH1UL7jsoo2/IwzpgF4Zfuagu0CKv1FWHzCM
 +I7nOx1YypK4nzm0H/FlUYQr1xpmxC/IL2xkx48NwkEjweKxMHS50g9k1OLl6gKzJ2PsXtJ0o7hCnE
 jtF+WkUS6R5VLeX565posHg8OsNmhcbOkI8AFHaWQbU0OTjPkjoNWUECDiCE5puBbr65ZYsDuJSP4q
 J2z84HPCT1AD9Ds/teQoQm//ojtuklX3+bJ+pRUlfv5zC0F6Qzb13GwemLdznziyemgt4JagF2bgKu
 oGmGfAvxvu7Uhc6Ylm1nYpc2XTQAeQVSj8oullyWuY7i+9gWOZpe0folEAJg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_082957_638054_DA7386FC 
X-CRM114-Status: UNSURE (   7.31  )
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

The SARADC on the Amlogic Meson8 SoC also requires the amlogic,hhi-sysctrl,
property, document it by adding the amlogic,meson8-saradc compatible in the
adequate allOf:if:compatible:contains:enums along meson8b and meson8m2.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
index f748f3a60b35..b0962a4583ac 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
@@ -98,6 +98,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - amlogic,meson8-saradc
               - amlogic,meson8b-saradc
               - amlogic,meson8m2-saradc
     then:

---
base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-127d3feddf3a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
