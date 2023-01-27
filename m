Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18FCC54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tJgKCg57U0z3MI5IHpwn/2F3S4W1G5PlXZD+YcPcSk4=; b=Ma2uW6OGgZEY2I
	9Op8hBtu/PQ6oLw8jGo+KM3ppbjnhy+/LwblsrJ7utVyrnALjHdvLYQ7+sghYm/VBUEYjb7ixDM7o
	c7kLZH1zF1YsdW4BikhQ8q0BFlkrVyAiYfWErOw+JmWwGg1A5mifIQ/1dpaRBlsmPWQpt5E9jyqtK
	uWtR2EzgoIQgcg28iY1EDj6Fc4PydGlYFdP9y3iJnbxrHAD/0itheOc8szyQ1mh5253FffukWOP40
	JREIlv7NR0/eBZdbG89iqTCEVKyl7c81/rFTubPEGq3AHOFLjcNfel0jgMfRIgEPfgIqSYm9dOCO2
	Qyf2f2yRLuGyNXeFoUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMc7-00E4Jo-MU; Fri, 27 Jan 2023 11:09:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMbx-00E4H2-2Z; Fri, 27 Jan 2023 11:09:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id h12so4622041wrv.10;
        Fri, 27 Jan 2023 03:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=isAaPgBeDdcHxcgXON9D9sIMsPD5VNAr8JbS+XxPvnw=;
        b=onA6YQq5/uVWw7YaxNEnf5K6JGQj0hA2+dIlYS8+OPNSL6lqXdTMos5iOw/I3W4ltO
         /nrrafXlkDxBlkKtUnWX7ZRyr9NfujL6IzZNaH5wu/87HKtZhE6kABZ4HoquwOKJ8R36
         SUFixppOFQvMviZkPNSfhOGV+e8dJMlFSqFDrs/3AayDPvzAjDuMZlMj/70RsWwmuJ4h
         NiFyBiDEjib87eg5ZqOK+EovtXvxIGBtXZns8uu2AEe5pMmZfi8cb2oB6/nPTK3LXYEZ
         gkI9QkeIj84hy2kGCu1SV0IwlNEqWCFI4YjMYCIYK+DGQEx9obvdfz8ZIJo/GEtrV0Qq
         FUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isAaPgBeDdcHxcgXON9D9sIMsPD5VNAr8JbS+XxPvnw=;
        b=x/NAPvY/KGyAU/hAkIEYqn8hxuWVTib2HaLH7S2E6iBQSDxKlYXKaDL0bIL1J481a3
         T0JCt/DhZ4IQogKtQTF9zex/kka381f5wgmhqi/fRLlY/SGIqNy9lmIFMYUVhg3PRkaX
         Ei5G2j3MdWtcUNnjanp7/Xb7Kw/TBnsLo+V8QzG28UAvvahAcSpVlN1PvECTKiamTt9q
         neQe4ZymuFydtLATY3Y7fJYxFcjHCvb6sdbPua11RpKFqmcCJydwjuse/4j88+6IobFw
         k/2Rh4MYwyMP9NXwOMYkyGl40DhgCHfhL4NfDaeuwYfhmvaUhlhvB7zi8fN1C+8PxRBP
         xs+Q==
X-Gm-Message-State: AFqh2kpEf2TdsCI55LzC2AlIApbZSny8azRqsDM2VjT9AmLmtz2QbtPv
	ZVwUof+nfqD8ooOCKUSP7WE=
X-Google-Smtp-Source: AMrXdXsDpz6xvjzOlbveXGOY9ueHKhX8OWw+Xd0swYVWFPnwkqCcjGgjSJiOH9ZpVy79L/lK7SUb+Q==
X-Received: by 2002:a5d:5c07:0:b0:2bd:fa1d:5291 with SMTP id cc7-20020a5d5c07000000b002bdfa1d5291mr38022885wrb.67.1674817773386;
        Fri, 27 Jan 2023 03:09:33 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id d7-20020a056000114700b00241fab5a296sm3662106wrx.40.2023.01.27.03.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:09:32 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Radxa Zero2
Date: Fri, 27 Jan 2023 11:09:27 +0000
Message-Id: <20230127110928.3387654-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_030937_151123_44847FB1 
X-CRM114-Status: UNSURE (   7.97  )
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

The Radxa Zero2 is a small form-factor SBC using the Amlogic
A311D chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 8aa6b6a92c29..6e3cb5a0d879 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -154,6 +154,7 @@ properties:
         items:
           - enum:
               - khadas,vim3
+              - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
