Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E725C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 16:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yt4gT3sYO6ZwQzLLR+OCWczWpPkK+3m0IeIy9M6wOvI=; b=mwyGakA4pEWKX+
	caFYa4dJh/aRBaOQ9DeEi58vXoJqs9TsV9ZwwOjLqAGYpe4geYewrnQrXP9TIOWsFVfuuwdqTVF8e
	nF3ojyMf1Hzs7BSuaxI7iGs5a31mhFd2isUhr0yoFdo4P1vM8WKcjzc4G8CuG5ghp9ZZmKhfWD3ZX
	L0/mVH1rELK0AGLSEFOt0o4teClxTcu/fql/JXVXdKp+oPHizib1qGfAvLUC6klqbm3FBNsoRx+kN
	U2jSrkXR16lKzlfzcAWd+dtkAiIRDGqW5nwA4jPwdxWZXdtcb7N07POeJCUqaFTTU/QTCSsLzs0G/
	qEO2QER/rrkGvfp2W4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms5kE-0066kS-3B; Tue, 30 Nov 2021 16:12:38 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms5kA-0066ib-84
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 16:12:35 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3S0v51kXz9wVG9
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 16:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJKXmOQ97shP for <linux-amlogic@lists.infradead.org>;
 Tue, 30 Nov 2021 10:12:31 -0600 (CST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3S0v2y2Cz9wVG3
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 10:12:31 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3S0v2y2Cz9wVG3
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3S0v2y2Cz9wVG3
Received: by mail-pj1-f72.google.com with SMTP id
 x1-20020a17090a294100b001a6e7ba6b4eso10071491pjf.9
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+InRof0/uIdyh184kbNfYTG/vjRoi2ITuATxWqrIaCg=;
 b=QQFpZIXv7DEivrF4SMIk84Xm86N1CjjIpvc3cSlX1cmd9Sy8GbGFq63zL0k5PKJa7i
 bIy7HFYuOq4jGsE4d4RTL4AxAt94zHyzsAjCw35b/P0HQ3vEJmrPcyPSxJRpH7d86KRS
 cu71acBcYj4CJebZkc2z1XlMBRaARx9RlgIlaA14r23AloLlHYesN/0Hdr7EAaieLnBr
 6GfBi4W0uurDwOAhtRKeMvYzmsyocF5Nn923hEE5t5ldSiT38+pR0WEDDTBdDUSSAs43
 s4J9TuzlbvUd7iuwKIOVUeuLVEdepQQyQJKJjvUjghseEyj0mXcL9z6BaHLeGZS3MIf6
 31OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+InRof0/uIdyh184kbNfYTG/vjRoi2ITuATxWqrIaCg=;
 b=kbrzT4ZZYFJQinrGjXjDQTN9CPe6sJgKEbyZ0sSorMIvdz8jRAaK5aqv+XThpSfc7f
 zaEBv0dR7PYzpD8JIfVb4CCnpAm6IrKIfBuJZJo1UULBTYDhrbcXZo/RL6h8sevOgobT
 QtTD1DebRZoWfsL/f7Ch6Y9+D4rU8S1XS7nIokKJ7+rJDsdfkkwVasdDFQoupfris3UZ
 EFBPxkICK410S/uhOVz9MA64WCRm/Y31FvGJTMEdlE8hn5uGaxBiUz9P9vScS16DsktM
 jchrKM3bqutE8gEub2JhJ3dJoFY/iLenwRv9oupknPJEw45UWFOB47tg/3RajH7Gq193
 xKSw==
X-Gm-Message-State: AOAM531LYarpLoLnVt8SmK7rrFugp5Gp+Ok+nQ67k2+EkHcY5wydAydu
 Zo7I0dpTHH01BY7c8SJc4uG7lR5XniDtqmAq/PZwqMwN4HEc7LSe2Qe0vmYfPDr+mBWC859g10G
 +r25EXCdtxoLRtpLYdWLwoDqJD19BPW7Ub/g=
X-Received: by 2002:a05:6a00:24d2:b0:49f:bbce:7bc1 with SMTP id
 d18-20020a056a0024d200b0049fbbce7bc1mr155710pfv.37.1638288750630; 
 Tue, 30 Nov 2021 08:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+GKwKQHK7uXFjfxjVBqjeb+jOkdeK3mPEahrfjDgFy1kG8HcnLoSHVfN3RaX0GqrIAbyeRQ==
X-Received: by 2002:a05:6a00:24d2:b0:49f:bbce:7bc1 with SMTP id
 d18-20020a056a0024d200b0049fbbce7bc1mr155680pfv.37.1638288750395; 
 Tue, 30 Nov 2021 08:12:30 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id lx15sm3380968pjb.44.2021.11.30.08.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 08:12:30 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Maxime Jourdan <mjourdan@baylibre.com>, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: Fix a NULL pointer dereference in
 amvdec_add_ts()
Date: Wed,  1 Dec 2021 00:12:23 +0800
Message-Id: <20211130161224.181519-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_081234_419509_E0E14A2F 
X-CRM114-Status: GOOD (  15.06  )
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

In amvdec_add_ts(), there is a dereference of kzalloc(), which could lead
to a NULL pointer dereference on failure of kzalloc().

I fix this bug by adding a NULL check of new_ts.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_VIDEO_MESON_VDEC=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index b9125c295d1d..41297c2f8f9a 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -234,6 +234,11 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
 	unsigned long flags;
 
 	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
+	if (!new_ts) {
+		dev_err(sess->core->dev_dec,
+			"No enough memory in %s\n", __func__);
+		return;
+	}
 	new_ts->ts = ts;
 	new_ts->tc = tc;
 	new_ts->offset = offset;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
