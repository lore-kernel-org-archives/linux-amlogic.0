Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18285C531C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJHyajFm4hn8MlMVHheJkrSBtizaaY8BiGNjcFOkoOM=; b=tyqrzI5LIIKdet
	7iO4dxtqO3ACfPv1e2PyWb9NobgeFqXZ1JjjAur202Sccu441IDXEYNd+PCIwdhB8blvftKNdyPCr
	IFOfbvCR7tsTlJxCvEyCmQOW+AwYYqmy5LRpRYYTJeegOyrkIaLXWf/aomkVhV2S5BJ1sMrcU/mrb
	3/bk+8cVQ0FOX3bXtDdjKQfRTnDzJguEhU+ZKiq1oMpP2uRBRM0o/jfFUA0L/DuIafed46hHVHDuh
	EsfatASy+GdVf8XVT7/Rv7/X67SoGUa/ESASlk79D7lmSvIklNrZiJ+RmyjCqIaJTFDexCE8OaFEZ
	nE6uX8NRy4/4ZfmrB6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UJ-00000001Tnx-1Pof;
	Sun, 26 Jul 2026 18:22:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UG-00000001Tlv-3YHB
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 18:22:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso10069495e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Jul 2026 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090127; x=1785694927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3SlIwUm5bt7YVM6EyfiZIEgRZEN3wUHTuCE/oWFfY7s=;
        b=k4c1ao12dzWKpThdU5IgYapIcv34xWPdfE6HB6S4R/Y/YXrCobQHsYzbuMDFjvLVPy
         2LNW73Xiy+zSm8hZRosJwhMqIat3dCzrEiuGQTs4cRP9ieHEPo2gSTJaCZFaHUuAiDzO
         8PzFnaXOol0o4cf5emt+18Eg8JtRrAm1vnMoAUWgIGD6R8QUaokB+qQSZeo3hkiKRZR2
         W3uJvL+traCebHIpbxjGOHtlrCJhpT5AG4Gf24Ax7F2a8WDvWB9JmBgpGEyIWVCjuQIG
         a+rn4SUX3gIz+Axc/B7sgq/eTBkIZUKMISKzCgkMVnQCHUlMHpdTSWbs90mIm5uMEz+y
         CJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090127; x=1785694927;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SlIwUm5bt7YVM6EyfiZIEgRZEN3wUHTuCE/oWFfY7s=;
        b=mcP2SLh/UbNB6R0sMN5bR13qWnEtObMyCzh7SSxaQz2gQM1LHpXz3BLgWo+wJxLHTh
         MiuK6tw5ahYfANARRAmxGYTJrMIVRDeSexXHKrFgTcy1eZfQHl48WHIOwajKyawGeE4O
         A2mGWMd4LVv/zc+6tORP44563g4eWin4IKC8Z08nXB7AmEN5WXZ+vPaAd8HuXsm08yDW
         bCvaUkQvGxbgrcG1fs3ayLOkKsKZ2G5DruGDsdHnAPLAdud9MCEPmSNJPbUW+6ms/jUB
         aymjprP8cSfCUOu9zUBIISybUZpiW8BrG67u70jo1aGuFsTdQw6s6azgRp5y6zK8xJel
         BInw==
X-Forwarded-Encrypted: i=1; AHgh+RpQwUm+MH/qoPW6kSrFvLxJYizN0g8bWwigExtKttrEa+ffK/2qLovH4nwpIq3VKZ9Yohp5VToSY+aAZxWX@lists.infradead.org
X-Gm-Message-State: AOJu0YxKdUK1lQ6wwxKhPSbT3GzDworaD3cTtIES9cd0UnOS2/7GN8pt
	rcwHjL4P8zJvV/NiOuJ7QlM8wJIkV04Tfm0xaDv2x6v/FbUqRpjkanbd
X-Gm-Gg: AR+sD12TCICWSjbIriGSeQDrmYN8s3Caz/NjRAdM3k+Zt6cnd/voIOUDDwxebDPZuui
	2iWtyJtL9Z8I4zdFR7qm5UhOGEYmqb7QTBvtJeVuRw4ayGvSu1IFm0SwnOYQBQSpG8N8wmpLO2a
	98M7BGtXauxliS/1PPpkK4xRWok4WLZ0dSi69PbOS/us0Mm6LXRzKYpzRk9wY+6lS3hsR3hv8kr
	vxSPBUNo/vKhO1kTeAw6FNtdzoKu550g2lpO7T/lNBxFTNVRb9Ncg5FecFUe/bixelkoF1RPHZv
	Uz/5m0gQMtp3cwBr0RBby8RFg4LWJh1bdsu10nNad/UiziRbDXPMGPUfAyXB3AmvK7E/wyXLkja
	GURefKmJvvYL9Y44l9ETwyyZFoNWrWU/mDn3M1Aiq7N4yoaVY3W7F8X5yMWIndJzEZ3PWMJGGEn
	cLCjOfTyfv0uD1O5oC6wAvOc4FQq2S6tr/qrhMkA==
X-Received: by 2002:a05:600c:a102:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-496b575ded2mr58213725e9.36.1785090126740;
        Sun, 26 Jul 2026 11:22:06 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:06 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Sun, 26 Jul 2026 20:21:56 +0200
Message-ID: <20260726182158.249449-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112208_917786_56AC6648 
X-CRM114-Status: UNSURE (   7.76  )
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
Reply-To: robazza.alberto@proton.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Alberto Robazza <robazza.alberto@proton.me>

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..f205df64a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1213,6 +1213,8 @@ patternProperties:
     description: Orient Chip Technology Co., Ltd.
   "^oct,.*":
     description: Octavo Systems LLC
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^okaya,.*":
     description: Okaya Electric America, Inc.
   "^oki,.*":
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
