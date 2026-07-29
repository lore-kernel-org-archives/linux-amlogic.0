Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0122CC53219
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jk7hp0jUhTbPCaRvhsvbu7kxrmneBHQLpEdZiMQ89Vo=; b=eUpssPuGWc+Qf1
	PPR5/tFWl+iBzGqnsF5lBJ2Yg9NEWGt8zsf6TESuMh2I4gu8LsAk/DWn3M1KnzfGvKabGYUDHXGjJ
	SfFKPJWuV7Qzyp/mOip3ozMgl/QiIjcZMiU/z/xYN28AGvYGeuOb0lXrpNzulpy0JSHfBiprhVPvd
	LLcTMuUzz1d0V1Km1Wcs1NZuaqoUKd1oalhoXmUpaRMZQAxemr2HUtmgf1N1IcqfTVNO5f+k4fKDN
	5JlJUfvkDNYFXgBg2CD/cJ1D1Fre8fB847M/7j2neQVVePc+4B3ygFiJCDjfO+yIyZz1RlwJOmu0w
	nI2yEh7OtBtgEiAwnThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Rb-00000008kGE-3QSS;
	Wed, 29 Jul 2026 17:51:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RS-00000008k9i-02Wb
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4957eefd361so9022865e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2026 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347500; x=1785952300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bz0ySSPwLkjCZQjoAOssGTzCtgnTiGfSJWwyPJTSyPU=;
        b=Sc8XUk/5vygG9VeEyUcq3uOc78KNNCYQIjC2V93urj0oLACgigkg6L3W4FmYjderWX
         zYHF9lBsie1uS1nl7JnVIVDuwOaSsZVXcOlmRVp5J0d3GefytH+K4NMirusYOikfnAuv
         PPZI9066LNz1dfFiETFc+R8twGPA+OCY16tw3aEUlcCuutRtyPi2p6yQDE8c1skBy9lS
         oAH/w+igSuqDRA63C+hyUn/g4KTP1OeSxFFB2Wwnbrv4eUBESNP22n4xjhh2MGVyWKiJ
         +f1WOxfqZV++JTjxAP1JlUzPfDGOl16heACtewoJiZA7j39dRwf+mj0ZiRrqHzG9PcP8
         IZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347500; x=1785952300;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bz0ySSPwLkjCZQjoAOssGTzCtgnTiGfSJWwyPJTSyPU=;
        b=ifKWVI/CbMU9SfdqnN2T5vWZ5/6cQc+PK5dGuOfbQG7ZYJzsTIXx1IQm78g+MQDk06
         fWKE2IvMeF1W8bMdxlFOgptj0hFAlQPpJbdZ2aY5QmTKxYRej6CEynKT0cz+goLjHWVe
         IS0JIHNe/ijxqNyiPWXq6G7mWE1AIk28WLlLWn9R7jwbE67K3mwEhC/A8tBRGcUKUno/
         qNlazzapdNTaORwvmwd+Xt40vq27BvmEJ6CNuYjWQpY1wzGcksf+tmjGnUf+XbxhTFUC
         KQOjTL46q3YIlH0ialvV2SXpvEGLlNXgXq31/UKj9j1hWuJadHzg6KcrwBLAw1RVAuk6
         ZNvw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Q9iXTIWvaKlnWErv+rJpMq8XkRwdifOwtt12YLiz8f02W6U4RYI1GUeDCSWgIWJ/5RV5iTWbisEyXfCo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp7lTxjBmVsw66lJbsMSCAyN8szvYJvJzLORXNqs8j0Yeo1pEQ
	UuEMwQXaK2bniu7ZP9A9oWuOBTqoRVmcn1NjiMuPJStBU6tX9QWNpAk0
X-Gm-Gg: AR+sD12tq0zVZVYvXTm+MHCcYvkPwbdH+X2qrGl+ZgpI24K5XCruGttM7FpIm7nzZY7
	JZ+1FdF8JDndu5+KQP9HfRtUcAlT8Mamcen/sY/iNyCAQg9d0pfeLZ/QX6pdB1dZF/jKw7I4rwl
	3nSAI5X9l3jZv+VrUAXoddOwnY+ohwi00PgWXvhxpz5Dve53fsbVbWoRmAVOe9elg4q9EksscIx
	/vX6Byam7ykWMKPevMp1YSXpsxIc3jIsIjbIwr4Znb5bSeuj/dRZQJflXl61hKVD2ueaBoJJ5WZ
	/9pnf97Aln1KneJp030Dfcy9BxAd8pDnRFgFM9v3pvH4+aWAbv/LWd+pp1B5mNMBALWJM7UPhmN
	i8pZhirv5Fj68BEljtRbqgqWCXuwhLDbxYrew2PbJv9Z0ZWJEKNNY/wcaNY16YDY6atU6yuNrOE
	o2BpFP4bi4ZoiCgHd7vaOk1QC8B+d0yy2+kt92HBVmTtfi8bHm2tRYnhvjUq7v/ITJBpiA4NPHR
	NgYI0CPro4+VXHl1d3juQ==
X-Received: by 2002:a05:600c:1c1a:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-496c60c1c4dmr81087375e9.0.1785347500402;
        Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
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
Subject: [PATCH v5 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Wed, 29 Jul 2026 19:51:33 +0200
Message-ID: <20260729175134.92909-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729175134.92909-1-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105142_101383_85EE2005 
X-CRM114-Status: UNSURE (   7.42  )
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

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
