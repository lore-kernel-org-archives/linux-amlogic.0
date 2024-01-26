Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2586C47DDB
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jan 2024 23:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpzopjvFmhiET9F2JhIFd8FocoNpKi5uTtXlJIrOrm8=; b=uLeDtOvHu1/+1t
	kZjAPl1XW/jVttE80zghi6aGD4H+PGln2aBBII8LIoH5p4pBHR66/z+HOZWS1iorlpmGaT28LtujO
	JdGaIsqxzOGEZLFEJ5afEoFL4KvUmed3/Bp1/u1mHze185qD619RzLPZI70LALaZ+czvGeVTEjcPx
	ieVvVVM2BzIjw4VgyLLEc4yySf7S4hiwg8coOBB50EGvEtzuzBGkI5quDvtF10tK4sIsgxVAF/SbQ
	Vk8k/051Y1uqVnC6TBp7SHNnz5OVHbyCAzpLtckK1ovSrwEmakajOKL/ymPtTj7hofXlXGWaFUYRk
	Rt0QLGKKqrSEZmAf5/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVRG-00000005j1h-1MbX;
	Fri, 26 Jan 2024 23:16:46 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQe-00000005iQi-3rvb
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:17 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-783ced12f9bso52802085a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jan 2024 15:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310967; x=1706915767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKZ2I0FgT+c8VUKnt1mK+wIxC1JMtHjQ/OWMUKXoVdE=;
        b=QalqUtMF4PDKz/hKVV5ple+NU8j15nurwIRrtkLlLUxVxGco/kv7OD2XGxTWNJOS6D
         onH3TjC776OU2kOXHl2D6fwQnWlo8zJQK6uy9MKOnyt/eX6J7KohhKJquyB5H+BM8+GC
         aXJTZMBmYa8Y/V5IRMpjvSrEVu6LKVa+cXUq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310967; x=1706915767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKZ2I0FgT+c8VUKnt1mK+wIxC1JMtHjQ/OWMUKXoVdE=;
        b=eoggx/jfJvL+uL8eHF5/4FiQHZMN+NfTmIJuzXJRjdxgiZUDb7uxobjzrnKIAakGIV
         n4fXkdZWUuqglFm+lZknLdUbDdIG26Cr+iEhCcgl5WoPRC6uKD6TFUcns78QIWvHAoYQ
         4Gech68eVASGjzBBcwH7ATMntG1qNhigN9yooClfjbVtUMcypeBRUEhI6DsIJNfUG2qI
         CcaN7myZOXjKEGpNF8FaIxyTWZ/B9Qj2260zV+q/j048XdD0rLLwHNapGoDjt1ir3h7l
         dRykPqwRPD+8jzXMFGLg132pZ/JmmMQoguQWKuORjXUK4J82iKgy7U982zDZ7jhAj8TF
         MQWg==
X-Gm-Message-State: AOJu0YwZbmBw31jvyuGF0z4PEaDd5bFQDdXbbFFxLuG462ugPpXUdU/n
	+ixl9Xs6tfyDLIIe6zxFPpV7V4avw5IMnz3oVBqEowAMJhFcRTuX23QiXnyd8g==
X-Google-Smtp-Source: AGHT+IGfaDanel4bAe+Gm4pPjfl4j2bUb1CcCFTzpsa5FCnRkAwIXhqbnMbyXrNSHptz1QBTZemCAg==
X-Received: by 2002:a05:620a:3888:b0:783:3cee:425a with SMTP id qp8-20020a05620a388800b007833cee425amr491959qkn.141.1706310966713;
        Fri, 26 Jan 2024 15:16:06 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:05 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:01 +0000
Subject: [PATCH 02/17] media: videodev2.h: Fix kerneldoc
MIME-Version: 1.0
Message-Id: <20240126-gix-mtk-warnings-v1-2-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_151609_092970_532583B6 
X-CRM114-Status: GOOD (  14.41  )
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

Named nested unions need their prefix:
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#nested-structs-unions

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/uapi/linux/videodev2.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 68e7ac178cc2..a8015e5e7fa4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1041,13 +1041,13 @@ struct v4l2_requestbuffers {
  * struct v4l2_plane - plane info for multi-planar buffers
  * @bytesused:		number of bytes occupied by data in the plane (payload)
  * @length:		size of this plane (NOT the payload) in bytes
- * @mem_offset:		when memory in the associated struct v4l2_buffer is
+ * @m.mem_offset:	when memory in the associated struct v4l2_buffer is
  *			V4L2_MEMORY_MMAP, equals the offset from the start of
  *			the device memory for this plane (or is a "cookie" that
  *			should be passed to mmap() called on the video node)
- * @userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer
+ * @m.userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer
  *			pointing to this plane
- * @fd:			when memory is V4L2_MEMORY_DMABUF, a userspace file
+ * @m.fd:		when memory is V4L2_MEMORY_DMABUF, a userspace file
  *			descriptor associated with this plane
  * @m:			union of @mem_offset, @userptr and @fd
  * @data_offset:	offset in the plane to the start of data; usually 0,
@@ -1085,14 +1085,14 @@ struct v4l2_plane {
  * @sequence:	sequence count of this frame
  * @memory:	enum v4l2_memory; the method, in which the actual video data is
  *		passed
- * @offset:	for non-multiplanar buffers with memory == V4L2_MEMORY_MMAP;
+ * @m.offset:	for non-multiplanar buffers with memory == V4L2_MEMORY_MMAP;
  *		offset from the start of the device memory for this plane,
  *		(or a "cookie" that should be passed to mmap() as offset)
- * @userptr:	for non-multiplanar buffers with memory == V4L2_MEMORY_USERPTR;
+ * @m.userptr:	for non-multiplanar buffers with memory == V4L2_MEMORY_USERPTR;
  *		a userspace pointer pointing to this buffer
- * @fd:		for non-multiplanar buffers with memory == V4L2_MEMORY_DMABUF;
+ * @m.fd:		for non-multiplanar buffers with memory == V4L2_MEMORY_DMABUF;
  *		a userspace file descriptor associated with this buffer
- * @planes:	for multiplanar buffers; userspace pointer to the array of plane
+ * @m.planes:	for multiplanar buffers; userspace pointer to the array of plane
  *		info structs for this buffer
  * @m:		union of @offset, @userptr, @planes and @fd
  * @length:	size in bytes of the buffer (NOT its payload) for single-plane
@@ -2423,15 +2423,15 @@ struct v4l2_meta_format {
 
 /**
  * struct v4l2_format - stream data format
- * @type:	enum v4l2_buf_type; type of the data stream
- * @pix:	definition of an image format
- * @pix_mp:	definition of a multiplanar image format
- * @win:	definition of an overlaid image
- * @vbi:	raw VBI capture or output parameters
- * @sliced:	sliced VBI capture or output parameters
- * @raw_data:	placeholder for future extensions and custom formats
- * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
- *		and @raw_data
+ * @type:		enum v4l2_buf_type; type of the data stream
+ * @fmt.pix:		definition of an image format
+ * @fmt.pix_mp:		definition of a multiplanar image format
+ * @fmt.win:		definition of an overlaid image
+ * @fmt.vbi:		raw VBI capture or output parameters
+ * @fmt.sliced:		sliced VBI capture or output parameters
+ * @fmt.raw_data:	placeholder for future extensions and custom formats
+ * @fmt:		union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr,
+ *			@meta and @raw_data
  */
 struct v4l2_format {
 	__u32	 type;

-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
