Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7406EC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 10:37:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E1F9221F8
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 10:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E1F9221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6ZKVVlUtEI7xqMQ2XJvRr0y9U6HCq8xniuXJqRJaRo=; b=VS21v/5eWKUXWQwHHenWeLNnCB
	Jyzysjuy3/Cuj3o/G0MLRxGIM7BPehVbz4kPEJq4yvGjkzYMyCkV4apnmkW8yX2tPmiDQfVv4rfP5
	5Bv67cxKGZ83+SFOfVP/g6xEmPWAvXUGyTFddQc2DGUAdUuwX5z34kPjSIxv8KwgmXqDa/62fzBgQ
	faNfv8mhnsm56UETDPtxNgWSSxoSHjcbgLYWcYVZaUeW+ME7Fmy5b2pk0NJqtNAcTWfWfYjjV6qiJ
	Nuiy6kAiExnD1MV6K16cA/mf6BSns/cDMdyLGFrt5zvTnryXvfKcR0teaQxX9MVcVAzBTnL/mdLCb
	f+BgWLeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuYrR-0007yy-5n; Wed, 30 Dec 2020 10:37:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuYrJ-0007x6-93; Wed, 30 Dec 2020 10:37:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r3so17088533wrt.2;
 Wed, 30 Dec 2020 02:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qhhYEI5h+gOOGXHuXn2NRaquvFc5DXohAEyTChn9mP0=;
 b=hIaBq+n0irK72XY/MMtnoo3if33zl5/AiOLYkcu4jcD6+2T+Iizb1jyUwuu6CDkcV4
 Y7H/t0/4ohbMlydpZ3t60JDWU08Qf/b2Vr6Na9gv94j66hcWVNIUVfWYLfvFOIB3VOwu
 seDFNNDzSCCQcZX9feg6t0HCRrNvxDCLGSv1YBXmuXz+p0JsqzoEH31b5+6eKO6DvxbP
 t9+LyE2cBCa7QOO8J/UKDK4aJVXy2cm5YcWB11tq58TYucJJWvoUoHs0TtTKOkJ00lIG
 QfcD2QBNGImEf+bbA6EXHzHtr+P6Zjfs2LyB9gc/CM1QpbUUjQ62Y6XljkTq7vjthFD9
 9llA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qhhYEI5h+gOOGXHuXn2NRaquvFc5DXohAEyTChn9mP0=;
 b=AP0/RJ3ssa33kYBg6pBot4n7JVqGL7IPxdur/Zi77pKex3kUSmaQl3O+PBuRWzxqmc
 3JuPT3rTmu8XhMgRId6/WbNAPlP1VDNmdOtUurwzCvqKlZcTFOo4+TfCElJEZRMdabUd
 4odRU098Ss/HvTZ2oxZ7nt2UJ7XaT/2D+/h/5wS0gvGxL60AkQfk6gAelDeS/4fSoaCe
 1VSbqns+5Ww/+qSS97l1jSTrfm9+YlSz/YWoXtvtphK5VDyVmgPcLY1Ffidvidml3x+/
 fFzzUac7xYbqJgL0eUO2VzfIXV5jn9hb18DnttEgk2AROk9VVkpG0ZSzRRPwEdVUMyfl
 8Uuw==
X-Gm-Message-State: AOAM532wJ5hoskYSvn5dG1SXE7aiXRRCHrRM6X6m7xeUE+bhdtVYEu8T
 3QBFEkGPSV9rDzNo22UTOOs=
X-Google-Smtp-Source: ABdhPJy7n+kS1h/AtPmiV94IkVphrIFQM8x34rmGP3avGly0n9lzcYNXvf6XMLYcYCjGff44wsF8IQ==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr57207289wrt.324.1609324656106; 
 Wed, 30 Dec 2020 02:37:36 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j15sm66672156wrr.85.2020.12.30.02.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 02:37:35 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for the Beelink
 GS-King-X
Date: Wed, 30 Dec 2020 10:37:28 +0000
Message-Id: <20201230103729.2272-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201230103729.2272-1-christianshewitt@gmail.com>
References: <20201230103729.2272-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_053737_340967_465DD033 
X-CRM114-Status: GOOD (  13.49  )
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
