Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD033CDE001
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 06:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mVpbWm0x5q12VPFJNE7urZLBcZJQOTzG7QWRyA7KZZU=; b=vXkUM8rNzxUTDL
	V2RxKfhGow++4GlJCWZj61zyFuMAloYt1IbV5GZDkyQXEVM1SX4JHzq/J6c4fpcg/49HVBXp4BeI7
	qSmcN6ktVh7y5GvHiXdHVf/FLOhkYsqU0hTS/1VmU0PNSda5MLArS68X9Wv5FDGA5SKezS1znHsc6
	iP4ldUBN+DDKt2Xon9gLdPIUg7USC0uv0Gf+Q0s7slKpoQwmEbpD+bu3jxFwaf5/HGke0IL8QLKo4
	dYja+M41+GdPRSW4jQiaOiEVcZ0Lk1BxEF0nqZybpQ2EHU++LoXIm4YgA812aL9Bo09JMu7X/ay00
	q+xV7JDpBqSkFx+6yWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHYz-00000007GHv-0cV7;
	Wed, 24 Jun 2026 06:58:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHYu-00000007GGt-44V7
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 06:58:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso6637905e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jun 2026 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782284294; x=1782889094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=;
        b=ctVUHL9TuBRdYy+RplqmPsPT2gSQG/mT3EFH4blmkNuzCPCz928KM25l07c1GzmFKE
         lYci9+th6f6L//wFxkO5vXU8D8coa0imNeyG7DYcWysq0MXVUiQMiHbIfAvQK7tSrtUh
         12RVWgk4wOMdqsutKl3JFp9Gactrfi9pL6TEImPXXPatjsy4awE5lSuzFfrUcf+jmlCE
         Jk2MCMBHQNTcL2UlEEpsJSKSGI+Y55As4WxEvXJkheippQjw7oZxDVsaADK2pL6SV9y6
         mcqFj0lKgkeGaxuPJu8GAxXKBhmkVRHfazMCSpIqMD17TO/zeMpQ4o624f8CrPS24TqO
         7Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284294; x=1782889094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=;
        b=jiZ/4/OMSaRNOomqIqJjfos2hOHmrD8w28NvKS7BIWXy/RumE9K6P/0/+1oyF9RNuM
         YkuBJmVCbcRCEXjVdeDGrtbfSzECP70yycTgDcgUnFyz4pSJAcBFG/m8K9UeBSZAB8m1
         BTnj5I6IQRZ1L88cexj2YGJppeWluASv4xKGY4SazsWvJUaUb4qSmcVyI3ly7HvehRx/
         MZXBzlm/hh/5+ZEH5z9vEK0CRq5jIQGIlLJN58Tj7LpI8l4oqlZ/UlOhUuQXSbD6ZWKE
         aQVgioZwHwZDJ0XCCr42uMfsI38F8Vf1vmANe6WYQZbUngK9XzqVALXwsCAOsL9YDguf
         2mBw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZMpqGXJFYL8HLDLONajDghS1qjZWDhdFOeL9I68x+1iCnMkHh3s2OYZkN7u7NYU6TqCv8qgrbtQr3+Vme@lists.infradead.org
X-Gm-Message-State: AOJu0YxtZWAZ2EdA9aRJ9PMccndazQxUj2deI7T0XAuPnuuuHXrUaMbp
	cgqW15sHezJkXJRMVYSlyU0domPgHaev0dpYCDzelVL9kbdBnW/2I7br
X-Gm-Gg: AfdE7cmTL+8vcXEy6+fP1EukvA1l24ckoy/ctY1yFSi6zf1QC3Ph8vKYO3scbMRsdBK
	z/mfNnHGxJOGXGR+VxotruXCeb12uiAtaZ3Z1me8AY9xqDM5Qs+LEIZPu1IXUlULQmejY+LUeJ1
	+SGNIJcwBdlQhSE9KSDCflFFyTtXz6fXDPjLOaPeyeINXAGfsQruQco03k5LnhcoO1cOwwUWWEf
	VLaVDt9/D9m1rfZAsThGXQZVtBeN+1aO5Q4mZZMWPYrI5/GKKoX0u6snta9y5iS7nikjri9GfEH
	05TcFwOnMJdos5Tfzt89UurysHrsGa8gVDEEEfHfG2AuCgUpnS7oE8wykRGCAvKBcrYEdFvL4PE
	ac0L6N1aL4uBt7CM9ywUeJpHN49BWreL36srTdIhGeCLTFuRFLoAOYXh7MyWIUgYKS2YsOZapPg
	n5BQ4FGXG1i3u3u0Zj
X-Received: by 2002:a05:600c:a49:b0:492:4b68:c80b with SMTP id 5b1f17b1804b1-4926084aac6mr23722445e9.1.1782284293970;
        Tue, 23 Jun 2026 23:58:13 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49260d77e8asm20013925e9.1.2026.06.23.23.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:58:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common
Date: Wed, 24 Jun 2026 06:58:08 +0000
Message-ID: <20260624065809.2460720-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_235817_045190_50909D36 
X-CRM114-Status: GOOD (  12.77  )
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

When VIDIOC_TRY_FMT is called with an unsupported pixel format on the
OUTPUT queue, vdec_try_fmt_common() falls back to V4L2_PIX_FMT_MPEG2.
However, if a distro has locally patched MPEG2 support out (as it has
been broken for some time) the platform format table does not contain
MPEG2 so find_format() returns NULL and the subsequent dereference of
fmt_out->max_width triggers a NULL pointer dereference.

Fix this by falling back to the first format in the platform's format
array instead of hardcoding V4L2_PIX_FMT_MPEG2. This is always valid
since every platform defines at least one format.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

---
This fixes use of v4l2-ctl and v4l2-compliance tools when MPEG2 support
has been disabled via vdec_platform.c - NB: although this is a fix it's
also a rather niche scenario so there's no need to backport it to older
stable kernels.

 drivers/staging/media/meson/vdec/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..f3e7072f221a 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -504,8 +504,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt_out = find_format(fmts, size, pixmp->pixelformat);
 		if (!fmt_out) {
-			pixmp->pixelformat = V4L2_PIX_FMT_MPEG2;
-			fmt_out = find_format(fmts, size, pixmp->pixelformat);
+			pixmp->pixelformat = fmts[0].pixfmt;
+			fmt_out = &fmts[0];
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
