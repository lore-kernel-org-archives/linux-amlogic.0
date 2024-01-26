Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6274C47422
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jan 2024 23:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZPi29RkBUXDVtlXdxOaENLgLQ2m6I0/zYDVjyrpf+8=; b=0hyPqaQRMxX1G1
	M2V0B7T2MLNurnj3eAn5smSZvXP4GRRgXSE57UgcGmhxJnE2uLJZFminLGx4H2J+y6uVIQPJVe73+
	3i+nkr0Jfyr/o8VuXbBy4PKW52mjR/eJ+jdZ0UBDUVSYo1EzceDrGTAmWPhzyok29BicLT4wKGXbJ
	oo8HwHZUsXgf3x0V+IwF8fedAk6JispTfZBDQ7jJSMUkr143W99mNATGEEeJsJVOYrKEfKyGI6+BB
	itTi3xRv77JGs/vWDAPQ5M1wCELLjUmQIBm7p3b3fcSEXCw7xQnNZkPgAwqt2N0cNOJkHKHnrdfF/
	u+hhX+KOLvPPSQvEOvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVSI-00000005jsS-015q;
	Fri, 26 Jan 2024 23:17:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQu-00000005igx-3ysD
	for linux-amlogic@bombadil.infradead.org;
	Fri, 26 Jan 2024 23:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=stuI7gBMJumChDGNuDa5NAtrFPgVVPyF9dOhkVEQIZs=; b=YNFL+6xwLs7UGHUwxrMK9jP65Y
	nPxGqhiFnRIdioRqMK0Vx8MlcjHKAGlN5GkJTjUWLpbeUG6iGgzHU62/IDS31dyJokz12C3QznmhH
	0bw7YLApkf3g/S8MpGPr/rGxmBdQub79yHW36OkEe8KBbV5CJiC5muB2ohevOyffOsTpmgbiwvkXa
	h4COede26lW6l0a+ASm2r4dYrjtE8gDAhqntQHGEmEmItCVPsBT3uQse5ItG/I7+3pDHZHSPP9KzA
	NA9aDm7IjKJuOeetE2HhrNpP3utjZ+FlG39DuJ/bTfCtm2221rNFjZfxO+E6UNx/Xw9OQdWYkmmkU
	Drd+9iXA==;
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQq-00000006J4T-48pM
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:23 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-783cf58221fso78009085a.2
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jan 2024 15:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310979; x=1706915779; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stuI7gBMJumChDGNuDa5NAtrFPgVVPyF9dOhkVEQIZs=;
        b=AglH5q+0KCgMtV9gsNJ1IJqk0NOMITonNrRYODNbZKH7uQPhOC4cCaq5nAuz4cbrGL
         pASWXQFi3QIbQT8NdiSNJ4QcqFU1yAINTt0uUulpqrzmBRrbKAe8Qq/pJZLuvuJGHIS9
         QH2qQjCVgq0+gMNDTKb4LquBaMqobdAfWtIpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310979; x=1706915779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stuI7gBMJumChDGNuDa5NAtrFPgVVPyF9dOhkVEQIZs=;
        b=deI0hdmmMZXfWCBZP0YfZZ6JZXAlWVseJMAtk9PJUut12kaCV3ipEySNCLAHPO5n/Y
         c8IyPM4ih+C4Ucw8lMCu91gLuinyJgg1hMvVW8aguwChBrGoYPImy2P45Cx+j7E2K8H2
         iaLobX60dj+yoJodyWl99RO415wAKip5zJn8avLZbDZLOF7ngxnekn4AdvdYuk0ROTIO
         vmBAsoEwkcmmKVslJzEgfxxHFeHNcu8u5Ywop8vmvIrtrCh4gaRqfWpDmajSWh6MPGKE
         C7vuEgQptgx9kl5zuHTNMLwFjMNKMGCy28fEgyO2psumltFIPQZqv7B43RMtyBYiyAPU
         TxNg==
X-Gm-Message-State: AOJu0YxVvEND/S/7RIz6/+qopQa+XrIJ5qljGTuUkvOAGDpz1rZWxt2F
	gslPYXZIbDIB3RzHXgWpsB21Mhia/zpPrUGNSyLu6NkARj8lGag9RDU3jxPO3w==
X-Google-Smtp-Source: AGHT+IEd+7JsySye9GLJ+DZua0TH24OzjziTyfzLeDvrZrUGlvpFgq8zte88/+mhTsCB6LhfusGKZw==
X-Received: by 2002:a05:620a:5593:b0:783:bd38:aca6 with SMTP id vq19-20020a05620a559300b00783bd38aca6mr655440qkn.82.1706310979526;
        Fri, 26 Jan 2024 15:16:19 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:19 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:12 +0000
Subject: [PATCH 13/17] media: samsung: s5p-mfc: Fix kerneldoc
MIME-Version: 1.0
Message-Id: <20240126-gix-mtk-warnings-v1-13-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_231621_729097_E428F292 
X-CRM114-Status: GOOD (  10.70  )
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
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index 59450b324f7d..7e7e7b695b53 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -612,7 +612,6 @@ struct s5p_mfc_codec_ops {
  * @chroma_dpb_size:	dpb buffer size for chroma
  * @me_buffer_size:	size of the motion estimation buffer
  * @tmv_buffer_size:	size of temporal predictor motion vector buffer
- * @frame_type:		used to force the type of the next encoded frame
  * @ref_queue:		list of the reference buffers for encoding
  * @force_frame_type:	encoder's frame type forcing control
  * @ref_queue_cnt:	number of the buffers in the reference list

-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
