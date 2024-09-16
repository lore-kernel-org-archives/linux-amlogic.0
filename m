Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103B3C3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wm/6mPYqr81Zh7ks+VW1kLn9R1MRJaaiHVuMSvIDyBs=; b=30T/eP6fLwECOt
	dfZKpOrEgJS2fNuJiGc1Ebh5SI8tfkkpbHekkxKps0aadCQ/T+YT1chq08t/mwJp6K2q+JKCC+aOL
	nqPAOu/3TBYKJ8ceOizwdKXxVoeuLRFGu9lBQbZAD3r2jKDV1RZRYhIF8qipdpI+kXjuX8lijySkf
	706zfwMNDUEXHAdHhwJH96xIgoKtVlW4PmJMCmxLQhLLCQaUXZ6k2VMH5T+EdVJ1v0ZAumChSB1wi
	lrdu+uYPfYTInIXoKjF6AF/puCxTFoLoqYb7qw7OwiiQw0VzdtadiGjiBPZJLieooRvbbgcCM2xla
	r7DeUtQLphvpflS4Y7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6xY-00000003PVO-3WU2;
	Mon, 16 Sep 2024 08:19:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mz-00000003NH1-0Lgw
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-378e5d4a80eso1532078f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474131; x=1727078931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=580RMZg7BDFC75JF/Ebwkba+nsn8zF1UwtVo3GvoGBo=;
        b=pT0s2vlXu0rnd8BGNJKhBVBFH5gD0d5esUXDmYqyKqVdoreM4xvd4N/7mqq4tmNoQZ
         dZPy3mmicUHQ61jDoVoIPpVqgMG6hO2sibhgVJ2Aj7sUK36APgEH3L+DDccK+6xPWmnL
         EWczqOsqp4k6J0zxFVhl8D9xd9DLfIu0Cul30NldpwjRf0qaqpv1r8blL/WY2Et60RQd
         f6hLBKFeJKlTDO+IofJ2zt7xvZCJRNz+Jc5/XLMTNJzNE/UC12sa0biFQ/a3Kv1XkApB
         HGtv0KNa4KqByxkqbcussxOJ4atzS/KYS8LG1tcykHhnwrC2W0brrjOKf6rJ/DSyJtVf
         TYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474131; x=1727078931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=580RMZg7BDFC75JF/Ebwkba+nsn8zF1UwtVo3GvoGBo=;
        b=ooluFCymws8o5Mcd5aZde7MyRu46oqaNOoYLq7BG7lpx7EOmIMXLNuPA3+l4x7g7nU
         US8+CHLjcqVEExAJBxfsGi2VIVQTGoj9wat1K/ijWsXp3t8Vj607IhJieL6xA209jiIE
         chIOAI6U/VDpXUNwrJGrDnVqtt+eg2uNi7RnLJ0GTZMd4p6S0MEDXplo6QceKj3gQ79J
         ioQtPPDjnmt4ObCKVjItgKmMlsDUHrTx5lFQzS4lEeNI5RSja1da2E0Az4ZYHlXxIV9y
         wwPtBH4CDebjzs62nSHOkh1dRLAlV0AnUz/gRoyn9tm/+ndMGphGSxtsEkcK1FSIeZV9
         4U5w==
X-Forwarded-Encrypted: i=1; AJvYcCWLrVUqnSMH5E57D+KEHQ4or9K5x8rgolMz60UIiO12+bMuMjY7FtF4qMraj/4cW8Pp3M4K9qZHb4EysBOd@lists.infradead.org
X-Gm-Message-State: AOJu0YyMgCgPhodnB6/P5VsUdaDoxtCh8d23dWaoEmpq1kbQYvkz6BA3
	RfnibGafcIA94VlOz+BvPUwTkF3jUljYl4QDiSsIOjDbADEcoN2JwIxRdDYR1hC9zyNFqty/ryF
	o
X-Google-Smtp-Source: AGHT+IGMREgifms/lDTUpClDP5pCg/sFWOg3A40dsdRdMnpj+FRfgzEkbXrVVJZCs/soJ5ufFsVqDw==
X-Received: by 2002:adf:f0cd:0:b0:371:7c71:9ab2 with SMTP id ffacd0b85a97d-378c2d55524mr7817208f8f.52.1726474131002;
        Mon, 16 Sep 2024 01:08:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:38 +0200
Subject: [PATCH v2 09/11] ARM: dts: amlogic: meson8-minix-neo-x8: fix
 invalid pnictrl-names
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-9-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FU06qT+NPvOm3hhLmS57lMOIKalbhsZ4lUkeWm62pBA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eIgjcR0Jy3c1zFVfb4awqVgjM5vpv5Gc48MIoY
 coRQ0gyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufniAAKCRB33NvayMhJ0VPTEA
 CwOtatXF+N+5O1QjEKU+cxwJQAKmdFc0sDtqao63cmeT8zsT9MtMuPVVGf4NLU9XkLxOSHPcSNDDDh
 Z7vwuLpkaZVKzT+rpZjiZVUeAtN8bsyT9SGM0YtCFRtN6YqW9hVJARwRbezPuii6eIUxU3xHT4U11y
 hFA1ng18uIfH1c4+1blVnD3saIdjx+fi/HcL9jlEzkci4VpQh8N2ZO4g76xIfJVuT8VyNjcBb66k5M
 wqNVkeUh0DRO7ZMcQqrU1wt7oSkarpPTNk2TslZKsHaObTL0gfZKenOgO+cqEF83KQjy8MBebkFSMj
 aUrRG9syBUACtmrCuKbGVhUSznZQ0FjUNWQfTknGUXT/yTooCRfKxqGoSUy2UQ7VJj7mEuSng7OGhu
 nk23cTjLpqIF9wair1ntQmTn90dqYbTZYmc8PKJMXYXmeNLokVexmrV2qolrwo2LeA/QfznLDCJmzg
 8DmbCa0YUdqFcSfhVaiuICt5JbzqxO/rvd5oGl1XxjrSxnxdf1brK3oIj/NFZ2c8U/7qeM8KW5w1mZ
 UQSDzSU2AEPwGglAwAZV8zkGmnySRzNPMfRx1fv43nK+ViaYlnrYtG62GZv446YsB95e6Gjvmt/Jdf
 64tNDAmmIZRCt09bMsI6ICz0FZBeju74A5YduCkfNgZ9UuKBfHRVVSwriVDA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010853_168406_DCEE5B3D 
X-CRM114-Status: GOOD (  10.32  )
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

The property pnictrl-names is wrong, rename it to pinctrl-names and fix:
ethernet@c9410000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'pnictrl-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
index f42f97f2c7e7..62987eadc747 100644
--- a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
@@ -93,6 +93,6 @@ &ir_receiver {
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_pins>;
-	pnictrl-names = "default";
+	pinctrl-names = "default";
 	phy-mode = "rmii";
 };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
