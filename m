Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4F0C38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LRJ3IjadKYm4gUkEzfwn1mLHKOkx4/Zw20QbinF1ZXY=; b=DnSIC0s3QBHji0
	eQw8mjRdc857SPnxJMmPIm8kz9oTil7FvJ/HCFjKkwwegP6IutwGGVfC25pywbS5136Xmit80/o/l
	WA7PRbbSeohQf8KUAhKJvVFT3Wcn7Ygf4vZfI0GURelVS13BJdTHgJvh4L7IEOf+azJRstlBX/UlG
	9WStv1TncKw1GQzI2ZllrfeFLxzYqG5V1J+VXpycsZ+od+P24csVzK9U1NYJf9JTzOxWRYG3BdOFt
	dQqdve86WMBJzBL/RFH7ZtRARM0cdqygGd2w0xnGLnSp7WXwFSTGKx/qtrD3Ht7YyX2aEuG3qtaT1
	W3W/xCvmw/uYdKChqOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJr4v-00GArA-UB; Mon, 23 Jan 2023 07:17:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJr4s-00GAqT-Ks; Mon, 23 Jan 2023 07:17:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bk16so9825808wrb.11;
        Sun, 22 Jan 2023 23:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orgUUcijT9HAApybCZNzBbAQbGQJs54lfazjlNmvor4=;
        b=WRCsLiXIOEL4Z1N86sUMV6M5XLpBKylpzBAmHT2JzYCDncyvy3j/2S4bjMMfg7qFKA
         0t/8RMvcLyZ7Hm9n96j07NCQiO0W+kmPVRWXVr+h89ghY/sTHrxYPc+OS8d29zTk5YkL
         R2V99J6yTedGvuffOXjjSPdOzMpw3ulfv1FGRRhKw+rs9DPPR/2HHXTGbaAE8VEord0k
         L1jrrYxn0HpQiAaH7N57dxlP7Mota1QnShp2jTLcf6hdindbQiKhv+eA9iTK69PNKT6+
         1Tc1h4oL75lIoqP1tBYZeVCtVO81vEHJyaCuYYKfsOCbx7toPCmVdZmurYF1CZhOdZGC
         XtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orgUUcijT9HAApybCZNzBbAQbGQJs54lfazjlNmvor4=;
        b=z2qq6l692smNEs24onR0IYlMH0zpW63vU/01oLdo3pupva/Aun1t20MqGt1tAA2JLS
         drNUuWrQrfNsmUILIs/A/B9S8Z4hDfALEOc9ZYvmKPm2zqUWeH7zUgs7uRe82znmjui3
         KiHIbGFzplpVqVRwepLyihmMCBv+5s5HROqpaiocWG3E5S2rvovikbH3DoQNpiW2X4rL
         mBN0WW6TGsuYB+zSU37np/nue2tkPdjZdxoSoP2Y0kGhZarZtWweBJpb7xSzTczc4A/M
         oH7/yBALG+Biw5QwCT3XRQ93IiHlnUnpSHb0oO4CcOWBWeKxJbxIV9IX4i9jQ/hQ5gBg
         iBDw==
X-Gm-Message-State: AFqh2kp0zQu9y9mB/ELFD1DbLynRbMoFtniO8hbXkFzPZzxDgjSckRDq
	VKL445OogrJ9FzdT4wWMUaMLvWZJoENqlI3/
X-Google-Smtp-Source: AMrXdXvWh4N79aN3+Zbpk2+4tvBaV8mZGbORgIeWR2mMNB6qANbMFGt0GeFzVFZKjCoaUSqoZ0vkbg==
X-Received: by 2002:adf:f790:0:b0:2bd:ebc0:6f79 with SMTP id q16-20020adff790000000b002bdebc06f79mr20538950wrp.46.1674458232520;
        Sun, 22 Jan 2023 23:17:12 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id f2-20020adff982000000b002bde537721dsm23713801wrr.20.2023.01.22.23.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:17:12 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: remove redundant if statement
Date: Mon, 23 Jan 2023 07:17:08 +0000
Message-Id: <20230123071708.2670751-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_231714_744973_795ACEE7 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: Benjamin Roszak <benjamin545@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Benjamin Roszak <benjamin545@gmail.com>

Checking if sess->fmt_out->pixfmt is V4L2_PIX_FMT_VP9 was already done as a
condition to enter the if statement where this additional check is made.

Signed-off-by: Benjamin Roszak <benjamin545@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 86ccc8937afc..7b15fc54efe4 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -314,8 +314,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 			num_dst_bufs = codec_ops->num_pending_bufs(sess);
 
 		num_dst_bufs += v4l2_m2m_num_dst_bufs_ready(sess->m2m_ctx);
-		if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9)
-			num_dst_bufs -= 3;
+		num_dst_bufs -= 3;
 
 		if (esparser_vififo_get_free_space(sess) < payload_size ||
 		    atomic_read(&sess->esparser_queued_bufs) >= num_dst_bufs)
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
