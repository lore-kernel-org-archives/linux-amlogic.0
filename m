Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49DA606A323
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 17:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2WoZkBPU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D13NO4In
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=swG8ASXVVTSqKr0vgOR5nWHL4AGRM+wT0k/fVgmrMEw=; b=2WoZkBPU+n3oD7pT65dVaQKPFO
	Y+YsT1BpPayeJzDVlgoKt4S83ranMLBzYRPT0blHCw8LPE/gQHc2xAwpTnFj2kVLuOyQmHznDeqvt
	qDPduSknSxuTb31MJ5V6mBZmisXE6QbcyRlXBlsjeK1hCt3wCMfR5E23Mqex6EGKisx83N5NAbtmM
	n/VMQ1MLWjeAX6t0DAWM/H91hudIW71c9Nt+kPbVBo5aE08CcJQCg/Ga+wdnLqr32wLJPDzgp3No0
	GKLSyNt5Ttbre0lYy6wFQmoeO9c0OshuEAbP2AcrlUwY4K7w54T9QWiNyVwD12cAveoYQh1/MTxug
	ttom8iYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKfnm-00000000PLB-3mWi;
	Sat, 24 Oct 2026 17:45:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKfnj-00000000PKQ-2zDz
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 17:45:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1554864f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792863901; x=1793468701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=D13NO4In1izssgStRb8vq1p5ZI/qOCnsUFBbeRh0fg/ZZDoajTfRIB+2fEGb8E8+Ho
         F+mcwAaOsged7tdPh4n2OrobbteIPcQDFp1pHXpATP+en4uisbabAXk6D9OCOalAeliu
         FWfjg9Axc1ISbUNFnfUx7PSxf3YJ/3vLN3M3jYZkMjloxw1tVfsaVipDraZ8iy19aU5+
         /r49y42D5fAjdw7Tqpw4iBCXR0oo78oAHyoI4CMxdzk1Yzv5x/GmyEzgVovvUxm+weyN
         CLqmP0NdQwpTjhq37nVVkdfgbYyUp93ecJMz8Ljk/l5TLtGqufbuJ/JAhOoKYRzWucao
         NsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792863901; x=1793468701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=BkR0AvC/zzYe/RDO3GPckYoB7G+VwuQVmpHhXLhR9UAV2pb9MJbm+xtDd0lQAnFfl9
         6K+EWKwLQJ6Ur0DApkk9gRa7HRR9PIykpksi60WjP5DQfaBxoGrpeZ5DMihZqNT1hBqV
         +ktCFeooQyvmxYkUq1WVf//Co6ht1fEm7hUSgmu8hDJ8JiEvzq+oE78VRQClamgy2UtL
         1AxdsSoESKEpJi1sd5+fXoSaMHMIXVG3j4RAmnG97KiMqhfFIDM6iOeA9CDiPqnSCrXH
         J67jszxhkr5tQ8gHVIEReUqIb0lEUHcyIoVL/v5fdFYyO/yXj3nfW/bvNly3fD6c5zf7
         9gzg==
X-Forwarded-Encrypted: i=1; AKwUvByuMrhP8pzDGXTqUBO0CFMtgLeePkAfalT3SgMfqhS50wJ7f9JXnKVORVlhGiTAaSZlO8LQTQj9lvYeYcpt@lists.infradead.org
X-Gm-Message-State: AFq9FYLZt5aQWVQHLz9xXpvdmiEZaCLSRpK8h2HMtXQ+jQ1MoQUAOEeP
	jkInasuuizkoyXtz3HBdDwyeeAp1lZ7eEut8bvfCXAg5V+Y5yxnrUhAm
X-Gm-Gg: AYBFou2CDWT2aTXoNJse7+eKwFPluiNUvqL+5VkZj6wLGLPOu7P42/Gb+Fo4jNahjzv
	Dutl5jrLR2osuyXBgQ5zpjR+7BMIrmslWCQD6R9MfjoX3Ro2DAYxu/YzdaAlMdG1DTSXLdfWNh8
	Zk0YshUbTpCaTgo3DLB2iGfNc1LUIBVmOhXtruw/hdMwOjzyeQ4wGjbLHlgtcoSeW9DtOb9yqyn
	hbcKxbwCQLMx3uqsO2JV3OkNn6/1Xd/BqCbTIJ5rgxWAuf5dCYhk1vhe5SCz2SArC7oC2LWrpjC
	M+ZqJvxsbOKrVPtWdT5BO2ZD3ScWfIy3ern7D+eQmlsBd4eD5kRn1M34i4JWUX0ZmWOTTTJJL8p
	75heQ873CEOEQLLrzK4aBIFbgzaymdKyxg3ptD8YtR9QElhqjweZZeNAviZ+BHBrLL/rKlW+owf
	xl5+7/4YcRSm/T/RHO/wuuda7YVj/0CPqWqjHJG/2iaqIrkxei8F2ZRzOcdVjQnaZ5UA/ROTNAL
	5xSGm7WR85LjpWnrGaO298jXJ3jzM93DbrTnIHNV2uogveZvIYAfmwcGgDFKkOZTkUjnYDi8LeH
	oa07fFlu858k1QjkQJ1RsexLkfs=
