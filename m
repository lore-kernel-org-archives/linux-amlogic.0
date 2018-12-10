Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B710C04EB8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 13:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D31D820821
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 13:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RYjzGWJc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iooce9HI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D31D820821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hhb6i70dY8xpvCxQWtRksXJnyjZ/lB3w/r3s5WKAymw=; b=RYjzGWJcCZ9jIp
	4JjAFinxOfmC5C3I3XWSyJNl3JYHrJJyTQUk9STae3dqm6mIzfM88ZtUdTG8B8Qb9XbhFtkkLI9+8
	bdsmB6WSc6aqhYdOoH931gg12sxHegAu9Mji9bPfo/IRk6Q3grTzm/xtd5BiWGFgXYPc2Hwlsk7R0
	90PgGQXQ5vKscQ66jZFFTc8hE1y0wrAzmxWSE/m+gAfkZxAcewcJVgqJfDeS69hUtVc2nzIKvKlum
	m8XwV808QpzzBR94sPuD2AVK5WFm17VL7VP0SmOSyw4n++IL8HNxxUW2tN7x2EUAmx15DmjdT7WoK
	Ptfxs7x6z6bcQZiOaAnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWLWw-0005wo-Hx; Mon, 10 Dec 2018 13:23:26 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWLWF-0005Cu-C8
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 13:22:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id z5so10419384wrt.11
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 05:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPFj6MLu/M8G4PTHe2LZz+FX5iaOvPF1UuFtv4gFdoM=;
 b=iooce9HIO/IlQvwj9SUjEVZnfs4JA8YOgJDRilfuZl6auKf8xTrYC9R5wRQ+C0bHxX
 ZoFdLXyU3el2I9dN9udnFGLs4UxW6Gg5ijO2IoI9UK+vPkV3zubFGZUNq3RRD7yR0si5
 66F9q1JZHKxsUODKLPhESXtIAOv+SDnoCVVfNIezW2czQtrLsbRQIs2xotIRdGhS1Wl1
 xdUkmfyWQD++JJNL9TQVCq08kwEK4ZRHGDCJ6oaYtwoRRXp3otKtUoEHPJBCX7gWrcSM
 Ewwf5pqG3wqhf9DckZw2fqS9rqIWcZ271KOBsQHQ/Y5GvgJdW2lwVzUWjy+zssTlFyef
 1TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPFj6MLu/M8G4PTHe2LZz+FX5iaOvPF1UuFtv4gFdoM=;
 b=X1MjlnaGO0iynVJFPnIGoLo4OEXMms8++9fk3dAUIxAA+B6vyZoD4eKRbM9NURLO2e
 5asWuwYW6IGcR+aKJrnYQf05LhOnnvDp45zJJZdTgnEoQPXNa2bdzZ88hOhYjz4NqtNs
 ZnQriQlsbJPYjZ5el63CIl+ec//ccoa4YzAXt/r42oj65GTVMJATnkxLXvkv3EA00RuK
 O/5TFKlc2jGFH7MVTyoVmqM9iOHbqZtnMSXjj6Bw+O5TPzN0ef0eFsT6K9RuXyAoMm3V
 jn13WTmnnqsiHmi2B3Wey8emH+DG5VGSGLNpQh24v1936Dy0pTRZC7hr0/2QMS5jHnay
 Sp/A==
X-Gm-Message-State: AA+aEWajLj6q08ss771cmSirzmLnxodIX3LtxrTAbvyI9pyKglocnbzQ
 VfiQHBCsDfycN6qWl6nPWp3qQA==
X-Google-Smtp-Source: AFSGD/VMEYq9rPP0ewBLKlh/rB6emjkoSuKndni9TE55hTZ/5s2L+oaavtKw/KDurpcOrw1X+emiDw==
X-Received: by 2002:adf:92a4:: with SMTP id 33mr9607298wrn.11.1544448151513;
 Mon, 10 Dec 2018 05:22:31 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l3sm11208424wru.36.2018.12.10.05.22.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Dec 2018 05:22:30 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org,
	khilman@baylibre.com
Subject: [PATCH 1/2] dt-bindings: gpu: mali-midgard: Add resets property
Date: Mon, 10 Dec 2018 14:22:26 +0100
Message-Id: <20181210132227.29262-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181210132227.29262-1-narmstrong@baylibre.com>
References: <20181210132227.29262-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_052243_408648_DC1F689C 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic ARM Mali Midgard requires reset controls to power on and
software reset the GPU, adds these as optional in the bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 18a2cde2e5f3..24d83ec952f1 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -37,6 +37,8 @@ Optional properties:
 - operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
   for details.
 
+- resets : Phandle to the reset controls for the Mali Midgard device.
+
 
 Example for a Mali-T760:
 
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
