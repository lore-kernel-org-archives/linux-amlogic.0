Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4654CC47422
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jan 2024 23:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjkAj/D2HwC9buh+BIk4Zba8KzbdQZmKB2yXmxTgrFU=; b=qD2SLrBWGfbBwg
	46/LDadaonk5QWLV3dH7PXXvHKpUJpVM/TKcCXQ5qcXdtK/DGO8JYidHVqJYXVHVET9DXfvnbj1FN
	CXY7LmuS6cB/YwFIlNbz47qgev4gMJaVnnoVRE6Hy8ZG/BdDXtd83UHR5X0NJ+WHLa6itr54G+zFi
	9tJcnuqfTDnz4qkAXlkjAy9rqcV4HDDpdj3g33FAUfgqP1iYWztxbKZqV2qiIknfqjLZAkJKaSZwX
	B0XEC7k5cy09m41tM68dkiK6ImPyU1lFxQ2ePLH3HLDMpwX4Pe0VY6Qo5GIzD4j2nfphZ68vRorej
	/Gtc4nJMIuz7HpV5FWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVRg-00000005jNn-2yVE;
	Fri, 26 Jan 2024 23:17:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQp-00000005ibO-3Vbc
	for linux-amlogic@bombadil.infradead.org;
	Fri, 26 Jan 2024 23:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wJ0m3P4movTLz/Nvfo+j871i2YxzmvzYNu3X7u/7SQ8=; b=Kz3aY2Zr/PAaL3vXrTnpO7V++a
	xpX1V7IVnAgi/09nNW5U/cazJA+A5DS6NqgWNvIs5lg56y1KR0krRsQuEecFPRowKy4HTkTS5x+ZF
	rA+EyvMkgv6hncYeK+eNHae1onbIkUu42mdKiXjKol4azOwS9nNf5O1Alg4/6g7HNrU+fVJiZgk9F
	bumn9m0NgZjEtz/lf1ErLBi0bDUdamaVEGJOOTrYdae5lSVIlJGVsMyHajmHTGr89x02lGXhj50Ex
	a8AwSThbal7CMs0ziPph3U9UZv8WrrHaDTEnCql6U6wvE5aZ0NuqDeWqQoG75+AAveH9dKhC4SFxl
	EHAQdu7Q==;
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQi-00000006IzI-1eVE
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:18 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-783ced0216aso46176485a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jan 2024 15:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310970; x=1706915770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJ0m3P4movTLz/Nvfo+j871i2YxzmvzYNu3X7u/7SQ8=;
        b=V/woJ72P0KPgTjccHZNUk/RP+t0EVdl46aTfIEIyS7T7wsfnd6Ihi0LZYSgobQDryM
         Wc/PLhO8tJUP4G69oBLb+eZUDzoz0NiQL3eWWap/vaIdOI9PdnYbCchzSHssBUDDf25n
         DFXb1t4MmLKPPxfMf6ha+AbEASm8AN+xtnvWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310970; x=1706915770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJ0m3P4movTLz/Nvfo+j871i2YxzmvzYNu3X7u/7SQ8=;
        b=J+MEKzETraGGjA8SUpmK9oMb01iYH7xD4VCyuzFLix8gIlgothVCPOsmVMImRPQguU
         tiVqBC1q7qy+xNAOFNKNJXiY3IlNIsAEC4mK/qiNUYod0Zoxw6KB+rdzvDfFh1rcHTJD
         7fddBi5hf7oTYRmPEjy3UQkidWAjDwNFofaWtnBqX77jlYsqbZoho4zEsqkQq8BnB2LS
         m0I1fdVjireAk9MYw18VTg4+V57ZlILpD7LaLhk3WVW1BsIAeKb4EVXcV8h+/3E00vEp
         bJVt5TGQ1dRumnIXI7AwxEQ9B4v0nvOvgST5TGe9N5gKY3BVHgNrZ0MZEbLn6RakzS2T
         cdiw==
X-Gm-Message-State: AOJu0Yy3SnkayWRr7fcpRWyq9YOHQz7OK01xzcTsNQKssxp9r9nRSmKl
	/PD3QnviNaRdFLovqNd2vUiGnOCHJt/CMzZ09wxNGNXBsbJrjsje2bOP7sykgA==
X-Google-Smtp-Source: AGHT+IHAmNfItdlyJWsZ1GtS50XKPZcd4sgiZnzEdRhsQ66Nd+BshXmAy/d7aAGqJVN+Us+VU1C3UA==
X-Received: by 2002:a05:620a:148c:b0:783:89f2:d9f5 with SMTP id w12-20020a05620a148c00b0078389f2d9f5mr495965qkj.104.1706310970554;
        Fri, 26 Jan 2024 15:16:10 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:04 +0000
Subject: [PATCH 05/17] media: pci: dt315.h: Fix kerneldoc
MIME-Version: 1.0
Message-Id: <20240126-gix-mtk-warnings-v1-5-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_231612_840860_D0649CBC 
X-CRM114-Status: UNSURE (   8.90  )
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

The field is gone, remove it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/dt3155/dt3155.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/dt3155/dt3155.h b/drivers/media/pci/dt3155/dt3155.h
index c9ce79cb5566..ce1835d9691e 100644
--- a/drivers/media/pci/dt3155/dt3155.h
+++ b/drivers/media/pci/dt3155/dt3155.h
@@ -162,7 +162,6 @@
  * @height:		frame height
  * @input:		current input
  * @sequence:		frame counter
- * @stats:		statistics structure
  * @regs:		local copy of mmio base register
  * @csr2:		local copy of csr2 register
  * @config:		local copy of config register

-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