X-Received: by 2002:a05:6000:178d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e3eb262f0mr3872646f8f.7.1792863900975;
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
Received: from john-desktop.station ([93.107.83.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm5748244f8f.28.2026.10.24.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: meson: vdec: reset the VLD before H.264 decoding
Date: Sat, 24 Oct 2026 18:44:36 +0100
Message-ID: <20261024174436.1835068-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_104503_781454_9A8DEB82 
X-CRM114-Status: GOOD (  16.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H.264 decoder outputs wrong luma until the second IDR picture of a
stream. Chroma is correct. The top-left macroblocks of the first IDR
picture hold garbage that is different on each run. Intra prediction
spreads the error over the picture, and inter prediction carries it to
the following pictures.

vdec_1_start() resets the VDEC1 blocks with DOS_SW_RESET0 before it
powers on the VDEC memories with DOS_MEM_PD_VDEC. The VLD then starts
in an undefined state. The vendor driver resets the VLD, IQIDCT and MC
again in vh264_prot_init(), after the memories are on. This driver
does not.

Reset the VLD (DOS_SW_RESET0 bit 4) in codec_h264_start(). The VLD
reset alone fixes the corruption. The other resets that the vendor
driver does (IQIDCT, MC, DBLK, PIC_DC) make no difference.

On G12A, every decode session is affected. On GXBB, only the first
session after power-on is affected.

Fixes: d7647e7c90f5 ("media: meson: vdec: add H.264 decoding support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: John O'Callaghan <johnocallaghan@gmail.com>
---
How this patch was made: the bug was found and the fix written with an
LLM coding assistant (Claude Code). I reviewed the fix and ran every
test below on my boards. checkpatch is clean; W=1 and sparse give no
new warnings.

Users see this bug in normal playback. On G12A, every H.264 video plays
with the wrong brightness until the second IDR picture: the first
8 seconds of my test clip, with a band 72 levels too bright on the left.

Tested with H.264 High profile clips (1080p and 720p, 600 frames, IDR
every 250 frames), GStreamer 1.26 (v4l2h264dec) and FFmpeg 7.1
(h264_v4l2m2m). Every decoded frame was compared by MD5 with the FFmpeg
software decoder.

Radxa Zero (S905Y2, G12A), Armbian kernels 6.18.45 and 7.3, staging
vdec with Armbian's patches:
- before: frames 0-249 wrong in every run (10 of 10)
- after:  all 600 frames bit-exact (32 of 32 runs)

Odroid C2 (S905, GXBB), Armbian kernel 6.18.44:
- before: frames 0-249 wrong in the first decode after power-on,
  later decodes bit-exact
- after:  bit-exact, including the first decode after power-on

Odroid C2, plain v7.3 (no out-of-tree vdec patches), GStreamer:
- before: frames 0-249 wrong in the first decode after power-on
- after:  bit-exact. Two GStreamer starts failed first with the known
  poll() start race, so the decoder had already run before this decode.
(v7.3 also drops the second-to-last frame at the end of the stream.
That is a separate bug and is not addressed here.)

The DOS_SW_RESET0 bits were tested one at a time: only bit 4 (VLD)
changes the result.

Not tested: GXL, GXLX, GXM, SM1, interlaced streams, 4K. On G12A the
tests ran on Armbian kernels; their vdec patches do not touch
codec_h264_start().

The same fix is in Armbian:
https://github.com/armbian/build/pull/11098

 drivers/staging/media/meson/vdec/codec_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index a6074de15..497fbada6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -182,6 +182,14 @@ static int codec_h264_start(struct amvdec_session *sess)
 	if (!h264->sei_vaddr)
 		return -ENOMEM;
 
+	/*
+	 * vdec_1_start() resets the VLD before the VDEC memories are powered
+	 * on. Reset it again, or the luma of the first pictures is corrupt.
+	 */
+	amvdec_write_dos(core, DOS_SW_RESET0, BIT(4));
+	amvdec_write_dos(core, DOS_SW_RESET0, 0);
+	amvdec_read_dos(core, DOS_SW_RESET0);
+
 	amvdec_write_dos_bits(core, POWER_CTL_VLD, BIT(9) | BIT(6));
 
 	workspace_offset = h264->workspace_paddr - WORKSPACE_BUF_OFFSET;
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
