Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C066C7619A
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKWkZWkoLbG8roL0M2567NJTanAaI06g8ForMAUpqno=; b=qgTEm3V/ndAwMb
	m8Yehpyb6pqNQLUaauqaYj5sIvjBbR0Z8NEd7eJlnJF04Gqgwz3g/f0Gwv0/a2j0mMNYcyuGnI37c
	1G2LtAJWYGZQKKC8AMHeZc9JWKm5AtP2/RTtMOYDeeTmi/pEtPUN31HT03vGDFo/oxcqzd0N+2Q8e
	71EOe/DyxgZZMhHpWdb8gUWFoEN0NZVVcqsxHYwBEUa/EmTGDCE3UCFoH4Uq1XvPfiepTkTqjPwgb
	l5cnISD3cmC/raT4h+S6odshjcUkbqGOxJVDxoc48s/kX2axhzL3c9xM0r5SwIY9TrDYztFFtR5ty
	FzhYXXNwz2foQmnLTl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLyu-002Bc5-2P;
	Thu, 23 Mar 2023 14:31:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLyq-002BaX-0G
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 14:31:55 +0000
Received: by mail-wr1-x430.google.com with SMTP id h17so20726717wrt.8
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fGAEjxZmqcGuM4G0te+O7Csnup82dwOapD74BskWR4=;
        b=NRSe22DVQcO6b72zczibgxC2aepUoBRjH16G2n6mGCIr3YIPPsJq9lyL/FDkcf9TSH
         5NKbyg7Or+CII/ufiiz89kqGwwhnOp9JDHdEB7Fv/Nq4IUxDIqagE6sWEAAOSlBQGwoH
         DMUiAU5mFu39meM8M0bxuB3ddlJ8bSYFfaJgzg2f+i4TQfGDgtcojCEtsxwyYydyUNQk
         N0uwInXJxH4agUwHCyrNiY81OFx//WI5SF+vLveOwHPG1Enuc6/h+DBxh10pJN9XBkGJ
         O95RYBlGTrQdJVQBu99Io1rTRxSkuQPxpvBdP4bxc9U5KjX6UGHEOoOZ0gUVQtf4oLB4
         +HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fGAEjxZmqcGuM4G0te+O7Csnup82dwOapD74BskWR4=;
        b=ebnaCPWznDkIrkAqBG6h4euUzGzw53nAE29DBtl1k5paz2wMyUazw8RpWbzDABdSRo
         Kt+EIthL8yPRuEoru7npk3aOdDEwRPA0HwxvsuMiOXyPn6MuPFiLnroov5R0WLYgBjkc
         dXi+/kNoJAb5r6IzxDIjXg4wijmtLJxpMt/8NhOlAR0gsMutG4rU7I3xYNVs1zOtv8NV
         cGtNKA+NYRTZ8ThPnsBXZotn9pV0yPsf8DsQPRoUfWe/NHUhcrCWj2/uT04Vc1mgg9xq
         XZhoQE5IyotK6cQs3vq4mZmDhEtuDzBENJrgwmXK0NlT1b3BE2yFQhMk77g86uuwiQsi
         w3jw==
X-Gm-Message-State: AAQBX9cZA9jin6epJlgbw1urK9QGa/05SK3mRiouRHzf5kbIu9VpjCUU
	ij5CMsa8N7+VLE1YQtsxr5c=
X-Google-Smtp-Source: AKy350bw/Re2QpcinD2iSuJOEu0iJPnAZp6HS4o1LTizTEER0WsQfNsD4Ig4ccW8SwSL7Ezr/YvSBQ==
X-Received: by 2002:a5d:608f:0:b0:2d0:cf21:a40e with SMTP id w15-20020a5d608f000000b002d0cf21a40emr2599973wrt.30.1679581908245;
        Thu, 23 Mar 2023 07:31:48 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm16311242wrx.116.2023.03.23.07.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:31:47 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 01/14] docs: boards: amlogic: add bananapi-m5 to u200 maintainer file
Date: Thu, 23 Mar 2023 14:31:29 +0000
Message-Id: <20230323143142.780306-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323143142.780306-1-christianshewitt@gmail.com>
References: <20230323143142.780306-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_073152_136541_3003662F 
X-CRM114-Status: UNSURE (   7.71  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The bananapi-m5 docs are missing from the file, so add them.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 board/amlogic/u200/MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/amlogic/u200/MAINTAINERS b/board/amlogic/u200/MAINTAINERS
index 47cec234a1..919e349922 100644
--- a/board/amlogic/u200/MAINTAINERS
+++ b/board/amlogic/u200/MAINTAINERS
@@ -7,4 +7,5 @@ F:	configs/u200_defconfig
 F:	configs/bananapi-m5_defconfig
 F:	configs/radxa-zero_defconfig
 F:	doc/board/amlogic/u200.rst
+F:	doc/board/amlogic/bananapi-m5.rst
 F:	doc/board/amlogic/radxa-zero.rst
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
