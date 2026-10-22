Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D808E60A2628
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ft6sQ2qd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EqSFYy1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VJAGcMr8ELePedoqGSN9mqPpvtpskL+xG2QQDW5MhMI=; b=ft6sQ2qdgjCEkAqJxkq8DrKmem
	69YXd0FUq19Bshmpg+WSn9eSWIM5zlLeID1eP3Lx532Xk3z5ob5us1m/Ax4RXPWt6GbyxljTLtEY6
	68Ib5N0xkHExe7erfRXnxZQxRS/HaSjYO32gP3nzCiwAHrGB14Ga3xDBEzXd8qPvl1AFv+p3Pvs/Q
	VF1nCXsqEeYy4FJMg1n6A7WNEOXGSS1Gi+tobvve06YGTczc33g7ph5ZZVzdBUTzEEns+o8/KZ64g
	9G4bmMvrH/3x+RFfSV6w02VLTa9i8VcYQvcxjS2nzX7iN9GITKGzoEkjL/Rinu1HB2tf4CeFXyJf3
	94dNfYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZa-0000000Ei1j-12eM;
	Thu, 22 Oct 2026 18:31:30 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZR-0000000Ehpp-0iyB
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:22 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1df146015so967585e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693879; x=1793298679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
        b=EqSFYy1Qnv6RdgACkV3QKU/tcXRd1aJZUHJOrXzMrJEv/5daqLvzRAh2WWvQq9qLei
         w6lW2WF8Z087tkZkzZKJGh3nxppMUhmH797GlKJh5io7HkK/Ma72UCvzcOxRm8vVBidM
         xuYzzEH0BzrnRxzagg03HvPqSDazJJGZMnMonEy1J7VkMV5LDsVCCZvHwYo3rbi+Y6Wj
         MGNRQ+lqdG5h3/UwH0CZ/aU3wKQBFEH4uPYvKt4QVF1zuOpi1dVAFnFYUUOGiILuooCr
         waVqCvLgYSnVfJ4NRdFdEfkVOsuQxzvxexatQcUBXEYCFRBPyVRHxdl6/zXs0k0OeZcy
         6/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693879; x=1793298679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
        b=gyFxXZfWTU+ahLJozOQrkOhTLS7ujCL1/yX28HMFXHrB3iPLabAqxzIRGsL+0IVezm
         uzLki95wwxu2h59HdIlarKSgd/6dU2gx4SQi+O00xq9cXoqQ4ewjiebB+bXSY8jsVIjg
         gBKNSkRoUKqvgx/5YNmvOlVPmeuGwDjyfKIlNECuQjNV0OTAhR5jUWgSpO603VJ4aZq8
         3JI5vsnH1MSExXgfPPfUwBVI4bVP+RYaBs5Zl/5v+QHhANIbpnvuv4e2Nz2s2zafyxY8
         KvjHWiPV2AabYlKWkmIU9QJX6DBOGtxrsrwSsYgXtFz1ulJoRYyf9cxcyZs3ff07hS5z
         evQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9ZawQXvr2tkRNdf+85Gj74aR8GC92oGGNWPFo9GasW6OjlUGuujehfwWOYp6o/bjB9mFsMLDAVS86+Vlb@lists.infradead.org
X-Gm-Message-State: AFq9FYIarFhZHLTHZizb2S2ujKnfV4Uta9a2Qjwpgzs1NKbB/pFuBe//
	pyVE72AH5ZIRNn0sDsq+0Nw69Mmf5q3R2Vwf5TikJt11FTd09U7u7xupq4zytswXKSU=
X-Gm-Gg: AYBFou0ZiMzVVAqspqwMgtMKppARCvi7vwKMRXZJj2nXnsaUN+6WBU33iF1zpSDI6Sa
	Aijsygo9kEe0XmVZRYBLypoDUrE1h9kG1y1oMXguEU6zYckhCWLcRgaxBrhrUziXuIMHVqMmS/k
	/OKZcZ2eaxpva5VnJJS9RS0H2r1PrMZtxQxgIwCo7DxTjRhaiNoC5ZKi9og7aeM83ZRaKvPFdpm
	iLhJPfARmiBaDE3XSPzH6SLVKZI6mrcAhEChGoZDRSr0I4H8SuVOcy4iWDwSkFS9OVgEnYpvYaa
	2va6QapMFdA4oYjtAluDFyEGN1k2zCQxnYb2eUHP429Qm7OjGIRyN2Ac/Y0laoCWzM5SUtLYz05
	dAd+d+MMVjA/Lp3Efh6E2NSE5wWDMUduGY1lntV6J7wakp1F1dQdyG6OHdOk78oeNKitRQVFyzh
	sbwYl6NBMU4brDmXi7KzeLnqQn9UumJfK73SYpCZ7T1cWDTI5hPXEM/h90cNA7KOUJMqa+ypPma
	WY93GPMlP6SCbfZGb4GLrxpVBZ1ygb0UpVe02KGpfF5a8/OM/O1wxCeZnuaAPHqnKxnK+aIpjD1
	JctuodC97p6ZSZ7vRDra1lbw7mGwfK8u0vzKbWDGQpkN4VLUiRYmarB/k8QBFY4=
X-Received: by 2002:a05:600c:6094:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1fd89daa9mr116976045e9.4.1792693878853;
        Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:28 +0200
Subject: [PATCH 2/4] arm64: dts: amlogic: s7d: fix the GIC CPU interface
 region size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-2-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113121_580717_7EB31578 
X-CRM114-Status: GOOD (  12.06  )
X-Spam-Score: -2.1 (--)
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

The CPU interface of the GIC-400 spans 8 KiB, but the S7D device tree
describes only its first 256 bytes. The GIC driver then disables the
split priority drop and deactivation mode, which needs the GICC_DIR
register in the second 4 KiB page, and warns at boot that the range is
too small.

Describe the whole 8 KiB region, as the other Amlogic SoCs with a
GIC-400 at the same address do.

Fixes: 1a30661c20de ("arm64: dts: add support for S7D based Amlogic BM202")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 5593ff9e07eb..059a1bf37584 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -85,7 +85,7 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
