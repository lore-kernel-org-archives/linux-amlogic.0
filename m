Return-Path: <SRS0=Lu7g=T7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C666C04AB6
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 May 2019 09:32:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC7220665
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 May 2019 09:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MBzIsDCF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eZ5o1iOK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC7220665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oC1MrPkPN9wiASce+2HHl07u0Bah5InVE6+5lLppHbY=; b=MBzIsDCFmIV9kS
	YgA1QVlVgojHzfRBvwo82dq7k8Wv7HDCLumj12caXpkd38pxswR9xoVi83pAz12RCVpfdqbYrResd
	3tRRPZhRdEIIsb3HMoCzVva0sX+r4T8VgincgpkWHVf6VIowPR3kkukmsp+wHZhw0g/IlVlufSCG0
	txmUnSDx0J6GmXZIn0HvwXpkjw0Sz9qBVu9195VZ0JvnLoZ7myBcHBJbIuTUsp6thzoebgggZjTJn
	6XR9lzuo9M158cwYG8NBafykgeZC1jIXyoUbXkuzb9X8MoQjM1pAYX9UeWenMxui3BmBECvV3G/xM
	pel/5MifQJhYhz+G08CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWdta-0000u7-Uj; Fri, 31 May 2019 09:32:18 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWdst-0008Vh-K0
 for linux-amlogic@lists.infradead.org; Fri, 31 May 2019 09:31:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id c2so6027381wrm.8
 for <linux-amlogic@lists.infradead.org>; Fri, 31 May 2019 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oDHxGsrXeJidj701untt/R6ogKG8h4nrtZU+2E4/fDA=;
 b=eZ5o1iOKOmU9ImO+ETCAduVNT36sLs+WQ8dQdJ7NPG7cMC+JkE5CEyy0yxxrR058q6
 cbBygt4YFV4uqu6AS0nSmwion1FztQFXCYEBF9+MKoObTrwoan5UUb38OOjnySOz608H
 lDpvVtjlrDS1dXbS7BbXtH1Xwirui7c9S6ou185LVWF1jSzK+EwSOJ1ukakLdRPFQTg1
 mh5uJbpKwPbcob1V/7wleFI3FxtfoeJ0hKpK/eC3u5a+AL92m3yUyT5CM87zKi80dEuu
 S89IcMPvgiwH93UGEDdkgjFW6Gh+bcs5drh2TC9Awg0CRRLjlM5wPEv18zRKfCd41V72
 5cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oDHxGsrXeJidj701untt/R6ogKG8h4nrtZU+2E4/fDA=;
 b=OAhduOJZtdtl4mCpBJxk+6BmegCL2qMMZMm9HItBdHGbSbEUZA+vreEFcEpzoaNMvI
 LSy3tyLgS/sEJ3UVEfSX3fMSqs0+T6phO/1kvTEjq/GxUdprUKrCPBpKOyiqI1u7MJwb
 SUipkLv4SYZOnA/VgdOlBCT3ggRtSxeD0qdTpWx0Gv79fskN4FPCjM+BuGNr+88ohAc2
 G/Pwu3YKCyO9nMUabU2b0LWyLoMsZY+TKj8GyPutHt65oW+0rNQ0iKU5l97j3yvM0X8M
 F7bNTDhS1PEx2kJg8sTh/vRywrk3o0a1NhCwugIBFkdl9RQkpdBFOuqnoUhK98E76O8t
 nJHA==
X-Gm-Message-State: APjAAAUVDXB5yBviO6NQ0G7Q+0LSzeqofnwYJTxdmgMSFbKQimBvxOue
 HmMlOVaCfuOS3vA2yAu26NNAhg==
X-Google-Smtp-Source: APXvYqy+FDDF8Pib6Y2BDgETFWEQSTK2um06CcN2NmrEMWrfPEWU/qRyDjEDyw2S9zAZ3x0XMomz8A==
X-Received: by 2002:adf:dc0c:: with SMTP id t12mr5813693wri.101.1559295092871; 
 Fri, 31 May 2019 02:31:32 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id b136sm7187023wme.30.2019.05.31.02.31.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 31 May 2019 02:31:32 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v7 2/4] media: videodev2: add V4L2_FMT_FLAG_FIXED_RESOLUTION
Date: Fri, 31 May 2019 11:31:24 +0200
Message-Id: <20190531093126.26956-3-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531093126.26956-1-mjourdan@baylibre.com>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_023135_657387_391690E7 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When a v4l2 driver exposes V4L2_EVENT_SOURCE_CHANGE, some (usually
OUTPUT) formats may not be able to trigger this event.

For instance, MPEG2 on Amlogic hardware does not support resolution
switching on the fly, and a decode session must operate at a set
resolution defined before the decoding start.

Add a enum_fmt format flag to tag those specific formats.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 6 ++++++
 include/uapi/linux/videodev2.h                   | 5 +++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index 822d6730e7d2..b11448a1848b 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -127,6 +127,12 @@ one until ``EINVAL`` is returned.
       - This format is not native to the device but emulated through
 	software (usually libv4l2), where possible try to use a native
 	format instead for better performance.
+    * - ``V4L2_FMT_FLAG_FIXED_RESOLUTION``
+      - 0x0004
+      - Dynamic resolution switching is not supported for this format,
+        even if the event ``V4L2_EVENT_SOURCE_CHANGE`` is supported by
+        the device.
+
 
 
 Return Value
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1050a75fb7ef..9b0a7f82dd92 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -768,8 +768,9 @@ struct v4l2_fmtdesc {
 	__u32		    reserved[4];
 };
 
-#define V4L2_FMT_FLAG_COMPRESSED 0x0001
-#define V4L2_FMT_FLAG_EMULATED   0x0002
+#define V4L2_FMT_FLAG_COMPRESSED	0x0001
+#define V4L2_FMT_FLAG_EMULATED		0x0002
+#define V4L2_FMT_FLAG_FIXED_RESOLUTION	0x0004
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
