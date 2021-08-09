Return-Path: <SRS0=MsbO=NA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A75FC4320A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB58C60EC0
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB58C60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZnXoBz+Gj4cJ4wZq6GdwR86aTBuu/WoCC2jp9MJwYw=; b=aVpIUghcOWZLFw
	tfc9kmtcf/tYSC9Y2uq1Is/BRL3IqUqPhbYh4IfR/xpKFuySBXNkR6TX35NuEkTJ9r4yV3yme2exS
	hTA6eFefQWrsWQNv3VX85gkoDsT6vOggEO1q0lm6uAipZzUcYyapdSQp8yVi22fxZsYwBVRukNvoN
	sb3XyeswMA6tr3KeCurZz3XJ16BzpYD9YtN9hqPJ8ng+YGNQYeOhGxcSOfjPpIz7mU42l6tzowCjc
	4OkgZVBwwNL9jGzmEKbNkMiN0al+y/X7sipFOZOy7TY/dwPIdiZ3xzODzW2orJpfVcmXUX0tA6R3l
	Rxo9Vu3UQd+JgpWD0V8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD53u-000hkL-Dr; Mon, 09 Aug 2021 13:11:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD53P-000hYF-Ep; Mon, 09 Aug 2021 13:10:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso920701wms.2; 
 Mon, 09 Aug 2021 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ail8+T+/FwVUA7gWn+lZm4pSQKQ3OOV0PrkoWmQeTKk=;
 b=Yk74tAmK+MQaHIVZnM/rt+4N+/EaJRfFMGegydONTpq/lpH97+J2kbgpeg+zIl8uZN
 6QGOiwVXKDS3k1JmIE3wlp/aUiIVdIz7CgWn2ccHUaKpa6hdIZySGw/MM5zCzUlB8omR
 /bPx6GAHWmGF6auTeeQYppAlkioJ0lK4lXM5l4E/iImIRW2NjiwfquvPbGNVZrbEV4N6
 AAVG5tsU6+ZTSugSUSl8hf4/7uvl7hAuuQaZUVm5RFw97/TAwmXuq0Vaul0QtlvhKJk0
 i6M5e4mbjTJ+D6XCeR8qQudruXlWXVHUayluY5U7HevFbbgn0/80DtPQSjt0B92OVvl4
 zWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ail8+T+/FwVUA7gWn+lZm4pSQKQ3OOV0PrkoWmQeTKk=;
 b=t4EwQ1ZqTwLBKfu15DhW0cDLSLPD6zgD5TGOr88FSYstHO8EnVjzcY9f34jdn+ZSmj
 p+3cUPU3WW6WUT9yRjYGC4gQXUN30ojnDMr6gKckRuaxPRrEFeRCUn2Em6M99wjZUzqm
 9tG6eNTZ8c2r+4SoJtrMPGEq9ZBbfkOOKBQUEq2EZvnmgmB4SUd90wmUrSiW6QdTOYef
 Ub4CyDEOa2ix8+HUuAUnost9V9z5Os2zQuV7IP7WjhySxi0tu/aju6aOxmwF7p1ben9j
 iVEK9iAKBH2fxuiXJTKclXEYZEIsVdWK/l7x+sGeWdmu8bP2KaAa4zavksF82IHA1kye
 Fe2g==
X-Gm-Message-State: AOAM5312PRu5ZDrKvVAIdtrQf9T/SRHjIO8hjW9PuW1y71Po+xaBeBNf
 sxqHvlDQ0TgDulwdHaqkIQ8=
X-Google-Smtp-Source: ABdhPJw/6i5Fh/BkV/Aca+Dj51H7NmI6IoVGRRNCoafm/uOoZjOmpTfzPSDQFaMKh8LfMLoiipY05Q==
X-Received: by 2002:a1c:6245:: with SMTP id w66mr33640271wmb.143.1628514653724; 
 Mon, 09 Aug 2021 06:10:53 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id k12sm5276094wrd.75.2021.08.09.06.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:10:53 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Radxa Zero
Date: Mon,  9 Aug 2021 13:10:46 +0000
Message-Id: <20210809131047.28047-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809131047.28047-1-christianshewitt@gmail.com>
References: <20210809131047.28047-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_061055_548068_95748D68 
X-CRM114-Status: GOOD (  11.03  )
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

Radxa Zero is a small form-factor SBC with an Amlogic S905Y2 chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6423377710ee..67dccdd9a5a4 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -141,6 +141,7 @@ properties:
           - enum:
               - amediatech,x96-max
               - amlogic,u200
+              - radxa,zero
               - seirobotics,sei510
           - const: amlogic,g12a
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
