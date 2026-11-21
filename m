Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA61606A695
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=thxw4aE5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VaQzO5TeLOm9wRR2t5UoMgJ6swxOYeAdRoDd+6TsPro=; b=thxw4aE5DiPI/BH5v5xvJeGrVY
	h+PLGt14Cig/K8qChKdPzXXBYtCl742cjR3ld3hLpxrmwpkVkgnJziDQbKucPm1xKubvk6lMI3t3e
	CJnEwyI/hBHAmqXaqFqC8Jh1Lt+1cfyRTxWOdqXaB5WBzDxRtYtBK3OfHj81t7IzKQX/5rv86BmdT
	+ZM4OinvcvqUbpkRaVB5Yc1dEyx1VZdjXKIvSCSMp/S3TmWsJfReMewnJz8yOn2ygsHDvaFDPjdj8
	6VFYkE/rSg0tCg6VSCoAx3tdizOtxsWCtsNyFYvkMmnse5iBYJPg0VMxWQrQ7os5/6F9npb7t7LR3
	mEdPoi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfv-00000000LVm-1IQx;
	Sat, 21 Nov 2026 21:31:11 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfs-00000000LTq-3LEo
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:10 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492690dd5daso1509574f8f.1
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296667; x=1795901467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=;
        b=wUTbZbzJffveHPbTFyOBRlikJx56upat1ewMQ8rtHUye+41E/efEK9Ykz7Xdg/Y1ps
         BsUHOh07G+GjokgrHulIVRHuWz9AQkWT+LXVv0CodJIBVsy3Epsl1YoFN89ps1y4k4Gx
         fS0E6rmXatr99WS5K4B+GB0RrUF2KeCNbjctEsNFy1SAFvTQr9ULzvr90qobsDkQB5Rr
         1iOdTiqkf9GuUuIQkAtns37JCQvR2tmT88XpaaicLR+tQryl6ApHbNWrvRhVjTNzITeB
         f8Y4J1iT+cZZKdI8MCyzQFuEcGhlZGPqj90kzVb8x4j0qHRipZBk04BT78pBXV3V4jnS
         QH0g==
X-Forwarded-Encrypted: i=1; AL+hErF78ryTtbaWYbXF8bKYDrVfn9gyfULSk9REhuBv8vbOYK0DyRZao/87G9w4M0y/8G7lhD8FePTNs2Z/znBi@lists.infradead.org
X-Gm-Message-State: APuU4Z91rzT/I0KnDOgLEuHsoQVs7E5SCsZ3DAWDxncHYvGbnvp1DL6H
	ByBijtXW04/4C22dJMbFr9u2WtXiNwpdE1YuzA16xVJrwD3BV/Ozfc/5
X-Gm-Gg: AZFdTZex9OPPCBSmD5lJ11iBLe1oGnF/ClYiVUsjwMT/9jIsK6ZCpVJwLocODXYlZYI
	/+7AqNjHJKOxJ4bVdPXX0PblAlISH3mgXMwRz89DM6dGwbAHSkd0uYAAXnna3HxeoW+4m9DBFNj
	87Pk6bdfhXQ3IdUaPW6h0WOjoxkNhFaQIRul3xb2/A9TSSEas6YKEICcb4d050iw9/GWLJRopUk
	7p5kAmQ7xXMn55w2LUKlwZvNdkC4tLz7obWAD8drg4rzNRHzGNjzyqA8uCxPpJN8L1CgFshvV1B
	k6CPYV5DwcSdLejqITOdIOmU2U8W5i3sKuQwugf+L2n6fheqyFPc72eQdWUt7g2i1QRWkfDHmS1
	HVauHLiMopqi96NWo2g3bc/3YrqIZqsou5Ls4JlB8/pwp5RMVL6wspkNuW3AZYmU56tzf6NPISI
	F8yUxcoEelj9JsNisyH78ub0/sqzy0pBChIMpZSTzomi8IVSC3E65aRm/meC04YkjKLiVrA+Iik
	oFo9UuAGUhP1atVbRNiDgUpY6ykD7+WydsBAyaHATYmx4ktHDefSFeBfsdG3lz+fzd8PJcHKSFe
	iRzQEj2TYQXuRq2e/I6CFqAbsrcR6lDdKeSGoilWXy41tyl0IiS3Z1l2VR4W24s4U54mZ/QSsau
	qxe1WfUJwg4Wl55U/gkieop0=
X-Received: by 2002:a05:6000:1847:b0:4ad:d65:ab13 with SMTP id ffacd0b85a97d-4ad0d65aed2mr11591573f8f.51.1795296666841;
        Sat, 21 Nov 2026 13:31:06 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:05 -0800 (PST)
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
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 21 Nov 2026 21:30:59 +0000
Message-ID: <20261121213102.143130-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133109_004037_E2D6A6C8 
X-CRM114-Status: GOOD (  11.02  )
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

The T7 has the same management bus multiplexer as the G12A, in front
of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
But a device tree that names only the G12A string leaves no way to
tell the two apart later: if a difference between the two blocks
turns up, every T7 board would have to change its compatible to get
the fix.

Give the T7 a compatible of its own with the G12A one as fallback, so
the existing driver keeps binding and a T7-specific match can be added
without touching the boards.

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
