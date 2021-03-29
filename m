Return-Path: <SRS0=bUf0=I3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D05C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:11:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6B56157F
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6B56157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzWXJ/np5FEUcR/L2FdMOAofkFTc7t+1cbtLB8RQYgE=; b=DGkaBiuvPLimKM6gT+VbyWdC7K
	ZEGY7L2AxJApDM3l+c+PTSBCpxDgNut3+f9zm61zlQkfe9aRQavd78gR9DYlAdkCUHPzE/nLniSNw
	9+nv9J2mffiCfbxyVCMrTUECUEILQ62/958/IX/X5TMAsZ3VQH100CCIuLZdD7Mxvc+KQbn/SG2qH
	LRc8cIN839VagAYdgSxnj/WYIEXXc20+vMyG4aXqgWMsCeAxicYjMKf1g7UlCt6npAj0C+oS5RD+X
	a5bKLQoZVhLb5doiVqBtvBfIlT7Xeqf3B4E9i1p8ApNz8zN4QWWPq/T3dy5I5OMTdH+KgtqikK08V
	KMJSj+LQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR12e-001r3p-KU; Mon, 29 Mar 2021 23:11:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQu7U-000kDj-SY; Mon, 29 Mar 2021 15:48:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso8775224wmq.1; 
 Mon, 29 Mar 2021 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PUSTRl8mQTF4xVmOy5MvVS/tUAWi6N4QqKrYUsHXAcQ=;
 b=SwYNslT4lMw6mV5mSelCU6WjkKcYLUK2yVIAz2XyPDx7xqKwefVqlNBXbQbaWMz+RM
 2+nCHRPQijlGzdzBz8GWpP/CtT3qkstHNFo3PHTqm92f6KR0n2FJ7QFPKqmqXVhtbyaI
 v5FCym8CaNgUEpUC1MF02zzCiBUZWbBcvnLsN2+TdUzOJ8lpd2k66zG/2za8Pet9xkCm
 xYyO3PFTUn1fllellqIsyvzJITFbUBd5qkf1TfZG6j4xBpR/6Ot+DytAGFgxBKUuI2R2
 Zn/VEbseS/gRMo956nlWJzk8OTmHKa98Ri8rGk9p0EQd1ESYKG4bVbZOEmuAM+CQxFlQ
 UNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PUSTRl8mQTF4xVmOy5MvVS/tUAWi6N4QqKrYUsHXAcQ=;
 b=cU/9pSIfvYaKMUqFGvH0OlQluDYvdJtEI0W0LiNBN4i1A+vHScfte5Cfjx68IbsfUB
 nY7EZvmcP+A5TTSCJLetHBlZmKpHiSmE5LtNnK+s3Zh+TxH4V2vnNJ5WlNYaDBdrYO/4
 DaVwrulAEK9q2QHoctvBxEhZJoglr2QgoFv+G6ql9QUEJ80OTpfGxRzv2/WlxYiXwRi0
 SQNCDyQJfUoOiomNx/XvbI5r0jKC4z/9rL3zOdAdOwp65MsR6YCQ0YWuFU2nqV7G5tlL
 Wkk1LVb8TrUr2d0ffceVOh3APOLek0RsNcQ1K5u5siXRFtcDHXX43QN42nIlLm6Ki15o
 bl7Q==
X-Gm-Message-State: AOAM533TLF4E6BrCKWmZN9Np8/2RRyM7QbtKgLE15Dv6DveT0uhhq3E3
 fEbJ5o3w6LQPeiTF8FlzCgY=
X-Google-Smtp-Source: ABdhPJylCNRMxIPd1v/0cuu0IT7zY7iPYYqsbP6tfLVsvlgWvSTUjOR45j04hdnISf2uAJbuyZdWnw==
X-Received: by 2002:a1c:ac02:: with SMTP id v2mr25472774wme.111.1617032879404; 
 Mon, 29 Mar 2021 08:47:59 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b131sm24987323wmb.34.2021.03.29.08.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 08:47:59 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Drazen Spio <drazsp@gmail.com>
Subject: [PATCH 1/3] dt-bindings: arm: amlogic: add MeCool KII/KIII Pro
 bindings
Date: Mon, 29 Mar 2021 15:47:51 +0000
Message-Id: <20210329154753.30074-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329154753.30074-1-christianshewitt@gmail.com>
References: <20210329154753.30074-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_164804_009418_F6721154 
X-CRM114-Status: GOOD (  10.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board bindings for the MeCool (Videostrong Technology Co., Ltd)
KII-Pro (S905D) and KIII-Pro (S912) devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index d24334e1e166..97fb96266344 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -109,6 +109,7 @@ properties:
               - libretech,aml-s905d-pc
               - phicomm,n1
               - smartlabs,sml5442tw
+              - videostrong,gxl-kii-pro
           - const: amlogic,s905d
           - const: amlogic,meson-gxl
 
@@ -123,6 +124,7 @@ properties:
               - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
+              - videostrong,gxm-kiii-pro
               - wetek,core2
           - const: amlogic,s912
           - const: amlogic,meson-gxm
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
