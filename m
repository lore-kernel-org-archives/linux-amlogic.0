Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7C7C38142
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKTp71Ia3KCAMG3qSlq18DzBVejOkyDjgp/Kz5PaNiI=; b=Xb5CB0+aLV1cx1
	kl44oNhAaPPFFYqUGoeY3XMfyR7BJDZ/otuKIdNfnBGgpyxp0pIy2bc2zI0sGSkV5/b8Xo4nEY6EM
	KvKvj/dyqGxj7N4nE9xEmGpDWp6D3wMrG3Ahfu736HOIuPpjK+Kyk2K4mcWzNxWpKZJmzSG4FQRY7
	ZdX40PopncGCuQ/Vq3DJy3jtkFqcta3ysLbAr5dFuPuour2qa0LGsVZv5/W2N+RFpb2y/BtjIoncC
	wHCRM+T9S6wHoIQi2LO8/7F5RTfKlA8y5YItZGvqGb5E1BAYvqNoz3asWMrYr/CACcfzcneSgymZn
	yQ5dVf3LwcdLMw27v5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI6z-00EDwU-Dm; Sat, 21 Jan 2023 17:57:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI6w-00EDvE-D7
	for linux-amlogic@lists.infradead.org; Sat, 21 Jan 2023 17:57:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso3789074pju.0
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 09:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/VSKDQbMfKNc4vbTKN5x3k2QwZYoCdcG6c1F2hh6IQ=;
        b=N/OIx3z9t4Uo5fQPEj9bdg0ERvScU+q6xoE8zCh20plLzYMf/9mTCvczSMgf1Khowl
         D5oxQJjdnSAR9nLO7b9k4CIRgjjscXzMl8LGbuFhen1oHkGcz+fe+yu8meWpsexNJtRZ
         ijac1+HzMQ7dCjqMcbtaYU54aqUXGQPsqsp89inHtgc/RZzp6bDh7hP0148iWyrL93I/
         fLp0j8pz3h1StWibXfIzaSCBMmOc3v/usQPsHlVjGge3iNiBuVjtOp17Hm4AAl1IA00C
         GP7eBNc0RcVt+TkCmwEPzI0m9/rvS4q53BF4hRDTk7MXCLCW+4rit5dtqLF+xmxy2fph
         a7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/VSKDQbMfKNc4vbTKN5x3k2QwZYoCdcG6c1F2hh6IQ=;
        b=VLPJSlYSLzzcfoKZjamuaut8teuuysvFmAeN7RW8bfQ4k86CGhasMiMHUU73u1Dm3N
         eF0cnq0p/jVN2MTheda7wF2SviNI6y6tXCa9LF3cF8UDBDEuTVlCfaxnFmaLjhN62Cmg
         CtMulZf0Yg6YP1o7AFqP/vnzJNut23U7fJ8IhjRRQXlngD4NhiE/R961zi5acfbSJvpo
         f2+TISBXCuZFCWc/Nv8s1MrkHapSaNOcTElpkGmq5uY3oasE0ScmNSMUYq1cJIPHR3h8
         k33Jm6xsEo25lhj/CDwwNkp39H34KqXlz1qYJXqcMmVhuhKv5QF93pyrJeq74lnihIUC
         dP5A==
X-Gm-Message-State: AFqh2koIQlCgXk3/aXCF+KkUT7Swf25kkwW/zJ+sbL8GUSVRrzWNNhDq
	3WzGp4AMamuWu2Zni3N0pPU=
X-Google-Smtp-Source: AMrXdXvALVURNZxMQoC6IgksCohu866TAnJyj6gUBO2UILqIXRqop3UNiLxFR7pIWHZBawt/TaiS2w==
X-Received: by 2002:a17:90b:1652:b0:22b:b6b0:788f with SMTP id il18-20020a17090b165200b0022bb6b0788fmr6011515pjb.14.1674323820858;
        Sat, 21 Jan 2023 09:57:00 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:00 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] dt-bindings: usb: Add device id for Genesys Logic hub controller
Date: Sat, 21 Jan 2023 17:56:29 +0000
Message-Id: <20230121175639.12818-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095702_465648_4E99BF80 
X-CRM114-Status: GOOD (  10.44  )
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

Add usb hub device id for Genesys Logic, Inc. GL852G Hub USB 2.0
root hub.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: - add Ack of Krzysztof
v2: - drop the vendor name from compatible string.
    - drop the -OTG and -QFN76 suffix from commit message.
    - drop the GL3523 USB 3.1 root hub device id.
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index a9f831448cca..cc4cf92b70d1 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - usb5e3,608
+      - usb5e3,610
 
   reg: true
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
