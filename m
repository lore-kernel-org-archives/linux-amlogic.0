Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E80C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4YixJZY2yh811Qd1WOwMSXRDR1h6o30J+BijorHav+M=; b=jwBZgYIT7HMb8a
	fpYUhZDFpUeiKCE54pF3uvUE+pDiCLNhxoOvGtv9ZbNIN64gWYrO71QGpNkBRCWON3hpjjzrWP12b
	iZcIY6NZoI9Q0FV+H6WXHZla19bqK0/Qc1ivtusffNUWLPJQk3N+nNblJqLFv3+GgqXrCxaylr/mJ
	FVxPXWrVLKba+N2lSl26z4pt2Dmia1U6uW+mC04on0Jm2dE9YYx1gt9/k+ZnI26FNrzoiGR3qbZJk
	qP7PtWeICyia3Gn6oYDP6LNoRHuAV6nJAAHD1aZ0y8kU/DEj8e5uDvAoYd/82kTuw1ICSTiLJ2rdC
	jFQUlXsQjAuXXMuRGHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtM5-00GYfo-CP; Mon, 23 Jan 2023 09:43:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtM3-00GYf1-2M; Mon, 23 Jan 2023 09:43:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id b7so10196833wrt.3;
        Mon, 23 Jan 2023 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6BjjeXL8yTJMC0wJlFe+I8I2MsrGeDOh1B+2LIf6wU=;
        b=agILq6o+GWk4tuFzspZR7fsDXjM2H4OVKJfjyuwFl2UcLwWyZ2gq7A11/LUvn1bsmn
         cX41gI3USsqEo0h0SFKIGzPQ4sC3hNZ/K08K37HYaJzs6Z3ZhJjVH/uQvO1vLX4IDDHl
         /g2DEbESv6pj+qqudSDlv6MAt+AlSpUR1KpXm+3FLQe5PpuJEGO3zY9lpIRDMqjKTeFO
         XotsdfsHHtfNezyDvJY1OHuaoiJRpa0zmozqH+YyBYsujIa4rpPBtflaAaPtoOWR6iFu
         RzXnWGgaFWcpcV1C48Jrgp7rvQNRLhEOgm3rdbgxY9gO9EJKf00fYME0iYTqR4FnwBNJ
         ATXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6BjjeXL8yTJMC0wJlFe+I8I2MsrGeDOh1B+2LIf6wU=;
        b=w6dFdhKDqDsrE5A4eUS6dmvx9aHIAKLBC88DT/Lmkq0RfRYOKU4I/MGonNe1B4943F
         l/ZaWlxmjITj7GRUhWSN30vG2rvhZ5ORaKU4b6O4keiptCc8XRxB9/GiS8iBHkK1mveb
         AZrwKaUHdHCxg6wlgH13VnttnT+kaknbiteblyEDW9R7BPRat0sFUJuax+Gune11q47e
         2k1f00cbP3lQOhinqJ+kaxs5yaJLzzqEnCxq4+86ncff2sm73uHX2nP97LyB+C8+t700
         0+6mUDHc7Z1myEcC4xO/N1DqDq3+VmnEw0US4h82IFuvZDE8BwT/qrGZv7yKAYtgL+Nv
         JrbA==
X-Gm-Message-State: AFqh2krQslFl4dYSKqTKKPWi3oyJWTBdR1CoIWIqMk/uULyXhomTZ2uk
	qG8auiy8rblw/mcnYMVXL8s=
X-Google-Smtp-Source: AMrXdXt5fyhf1LiEcRZCoHd5aZVrC2fCwIs2S4ezPycbnFeLgplLPKiVW0DzdP6j8gCMA21I42WBZw==
X-Received: by 2002:adf:ce01:0:b0:2bd:e208:1e4c with SMTP id p1-20020adfce01000000b002bde2081e4cmr23690706wrn.11.1674466985537;
        Mon, 23 Jan 2023 01:43:05 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id e12-20020adffd0c000000b002bf95821372sm6178158wrr.42.2023.01.23.01.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 01:43:05 -0800 (PST)
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
Subject: [PATCH] media: meson: vdec: esparser: check parsing state with hardware write pointer
Date: Mon, 23 Jan 2023 09:43:00 +0000
Message-Id: <20230123094300.2816812-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_014307_148996_7AC525D5 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

Also check the hardware write pointer to check if ES Parser has stalled.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index df5956c6141d..41b705f999b2 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -300,6 +300,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	u32 num_dst_bufs = 0;
 	u32 offset;
 	u32 pad_size;
+	u32 wp, wp2;
 
 	/*
 	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
@@ -354,15 +355,21 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	}
 
 	pad_size = esparser_pad_start_code(core, vb, payload_size);
+	wp = amvdec_read_parser(core, PARSER_VIDEO_WP);
 	ret = esparser_write_data(core, phy, payload_size + pad_size);
+	wp2 = amvdec_read_parser(core, PARSER_VIDEO_WP);
 
 	if (ret <= 0) {
-		dev_warn(core->dev, "esparser: input parsing error\n");
-		amvdec_remove_ts(sess, vb->timestamp);
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
 
-		return 0;
+		if (ret < 0 || wp2 == wp) {
+			dev_err(core->dev, "esparser: input parsing error ret %d (%x <=> %x)\n",
+				ret, wp, wp2);
+			amvdec_remove_ts(sess, vb->timestamp);
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+
+			return 0;
+		}
 	}
 
 	atomic_inc(&sess->esparser_queued_bufs);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
