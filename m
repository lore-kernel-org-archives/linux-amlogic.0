Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B17EC54F51
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVAi1kAW9QoEqSS5/une8UZIVVZdy0DBDSdZUo68qAI=; b=m49RCHm+8B03y5
	FAH+jmkOjUh5cIiEVh7b58tQRa7j3YENAyPzU0D2WSgeSgP64HJLUkbvmXdrBEk+K6tZUZRk0VYFq
	QW3g8wlXZxjIkczxiIK/kaQqgFam9Shgb7F08e3aejDk+ENrzd+rZstw3YNIey2heQO1YTh5GbHA5
	LusUixG57pGke4hNNR9cPvonqSvMiXGQlYqIVQ5tMgO+H8oHZcV818uGDmwnZmyGHWkka4aYLa5OX
	mN52r4uVaE65EtJRvWRf24Bsb2fpkFt3gwAodNWmoqW0c6OPpLNFhRxp1mt90JF3ObwQTKC4p929f
	BwOZwY7v3mi09hUEIhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51e-00000008Dm0-1kLz;
	Wed, 29 Jul 2026 14:12:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51U-00000008Dh4-2jzw
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 14:12:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47df43bfb07so420580f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334359; x=1785939159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/ABHH261kAcEZtti2TzXUxz3ZAT2vqzNe1BRxM87S8=;
        b=fSKBuFJ7i79ItJv0Ut4c8ftrVXQveiDryMV/MlQS0s5AQQCFNL8q9LwyMv7CX8uJJV
         F1Nm7GDRihARyHCvzeiI6fmwxqqOjYpP/wpoQ/YL3a+BR/fHiy4FMIs0uzDB9PJQqadG
         YO6B4av6nplm2VRp8ZkIskh97Mkg/65+hIl4NXpj1NRhg8dKMEOtvzkcYau8uFEJxiX9
         J2MDZICFbdC2vIrfzuQw3c7dVOOn1aMLe0PUGBsvQXK4fxucpX54JfquRXUfxym7Vafk
         onjPNIizPEbCOYBsgqSCM+SFzcSd8DCmSW3yYc5fWdrjWpmQt3G68jymGPMMtVCGObqr
         gn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334359; x=1785939159;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ABHH261kAcEZtti2TzXUxz3ZAT2vqzNe1BRxM87S8=;
        b=ss7ZSM1CzCSm7KVQ7b/jI7WRaEFd6S3cR6RcEuz6RHzKptId2kxnArytFFvlXoNnMe
         b83/rOE7LomMXclak2wQ9iKZKnem2yuDI0As2HHYed4urry1CskRV/Q4xXoOcYDrjDw1
         9kJGvQ+RfsiYQ1S6ArQ8b/NlmrIwoWJilWj5DcmglUOv/aIpnN9aCXLZ7T3Dp17rnU8x
         uqRAJ9Zv66ixYhaFR1MSJMPPEaqoetmzuGQmnLFUmSD+E5kiaYJC6wvlRHpBJh1qYF9q
         14gDV85ngHWF9fSIcdwiYGHqsDH3GrdlK2usLvOGw3ioeHjkNx1uAZGusr5bXIgs09SV
         qrgw==
X-Forwarded-Encrypted: i=1; AHgh+RpUzmdV3nVtMQyJkb3KTWxuny+llGuJNqFj8f62IiSt2Ry52SiJbezreOMQlptK0ujwhmGnBv9HMtvIFwjF@lists.infradead.org
X-Gm-Message-State: AOJu0YyzXfDGJxcE90Erv4ajGkLHipN4/k44A50BCPrLKhvx7WTxX4Ey
	VxbsJURh2cXsHj/HqX7Ht9jeEy6/jmFWbUDJaguuZC0/CFQex7VGjjIR
X-Gm-Gg: AR+sD11AHu5e/k4fpwuuaz3cEeoyAeWOuEf/6Dadg70LOsivX9Y6HQzkKNk1GpsLp/C
	5aCP3Wi0rqYgO3gljQnsTwFQx4WUzEJYcuSHf/KWv8iIBzqo26q6rQqbRWcO/0N3LlGVPqGJiMO
	TNIYjw4TyV3WBHxUdj3w+cZf3RuPf4A0d04dmSWXkVi7koVE72NucCXIcS6cZ8FkBwjpJt4wXtg
	+mL0AiqHtBJVFyrSoFZpDs5J/xkZ07CIX3LgJpkUjQbmwf1JCyZIWCJE4xwd8F4yHKze80+N5JW
	CWt/KGLmzuoCd/XzqHP3fICfUAAwVMM6xtpjnJ0qfYaXdhYm5pCqfDtyhomWUse2RrHWHVxbCij
	O8LWEGagFcMIipf0jmoMBydIegxTLIASW2EgGjRNF4JuLiYbXw+mTX5qlXJP7KszLDdabW6jNde
	8N8PD8XF91hPO5+sXQyruMTlGzP/dhlKpCEZUfSmVEoDruyXXE43387Lg+eJQFvBu86O+jm9fqR
	QqR0hTYCHNGKuFjWE+nTA==
X-Received: by 2002:a05:600c:1912:b0:495:3b8a:bf11 with SMTP id 5b1f17b1804b1-496c6577941mr78545775e9.26.1785334358491;
        Wed, 29 Jul 2026 07:12:38 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:38 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Wed, 29 Jul 2026 16:12:32 +0200
Message-ID: <20260729141234.65037-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071240_690364_FFAD2886 
X-CRM114-Status: UNSURE (   7.00  )
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
3D depth cameras and embedded vision boards.

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
