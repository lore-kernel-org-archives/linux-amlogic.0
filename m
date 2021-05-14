Return-Path: <SRS0=hwcs=KJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1B0C433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 14:33:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C48576144A
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 14:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C48576144A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fvkNbyT4Ur65SrRVzuv8jtHnBbW652A7T/cWCMECqUg=; b=FFFmdd8gFNpQZZVvlEAKIMgZH
	StZjveex3j+cOXXfigQoNkfPDzsbRVgnhIErWfKRZ5Gn3107RzZYD8ghsIHKCnhJ3mAaWobpAbP1U
	Y0xNyz694J3U9QuI73U6tIP56GkMY661kCwnUSx+OHoEOJZrfeAYDpoOz04rmBjqQzpwSD8E6vJRf
	5zZnFn8d2MJshGnVhXulmkw7qIKSDFjyiBJz3XmhqorAC0Q0ouG7j3WnThO6UoBcjae/qieGmw60C
	K/IB00zP3QqhYKLVWFJBGlyRF08Ktp4HktrTQqP4gjtuFxwQXkUwz20sJWu1tA0+DJ6+xyy2NmMnw
	P3J4f8Phw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhYsg-008ISO-Dl; Fri, 14 May 2021 14:33:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYsH-008IOg-RK
 for linux-amlogic@desiato.infradead.org; Fri, 14 May 2021 14:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PjPVZHKFcw/0Kjl3neOnoz2ErhwMmf8NtZZOxTpdu8s=; b=ReGIr9P0aW9ExwMYLmEXXSl7zE
 C/2aLPJuSAKyct7OAEJKSM+LIYyZeyWP787T19Ym6N1FzPKBx8zTBln+Ivdd1u7/1+vt4ymtOqFLr
 zFML8hGbIEk7zvuaWDV9CFu/Nw/PlbfpJOLOgRcI/xLrHoVvcKeJpneeJx9O+H7FNaxuHpr8Eu8ol
 pK2L5wlVnxe2QuNZ6lvPaDiMzGQD4SztF24kmk+mD2nfAvDJeMrFO6dfS3/rJ7uFetFTEYsF0GHKv
 vDxxjvhBxrlYxFgPXgdhLLo6NFG3oOI+wTfRYyilZKPgbM1sFTuXF2m59DGoAy0m+hyGkrIytnnsI
 KE6llTfQ==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYsE-00C2ln-35
 for linux-amlogic@lists.infradead.org; Fri, 14 May 2021 14:33:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id n2so30308944wrm.0
 for <linux-amlogic@lists.infradead.org>; Fri, 14 May 2021 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjPVZHKFcw/0Kjl3neOnoz2ErhwMmf8NtZZOxTpdu8s=;
 b=N8n7j1UMrkltISPqNfNmaFCoGnD9mDpbzYFFiz5DukTU/MJT58wTxlhpFn/yRIWYni
 bPp/d/LpIoY0IyKync8lVLytAsFXRXOxTkRL/xyN1JVTdYS3+lOQUkY99TeXMkBgNs1T
 /oHMknBIPnCNFlJcTvwmGLr9aX4AOq4wj+YQjQO8ABcAH5/SZ2xfFD0T8kwOGj4XUYpQ
 +BrA4Ju1g9aH2nRpjw7lRXhMmBMToRw5umI3wUdNpdwNJm/4Ysotkxxb5q3kng+VDeOS
 GjI/7H+m8BBrKysHtKJ3xZtCACLo9QtvDs0V5W5mb/XJh/gpkFqxVh1OLV/qlqVgWPSs
 k9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjPVZHKFcw/0Kjl3neOnoz2ErhwMmf8NtZZOxTpdu8s=;
 b=acOP85g852H/3IKsqPFEVnwkfTHkNHOEotBjB6DOD7tuv8hF2uqHbVfey7gPaQhbTh
 MGS4PyoDlmlhm93InPkMWq+kA4gzfiYEH7cC6EX89qGjMpWuqIKHYLCZfubjBFfrnhmZ
 PbEBUA1qf1ILY4k+SXjTpWkh9Pu28PvvU7TCE0ufh5caGUjfwHcmavAIL0LVZ0cukqQN
 ZWUq8aqrWhCZx75OPJ6JI6ZiAtjIfpxrv4A+/X4vZKtRJ8Zc/u+hWBx5/L7YQtQ5y9pX
 h67LYP66nlRlffyW9t0fJsrfqZ2oTJ2Eb8KmqoiJMblalCXkgvl5ZyC9zZHh89z2+p9r
 0KMA==
