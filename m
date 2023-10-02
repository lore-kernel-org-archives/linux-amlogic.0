Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBAEE784AD
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Oct 2023 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zKX4xNrmYLTiEg5NplDlv4irc9irS4CSOUJbhig+WM=; b=NC4gT/GPqZbKtj
	OWtOJixTyyEBdiLpxU1rNQjvUj8b2BTl5tvO5BXGXVxoinRMM7OMLWe7y2VGqxYxpEjdNFdkF4t19
	J0z6w9zexhLyD9TgkwKRKEMwbAjeaEMwg28848hnkBunI9n8FdH1x5eMoLz3B/ABtWVv3hr0nLKKm
	CUs91/RvM/OfqKLFzOBrgt/sWoKw5RN/+xVYn7OBsJyBwg538U+90DdHm9XoE2uzAe+K13Q3oReY4
	u/FtTHYs0LLIZ/24FydThsb1R1V2trVE7c4oW8bEREPrA+WYg0m3MGiPnvg3j2Lll3WhwindtZ7rT
	/m9FVewUSsuC4Z5MhLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJdF-00Cqth-2K;
	Mon, 02 Oct 2023 14:10:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJd9-00Cqrn-0f
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Oct 2023 14:10:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406619b53caso26695035e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Oct 2023 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696255836; x=1696860636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V91cYRIt8yJYSOx2f4FKH7CFK9UttvFj+gUpHbgWKyw=;
        b=GLKJ+UOdrQRnvEiO84Cl0ric/qXjho9ZkAhsHy18IoqLEWXxU6/dGRYGMhmutiipqJ
         xV/yFYBQb2iP3VdMGmD+j/ywO2YfHmjv6Na3N5kiHPHlieiP50JK9ZjovteKpb20LGfH
         u2lYxVPYidKe7zGfVL7srDWkApC2GuVKI9FiZm8EMk3Wof51Lif2KJTIcCsduC13RYsL
         1wMxSsh8vEeTHI02Bfi1/AeROiv2CuCtOkFCnnVZtoQXsfb2H5INN2CVsk3QT18/5icO
         5Dpm5Ke53n4rrcG3lEuQKfDr4Tonnb3RS6cS7JIhA/LUYRbYCI44EcogzS4A3QflmrUa
         SfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255836; x=1696860636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V91cYRIt8yJYSOx2f4FKH7CFK9UttvFj+gUpHbgWKyw=;
        b=KQQifv1f/kZgqxmprHerofzauaLho5vkkMV1SocJy5KvNKnTfiAGVAaa/ydohzEBec
         GQ4MmrzydD0m/S1OHqKOAWXtU5Ztzpn4W25wqWZBv9wTGawc1JVZIfecASBNl6PzaG3z
         7gIrIlF9ju0g/CCMAVpMCE/VovCFOMBpa3O6yG0uzeNYZGZzfe687fUDKsMYIw4YvCih
         jIsVJx3hH8huFsPNkFQhO6ic6LJqNY/hiBycXRPRtmjVnOD3FrA7wtMn/vSI1pI4PfxZ
         wDsa0Ta3TPWixX72cB97lMdr40F/cgyI9ELHkkmBJeaasGPuJIHncIu97FSS9GxatmMq
         IOFg==
X-Gm-Message-State: AOJu0YwpJzwfn5cXgHnP9kFy87eewtL9h97w6NPQxZzOkw9YmkyepI6V
	01SyoGoMk2ke0Eh7U547fFCviQ==
X-Google-Smtp-Source: AGHT+IH12gMfHz+WiKvadwSp8NrQkbn9hq0VDKvMaeWJbbqRL8bgMgmJ4ZngnP0ASA8/U+F6q3Nr3A==
X-Received: by 2002:a05:600c:255:b0:404:74e3:27a4 with SMTP id 21-20020a05600c025500b0040474e327a4mr10414923wmj.40.1696255836595;
        Mon, 02 Oct 2023 07:10:36 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fcf2:65f1:853c:13be])
        by smtp.googlemail.com with ESMTPSA id k3-20020a05600c0b4300b003fe1fe56202sm7361911wmr.33.2023.10.02.07.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:10:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Da Xue <da.xue@libretech.co>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add libretech cottonwood support
Date: Mon,  2 Oct 2023 16:10:19 +0200
Message-Id: <20231002141020.2403652-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231002141020.2403652-1-jbrunet@baylibre.com>
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_071039_471039_FFE14EEE 
X-CRM114-Status: UNSURE (   8.56  )
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

Add compatibles for the Libretech cottonwood board family

Co-developed-by: Da Xue <da.xue@libretech.co>
Signed-off-by: Da Xue <da.xue@libretech.co>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b7b0eda4164a..caab7ceeda45 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -155,6 +155,7 @@ properties:
           - enum:
               - bananapi,bpi-m2s
               - khadas,vim3
+              - libretech,aml-a311d-cc
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
@@ -196,6 +197,7 @@ properties:
               - hardkernel,odroid-hc4
               - haochuangyi,h96-max
               - khadas,vim3l
+              - libretech,aml-s905d3-cc
               - seirobotics,sei610
           - const: amlogic,sm1
 
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
