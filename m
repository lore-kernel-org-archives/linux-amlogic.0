Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12F6C48260
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jan 2024 23:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fssYq37rgTwLUj+L+PdbQBdsQ7GU0PwY+75Yx7K0b08=; b=is/PzTOQeLvHtE
	7B15gx11U1uu1nH6nUM37V3qbQGvHWo3qG7uXgrCV3Gx7IuYNaI8xnWTqrGKHKyn29PbL6M3hr4WC
	tg8Z+UYoHumqq0JmF/W+h9SiYHcupRfPCAz9uz6u5xjBDYcoZ8C5Yv0OcPmTeBgaXPdYxUSlslm9l
	KVvaxefXtZrUoDC9YbVKP4UIAF8OIk4QplyDwf2Mw7ivQmvIfH7fZLsRVDX+bm+JKYpzg/I7PMTvZ
	tnjxIM3mQrVl9sb5JaD3WJNsnGUtNqw67E7Nu5djFg723WUqPDitWWfHWZ8+gKcST3z5RxYG1yjg4
	j76WcgKM0GTO6P2RBokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQo-00000005ia5-0LWP;
	Fri, 26 Jan 2024 23:16:18 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQd-00000005iQQ-2v2J
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:13 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-783cd62f1b5so41715985a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jan 2024 15:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310965; x=1706915765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar8mBbHXqsE1e1cRGpZMgerGImf36JANUI0hlBJjqHM=;
        b=fHD1qW4OI4vofpoKVUEJC8tjY9yz+QExMuv6rySAE2gKFmEsO8kd1RmXjDmBjNYSyB
         4DJsn4gGHQ4g82WXxgMHJZrYAva5o4oRqDT0OKod35lpxq08eb4Hs9rc+c71h5QsZt1h
         +vq/dUaLcTwfXEAGlmZo5KH1VgDp5fOJwlRqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310965; x=1706915765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar8mBbHXqsE1e1cRGpZMgerGImf36JANUI0hlBJjqHM=;
        b=MzNC1noiXVWP25RxR006P2lnCscbFGjMHZ5ETaG+jYSFLC5RlaK4ODY1B8Ep9Ugayk
         jKaVu9mdZTwZhyjGsXNLFK3txExIUt1vqze/EIAALDhgdXgEjZTEGpLnIHYMgWLSIQdX
         3iEbPu6BklgFWW1Yz00TTHA5R2Oh+4zxt6iOHC9FQp3aOBQuKWsb7U0l+y2aSw0NUDtj
         bDH7MkCCveLyagdgaHNHBdiMT65qqPKz3bmqSnEZPp3KnuaScfsc7w6pTTLrTKWi9mgU
         2SHXq4OCI3GznYvnmf715HG7RYQwsTr7c9NS4d9Y5U738pQDJwUHlCRiRK1VrejgAbpx
         Z84A==
X-Gm-Message-State: AOJu0YxMNSDJvoP09TFnIDGkjHxUWQ+h5fZPP3Y7dq7WIuxkbJymTEfO
	YLyUdwqpRtn5n/la0pi5np9JoAmVnUYgjyyVtDKntHTSSc8nh7wLfTqSaEDudg==
X-Google-Smtp-Source: AGHT+IEp2TplztXDP53F55JwtnOMG+m/bhamzc+Y9PQOYbhM+M8gtls3bXtKPqVmvF6K1+rXQLaydQ==
X-Received: by 2002:a05:620a:46a6:b0:783:35f0:d03c with SMTP id bq38-20020a05620a46a600b0078335f0d03cmr626950qkb.135.1706310965318;
        Fri, 26 Jan 2024 15:16:05 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:00 +0000
Subject: [PATCH 01/17] media: mediatek: vcodec: Fix kerneldoc warnings
MIME-Version: 1.0
Message-Id: <20240126-gix-mtk-warnings-v1-1-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_151607_841615_62296132 
X-CRM114-Status: GOOD (  11.16  )
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

These fields seems to be gone:
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c    | 1 -
 .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index f64b21c07169..f677e499fefa 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -37,7 +37,6 @@
  * @bs_sz:		bitstream size
  * @resolution_changed:resolution change flag 1 - changed,  0 - not change
  * @frame_header_type:	current frame header type
- * @wait_key_frame:	wait key frame coming
  * @crc:		used to check whether hardware's status is right
  * @reserved:		reserved, currently unused
  */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 69d37b93bd35..cf48d09b78d7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -141,7 +141,6 @@ struct vdec_vp9_slice_frame_counts {
  * @skip:	skip counts.
  * @y_mode:	Y prediction mode counts.
  * @filter:	interpolation filter counts.
- * @mv_joint:	motion vector joint counts.
  * @sign:	motion vector sign counts.
  * @classes:	motion vector class counts.
  * @class0:	motion vector class0 bit counts.

-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
