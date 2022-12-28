Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA401C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNrW+ElkFUqQh4PuMQtQkk5/jvMbLH+CCjLlezeI028=; b=qbZPnnfyJI3umO
	9oDJirNigXx9n82OLs6vSiK++mVxapvWd9+IAFdFdwDeK2VQeUV/QMRpCf/TzmJFiHNv9AanC6Acs
	wZs1/+NzpMV1CDIy/1DMDpgBq10cOFG5dXmVYoIlZGf2MvkEl76MNeKnF2IaZwMg9K4RorXNagb1J
	LGHS0yaTybvAHGlQ1tyEfpCJ7bCANx9POdqpnKsZ9f4QjJn4ukqPlNh9mm+FhM9vzWSLRWE+CcR98
	HUpktUJJTbf5GqB3ObRJS9J0P7V9NpPgvtqLnmDHO98J9VMz+wck7BPwiAEFVIcdV+FJ2Ey0XP+ij
	c4T3NXSuyWGDYHx9bF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATKG-003vxn-AR; Wed, 28 Dec 2022 10:06:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJk-003va3-9Q
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:05:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id b2so15634994pld.7
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 02:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzi+Ui9Rw3X+XYHjLsOHBpUgiG35eMVgsV9hKdEu7Iw=;
        b=YH8WvQt8cfbYK+gfW4TIeFqiqDxUobd13/phjftV4AunnwVimnLVxCaOWioGaN/bsn
         8jw9eqQnAAVzvIMYgavXDVzysr8L/3SwZbkSd5uXlClbXiOAxnXjtNIKYVOUkD9ZE3Fc
         au8QxhvOqZXG76Qn+1uNuk9KR/pPQN5tmYLGMepixNRNhvtPvXezLCM4dPIdQlhMx+ID
         G+RBJ81P3g62UOD/G6G4tt/i17XvTXWjKMgPO2itpY67HJY0AAB9U1Ik65P9LhxxUMJN
         GqA2k3wKDIBsLYViLsQvzfH7KCbeeoX/re3RE1VdbUy9xdYqYjnMX616Wc+IprxB6G/N
         TDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzi+Ui9Rw3X+XYHjLsOHBpUgiG35eMVgsV9hKdEu7Iw=;
        b=T+uaNsUssSSVtuzGJb1qZR1YtiY2bpdBYJ8DHlpQ7CCgsLy90MEqTPSWLdyDBqGRyN
         tfhQHRBYNL4ZrSbdTF/dczodNU0xeT63sLbiSX7DHqEkg/Z0BEC3l3SfSjsP56Fghn18
         Vc/xQIgGFZt8eqx+KuyFq4qgN3fyMUiUPYHqolV0JBcZQj05DQuSR5BcCuJdLlfQNKua
         RzJ7OSBWh+BEphDAnIJAH5JImamvwG6xw8MkKBPYrNBduxmKwD/N3qRgoDjnoDND4Gi4
         QLgS4GFyIu47emvNWwPkmR2S31YXb5dcH7CvRsE0vVCO0Eo2JaLJzT0oXSO3FGP7oLzi
         pdYA==
X-Gm-Message-State: AFqh2kpok2f/pN/yQXUwnZPEcReCCOjLoibL/DWFYZ3YGZrw7o2B6AeC
	QlCs3COKdr0tz39iAbmx4OM=
X-Google-Smtp-Source: AMrXdXubODrYUscwAMYeQ/mYu7Q4kTIctO/0GrKB0wkpifvIlTYfyORN4CGcMsF8IwOnAfOJ45xYhw==
X-Received: by 2002:a17:902:c1c9:b0:192:6544:18b0 with SMTP id c9-20020a170902c1c900b00192654418b0mr17675539plc.63.1672221945196;
        Wed, 28 Dec 2022 02:05:45 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:44 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/11] vendor-prefixes: Add VIA Labs, Inc.
Date: Wed, 28 Dec 2022 10:03:16 +0000
Message-Id: <20221228100321.15949-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020548_710639_E2B5EF6E 
X-CRM114-Status: UNSURE (   8.34  )
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

Add the vendor prefix for VIA Labs, Inc. (VLI) is a leading supplier
of USB and USB Power Delivery controllers for multi-functional devices
and platforms.

Website: https://www.via-labs.com/

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 70ffb3780621..d19b7f9cef4c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1398,6 +1398,8 @@ patternProperties:
     description: Vertexcom Technologies, Inc.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^vialab,.*":
+    description: VIA Labs, Inc.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
