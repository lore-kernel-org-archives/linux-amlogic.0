Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FA9C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yyiBF3SkzrosSW0sIpxJOqXu15vwfzJxF81fIhdcz1M=; b=yCJSbzuhWiMrqA
	vfVyY/mUu+UgjyZPHYVaKAHxQTC8TKDgGt6OYCo1SKNgfJaNEDM/I6TDGMOpJQ+ziYllLD8o4bB25
	zuowxurYtiIo+YOLrhg0Fbr0muUHTDa8wtZKcaCghpfvYOFWb6iN1CApznGuudy7yOYwN43i+GrPc
	yf655JghDYGVlcSl4n7mk4fh8moYhQIfX1rswUZ5wnStTz7OHf52Lr0AUElL0PdEuKV/JFms6YD5W
	c7mKXVuTHEm/l96InKKW56jIKC9lRyOh5jnlxO6H/xeIFK89MD5smfQ7u65NwzmPCMVuabyzm5fEw
	+t23bTm/z34ciSSKMaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9bW-0000000BdzG-2GjT;
	Fri, 26 Jun 2026 16:40:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9bT-0000000BdyU-15jJ
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jun 2026 16:40:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4926bd21aa1so8188335e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jun 2026 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492029; x=1783096829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=;
        b=uBD/e5LiE4YVhI0zOgrUiAgETDdvNbrn79RscwnjUQ5YsFzjI3KfHwYVDX4LweR6Fj
         3J4MWMoOJ1D/aFMzoFdSmWPu2XR7+wP1mVSsEedAznpRzMnwKACjQ3eOe/GkuAY/IJiM
         8p/Yeya/a6RmlXQurK6zJvGSkeZPCpqa9hdn0qkjUnwUCffPDDVvyK19KXtFi1pjudvO
         UlIhOdXDfcaVfQGZAgy0V4KfgHgByA+QsTX1J5GVvDqBWiatCbzWWTzOlVZiDX/Wcnj5
         YulcgvnruDwbZL1XRoY7/hBGu1zByxWEUNvvg7PUDNZhefnxJUKzqLFiP5Hji/B7WhkV
         eULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492029; x=1783096829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=;
        b=pKi2Ta1F6U/t1O/8zjcI7iBabrjcm/+WQhzJjw3pT2AeTFfwuIzByn8EPX3AM2V5zR
         W/+xKWtqf8sxzsrbonzog/D4OfR6YuJVVY9vtVlR+nkFn1fJu2wZ3GztGg9IVS8vbknQ
         OKkuXWkTlUN+0dbmkLTqPWIN9fMoJaxKLTGZcTrExQitrX8VNZtGoiED+SfJgv3wrZGV
         Ke6q/Lyr+V2wfSDXaRxhY3qjgm9cn7cZoSA9M3d1Rg9FqTbYdJD/WJsDiAO8QnbjSG/+
         ZBtRh2vrHoue9mCvO4PXWB7zGDHDAi2IFTWbo3+oPasxU9Iix7bkMDx8F2Uo8/AYgIow
         W16A==
X-Forwarded-Encrypted: i=1; AFNElJ/VH0XRUCamTEpDFnP+Ya6AZFq9RQGgnoZZ6XVMttEudk2K4F7CBhPpMRILfNl51EHvatMC0gdF3yuvDmSM@lists.infradead.org
X-Gm-Message-State: AOJu0YyxCamWZeYbSxuePA3YYfHnShHPENBpiR9tOpWPje/ZxIziRyf9
	iUs5q3KgtdVJ9kkpaOr8BkRq/nXLjviwpCa5N6oZhM66rKCpVaUAUS9X+O0jSToYPw0A
X-Gm-Gg: AfdE7cns6uMlmXqbXqI1RaCpXN+ana6eaiLphhAEJgIFgOEv/PlvTSvQI2vZWe3WWDa
	SvufBZW7U8yHgP7TNwgSNXd32tK4arwkCQb6Biy4DSZH8bYbbsuIUYSPks8bwYSzRnkOVFO0Qcl
	gmdexl0iKQuTp0Rg5NaC4jRAc6AZqbiAD+CDK6HUAjdzK8/qcwF2igeGmA8rH8QDljv2bHMkH3m
	LNams2ucPyANbha/DKTfIYXNpncRx838IJmP884XJlrpttb7hL/3keHEdri3cK5Hr0c+S6d/K3K
	OpEj7bZT0X3zqa2aBqJXL9Q4uLsuR0P26O/jbITb2pBnf5RUL17rpLUytKNAh2yXthCWc5ZESMj
	IXSnjx6L4G6R6YnbsZ8c7LHfUb4G0d6b+tpdgO35LlAaoHNjRTxIJpRKx0IYdguLDbdL6q817LQ
	kJtTFnjuuboDroqR9BaVa/IwmF7ixG6cmJBzbhX6VJS37mMamHlQ545EoKvE6NgWCHqTCSyV31y
	oRboItM4iCvJylajKblv50ZCg39NGckGMY=
X-Received: by 2002:a05:600c:8109:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-492667ca5fbmr116117235e9.0.1782492028118;
        Fri, 26 Jun 2026 09:40:28 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926f94f213sm30866825e9.12.2026.06.26.09.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:27 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH] media: meson: vdec: fix use-after-free of prev_frame in codec_vp9_rm_noshow_frame()
Date: Fri, 26 Jun 2026 18:40:25 +0200
Message-ID: <20260626164025.52694-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_094031_351431_BCFCAF14 
X-CRM114-Status: GOOD (  10.06  )
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

codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
ref_frames_list without excluding vp9->prev_frame. When the previously
decoded frame was a non-show (alt-ref) frame and the current frame is a
non-show inter frame, the freed object is the one vp9->prev_frame still
points to; codec_vp9_set_mpred_mv() then dereferences the stale pointer
(use_prev_frame_mvs and codec_vp9_get_frame_mv_paddr()), a use-after-free.

The sibling cleanup codec_vp9_show_frame() already guards this pointer
(tmp == vp9->prev_frame); rm_noshow_frame() simply omits the same check.
Add it.

The fields that drive this path (show_frame, frame_type, intra_only) are
parsed from the VP9 bitstream, so a crafted stream fed to the stateless
decoder can trigger the free-then-use.

Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84..572f418c9 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1247,6 +1247,15 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 		if (tmp->show)
 			continue;
 
+		/*
+		 * prev_frame is still referenced by the MV predictor in
+		 * codec_vp9_set_mpred_mv(); the sibling codec_vp9_show_frame()
+		 * already excludes it before freeing. Do the same here to avoid
+		 * a use-after-free of vp9->prev_frame.
+		 */
+		if (tmp == vp9->prev_frame)
+			continue;
+
 		pr_debug("rm noshow: %u\n", tmp->index);
 		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
 		list_del(&tmp->list);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
