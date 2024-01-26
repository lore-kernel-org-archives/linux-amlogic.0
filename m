Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BCBC47422
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jan 2024 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjbbHNDD/D5ZKv3fPdDzBg2TOpCPHaNPH+gK7sTz8rE=; b=OC015GsJUxDkcU
	QCSuSVhq0x1QDV19i0Pl6W9Z3z2i2Hyj8rpQjBhDVbpacU+jTHJ04RFNa4NQcAmD5O15koH3XPtzc
	mnpE3ZEvy7xT1rQ+scsLLwZetkHOiMkT8ku4s8E+CpFuK216jMpfymRt6hfktoCeV0UbwhtyC3UdH
	3+mXDsCQXINcqQZyk+krkiupudHGSUnjUU4KvhiCBe0c1lF/Vkh6JeOStRkkaOwiMoLJyplwkQhIv
	Mc+8LqVQ+kx8QZMCFFBXTKieb3YNEtimI0sA2go7BvobkELCZSaSbBDFJcP9rUL9DoTWEVkoJgfw5
	WBv3ozQUcTKMcwGPxajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVSF-00000005jqT-2yMb;
	Fri, 26 Jan 2024 23:17:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQu-00000005ig9-0Yax
	for linux-amlogic@bombadil.infradead.org;
	Fri, 26 Jan 2024 23:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vJoiaHjGhItBXZj/CWSZG5W6mZ9RrzIgj+3pNfG2j8c=; b=MZdMhCCNDZG2z+QIn8J8u4FF10
	J0ZX6Wiu+3rnnhMbvyvR8Jytu8IH6pwfeXG3SvIjVhjIOXM/dgKoIgi6ELvx/ULH96tscAP1kzxnb
	lABQYEz6i5F2efGywqfBcnlkmLrSxykb+gheYJnRWYtJ/u0Ft3Z40yn+5c0faelNP96XwVjlWLE5+
	pkX2RAgeFnETOWi2VRqPsDTM3vEfL7WcLVLsJNA+RB++Tm81an36TFqTyzldcNUhaTaonzxC/Xqxt
	5Ds1ozqAhhdeoeRGuidhNDS+xM1+9mpQjLZGHlztKLa4r3l3rBpEWSawQNDlz+gkR2J6luCu+yKGY
	vSf/i5vg==;
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQq-00000006J3G-03iB
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:22 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-783195e57c7so67270985a.2
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jan 2024 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310978; x=1706915778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJoiaHjGhItBXZj/CWSZG5W6mZ9RrzIgj+3pNfG2j8c=;
        b=gAHGRlP7H1So99C46Ek4JXWuU0oO77YDezRm3GuRHaq+68D2eYA7SmsBLjTzb+C6SG
         mP3olkTkax87/bpPHkPCEXMb1QjmcW+1p9oByKkI3mXoYsKPVtBb2HQvBtyfgjQvP+bC
         Yg4+QzMOzCfmsS5HrqPgXAaKhHS+rFPkjGti4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310978; x=1706915778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJoiaHjGhItBXZj/CWSZG5W6mZ9RrzIgj+3pNfG2j8c=;
        b=TbF0tfqEPcq9AC7m7Elw7gbI4A7Lezr26eTLTS+UW8HKwyRzIfyxrjL7GTySUz2Uew
         kP0pqMh8flUWYg/H7JMypsBax6TOFK80Mw2Yh9uPY+Hy/ULywuPNIgeBMsOg+ccaezKO
         hW4nk70+XyJbIXeJP75kZCNF9ryfP+Q9ayZM6/c6oe+6lzpLO7shE8PgCYpYlA62hjCd
         cFd1xucZufBgx0DULhgHJZ+HTlalTzWXy78pymonPXJibGz2+P0ppWg/p/dFVicZFNIi
         5LQyGM8R9Ww+VYAXRvr6UM8PPh5pCzA8Ooz+aQWa3ZPcf03GfKP6bn1c+gRB/jAxkfWR
         t2Aw==
X-Gm-Message-State: AOJu0Yypo/3neVZaob2WKs7XryuUbfHSJT6Y/F/66+EzK+YMC0GbrvKr
	oAwtuJfKRp5I0mXdWCmU6gZV+RE3vQ8fyO8kFIy3Fz0mAev1I19ogtrqD746FQ==
X-Google-Smtp-Source: AGHT+IFhQN8B5FsPqeRzzxRDyy6PJ/YXcjzquYxGB3Ad9UBljkLUVzxY+WO/snoMGhjDTG+ZaJzFDw==
X-Received: by 2002:a05:620a:108f:b0:783:df3d:ae88 with SMTP id g15-20020a05620a108f00b00783df3dae88mr485948qkk.49.1706310978262;
        Fri, 26 Jan 2024 15:16:18 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:11 +0000
Subject: [PATCH 12/17] media: samsung: exynos4-is: Fix kerneldoc
MIME-Version: 1.0
Message-Id: <20240126-gix-mtk-warnings-v1-12-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_231620_620061_442034D8 
X-CRM114-Status: UNSURE (   9.94  )
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

Remove doc from missing fields.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.h b/drivers/media/platform/samsung/exynos4-is/fimc-lite.h
index ddf29e0b5b1c..2d96fb00a5c6 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.h
@@ -117,8 +117,6 @@ struct flite_buffer {
  * @ctrl_handler: v4l2 control handler
  * @test_pattern: test pattern controls
  * @index: FIMC-LITE platform device index
- * @pipeline: video capture pipeline data structure
- * @pipeline_ops: media pipeline ops for the video node driver
  * @slock: spinlock protecting this data structure and the hw registers
  * @lock: mutex serializing video device and the subdev operations
  * @clock: FIMC-LITE gate clock
@@ -134,7 +132,6 @@ struct flite_buffer {
  * @active_buf_q: the queue head of buffers scheduled in hardware
  * @vb_queue: vb2 buffers queue
  * @buf_index: helps to keep track of the DMA start address register index
- * @active_buf_count: number of video buffers scheduled in hardware
  * @frame_count: the captured frames counter
  * @reqbufs_count: the number of buffers requested with REQBUFS ioctl
  * @events: event info

-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