X-Gm-Message-State: AOAM533C2ryLF1rgFJKVAt2/uAzX4tJDSmVMfq34BEy9koTRdXwfKiEn
 i92ZPj9RfcgvFx1M6IJo1cHSqpyEezjqDfUB
X-Google-Smtp-Source: ABdhPJy6/TGdhjA/Zzgm3KU8lGiHXBECPm8RKOoEQKk1k3ayM673dArxL41P+kY3aOPDuAv6Kczftg==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr7181697wrg.127.1621002784504; 
 Fri, 14 May 2021 07:33:04 -0700 (PDT)
Received: from localhost.localdomain ([37.173.48.34])
 by smtp.gmail.com with ESMTPSA id v21sm11552036wml.5.2021.05.14.07.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 07:33:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: amlogic: add Banana PI M5 bindings
Date: Fri, 14 May 2021 16:32:54 +0200
Message-Id: <20210514143255.3352774-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514143255.3352774-1-narmstrong@baylibre.com>
References: <20210514143255.3352774-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=M0SEFpzXwIE8UCHsgzNMhizzXWIk2IptqJJD3NCqC5E=;
 m=Tq6MXbuxaNZm9Pbg31ijl2mYxV06fIqGdbAJOoh1/EM=;
 p=HRqFdlzLeSnVMnr05Eko/xZxgVVTv1235RJRzqjszD0=;
 g=1687e36ad2573496cc1e8703824d0d5297a2226f
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmCeigoACgkQd9zb2sjISdEOUhAAs7c
 hJRyOSKM4JJtqwrB77sPnGSeeNHqtGPUngeJYzFgcKIAcea6G5HUS0g8x2GkIrXey0CCe+XyGyR23
 oBXF+I/qwT5L1hOlAc2A4UaHGvZfDbmiKklVVuriO3cR3llo4hbPTjOvO+DMxWOnmoDAIDH/O8HCM
 AuBrfnIyGe5B/Gnxgm6ApoRYciH2A7PMyBrAFFYikfUUTfCbviBgyzrxGckv3WqyEVhMkz9J4X8Ac
 CEVGIQRiE94L5SutDbxtRbshckRS4mZL/VakaglyXllkiMy+602e1ByltpI+AlTIuBIral58ZWv9U
 Hz6HniPoJRt30o+NIZmL9dRA6YBZJE2sgJoSgZ3r8BbNGDjYNhT/zgUOUzUZfY/25owYLimTtGmB7
 TijFDcZW/wiuM6lHZ1xfmXhfZ8xkOeswSAZb0MG2Cbn0IegAng3opKoFlVMkgQyBXXr7ZDLDUzQMz
 DCIZZ9TWAWr23Jo1XRVccsg/tSy6+Nr6JUMkfNb6PryooDHlJm7FoXeM2U7w1w5TZ4K518Kn/63Dc
 ZDO0aml9vmqpfw/nP0zC8LG0wS1hsVqaFLoPamWNMUHE5IGhacE/03lNDya7EpwvXvT3ggs2Ju7+h
 ytHQGpWcefWgvTc4hYlpWex07xj3ad4JWK5bvfR2g/OW/ZHMDACzdl7/lavT561A=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_073306_145657_0D5A02C9 
X-CRM114-Status: UNSURE (   8.10  )
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

Add bindings for the Banana PI M5 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 5f6769bf45bd..d81a20f66415 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
+              - bananapi,bpi-m5
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
               - khadas,vim3l
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
