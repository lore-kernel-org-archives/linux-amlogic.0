Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDDAC54F54
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2026 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyjg/XSvVSJgB5MbLNe7DFUTAGojQTnHGmP7MqaLSno=; b=jaRJCGthlzPosB
	JQuFWcR5qAElIbvyKvVvtWqDpBk/uEC5/Y2LF4VNidJjF6MlIjSno6VvVfqVyoJUv2D17ySJFhOnv
	KURW7mQSDdWf/eLHn8k9OB/E+ycYJTDmDDG/v8jwGiGe5XtpD1R0lTqIvBrLpW/Cxh5REM4i92HpS
	dsWg55KMC2COpTAg3Wc3ANCRbNiNMqQfnYTkBrDlcUxUiW2PoZwRX3RBM/E/sSKhmnm10TVNC6LRo
	tZmohd2ns/aodY/ZO7k8v2xpMBKL7kXf2Zqboxt6miZ6hihej/3yu9KqHeSVkC3idFC3dnLSwlkkZ
	X7EnK1A4WKsPgDoOYYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojY0-00000005c82-3A33;
	Tue, 28 Jul 2026 15:16:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXw-00000005c4E-1UBS
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jul 2026 15:16:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f7854678bso1434882f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2026 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251802; x=1785856602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=j4+V+UJE22YNj4t4OYtN3VWqqfFq/cMhzmPO9qnL5hwSCipccA2Llt83BFYQyzcDlB
         VvUuEjr+t+iV+eSPe793mjL+vVKf11iXcSzi5QnCtmgWzKK1pdPHumV48bvju5unujUc
         UAPVmhCdar3rP4MmCwSxpB5tNmTpxKgeUyHwvfvn9XjGtSRGyf/rMn8DICxu4rp+b99J
         5IXxU9w6hR722dx7mjOVevR9IJpAb06wRxBYJZDoZR6+nau5Z1aMAI/A2r20nQoJtCk2
         ZpHd5i0fGIINe7Py+Nglba/izB9X3lGJ0UxyHQFw0hGY0GyIlTuzMSq0HDCFzEDV7i5T
         KWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251802; x=1785856602;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=LinAgK2woyUB9gnruaowerCjR1+poykwEkJrLL8StEQ93rIK1oW1nAXWnXS1mg0QYd
         NB5l3i1PoPwto51RGHlT8WMwjOb8ztz0eBsHg/XXqwOQbBWKczdMpjWgUaVPSxY3XLQm
         skFJ+M1Hay69Z7lCWKb21vJSPpFpXBhn8ZDTKseQm2gU9n8Yh4HKDQrY27G5r3PMzmKS
         jmXMMPbPfwLWkvUSZSdahHF5EAUgYPSfOn2649CoiUQ5K5k8KVdGg1N05EwSQeT1fHeX
         rmqcHfOOzOcFN9yu2GcmU4DBGIM7O6kNVCl0VCSVvUyoN/zGx7o5HRAzsuGcX4rKm5M0
         5m6A==
X-Forwarded-Encrypted: i=1; AHgh+RpcyYtXnVl9CGwJ/zlhBtmUaYRXSc/GO+tl4W8FpSQr4bpYrkN4GC/zflVYjWXtS6yG2RrflN022AyNkvvV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx77VIiuJ5dnvDwk8xxneCD5mBb9y6MZuOyrKNCTS53tg7M+P/Y
	A9eCWUVCzjYesLL8UwTnoKBZqWdCuz6AP3OUTLLR0aBtsbBZaCR/rzhd
X-Gm-Gg: AR+sD12XgAXoYUmN1KXg6pyAqkNqeqUCV40Mz4MV5T5CNlKk9gb7hZ6fYgSBKpSdIww
	Pw8qegZQkJVhagzINici/ujGZdiyzn3ndsA0Lx3/OUm3l1HuH8xleIaD4Y7+hyedoP5VpPaHl20
	PgKjoVad7EIzCgmrsuJmt8zeqB501YvHjX21K34zv1KPacFC7SFZnnshq+rWtqw+w917VQt+AFt
	RSXA0dEdQ5svepENH9i1cKcDyZR4kk6hE63NDXSuwBGG9foxwSrwbc3fyrJOBKgYK+HG9MeG/P1
	T4AFbNGNHdW91HqCjf6uxi/cv+H316B3OTvv4N2h7Wxtocl/tofui37N16iPKwl7oaFiHnupiJE
	/WWFUVcDfc01luGuGfz6is7LcXl72DoCU/BaHR6A/+aOghJLt2bPhYfoN2uV3i98Qpf0eYKcXbD
	Hq7mDFZLTjgGiEcDQ5HzITUV8jtL1pRMCflMM=
X-Received: by 2002:a05:6000:40cb:b0:47f:7261:3a5c with SMTP id ffacd0b85a97d-47fb1f30e92mr3467694f8f.56.1785251802293;
        Tue, 28 Jul 2026 08:16:42 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:41 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Tue, 28 Jul 2026 17:16:34 +0200
Message-ID: <20260728151636.236393-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_081644_446377_B91DBFCA 
X-CRM114-Status: UNSURE (   7.71  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
