Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD22CC04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:00:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F46520835
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CYeZTvCn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyBmnvGA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F46520835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qAzCn82NzvPaFS1oMJ0ZRmJLCB7JLDzfXNycOWeNsGY=; b=CYeZTvCn+403CcobKU4IeN4X+C
	ESNb38N20A0V8x+mHZOp1y7KGtL/Ehhh8znywucJZ4wen4ToYVvnZuA9d1fK9vIQKyZlALY0ZGdm4
	RJTa6Ne1HYVpyaCXXhOViGgSfELS2t3aBwdUrc+wwbtGa6RjdxL+4v4QcIjCll/Tq3H6znnJFmPx3
	uuat15n4F22friYLuXMGQC6qJsKK5M1Vak/pMEuNj7BHyUijSYbvsHCTK8lppqoduDQgqbng19SEW
	bme4uxEiNk/yvDAaseOrTR43hxw5EAqSEKhHxWmd4mnb0FsfYBKtu8zCt/n8ChrlYuyPD6+POFYEt
	HLOBpyjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCOt0-0000BQ-EO; Mon, 23 Sep 2019 14:00:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCOrc-00064u-Lz; Mon, 23 Sep 2019 13:58:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5so10127645wmg.0;
 Mon, 23 Sep 2019 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xDojPBQ0esilIp1GUWD6dVVMPDHyVZuOXZ5O6hXNfas=;
 b=PyBmnvGAVmeNZXVQCdhZuMm5xmUKjafJcs39w+VF3xZRW1ukATZ9MM17I1J5yZNxWd
 xUXioii8j849Qsr7+EivroplglGGCZmkQFXoQ8fVDUs/smlVzNX0ym7X/kShnNnWHB8V
 1Joo5oMJhn4DUS2E4CZgWJvij8n3nb5xNxJd96p0X6zQPPVfWEUFQDuNCLIXEAS2/a3a
 F+NDc+WB4bAOsDhi6UWEGLNKXBHwi93vC+i2ha9Snfv/jB94tcyK3Lyr/suRBfoCIa2m
 jVIGyxhMZqkJRUVn6UDhL+BT4Envnv0yumFDIlBfCM90X6Tt8lyH1tysSSG4FfA9c44E
 f5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xDojPBQ0esilIp1GUWD6dVVMPDHyVZuOXZ5O6hXNfas=;
 b=sqeqwb/T4JgK5zeiasEzigZZ41XhnlNWH18a0KmF9WUpegkxInmfsBgQEFz1WllUGU
 2yCp1TKuM//B2rck+Cteh9r40raE0fjCjqnhJC0xi/rOHezEC7QlSiY1EyVD3JXMyx5o
 6zHw3j/Fr2FsyBUZ8+CO5y1ehfMJ+A3CF+VlQ3uRtTknIY87IAOqgzjNnGweJ5stiCxa
 /AUzRvWAoQ1IG5LyeyUAazPmnKTdpbdrCxIwtHfCIBNTNSlY6kAY0rVeBpii3Q669mdJ
 3YjjumZVmBxM555oSBUQLH//Iqnsxvm1aYcVT8DiKUAaYsT9na6rFUM7k57MIQsoIvcv
 fRUg==
X-Gm-Message-State: APjAAAUz18OsGhx+iNJw7r63AT+6O/WuyNyV8eL2R0GMB3NgjEz2LGGd
 lnitae4mmncClwSQY58GLio=
X-Google-Smtp-Source: APXvYqwbM1mVAeEhkw7RAsOqpdjVQEUzhYsQX0hZyFely5cFNmwIhidNTc5umAi2fF9q96DYEPgpIg==
X-Received: by 2002:a1c:1b0b:: with SMTP id b11mr638211wmb.82.1569247130847;
 Mon, 23 Sep 2019 06:58:50 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id h17sm25266184wme.6.2019.09.23.06.58.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 23 Sep 2019 06:58:50 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: Add vendor prefix for Ugoos
Date: Mon, 23 Sep 2019 17:57:55 +0400
Message-Id: <1569247077-5212-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569247077-5212-1-git-send-email-christianshewitt@gmail.com>
References: <1569247077-5212-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_065852_773118_15FD0562 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ugoos Industrial Co., Ltd. are a manufacturer of ARM based TV Boxes/Dongles,
Digital Signage and Advertisement Solutions [0].

[0] (https://ugoos.com)

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbb..d962be9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -965,6 +965,8 @@ patternProperties:
     description: Ubiquiti Networks
   "^udoo,.*":
     description: Udoo
+  "^ugoos,.*":
+    description: Ugoos Industrial Co., Ltd.
   "^uniwest,.*":
     description: United Western Technologies Corp (UniWest)
   "^upisemi,.*":
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
