Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8079C43211
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 06:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzCIW/kkJIv8KiFmAExnwnLe00qkBO28cFu0c7JqXsI=; b=jDpN1FoagntacP
	byVBvpqevFTJG1b3Twkn77XKdxrBwFfFqIhe6v61L2L72PcyX//QbvvQyL8PfVu3BouY9U6O5xPkq
	1/XAgT/iSgivGRB8nTDxXNAU8/lm3JXRip9beFgXRFgJ52vCL+kNkh3/4uzwgdTIN2ar4pmjWvnWr
	FPDqKWm98u8mCP3EnvGRrSuHhXLAnateNOEiMyd6DR/eLlgcO0IabG+fN6Zxd9PbQ5urQhrn0acAp
	gefGj5ZVPs5Yj+BFWN+DQraHmtF+g0VN6PRcgnI3/QVVFusqoQZz2gZ5UE5ymZLIP2biBqM2UbpfT
	/n2tPEm+sxYEULT7VPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMx8-0000000CENf-3D44;
	Sat, 27 Jun 2026 06:55:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMx3-0000000CEJK-1nWP
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 06:55:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-46f34d8f888so1359932f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jun 2026 23:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543339; x=1783148139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI0+mugrNh7ILt3xdXuUk2twFjJ58HUZZs7uu1IE4s8=;
        b=p6J5Akk9lNWL5Bq3+Qtd8pjgpV8Q4Etxs9LftdSHdlsFguWVOePPWj/l+RXzZc1oDM
         zHnpKPUmUQX2PoAncwFi6VQVwZ9J50lvBD9/9QUbbsh1UaEC1DAgruaKJlfVU1Xp1Psx
         DaJO2Ned9fqrTXIiXywWGiTUNiYUx9sunBLqQUq6aPFWxSZi2ggLvF54GFw53XVPF4kY
         PibA0j5ibglVKfcyziVcFrKOzWAdwPqmVt5UE30q+FB+Wk6NPAwB5pATaV828+Hn/UmF
         3CmYwsR/6zN1BAUKdw5PYiRBEFbwuRPfAvXmP778x865kIPWr79aQNoqtIFxRDhYeO4F
         Wrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543339; x=1783148139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CI0+mugrNh7ILt3xdXuUk2twFjJ58HUZZs7uu1IE4s8=;
        b=LtRjpakrI0Hlm5HziE5wLyts3e1oGYPgC8cajq20sgTteVOcXx1f3PSvTx3gubeCQX
         i0CdcIM5TRMD5ay9kXtyiaH8CiVcW3rGy0sV3gQc4eOvQhqIDddyQfMT5yZSUlbHth+O
         bbdzN9rPChxkJbCANKRXftT4NEIYTUFRW0hMNEoF7HGuqKwHnCeWrYHQPHeGPVOYJE2k
         decE1I/pE4aNrWy36hNeTocaHUusuJ3IktfFPSoHWtvptUwoZjzSzU2DoqC8rpr5cKEe
         QKAyJJcE5CnHPSLJJN2jJR6nIyR0tU9YKMu4lLn0mqEHo9WQujw/ttUmuKNgzVV67WP5
         bqBA==
X-Forwarded-Encrypted: i=1; AHgh+RrPRfjs4sWlmwnMomH/DHRlMoSRrRdpKXDX+I2ulF9YwAkLqeGqfXngxDHGR+6pVH/oI/avzETQS+QKxinh@lists.infradead.org
X-Gm-Message-State: AOJu0YyTolOYgPmLupS8WJl+wNm4tYroYX7+Z+HoxNpDbdB58bCmrhuE
	wDmul9EJnM7/2PdU0AYVdebAztWZRcrW/dpQPMehMSdb/b0xljGGGI1DbV7aKdxq6DKO
