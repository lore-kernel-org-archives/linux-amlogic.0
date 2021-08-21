Return-Path: <SRS0=c7rh=NM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A5FC4338F
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Aug 2021 03:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAFBB6113E
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Aug 2021 03:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAFBB6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0D2VTLUumv9NmuMaQvBNGdyUiq9OQgI31uj9oecWOEI=; b=CoHqFGJg3YIoIc
	HLNg6KwHW+f0IZudvKDmUwqVD7f3+iCsyBnlypN4RNoSTIGTS/5l9zwOkGxtBiP0O/F7jGsv+WeiY
	gGbwah1ctKuULPtdrDSC9ZG9W59t8QMm656l3r0Z6HikzisrsKLSiMOo9weonvjXboj7TzLDPKn6u
	+w6oXUkb3eYboY7r+E4nks6RRnTojZ0l4N2fG5JjNg0sdUMiCkBwcUAXxiFOQ3KW07rSwd+Zjmm1Y
	5qZ4wWEZdEM4RjpkCyi8V1bhuQOjnu91ImwjFoBvs/Az9YKOq/XitNYJ+/R+7636/z1ZmuTTPXcyK
	Ayce9Q32+iRzaUNK+Rfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHI24-00CQRC-P7; Sat, 21 Aug 2021 03:50:56 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHI1r-00CQPs-3m; Sat, 21 Aug 2021 03:50:45 +0000
Received: by mail-qt1-x834.google.com with SMTP id u21so6173361qtw.8;
 Fri, 20 Aug 2021 20:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qJEeSvfeYR4GpQzmxAjuhDRVR/g1i3gAXvBM9dIcHY=;
 b=fPnRf6Ok2ou/v0WrM3AraBvPxv4tq0xxdh6lKZEGrhOlrdOXJtzQg9eTl00ccZAKMy
 YYYmws/mzSI8V0HNS2Ph6WpzrTBrdPK09ODNnNELJuoR1P8pQPhX1lVlnxfqghEoaVIm
 zxnJ3XlD7QfHXblmH+rYJ+2pzKTeNpmsGLiF+DYkA5ssYeHI51oPPbRjO/No+Gifbcx5
 ghtg8n0GaFuanJCNCs+nkwr3qrt788l8fPbcF53YFrCTFElfdbk5GnEsLyvFqR7UHo3N
 rPUQFoSEOILeJdrIlW7OqINVAv1Cnruc+vy4fzDgNUaTL2W5npFFpUBDnlIx53/+KEgD
 GCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qJEeSvfeYR4GpQzmxAjuhDRVR/g1i3gAXvBM9dIcHY=;
 b=LsnEy5gqgU1sQDveDmavy4PMnPcgBCjxFyS20TczjDvH60mY73vUsoYQX8Ext+DFeb
 5GafzHn3lSoenV56/HRh/Ok8zpXwkqU5+bpK0iO6n7lsHgEdZ7CiTkAOuTugNl0VcfWy
 kB16Y3OvietONatnMDwgH+FPPg0N4RPvxWSjQu7Donz8XJRHjEsdySDGVJ4smTlMV6vQ
 7uxOzRlp/1l+B63B+8WTAbX+yNksWGNjGLCXRqeYZ9ODHHiYCjyT5Ko5ZpV/f3lArzJF
 qntwxKqgcSdkhB8q//2Dx/edjbwH1AXawHqMWsIDbLoJDWQ1pm9i4AnmHQNv2vZlEtDI
 nCYA==
X-Gm-Message-State: AOAM531fjSe4GDoxReiIKdfLQ1gopBpo2vbtlCP9tX8Li8KHLngXXeLJ
 wNeChuzTR7GO4qaRWUV/9DRcqgAik8o=
X-Google-Smtp-Source: ABdhPJz8E0hCoCre+vuDt2dUQ81tAwcPRbcOHkTt63jkFmjvjnjYIEJw2Q1P4KyojF3fwBZLZBW64Q==
X-Received: by 2002:ac8:5744:: with SMTP id 4mr21136410qtx.326.1629517841270; 
 Fri, 20 Aug 2021 20:50:41 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id f2sm3366249qth.11.2021.08.20.20.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 20:50:41 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <jing.yangyang@zte.com.cn>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jing yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] media:meson-ir-tx: fix platform_no_drv_owner.cocci
 warnings
Date: Fri, 20 Aug 2021 20:50:33 -0700
Message-Id: <20210821035033.28210-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_205043_183342_CB2C17F9 
X-CRM114-Status: GOOD (  11.54  )
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

From: jing yangyang <jing.yangyang@zte.com.cn>

./drivers/media/rc/meson-ir-tx.c:398:3-8: No need to set .owner here. The core will do it.

Remove .owner field if calls are used which set it automatically

Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/media/rc/meson-ir-tx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index 3055f8e..c22cd26 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -395,7 +395,6 @@ static int meson_irtx_remove(struct platform_device *pdev)
 	.remove = meson_irtx_remove,
 	.driver = {
 		.name = DRIVER_NAME,
-		.owner  = THIS_MODULE,
 		.of_match_table = meson_irtx_dt_match,
 	},
 };
-- 
1.8.3.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
