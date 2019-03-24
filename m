Return-Path: <SRS0=t5ee=R3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F30C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 16:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 733AD20823
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 16:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bynvdoud";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cxNkdU1S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 733AD20823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1orFiWAU+kv//5clq2n1cz3C7KTuk5C78iF1wwHRBg=; b=bynvdoudQDToTe
	ObzVWQLWbeu0j6Y0l5QgzkXy33c/N0TbMv/6Jz0v/OjmHXRMsCoPJL6uANU+MsaWfoOcsr0HYO5e9
	5Wet2GIIuW/zXWOkQcstVuYmc+9zhH7KHyo5HcIdiDBskQoUlOfs8p7FXIz+xNIrAZxm2jRCHh5Oq
	KUWge2uoHn079361SBsAxmmDR98+/ScLtset3ZG7K2PyDzbAf+/lTqQaLH0GpAIJtKnV257WPDnH9
	F6r0uaOA+z7OdVuwKndNCOakGLL5aPI/W1yJaKDuOST0X5isiywevPlcLbckMLA156m4MfP+ggW40
	7S8Hhoe8pteUWqpOrHeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h86E2-0007kg-21; Sun, 24 Mar 2019 16:43:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h86Dn-0007Tq-MD; Sun, 24 Mar 2019 16:43:48 +0000
Received: by mail-wr1-x444.google.com with SMTP id k11so37192wro.5;
 Sun, 24 Mar 2019 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzekSxk7r2M+F/v0AiDgvjTXBQnuIPdQBLE4FKZ4rcY=;
 b=cxNkdU1SuhlTGonSFiTwVBnJmN2gDmtOQqdl+yo/LQuneGR8mB5NSv/+/uBY6jClNl
 aumplSyUpFv+DmJs9OfOXzlppiaWZSm50+NVNmCWmpEun65BRQmF/qgsFaw51Mv3QSwf
 cwiq4GtV0bopYMTHizTcPRarTviwVQzpjhH1O5RxhhzdPvVYvJyXFE/nXaokdqVb90uY
 8G74PBAlzvrH3AqcSRP7CBMz7hokWUQ6YmAHr46FOfPZQJiOpOKYv/9FT6+jGM/RtW9N
 YOIBubB13WVTwYIlKUtA02Az1bV9h+VZqaXV3H/eCmy14sNnPnAPjK+Bmrez7Z3AuPzj
 3YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzekSxk7r2M+F/v0AiDgvjTXBQnuIPdQBLE4FKZ4rcY=;
 b=dUkRXBZdhOfEoDx7QvsyDGx79nv7qYBqpzVUD5NCiUMjj+jkbFzq07XzohjyGXX1y/
 j5QogO+zxpVnVf31A6i6nL4ejAeUE87HAO4RW3O4R6tISu39PbrZPAk9MazIeDHqmWVN
 RQHbXAckwgnkJodNAxG1IfZ8vpf/AzVLmGFh1sMxL+lQqAh8APAcJ88nEqWQcxTbLIUX
 tmB/eDO3m1e8R+SRiribL4HDEpSLW44egAW6U5pE8OrcPAUwI2ztlxc/Fb18S8yFPkeN
 tULgofunnNIJ+Ievq9DYoF07DXaen/7yOeftLnXsH/y0jlAGSZVQCz1tIMd+zSlHH9nx
 6jHQ==
X-Gm-Message-State: APjAAAVHv6T4A64UyuTm6DJ/6Ys9uDI5zWpKEHJJFnwfMnP2CmCaYklo
 o6tgs3VsRNJURh8r5agsw+o=
X-Google-Smtp-Source: APXvYqyua+Lde3zbJ9f7AkAVMKdXWUppEWos3RKcGbqQNVdvlk4+cw6k/TLebKe/z3005IgfRK7+zg==
X-Received: by 2002:a5d:6883:: with SMTP id h3mr12675106wru.215.1553445818635; 
 Sun, 24 Mar 2019 09:43:38 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v16sm19042461wru.76.2019.03.24.09.43.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 09:43:37 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/1] clk: meson: pll: fix rounding and setting a rate that
 matches precisely
Date: Sun, 24 Mar 2019 17:43:27 +0100
Message-Id: <20190324164327.22590-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190324164327.22590-1-martin.blumenstingl@googlemail.com>
References: <20190324164327.22590-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_094343_729237_C2BA65D8 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: sboyd@kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Make meson_clk_pll_is_better() consider a rate that precisely matches
the requested rate to be better than any previous rate (which was
smaller than the current).

Prior to commit 8eed1db1adec6a ("clk: meson: pll: update driver for the
g12a") meson_clk_get_pll_settings() returned early (before calling
meson_clk_pll_is_better()) if the rate from the current iteration
matches the requested rate precisely. After this commit
meson_clk_pll_is_better() is called unconditionally. This requires
meson_clk_pll_is_better() to work with the case where "now == rate".

This fixes a hang during boot on Meson8b / Odroid-C1 for me.

Fixes: 8eed1db1adec6a ("clk: meson: pll: update driver for the g12a")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 41e16dd7272a..7a14ac9b2fec 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -120,7 +120,7 @@ static bool meson_clk_pll_is_better(unsigned long rate,
 			return true;
 	} else {
 		/* Round down */
-		if (now < rate && best < now)
+		if (now <= rate && best < now)
 			return true;
 	}
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
