Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32265C47404
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:19:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01DFC2168B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:19:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZwnHPeeC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxW7qDEf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01DFC2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dypoAPPb4floomlVYrbayUn8lsdTqiTF1n4iIhnmnOY=; b=ZwnHPeeCQwvA4K
	ewRPmCmObYb7FBe34odrc/SMhbGBxtVuFdvuOvDV6/5SmKL0yKpzFzoFpvdonrT6z/iTDBpqrIVUR
	VsqohhCSB5S6yc6HKc1ElOlzISOmu4joYIlFHgwHJgNfnuddwp2eV1+h3kUqD8ufZxZUe1stS92bf
	+37LLc84CjGIWxLHBYjfOQSpKzNtaD2+1EQ7MBKT8RbV/CAIR1j3jQsLKiBwaA94aJNBYcs6TjCJ7
	+hUza7+gCh5TszlpwBjiMvpZg0BgKwyvptN7wiXskxcCZMg8INksR2/eIjl20OFdDuDtcdrwMjpdi
	Yhg/T8SWqj8wkESwOvHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJslB-0007Ps-E8; Mon, 14 Oct 2019 05:19:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJsks-000778-VO; Mon, 14 Oct 2019 05:18:52 +0000
Received: by mail-wm1-x342.google.com with SMTP id v17so15300649wml.4;
 Sun, 13 Oct 2019 22:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r27WGXUs+Wuhk1pzsYshNkJtTiZw35ZkKYZGAVQI7mQ=;
 b=ZxW7qDEfgKxLpLZQCQX6vWykm+r7cYH88LGy7TAuV6zMHBGE8rm/Lt25gNvc93Cxyj
 OQ7R1pmBFKqrjpOXlRkqgRMkB/KgBa3fm7bRqz0xyLeET4uYqtzxJp29dtNBjxSB5/V7
 kPqKrycbvQI3nd0E3rd+5OpQTVp1AZx17u0+NwOJ5ctEvClATX8lSF9sIQrhI0w43+5O
 ujAwS4nWWQJzR1MxNtnX89x/aWs9R4OJ+o383l12cX7GBbZVxTGVETBUH9BM5cKZArgT
 E3BqB8b1D17Zpkh7rQPwM+8vVn8uv57UOQl9bNy0pcOntwiHs4Z0K/okXHQITln4NRY8
 8BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r27WGXUs+Wuhk1pzsYshNkJtTiZw35ZkKYZGAVQI7mQ=;
 b=CGTkrdiAMEx/pPAOIMULKaa5V/3QeNLUGV/mAjKVDSTKACIGPd32CDeE8IYmZeSRJN
 lBlgqWhMLBLruSEjQWCfShBMxoTigHjsnTW5WM9R/74bd5A4nW6l0mbicUjFMUHuznrh
 uKRLZaoZ5/XmhgYRrYc4Xdg/u7vVsu8Yf4VQm5QO5JTn+lGMHcJemx9TYSYZv+J4ILYQ
 9+A4txeF1AxNwz19Xg0GdMKQaqB73n/DdXSlz5wakgNKpEUFTkgRfaLUBh1xxL6qnk+w
 bu30b50e6l4BJVQWPXmVhxHxqJWRUr7rrVVOOvW57G46JbIkI6GBCvWYQpXpwvwkcT+p
 9iMQ==
X-Gm-Message-State: APjAAAXWcqJFedmbPYujtPvZPCDZxmtBdIMpUmQrqtQtZZjxC7bU6+Pd
 rY3lx3gcsI7SISHe5/4hESM=
X-Google-Smtp-Source: APXvYqzTsLHoZpuvisvBX8HutF5saEpyzHk2Up8rAkU+EmCCb/EqrEqbZTDKe8KERdgRDuazda+ssg==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr5811046wmj.119.1571030326771; 
 Sun, 13 Oct 2019 22:18:46 -0700 (PDT)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 5sm14660340wrk.86.2019.10.13.22.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 22:18:46 -0700 (PDT)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v2 2/4] MAINTAINERS: Add myself as maintainer of amlogic crypto
Date: Mon, 14 Oct 2019 07:18:37 +0200
Message-Id: <20191014051839.32274-3-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
References: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_221851_030436_4C46974C 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I will maintain the amlogic crypto driver.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36c5d6ee01f9..a8487a0999ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1477,6 +1477,13 @@ F:	drivers/soc/amlogic/
 F:	drivers/rtc/rtc-meson*
 N:	meson
 
+ARM/Amlogic Meson SoC Crypto Drivers
+M:	Corentin Labbe <clabbe@baylibre.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	drivers/crypto/amlogic/
+F:	Documentation/devicetree/bindings/crypto/amlogic*
+
 ARM/Amlogic Meson SoC Sound Drivers
 M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