X-Gm-Gg: AfdE7ckkpQX3QcfyNA/jZtjZtamo/eNjF6owQIDEe+QBkzRnRkr/aIntU7UdyiTPUL3
	n01Mrng/7frzWkFRxFN5SFhqNvEdMFng1pWcN0efoJC2GIBjNYjtLbzAVuIyee8x1i6Al+HubqM
	wALmYpVo5Wtvc1gnqCdytztc7WdSPU9iJeUvqFn1mj19L01Zqd1p7ASqdJ0yN/uNoZzaPTqTQ8M
	jyrgJ5Sx4TF0MDF6Rn6arYOz0VK2BR/MVLQHrNqYNcmvAOdowDr4ZEp8My4y+rYqkaRgChdNPhF
	4snv9TS8xRmPm8kpxvCHDXzN7LEdhbTnsFspVyRG+B2ywoZogoAX6oYBjCLWDEBI4eTIqKHUlG7
	dfTKvwsE1mUbB7P3mbJO1IQ0dtbPkJ4XhZzCPaP1BxSW1gfDtsuvZIN3XVAWzLC1xEllHcA39Z4
	rrVxJZ9ahFNR6s69dsNPftodtJDRaDUGHgWQAWgArNlk1/pQs+yT6Z5IbWOX1LQk6xrXgoUSdmM
	HI6GUIgt2pClPLeBFCVGQ5uQKfTE+lwlBc=
X-Received: by 2002:a05:6000:2501:b0:470:c049:b444 with SMTP id ffacd0b85a97d-470c049b6a1mr1348264f8f.0.1782543339444;
        Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: [PATCH 2/2] media: meson: vdec: guard against NULL prev_frame in codec_vp9_set_mpred_mv()
Date: Sat, 27 Jun 2026 08:55:34 +0200
Message-ID: <20260627065534.88527-3-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_235541_515683_4E1EFF35 
X-CRM114-Status: GOOD (  13.44  )
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

codec_vp9_set_mpred_mv() dereferences vp9->prev_frame unconditionally,
both when computing use_prev_frame_mvs (prev_frame->width, ->height,
->intra_only, ->show, ->type) and when programming the previous-frame
MV read registers via codec_vp9_get_frame_mv_paddr(vp9, vp9->prev_frame)
(HEVC_MPRED_MV_RD_START_ADDR, HEVC_MPRED_MV_RPTR and the RD_END_ADDR
computation).

vp9->prev_frame is only assigned (= vp9->cur_frame) after a frame has
been processed, and is NULL after allocation and after a flush. The
caller, codec_vp9_process_frame(), reaches codec_vp9_set_mpred_mv()
whenever the frame is a non-key, non-intra-only frame, without checking
that a previous frame exists. A stream whose first decoded frame is an
inter frame (malformed/adversarial input, or the first frame after a
drain) therefore triggers a NULL pointer dereference.

Disable previous-frame MV use (clear HEVC_MPRED_CTRL4 BIT(6), which the
function already does up front) and return early when prev_frame is
NULL, before any dereference. There are no previous-frame motion
vectors to consume in that case, so this is the correct behaviour as
well as the safe one.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 27 +++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 5ca27930239f..1df641202687 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -993,19 +993,32 @@ static void codec_vp9_set_mpred_mv(struct amvdec_core *core,
 				   struct codec_vp9 *vp9)
 {
 	int mpred_mv_rd_end_addr;
-	int use_prev_frame_mvs = vp9->prev_frame->width ==
-					vp9->cur_frame->width &&
-				 vp9->prev_frame->height ==
-					vp9->cur_frame->height &&
-				 !vp9->prev_frame->intra_only &&
-				 vp9->prev_frame->show &&
-				 vp9->prev_frame->type != KEY_FRAME;
+	int use_prev_frame_mvs;
 
 	amvdec_write_dos(core, HEVC_MPRED_CTRL3, 0x24122412);
 	amvdec_write_dos(core, HEVC_MPRED_ABV_START_ADDR,
 			 vp9->workspace_paddr + MPRED_ABV_OFFSET);
 
 	amvdec_clear_dos_bits(core, HEVC_MPRED_CTRL4, BIT(6));
+
+	/*
+	 * prev_frame is NULL when an inter frame is the first frame decoded
+	 * (e.g. a stream starting on a non-key frame, or the first frame
+	 * after a flush). There are no previous-frame motion vectors to use
+	 * and every read below would dereference a NULL pointer, so leave
+	 * prev-MV use disabled (BIT(6) already cleared) and bail out.
+	 */
+	if (!vp9->prev_frame)
+		return;
+
+	use_prev_frame_mvs = vp9->prev_frame->width ==
+				vp9->cur_frame->width &&
+			     vp9->prev_frame->height ==
+				vp9->cur_frame->height &&
+			     !vp9->prev_frame->intra_only &&
+			     vp9->prev_frame->show &&
+			     vp9->prev_frame->type != KEY_FRAME;
+
 	if (use_prev_frame_mvs)
 		amvdec_write_dos_bits(core, HEVC_MPRED_CTRL4, BIT(6));
 
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
