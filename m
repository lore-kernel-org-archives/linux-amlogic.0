Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F73CC27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fH7HwLDxp+kCqFxh1C3RFb/8Q/03jhwYNuRWhM4axA=; b=QmZe/AKH7eAslj
	LibQnS4z/fkERQik4xrX80PHumn3/tEXNzIy8DTnV11Lq9+12jQUtfY6+bS0DMyykmhbgGae0bB6z
	TKNqmIyKR+mzkqz4c4cqSaMCQbTC2H0138DWuCAEN/Sd7lK4S+nWky/kulExO6lvXIoxpP7rpTwds
	n2VIrvZpZIqoa5c/hKvB/ByaKLVRbSJ9MaPc4rkTOvcuv1nDS5LPad2O1BalAHsF+aZskv+WlO+X2
	M3MNs25FFckyDt5HKa6prgq0d4vsSgPbOpk5bptODTY1M9nI/PH4pu7CUgXubD0Ps5KfVHktEkTM2
	Vqk4/9kfL34BQQj5CA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFax8-0000000EWlC-2VXO;
	Fri, 07 Jun 2024 14:52:26 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFax5-0000000EWjI-2S8T;
	Fri, 07 Jun 2024 14:52:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65F35105BBC;
	Fri,  7 Jun 2024 17:52:21 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1717771941; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5khaxnHYfgBWx++I3wa8hd9Z9yMzi3N1PuwxaE8FZq0=;
	b=XeJ6qHkZAv6+/JzlFBWahb7E8Q2T1lZ1OkfTWW2A3Aa4T2wG02Gm9ubXWtYosJTxlr6DE+
	tEw07zA2LWf+42VtT9YpCIX2dJIjKvTcXinqf6vWsnCn0v/C/CVeHr2948U4XjJvUprupC
	80NiAWVbWFX9yqG0GtTQIku7eRG8QQ9klVScTVsY3CTS7mTGt1aWKG9aVwIuTgvg2HFVpo
	TdwZSRBVV4giH8ae5DJ5zh1uLAIfNygRhADt9+WIIhqW/ApD3MmbZWR6lpF6ws2hbvMZpp
	cnDznzEp69+5dieB/rgsF2qwEB0SjgfhBInR5Wkm4gwFCOcRt5+xSsoNTIsucQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: amlogic: add binding for JetHome JetHub D2
Date: Fri,  7 Jun 2024 17:50:03 +0300
Message-ID: <20240607145148.2246990-2-adeep@lexina.in>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607145148.2246990-1-adeep@lexina.in>
References: <20240607145148.2246990-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_075223_818265_DB781831 
X-CRM114-Status: UNSURE (   6.87  )
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

JetHome JetHub D2 is a home automation controller, based on
Amlogic S905X3 SoC

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a374b98080fe..1acfb184aa9e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -190,6 +190,7 @@ properties:
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
               - haochuangyi,h96-max
+              - jethome,jethub-j200
               - khadas,vim3l
               - libretech,aml-s905d3-cc
               - seirobotics,sei610
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
