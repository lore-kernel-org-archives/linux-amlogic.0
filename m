Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0E2606A321
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2026 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4V9dy791
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zh8sNInjjNHnjUvU3pwoetLUPI/1UqzcgHVKFd0Jyak=; b=4V9dy791LoV8EqSH7xbTxcBYgN
	fOAbFi+PYTf1hNvcHSqfVMkxZYOtOFZuj2j5ea7Cw8VR/AEiTbveijMHdYOpQsenapvDy7qYNiKYy
	BofSfpkAY18oThVBh0NIpXjyYq0hYSkl/f4/aTd/yuzoW8rmS77hzkOovXw/pF0MOaF1+aG6gbK3a
	zada55lywxxY4648NF0yh976pGkKK0KbNNZkxH/AIK5JZrjWLq/2VqSobZ+kgxtyLtuOlpHcJ/MJP
	bebDg1yPrqSeJmGFWG4KkRca5g/Wbw5EjKOjoU9ITP7ytj4652R/Bl4RkP869LNYG2CtM1WPdmK0j
	KzRYXM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfZ-00000000RNF-03J4;
	Sat, 28 Nov 2026 07:16:25 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfO-00000000RK2-2nzf
	for linux-amlogic@lists.infradead.org;
	Sat, 28 Nov 2026 07:16:16 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so7911111f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 23:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850173; x=1796454973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=;
        b=lHXyJE7P3najfcTRT9c5krAG+OKOs4LZgXUzqicmqLUFTdQj6cJBmtotL0XYW0gUec
         3Ysa9x89eb5f+pWEv1r3WIhHDvutUF/AG0KeJo/IlCVCc8nEl2XnrXcFJCj6rPUeUV+i
         1j0VSte4uddF4vyRfCwnAdnxdOzRNfVOS50IrB5UnC0DMB/5EFl8BPigx1y6F39m+Whw
         Wm/8OIHVhNZcodrv1EWe75LYCaco07jRYqL7ol8715GY+C7PCDPQnvXvk11cBIoy6e8k
         tn//eLTMh0YmfSbS3blj3Cz6+GEs8qIEW0ew/yd+9UX9ClwFysDsDO6PHmrESeJKnuHI
         ifSg==
X-Forwarded-Encrypted: i=1; AL+hErFhdIkvcbvxpTsKSeqjIWNUSVB3JDdoumQIMezm4nxkj3tPECzlIwp+WXdBNv7SXjqg6mZ6dXX6QCHh+hdL@lists.infradead.org
X-Gm-Message-State: APuU4Z/8Wc3KbHpponNWFksFZd9tJXc5MU7ZuQiFUw7Ef1VPRn0dVh6D
	AEoS1nAD/IODx0Z6QMVHPK/F+cCjw+wQQYBu0SsP2UsDZWIARH6Q4WW5
X-Gm-Gg: AZFdTZev0CDol20B1UeiwD0BTdM4KBCZioLp0UjpFd46O/hgJ3ZKmxqe386SMLB1qJk
	nKiTYc8KDWTQAeG8ktJwy6YEzvwENAB4CXhMPHyqxgrUD7+CGQiDFmeV9f6y1fEjZEsvx7/rP0o
	U3Ly5Fi26CJrqJ+MlOaU82LUomlI2E1k5aWtNrVquDIJH3QhbKpS0U6Kd1ajjsTHKWynwODLBtK
	seI3tt9w0VzTFugmLEAbKI8HFKgIuHpwiMs5qQIwkp53N46yt5zIhvFoIBSpH+sTsO5Hl5Ml0E0
	DtIJWQdBxMbl6vGIZLb0jmsHzpjrg/5OZvfBRvkOawes2kEKu7eP/a4soeFa/EYdEKV3+ehQXnI
	CT5jzpSYhqfD24n3LVtfDGZTnBwi9PwxXlmDa1c5bzx1qwAsq42r0nmjIlwfDWekM2HP3FPftLw
	+mq+nn+1nZMd0iF9Bp/Zku+Mh1np3CApl77VRFsQbb21FR2yIETrhXrQ+qwU/ROGpe2GeZ3iidN
	ONKXJ0qiNVlmL4PiA8aXqnQVXLqhwzVzKju6Zjho5Mz4blKSSleM2dVrnXLGMOzpJMdTYW4fDmO
	Oqp61prvCDnEGtRlgYQ5FDES5iXv/N+Ueq81RfyPqpCN5Wxl5dl8cYYMGscHINjLxqMn9ABC1Ef
	z3ygaIzKbeRgdSA7WTCzl06o=
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr687806825e9.5.1795850172794;
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 28 Nov 2026 07:16:07 +0000
Message-ID: <20261128071610.27855-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_231614_719364_0E1BBBCF 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Amlogic T7 has the same MDIO multiplexer as the G12A. Document it
with a compatible of its own and the G12A one as fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
index ec5c038ce6a0..ad95562d1f3b 100644
--- a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -19,7 +19,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,g12a-mdio-mux
+    oneOf:
+      - const: amlogic,g12a-mdio-mux
+      - items:
+          - const: amlogic,t7-mdio-mux
+          - const: amlogic,g12a-mdio-mux
 
   reg:
     maxItems: 1
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
