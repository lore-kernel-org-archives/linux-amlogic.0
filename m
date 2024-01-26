Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531D2C47DDB
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jan 2024 23:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXRwkz0eMFZOr4/SFSRufRese7e4/H6FBN5GY5kGNZQ=; b=y4Mc2HNs+Bxf0i
	zGBDpebMtrUE4FqFnFfsjOyuNaBxIXnjQy9pBSFo4nrN+LTsuD1mBebdWne8GIp3C2D1gpEQICxNs
	1wFnSzoAkNqGuHignEgpKeN0VxGUei626O2dygpiXlc8M/OxsG4kNJrSX/XXehWQqddGcotmvwfp4
	CiKbTp3fIg2Ey2Rkc4VKWpuX/ijTYJyvTowrc/5L1zO9wPJvGoccLMNhNTu+lq10c1yRgoQKrcG0+
	e+72d193i18JOQxvsH9YaJshu5XG5bAKPWsxIJIdJOFSx0v9sS/x11sRVsB4l2Gu1jpBmUeBo+Np2
	lEez2IgmULxipnhiq2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVTE-00000005ke6-3YDW;
	Fri, 26 Jan 2024 23:18:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVR5-00000005iq1-036Y
	for linux-amlogic@bombadil.infradead.org;
	Fri, 26 Jan 2024 23:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mtltgslBdQHae+oLD1399tQsPexikCLm+b/oIxSwL94=; b=dxXDGZA6/JEy+Uw1fA7SIvLchi
	KE02v9JtixwoU1JbXS2VGBq4roboddu9trpsD3STDEgbbE4S+HPGRCPxEjlyL8hdienjc3wvuomI7
	fy1Z8KD492zB6cSaWM+DxL8F6pY4NCeb76gD5aI5fZpSxiP0h+UxwhoLUIQAfH8yl06W6wDQeyirD
	I/cmgXlPq/gAqwGmr7GUCKPn1V3C2T4FcrH9tj7PE6ofSsQlnC1qrlHeqbwBNyfYmNzNhL70C2hFH
	EM9zWbP3SDdrLxj88DYpHvZO6ArFpCmkolM/SqTuk2D1mJ3Uf7sXXJTuQB95x2ysi4Sr5T4k7CgaO
	E6JqPhhQ==;
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQu-00000006J6c-3mby
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:30 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-783045e88a6so102320285a.0
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jan 2024 15:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310983; x=1706915783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtltgslBdQHae+oLD1399tQsPexikCLm+b/oIxSwL94=;
        b=epokoW0nZrBF68rk6G9i2rQEHhuDRksk0Z0bcmrsvG04GeQbuhBiDpzFD7MIfZedSR
         pTLoJT5lFySag1QwwqM8TGIHMEPVHFNRGhUhb1K9zaupzP/pa0lExmls76FuJaN7o6cB
         myt0+3NBaA6V142EqpFZLNTI1Y0D1zR//8coc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310983; x=1706915783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtltgslBdQHae+oLD1399tQsPexikCLm+b/oIxSwL94=;
        b=N2d/xUcbQn4bBElURTMPFH+0Q7JFSFEFXWBHfbBIMrgH84mU4qnLupk3RtGp8EMEZF
         708hlEC0C/+wb00VXaRg1L26ASgkmR9KIeyInAXWgRq8ZyA+ZPO3lTvFeI7zC3do3caA
         sRIVc0PqEkaFy2wRHaP9H0nVIRrL3wTcstX6GgzwkyCNem25q6GZnvFDNDJTS4eXKgX5
         8WSKViT/2OwqTQ3HKTNLPHZg18MibgwaoRyn8vLA/SRdwDnKMbe89UF3+NU3rvMl8CCa
         4kxBckwYyU8JBnCk7DYm++u7xCWWfEvxS7VYhMhRPBxy/qw+a56/YWeM32I8htDVh6b6
         /pLg==
X-Gm-Message-State: AOJu0YyxJFk1KZDMNWc4X3AKYec3WSIBJAN5Au8bh4EITlxCBM0YenBd
	DrSSIbGzTmzG2M607y5Ea1yq60x9OOB6G8dI9/06sdOtSdIowRTDC4T3WT1ZtQ==
X-Google-Smtp-Source: AGHT+IFr6+3pqj0JMsLxQ2GW7atIeRCtD6HJIvow5am3DYJqsXSoZPigBa/gFlr3DGsp4f3R3YcSBQ==
X-Received: by 2002:a05:620a:618e:b0:783:4cbd:9ed7 with SMTP id or14-20020a05620a618e00b007834cbd9ed7mr711408qkn.38.1706310983521;
        Fri, 26 Jan 2024 15:16:23 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:23 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:16 +0000
Subject: [PATCH 17/17] linux: v4l2-vp9.h: Fix kerneldoc
MIME-Version: 1.0
Message-Id: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_231627_355103_71554946 
X-CRM114-Status: GOOD (  10.93  )
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

Kerneldoc cannot understand arrays defined like
v4l2_frame_symbol_counts.

Adding an asterisk to the name does do the trick.

Disable the kerneldoc notation for now, it is already ignored:
https://docs.kernel.org/search.html?q=v4l2_vp9_frame_symbol_counts

include/media/v4l2-vp9.h:144: warning: Excess struct member 'partition' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'skip' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'intra_inter' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx32p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx16p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx8p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'y_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'uv_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'comp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'comp_ref' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'single_ref' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'mv_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'filter' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'mv_joint' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'sign' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'classes' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'bits' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0_fp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'fp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0_hp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'hp' description in 'v4l2_vp9_frame_symbol_counts'

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/v4l2-vp9.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-vp9.h b/include/media/v4l2-vp9.h
index 05478ad6d4ab..f0d80273bd61 100644
--- a/include/media/v4l2-vp9.h
+++ b/include/media/v4l2-vp9.h
@@ -83,7 +83,11 @@ struct v4l2_vp9_frame_context {
 	struct v4l2_vp9_frame_mv_context mv;
 };
 
-/**
+/*
+ * NOTE: This is not a kerneldoc, because the (*name) notation confuses the
+ *	 parser.
+ */
+/*
  * struct v4l2_vp9_frame_symbol_counts - pointers to arrays of symbol counts
  *
  * @partition: partition counts.

-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
