Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99607C87FCF
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Aug 2025 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwJpP2hKXW/gjUosiJkZDIgNCOlMBAg4Vn2yM3uxxzg=; b=GIoaY+UOyQ1uD/
	uciv6Rx/yWf8P/hOnkKg5VmQSFdyFGNoAc3ek1EIS9mvCdjWBGBV08j3czhN8IE8nxsDKqh2a4Px/
	lzBZLg9Yr6q6k4b2//0zIYhXf8LFiqUtuBje0vPxj9o2N/C0ZDCNVLWejMLChp43/Bpnlf6IDbjqn
	Pqksb5b04/sIx5//fz2KMibxgg42VftN/5Dc4GMKfZgkW+bIRtx1CzD4Hh7A7t7K0uy0h2Vrb90Ml
	TPIp1q5QnOuRgtnnJLgm2mL+95hONxLMmEzkfe+yuiR17rFrNLMcW4cQqCjO2JRhmRcUV+LK2xFbh
	FvzPyADOLeu/Mihz36mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukr1U-00000004wYS-0Ojl;
	Sat, 09 Aug 2025 21:22:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxC-00000004vmp-092w;
	Sat, 09 Aug 2025 21:18:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 224A1502;
	Sat,  9 Aug 2025 23:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774242;
	bh=SCnMn609VAUM2KKbbQUq8jpo/bDnKWvrBzI4LeCjjl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TLh6kOS3eulgwUUuo7+SnXvHDqTnp0MOCXrrBPUGrMOsYjv1GkIoVL9Ix+q8UUX33
	 DA7dXD88lQhbp3JUhtRERqD5ob02R8yY75MUq9zr9D9aJt2b2yEUreI99NxPqU4mo6
	 XuEzCbOqQANcEzeH9XEh20GlhAM1ehykuAoHyqOg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 37/76] media: meson-ge2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:14 +0300
Message-ID: <20250809211654.28887-38-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141814_211356_1F0AFC6C 
X-CRM114-Status: UNSURE (   9.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index b1b0b6535fb1..5744853a4003 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -457,7 +457,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct ge2d_frame *f;
 	bool use_frame = false;
 
@@ -507,7 +507,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct ge2d_frame *f;
 	int ret = 0;
@@ -574,8 +574,8 @@ static void vidioc_setup_cap_fmt(struct ge2d_ctx *ctx, struct v4l2_pix_format *f
 
 static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	const struct ge2d_fmt *fmt = find_fmt(f);
-	struct ge2d_ctx *ctx = priv;
 	struct v4l2_pix_format fmt_cap;
 
 	vidioc_setup_cap_fmt(ctx, &fmt_cap);
@@ -595,7 +595,7 @@ static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format
 
 static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
@@ -631,7 +631,7 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
 
@@ -670,7 +670,7 @@ static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format
 
 static int vidioc_s_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm, *frm_cap;
-- 
Regards,

Laurent Pinchart


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
