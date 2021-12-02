Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0995AC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Dec 2021 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2w1YFOMSaoICBSjKJLpNTyS2Fb1uKG0vFD4PzBr2sE=; b=AZmS1VuUKKXOYq
	svtcBVcvRu4gJN1e3nRGWrVn6MFIwQzQ7snKqJNzFirLhaUFlzVHxHYlEzuZihpUs1EGTtLPls1OF
	pvjNhA1igHuliMyE5nD5r/ttsznkQUPqmYhG4l61V03DV/IX3ANe/ieimhDQJLlARXfZkLRTK5a9G
	O0SWkMYYdu220qLYXqXpKbpYMY4UB0W/KfVA/a1fuQnnIiB9v8A/54//GSXL8UOGMJQ3wvfXadqel
	e0d+G97iraZ/QqrEL/Pw9CzjdJMClI/tELD1t3u6WWkG6VSJvKFTC0p2GUHYH0MzGnZgLIoNJH2gK
	mgtb/NfXK9Ht1fHaSZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msoZf-00CvpX-LO; Thu, 02 Dec 2021 16:04:43 +0000
Received: from mta-p7.oit.umn.edu ([134.84.196.207])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msoZc-00CvnI-70
 for linux-amlogic@lists.infradead.org; Thu, 02 Dec 2021 16:04:42 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J4gkt6t0Wz9wbFn
 for <linux-amlogic@lists.infradead.org>; Thu,  2 Dec 2021 16:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtM-ktJ6i_LO for <linux-amlogic@lists.infradead.org>;
 Thu,  2 Dec 2021 10:04:38 -0600 (CST)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J4gkt4vJzz9wbFr
 for <linux-amlogic@lists.infradead.org>; Thu,  2 Dec 2021 10:04:37 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J4gkt4vJzz9wbFr
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J4gkt4vJzz9wbFr
Received: by mail-pf1-f200.google.com with SMTP id
 4-20020a621604000000b004a4ab765028so17692068pfw.13
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Dec 2021 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSFdJHmjZmGwK0hgeK/BuhdxfmOuNZpb1fLDoMSMoIA=;
 b=L7C0+RHzWtzjba9VBc3MozgNXqhPdafl2LWHWHVzAggMUfoWrZALHvx2I8tzb0mZJD
 uH27GBysDh6p8PYn+9IbSvpazYZDH5AnsPUyf5xseBrxm9ERd/u65z+8bOekTU8dXr35
 JVg25OtUunTatma0lA9H+Xz93wlAOGSbUduvHPMHz81iMY9vlsYWZpSPxd6CHG0tZwu3
 D6iAWEhHB2C0HOC5Iflfa6sPTLscRTvsfwSfjXaWH3EzHspoFClknTsEXh0yU/ppbJ+V
 dXo1B0bKaNRS5+Wj/fNKp6HPZJ4+RcKEEs4vmzmouvuVv/EMH8fzet07v9ElecC6ZQF8
 ObVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSFdJHmjZmGwK0hgeK/BuhdxfmOuNZpb1fLDoMSMoIA=;
 b=h32n1pxMs+YFErcTak/Ylnxt/NKT6KvZMn94NU0fAF1widbDrVfmmr7bJlyqBkAoo9
 wKXYBO7MoH2XgeCAIU3SLgL3PuN4LCTzkWHZWlwktrthBTyqyvnGKp42fduE63bKUTwh
 6xLsQDDyxEC1egd/F7UXDKz4dgCg3i3u/MISQwTLGkN0f2/gf8heGC3hK20vVxlkCkv2
 cg7Zn4xyaCcoaHxsRvEpDv+rY6ezBYbNtOj4s84cUZbXOd+NZaf5EsJ7OgBQjaeQO3vQ
 HpTDCDj8RChRAbd3vEQpJIar3W0XU5GnJ2dZ32wB7AQ91IKMeKBT6Gal9Y9/qld991v/
 O0fw==
X-Gm-Message-State: AOAM532JJ34ynFf06xNYXW1k6tm70DKVWTVXmHpcGReWrTjLFdCoHMI/
 2PEtaKgB5GWwpoar5XaC9Xcy2lEhEsJxnCvi7yTtbTyTPRMcxMheMG1SaTA8wTP8jyDTiAwV72o
 QOl2I4m5qpXgQk2p6dq9nDVBXxYOyQaVJls8=
X-Received: by 2002:a63:1754:: with SMTP id 20mr24007pgx.559.1638461077031;
 Thu, 02 Dec 2021 08:04:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWtFMeKAwpw/3fOXWwvMLF/51H2uFNuH5A00e7CrM7Jjwcdxc5Efn+9134CUiC/P7QgYHbNw==
X-Received: by 2002:a63:1754:: with SMTP id 20mr23947pgx.559.1638461076514;
 Thu, 02 Dec 2021 08:04:36 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.93.212])
 by smtp.gmail.com with ESMTPSA id a22sm236765pfh.111.2021.12.02.08.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:04:36 -0800 (PST)
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
Subject: [PATCH v2] media: meson: vdec: Fix a NULL pointer dereference in
 amvdec_add_ts()
Date: Fri,  3 Dec 2021 00:03:57 +0800
Message-Id: <20211202160357.75173-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201084108.GE9522@kadam>
References: <20211201084108.GE9522@kadam>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_080440_368315_10FB221B 
X-CRM114-Status: GOOD (  15.84  )
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
Changes in v2:
  -  Delete dev_err() message

 drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index b9125c295d1d..ac60514c475b 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -234,6 +234,9 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
 	unsigned long flags;
 
 	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
+	if (!new_ts)
+		return;
+
 	new_ts->ts = ts;
 	new_ts->tc = tc;
 	new_ts->offset = offset;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
