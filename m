Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4CEC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LddOuxCdi35rcBe+L7fgTjY9b23hvjFmH3+ZEY2pOS0=; b=bKyUU1fFcNvHu9
	dTdoPGguh5oR9StzAOYTTK3fdIpxA0loOgi4Qwl+ISt5M57IUjD+JJc9uoz//p7MaazVCs6+HV2d9
	66Iu/IK8jnY3Jm5IqTneaNIfkjV0w35Kl8wm+cXv2nIdE/krrppEgh0rTI2UqOaaBJVeTWH6AxEgV
	JV2mhJRV1x/t8wagG2nlhKlkbPELKW1WJ3kgawMnGUZowgsbClyNjTeHSCIQExpVUFYcTxqOheUhF
	2abkqKzB0T+vmgQ2UhA/HKvsARr1zdmgJ6ID4IJ5eAGEjkQ7PhAk5WBujKXDpHFomVh7b+/yuKnkQ
	O6FDT3BnDyFbFq6Reo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QNx-009U4Q-KZ; Mon, 03 Jan 2022 16:40:37 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QNS-009Toh-AB; Mon, 03 Jan 2022 16:40:07 +0000
Received: by mail-ed1-x533.google.com with SMTP id j21so137900770edt.9;
 Mon, 03 Jan 2022 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ojj3JoMdycerIw0d/UxApbq5HUpT7xWvP5YgT79gkVY=;
 b=TFzj0ZSMTa3hnEDtT/XXW8Row18g8J2GgE4ihZIeiLLgwinpikb1bjmFtsye3RjBSa
 8A7EqKH6i7s1mTRgeltxYPFqqfSvhYEEkyDeSZu9NwHtlJ39rzqKu8s/qnz6FHMZTFdB
 9qz2SEhw4pq6EDMwA8pRXbI6gQrXZGJI0NPl6fhAClFSScuNTTZj+V4O4ae9JbYRzrYI
 yO4k2Wytx2z84hdtJVM4NrEhQejcRow1FaiUzLPNA6hvqnnVONIGzxrSSJHjsEQOCBlU
 6i6Svho3FcEgU7CIQz2nntEcEBlbBmU7IEINQ+cWwS4nn2O3xzKjAVFcNOGhpElBDeQw
 jvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ojj3JoMdycerIw0d/UxApbq5HUpT7xWvP5YgT79gkVY=;
 b=GtA4jNm44rpZKVHNPNe3jdxcwT/GXjp7WvFcfXBtlP6pn2xffE19bJNdNb7aaLqWao
 ehbKeTLrM4tqpAuR4IbiPoMhKWf9wokmpJs92H1HOp5z2cGt7PaQ41ely9rcDth6gp1J
 8QJoXyuSBLG7FMfjllzSSWSZlrRnNd5iv6dRd/eFc0seOPYbICYIXrt6CpItelaYKxVr
 JVlUdMWyDrR9xOFZxGIz9Rpu3gi3uDI7EieGVBbe9sJ9ASJZHFuZL3srGF0HqeOy7vF8
 RC3wj10dEv/K8UoUjqFgvu9NmTOril5Yk1fOP9NJSiwx5YB75vbxRI9fZzGFwbXt294x
 pjqQ==
X-Gm-Message-State: AOAM5313XboocxhmOJZKrJe2qTOWOfKkF/zQvwHim5Sz9xDOgwM3Y1jb
 DGLF91CVcAEqC6++WptrJb0=
X-Google-Smtp-Source: ABdhPJx3UBgodYsd+FuF9pGaQocd2DWemM2LohjQS8m8f0suxzXluEs0Of1L3OVVTxIuH/3VluM7/A==
X-Received: by 2002:a17:906:58c8:: with SMTP id
 e8mr35892370ejs.444.1641228005142; 
 Mon, 03 Jan 2022 08:40:05 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id oz20sm10724068ejc.60.2022.01.03.08.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 08:40:04 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v2 2/9] dt-bindings: arm: amlogic: add X96-AIR bindings
Date: Mon,  3 Jan 2022 16:39:49 +0000
Message-Id: <20220103163956.6581-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220103163956.6581-1-christianshewitt@gmail.com>
References: <20220103163956.6581-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_084006_376719_FDCD993B 
X-CRM114-Status: GOOD (  10.31  )
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

Add board bindings for the Amediatech X96-AIR STB which ships with
model variants distiguished by Ethernet configuration: models using
an external Gigabit PHY have a -gbit suffix, while models using an
internal 10/100 PHY have no suffix.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 31df120d73b0..b5b995941d3b 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -170,6 +170,8 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
+              - amediatech,x96-air
+              - amediatech,x96-air-gbit
               - bananapi,bpi-m5
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
