Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEC7C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdpoYQ9es/ifzRBTN7Fcehj4eZfnkxXWbLLX1UpGZmI=; b=rZU9UsnbxUW0Dn
	17SFfQraXYKJJbc89cfS5fu1JWw+1ZyNkK9PvIHzNQ8ESJTUlMLM9h6OIDz8ardrdoZ2rB0s7yLLL
	GORRN27LyPAUo71mXok9S71j9nLW7YU+E5lenLX0N13D+ktYS8lhwiUwsmq51iupHy+yclFzU2TnV
	yoC/YUiVRRHIHBL8sHHBnSNgu7oagQM5dIFlEsE4Kma+JH6ygvdAONjztOgNuku63ICysLdq/MraD
	zWBZ5pHG1WnMJSqLRWk97P7iuFYQ2vPP9vsXJIwuNnWho952TJNmYyeoK02WvNF3AFOQSVvTPFveP
	zfIShwBocO0e2A7wdB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QP0-009Ugo-MJ; Mon, 03 Jan 2022 16:41:42 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QNZ-009TrV-4v; Mon, 03 Jan 2022 16:40:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id j21so137901747edt.9;
 Mon, 03 Jan 2022 08:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bQqNEXrT2MXdan5ZsVv1uva0kQxDujM7b0rj46hBiVY=;
 b=je6BG00Wk05INgxTy7W/4qdN+a5pAT7i4QbDSsWue7Ekla331t4f8vv9qR7CpPuut8
 gNR7yt4/wX5FD4sFzAw4jIwt/32+ENNQ5Puaq+kAstuSGF6Y/RgRuNC19fGZ4GrcUUyg
 h6mNmkseFQPkzVBEUOry9XOdejzFNx2OuOL6ul7rCvnX86BVhjG8aiy5iweceNmY5Y05
 HDHiOdvrQ2BKfWKdxDN8TpSoDJxZMfkaZzEYgfDUAfSVjxf3KQ/LGHwOpeIq1dz+ttCq
 doQYNfBE7FBiqIbZW2FxAdq5b6OnyXeucv+jSxfBDCfZMT8BaY9U/n8ExbIIPIDeLjZb
 q27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bQqNEXrT2MXdan5ZsVv1uva0kQxDujM7b0rj46hBiVY=;
 b=htAZ0ktjrUU8QebeYsoxVLhsTjsHmhMRETw9gOAAN3AV2s8Zohe/CZ7fY9qvC06zP3
 cXmVW9JVlf1spS2nCJJvC1OUo0VxTR7L2kIsRPmLanFI+E5KN21TEU0KMdyqgx2wiXI0
 8QfMjMIauDgnwUcjX7L5uGw/3r9OpLybHuvHYWe2SUd78OaHiPaSwF5UkM8NIhlKu+mK
 PAWy0N/sTrtFBXWuuPvmsNgCp9Gs7GRqAH4LtCkmNgCZ7e0ycep0aKtwLLjhUd0yeHMW
 rHXPMfzbWYZNh0VpsH9/gGG6ICXYHHjYQtKTgD9qjI7omic8IcSJtstRNl99SAK4eAOR
 esoA==
X-Gm-Message-State: AOAM530/myp2pf+U8/mS8hJ4b2085hT0ZXSWLt06QBK5/kLwZBx2EDXi
 MnkpbEXzWZAIV8UMOpLWwoQ=
X-Google-Smtp-Source: ABdhPJzIKdTJJ02JiOO14GTgXAyke/OephTqfGHR44RLsFJAP2jLBTPjv7NSJT5mzyfnEmScVKnFZQ==
X-Received: by 2002:a17:906:d96a:: with SMTP id
 rp10mr35270813ejb.614.1641228011693; 
 Mon, 03 Jan 2022 08:40:11 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id oz20sm10724068ejc.60.2022.01.03.08.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 08:40:11 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v2 5/9] dt-bindings: arm: amlogic: add A95XF3-AIR bindings
Date: Mon,  3 Jan 2022 16:39:52 +0000
Message-Id: <20220103163956.6581-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220103163956.6581-1-christianshewitt@gmail.com>
References: <20220103163956.6581-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_084013_211438_EDA69CCF 
X-CRM114-Status: GOOD (  10.37  )
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

Add board bindings for the CYX A95XF3-AIR set-top box which ships
with model variants distiguished by Ethernet configuration: models
using external Gigabit PHY have a -gbit suffix, while models using
an internal 10/100 PHY have no suffix.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b5b995941d3b..2027ce81a834 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -173,6 +173,8 @@ properties:
               - amediatech,x96-air
               - amediatech,x96-air-gbit
               - bananapi,bpi-m5
+              - cyx,a95xf3-air
+              - cyx,a95xf3-air-gbit
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
               - khadas,vim3l
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
