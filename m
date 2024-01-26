Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6222FC47422
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jan 2024 23:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvATJ68UIiUMf9rT+YmiHVuMCmml/gZutMjEQzCq0og=; b=jfWZPG31pqpwY4
	yYu8eNt//L8WSJ6bn5pKXlEqSiNFvsatBZVcSe95ftimfg8bxGXTIdUCuCoMG0EIn+IDxn0BX6N3w
	Ac8ahbPkUnfzb6XLwGX24/FaWy/ykuYA7P0/7Azh5tbL5QhwPNvPClSDcjdqgvaTBJ+yeAq3SQ+lN
	2AExYUpSux7tc0OTFHCy9pLNNEGA3nF15ZNn+k6Bm2xjiMfsvXzJ2sDjiLATd0u1+vQjZK90njnmb
	dqYjIEz4o2LnPcGZtz7OwWlTzp3fjfgvp+cOGiWvyUrd54QL4BFjpKraIuOKVBQXm+DxXEW//5d8d
	l4kBC9s80qPxqQZvJqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVRO-00000005jA0-2qLM;
	Fri, 26 Jan 2024 23:16:54 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQj-00000005iV9-3f9J
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:18 +0000
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-783cd245ec0so73626485a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jan 2024 15:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310971; x=1706915771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dgr7uAnKOP7T5XfeX17z97swkwNkCZ42zeC6YgDi/s=;
        b=dX92LDcqOKYKKZ7SBfDQdWT5MQisIfUVNr69kWlmTUCkxYgeYFqiSvxkaq2ziHcC1Z
         OVYF7o4bY1QaC0YeSYEnzEjEpFBbpLhFCjpcTS6hkTO1jm+mpNa9iveEUgmk1DWKG9Dv
         /DBIdF8KwluqrFvfm1bd5arvfgEPVUlWRI5ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310971; x=1706915771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dgr7uAnKOP7T5XfeX17z97swkwNkCZ42zeC6YgDi/s=;
        b=kDm25vMin1hjsyPFoFlZvaAWJOHWJ9wTksGDn+zL1+MyGanuAJITj9ajjXc+WatrEA
         mKQQMkZyMgAiQKC2afgMTgTQPxxnF6Tpkp0fZ9PxEAlOLU6zKHi71X4bDsrj50ND+VfI
         wcLT1+LvWWybaKcMZugtrbKst/sLo3yl4PQ41G3myIBMwyrJOhUCDoZtbqPgP5DSh/zN
         7Gs1A8e36JJd5dO310Avl0pCNm/cR8OxuFRG2oWZLRq+Wb0L9FNN9FM2eaq5QwQRvp+j
         EQY/msgxmtu214k/RD2kUuUErUrdo2GTdbs0n1yKHEsus3e6agJGgEUH9GoPnPWmmavS
         PrPA==
X-Gm-Message-State: AOJu0YxjRsYwxzUWcmkMIkEVvYvpvjRLEsUmQUxG1MyVthJrEBTg2y6H
	+8MqtxK8gMaF4UiJzE+0UvwbifNuj9e4EaZuJ4FELVFvBpx9AP2PDMPSivNphg==
X-Google-Smtp-Source: AGHT+IHsMkOc7Y1zxu9ngxPBQ4/Ve5FRbTtg/VBTpnZVoIwUFy4DQtcLLUh2LbUFnAzoTvCw0KH84Q==
X-Received: by 2002:ae9:e917:0:b0:783:4dfb:11ae with SMTP id x23-20020ae9e917000000b007834dfb11aemr522337qkf.63.1706310971522;
        Fri, 26 Jan 2024 15:16:11 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:11 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:05 +0000
Subject: [PATCH 06/17] media: i2c: css-quirk.h: Fix kerneldoc
MIME-Version: 1.0
Message-Id: <20240126-gix-mtk-warnings-v1-6-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_151614_083442_C2017705 
X-CRM114-Status: GOOD (  12.94  )
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

Kerneldoc does not seem to understand that embed doc:
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'write' description in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'reg' description in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'val' description in 'ccs_quirk'

Convert into a standard doc.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ccs/ccs-quirk.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
index 0b1a64958d71..392c97109617 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -28,11 +28,11 @@ struct ccs_sensor;
  * @reg_access: Register access quirk. The quirk may divert the access
  *		to another register, or no register at all.
  *
- *		@write: Is this read (false) or write (true) access?
- *		@reg: Pointer to the register to access
- *		@value: Register value, set by the caller on write, or
+ *		-write: Is this read (false) or write (true) access?
+ *		-reg:   Pointer to the register to access
+ *		-val:   Register value, set by the caller on write, or
  *			by the quirk on read
- *		@return: 0 on success, -ENOIOCTLCMD if no register
+ *		-return: 0 on success, -ENOIOCTLCMD if no register
  *			 access may be done by the caller (default read
  *			 value is zero), else negative error code on error
  * @flags: Quirk flags

-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
