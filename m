Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19C0C47DDB
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jan 2024 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DpbPPSPHFJ1tlvYq2LhbS5iXJEOW7nPGrk79Ypv8ts=; b=VxEjJx1IXZyG1g
	NZhSaZ+cnoZ8niaAq6jZr0dZPqljF3YeA4fsRpb+0agwVLOVtSB7Urt8aDrZd9+SlvRe86Km84Lg4
	piP3wKv/ixrLjRzJtZC2cF/sCY8Xo5hRBkKfIMMyazF/mWkjwOHMoKtJncECixD23EwY7ki5CrzVY
	xhnP2Bzu21wZvgm2GqeBFZLEHAgV/4goQ7mmXz0Cke7klQ4H9snB/UTn3H8Me7ghy0/Ejq1gEIEul
	HTXnKvLxreXeGu/pKjm/Zwrv+m/x674syZv1x/e6fOr0tJrhnmLtwbbUXmi+/Cb3xcUiyRk6GwSch
	XkidZsWZoofy3Uk2lFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVRX-00000005jHg-36NR;
	Fri, 26 Jan 2024 23:17:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQp-00000005ib1-1z4F
	for linux-amlogic@bombadil.infradead.org;
	Fri, 26 Jan 2024 23:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=K8jNV9DHXsOFSE/nzIDQ0aFfd3NfLzQF84gBDTm9ggE=; b=p0IlC7Q1Y9hz55FEv5DEzv2mrl
	CkoC2FAoc7ZjibtgDYHrCgvnaOb+hi42jupz40wgBC4xodrLosC6w77bSPHfZ5G+aC1cBPwffhASn
	eLQyQmYDA5rJrwNPhpgJzbBUL95vHFYky4y/HZiVX7i6g5vCgvTPFTQff+2yvAi4JePn1165roNJV
	V7nXYCroufaXmVJ0C7WV6X2E3Uyp8Erib4gQyllA7b/4OZs8cAco8ayknKIih2idC5ijXuHX6JrbC
	aTzXPPBlv5+IwFuo8AZca2vRsCfCftid6uXnvdVZ8LQzkI1zcY1TkuBQbZzo0+31zTVSvy49IodDn
	2Hdf3ghg==;
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQi-00000006IzB-1e80
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:16 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-783e22a16d4so11190785a.0
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jan 2024 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310969; x=1706915769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8jNV9DHXsOFSE/nzIDQ0aFfd3NfLzQF84gBDTm9ggE=;
        b=fbLlysoRQ2/1s3XQxQp/96ldxbnnuYisxz5oRefZcHgw1KrGyWTkWqsNvOrBCVd/xc
         LMGgW6vAC93pbzyqRa399rxBWFqm5ubTAGQNcOW+/jBUKEtoxbi0HuJb8HPpcUd9TtHd
         z6eaqg8deUorOor4fTgwJCUFXvjGGygrlFHcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310969; x=1706915769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8jNV9DHXsOFSE/nzIDQ0aFfd3NfLzQF84gBDTm9ggE=;
        b=V3y0rD0WNDltCcatEq6r33kqf3rf82GaXN6rX3U6kHqgDWQcylm8/kan/4xbeHUgPL
         sdBjJmTREHuBfqS3MQ6jpq3UH2HueZBdRIoYK2SDYx70nZtLfBA9OmGHR/s9mLCrrUCh
         zpz6UUCv5GgIxNfba/ESFK072dseJXulu7PWscQHiQ20WuyjbeDTsV2pX80fFnew2rk4
         /keTzEnIo2bZTQV3us2ohuvjt6NJPDdJwVyh8P8dA9QtUDniE2oAOvU8kITBUmDPKU3T
         H/8ehHhZD5r8xATJtldsS3Sfug5fvOJ9bY+5ChTrmQFdVGQW1ycpdARdhf5dVUHB6V75
         hfEg==
X-Gm-Message-State: AOJu0Yw52PghCShh4XpKVHdXvfpo0vXX6iq7gWFMu0loI47kZoKEUNMC
	+IswvtIJnq9B+FRgBl8tYXjCuLksHcdxj0nf/3Li6kMSeFqvDlRrLkJY88RMAg==
X-Google-Smtp-Source: AGHT+IHzyRuPGLIU9IzlEEdTKBGXo6/9Uou4vY0QASKHiYYbaa5Xmk9tSWpjCG3cIXB1RJj/V/BCqQ==
X-Received: by 2002:a05:620a:28c8:b0:783:8d63:f3b2 with SMTP id l8-20020a05620a28c800b007838d63f3b2mr1010002qkp.54.1706310969221;
        Fri, 26 Jan 2024 15:16:09 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:08 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:03 +0000
Subject: [PATCH 04/17] media: cec.h: Fix kerneldoc
MIME-Version: 1.0
Message-Id: <20240126-gix-mtk-warnings-v1-4-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_231612_699151_2D2435E6 
X-CRM114-Status: UNSURE (   8.61  )
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

The fields are gone, remove their documentation.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/cec.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/media/cec.h b/include/media/cec.h
index d77982685116..10c9cf6058b7 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -224,8 +224,6 @@ struct cec_adap_ops {
  * @notifier:		CEC notifier
  * @pin:		CEC pin status struct
  * @cec_dir:		debugfs cec directory
- * @status_file:	debugfs cec status file
- * @error_inj_file:	debugfs cec error injection file
  * @sequence:		transmit sequence counter
  * @input_phys:		remote control input_phys name
  *

-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
