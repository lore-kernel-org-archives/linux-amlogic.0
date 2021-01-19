Return-Path: <SRS0=ZD2b=GW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B505C433E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C57522241
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C57522241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ6ZHU8zM8OFa8UyCoahJ/IHf+olpTKO8Ck1Zzi9h3U=; b=fgSL+C1SMBqWvBMXYLP76YBu40
	hDIAPrqTufGXydPoWHdjZCGILNq/4EAnV6bXwekHL9R06jE6CX7tpxW3mlMaAkmuZ2mnbM7zvcmYy
	W27hqph/rfM1Y125JFcv8SzNk2e4YJy0i3OyIuhDVL+4+bazO4kSkxe4uFnuDZ8hR8Tdggd1Oo0NX
	BhI0wCYAf/sKPuZJ1g8Ifl/2PwZSAEU6rIEwmT2b36pgMiWAlrxzz76vxQzZy6DWDPmcXP6UlR6fi
	1eFekCTxtTFuLA4lCKi/Qo39mqfDWjS1gB7Fy0ZA0O2tSPJj3W0UxYdmQ8Lnw031oWZ3zoRMqMCGI
	mlu7qQFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1sSA-0007M5-3j; Tue, 19 Jan 2021 14:57:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1sRz-0007Hn-5j; Tue, 19 Jan 2021 14:57:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w5so20009966wrm.11;
 Tue, 19 Jan 2021 06:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v1fcpvnUYPI/nQja+D/H69Nwe6mpUxULCJd6j/AG/F4=;
 b=Byg8/tHEodzmLL86FpTJLixTBpbHAUztcvN7SPKf8dz4tuMZufNgeLi82a2mLrrURo
 NC9XYjeHhd50imztA6ghDQF4J9ZcEWH4hSX8PVfF8siXtvAxMbRUFZnl1jzirqdFcNSe
 n873a+o741Kpvhzya/CnMmSRXURQ1L8xBHlFTRupYlvrPiTXwEnGoYYxI6V1OIerOePN
 eBP5pb5kRhKtxdgknSGldys243eZceoDNcPlQnUj1sCap+RIGPO+l+Q6FTdTIcpzI4wg
 YUQ7pYVmJWdbbi11t3smnWhcGQqytj8mhx1sJSyacw2K11oyYOZ6kkbgZFSSyiDTj22z
 fFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v1fcpvnUYPI/nQja+D/H69Nwe6mpUxULCJd6j/AG/F4=;
 b=Cn082BbMUzMw0/PMRJ3jwsxPKI9J515RMd6ETR59gd4wu90cUhmVhJNJa6OeuBcXkC
 k4ZvIkF2Zc1Xh5PWwk9q85VUUnjGhRFMGrPkAhXLbqy4cwT9ReligNphZAsd7VZ6nqCr
 UPbfEpaC6HbKt9uDeqqNGqf2vGQic96dQFshdZu39iTWjpvoCFbdh0JL9ivqw53hvEIX
 jH52r5/hV9EKAa4p/ojipY8UF2wmH2hRBJXiHWYl0Gi5BizTpvk+eZdQpWwaZpQU0grP
 6ULWdzsUHQzogsirDCLyibMZH6upgYRIkoXzlSQ4C66xkIIQXrBGlRqihnU8FP589Tbj
 hvkQ==
X-Gm-Message-State: AOAM530EC2FYP2l2qCQ2gojxQdgBD87+bNsz5xmq8xVqJEqn7BtcYhux
 DQYoSzCWS3UMETt7c6yT5WQ=
X-Google-Smtp-Source: ABdhPJxYxibfTIpBNikpwutwBO3WkgharOYrPB4r8vQJGAxjzMjogW9/ubDSI56HVXTanCGLeAA2Gg==
X-Received: by 2002:adf:ef03:: with SMTP id e3mr480940wro.98.1611068260925;
 Tue, 19 Jan 2021 06:57:40 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id s1sm36786893wrv.97.2021.01.19.06.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:57:40 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for the Beelink
 GS-King-X
Date: Tue, 19 Jan 2021 14:57:33 +0000
Message-Id: <20210119145734.12675-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119145734.12675-1-christianshewitt@gmail.com>
References: <20210119145734.12675-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_095743_271581_B3D9D10A 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference
board with an S922X-H chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 3341788d1096..6bef60ddda64 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -151,6 +151,7 @@ properties:
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:
+              - azw,gsking-x
               - azw,gtking
               - azw,gtking-pro
               - hardkernel,odroid-n2
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
