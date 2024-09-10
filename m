Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EFCECE564
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 14:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fb2Vyuc2mPRC21ttWTRBy9QJKz2DFMT77UJpcten8D8=; b=BpYOVP5NKmzEDc
	DdSOkV7dxtdOo8mug5ppTqkThplm5xSHYvjTUHUYbAwtzFyu2qiTtg5DYv3gHrZfEDix1KpIwPnbj
	u92HHo5vntEegZsOVSQHZSpHMqQzdUpOVWFJQGGRxXJ1Qc3PWUauLBrX0ZIcmIhdj8W1WWTDPS4D8
	d+Hnfg5LzFRYIuU+LNRcflOJUzx+rBbZQKt5HCwue9loPoRZpe5mECz8XtJ15yyqt/Nj/INvM5+7g
	MRPjvMeuqciOV7oXGRyNd26rDW+xDbHIU2sKs1UROcWrhbtYqwesDuVZ9f80jwGdV5v47D74JVvSB
	X8f6lSkteMPgVTaDBbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so1e3-00000005pZB-20Ws;
	Tue, 10 Sep 2024 14:15:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so1e0-00000005pXR-3uDy
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 14:15:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-371ba7e46easo712901f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725977698; x=1726582498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipLhOTJtHUyuJIWlpsyJ8y0oPviYNV+bTe6DZxzKTYA=;
        b=eucGR2WcIMZnPInzHZsJl+UtD7Z0+7+b6ykIhUiGL37mjDpJmrxHJGet6hJ0MUT9Np
         x/TH0p89oQhhERPUWAk7860YE3P1W9PFlQZeSUdTFclP3HoyUve4i3RLalpwo0flaTm+
         H8M0Rua89baVSZvZ0E238I1wJPmOJt6uWf2uXU9gqHFLryU9NZ9G+/bhNxq+9C4etFnV
         1nMAndmpSrFiGiycHqwVXrKYVA84tXRby/CQohrXbuqSZNhSJkw0M7TZqmC+KfbsjWV/
         qn1qhcPCC7ozU2GRmHIbT7JXHj4zICMewz58/73eh2LgF1OjlWnRNzauHHBkuWPUbeT1
         QdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725977698; x=1726582498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipLhOTJtHUyuJIWlpsyJ8y0oPviYNV+bTe6DZxzKTYA=;
        b=bsSlI0wWv22GQd7I4ZnSO3uUC5ct8elP4W888wdasSDFZwHyv2CtxuQeFjCR28DZ9N
         CaLU8lBaWLzQj+EZXaLd6cjyRZ3JGVrJW8tDhwhicdHwbPwMbq4UIobceWTepeqOE1Ed
         /8jzWGw9SGGxx7mDmKIiEiUtXZ5WE3KLRQ9hdOJ13p5BqqyUC46CdvUBF8jxEN2QhJXp
         hGYgLxvhJgivnBZQgqjNX4dJexk9jJxjEA/BX4h17Zg2Mfek3sN94w8shLUF17YP6kKz
         m68v3sJtVtPJ5n4QyLIzmpe56RmRRgY7MCsJn8JZErPbgTxdwDOz2L+i0lmuJfXJu7WX
         2fSg==
X-Gm-Message-State: AOJu0Yzgav2/7Lrohb3FtCqH8jQW6PWm/wj+60+Bv9RGgPEF7HYfrQes
	XT7yfTjc0Md64PyxL5Amgq7CyW7isLDpbKBLqNtebAl0nzWXtHTn447ByOav
X-Google-Smtp-Source: AGHT+IHc2RzP9yjCWhG3AZEvf4pBNTexT4KVavPkeJB8kTEbgQLelrklT1zWOR/jt5r2FKXvFHBcpg==
X-Received: by 2002:adf:e602:0:b0:371:8c75:a085 with SMTP id ffacd0b85a97d-378896b6c88mr8939239f8f.58.1725977697808;
        Tue, 10 Sep 2024 07:14:57 -0700 (PDT)
Received: from voyager.localdomain (178-118-65-79.access.telenet.be. [178.118.65.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d372dsm9070877f8f.73.2024.09.10.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:14:57 -0700 (PDT)
From: Theo Debrouwere <theo.debrouwere@gmail.com>
X-Google-Original-From: Theo Debrouwere <theo.debrouwere@faytech.de>
Received: from tdebrouw by voyager.localdomain with local (Exim 4.97)
	(envelope-from <theo.debrouwere@gmail.com>)
	id 1so1dw-000000008oH-3Zz2;
	Tue, 10 Sep 2024 16:14:56 +0200
To: linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: add additional S905D3 entry
Date: Tue, 10 Sep 2024 16:14:53 +0200
Message-ID: <20240910141453.33854-1-theo.debrouwere@faytech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_071501_003076_6F106F2D 
X-CRM114-Status: UNSURE (   8.60  )
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

Add additional S905D3 entry.

Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 7549f1644e5e..f61cfc3c11ed 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -80,6 +80,7 @@ static const struct meson_gx_package_id {
 	{ "S905X3", 0x2b, 0x5, 0xf5 },
 	{ "S905X3", 0x2b, 0x10, 0x3f },
 	{ "S905D3", 0x2b, 0x30, 0x3f },
+	{ "S905D3", 0x2b, 0x40, 0xff },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
 	{ "S805X2", 0x37, 0x2, 0xf },
 	{ "C308L", 0x3d, 0x1, 0xf },
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
