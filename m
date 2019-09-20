Return-Path: <SRS0=KMNI=XP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1301CC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 16:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7ADA20C01
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 16:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="os69gIfo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wW63Fcj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7ADA20C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LoNTHCvJs7QoVH+2JnrIA7igUZUdKdq0ObAPjxD9Tmc=; b=os69gIfoFZ5X7xar7n95LZquEi
	oL76Uou/5ldgnu6DltrRCUcVR6aOyF0cupMGuuSzqnRNPi1xDkUB3b3PHJkIbUj18pjT1aEqf/ek5
	36X43t/iiHuv0qdB9JhvD62v66RVCOMVG8D1xxKS3YftRjbPwY93GQw21TgWARI7PAGZ4xH7MPIbx
	UWnijfBgfrqq4TAV4W9gCv99wz5NPkoymxNXqL3SDXxoxbP1uj2H3DIcYBpVMQWZSB9R4itReLNqR
	V94SBJcXid1A2DDF5JCEtSx9csRrG67BONgEUa8Qz/58w8rVx5Tpz2YdIBoF7Vs0dQQyyDoo9vah7
	r1XO5Fsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBLfT-00065p-7x; Fri, 20 Sep 2019 16:21:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBLfD-0005gb-3s; Fri, 20 Sep 2019 16:21:44 +0000
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D4BB218AE;
 Fri, 20 Sep 2019 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568996502;
 bh=lj7T3kTvphhZDzZZ9VayMSkoBtQCOWfhYBk4KfxHg50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wW63Fcj6lhiCHAAQ3qQvBNpuB524I5PssySEdWtT/9BPu39PT+9aqVD3ijxpxk9FJ
 98Y0pifE0or9ZRF4g8VvjzXa096CeFEweNiXIkCcXZeCBm9X3LXkexu6CpmpHRI/F5
 fHwSsEgKU3FXPynRyLmUQ4/miqcvEhVzkMhkA4SY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: watchdog: meson-gxbb-wdt: Include generic
 watchdog bindings
Date: Fri, 20 Sep 2019 18:21:24 +0200
Message-Id: <20190920162124.7036-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
References: <20190920162124.7036-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_092143_202884_E929B3EF 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Include generic watchdog DT schema bindings in Amlogic GXBB Watchdog
bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index d7352f709b37..4ddae6feef3b 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -10,6 +10,9 @@ title: Meson GXBB SoCs Watchdog timer
 maintainers:
   - Neil Armstrong <narmstrong@baylibre.com>
 
+allOf:
+  - $ref: watchdog.yaml#
+
 properties:
   compatible:
     enum:
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
