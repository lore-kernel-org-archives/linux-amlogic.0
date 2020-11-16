Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0DEC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 04:31:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D0E520578
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 04:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yGpQQd8E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwebiu4H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D0E520578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Du/76X86RgYzq9g45EnPorgP/9uYDYe1z01AniP2Q5g=; b=yGpQQd8EGYhh4dggDpheUXKGld
	oIU1eRyAcjWuh/oskgzhdV98+uFnlR2R0h8hnzVBQWvyAGpP5pWI84Hd2m9A/aOoStfALjvld+JmK
	kasp2ElTpVneitWI3QuYMh01U0fOZUp8XX4GglQnzRJGridF4gdQMvl6/VEtuNxMeOcBIFcx5SgMM
	Iys1QlMTClMkooUT9vfysr8DTLDHVQXFwaEKv7zaOhuKbsUYjr9Q1MP/e8JSpkK4J2+cped/3PsYI
	3bwCEfd+5JZ/sckam9GQ0gTcTl7TftBZ60o295jdxFnQ0wh5sB0x2l+8McNuqlIl70jCZm4vxqY7o
	5sSWvdWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keWAV-00049O-Om; Mon, 16 Nov 2020 04:31:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keWAR-00048N-9F; Mon, 16 Nov 2020 04:31:05 +0000
Received: by mail-wm1-x344.google.com with SMTP id p22so22483562wmg.3;
 Sun, 15 Nov 2020 20:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1ykM2PQF8UjrQNrIxTj9JuB0X1XIeh6YbXFFU1ntkCM=;
 b=Uwebiu4HIVuABcHK8lNqFk0NZxgyA8PCsBSykCBhRoz6Sd9lzj/QOTTFvWpIUZrVZx
 QUceQi9d7XcR4i19LHPrx4fblUKtMmwshf1qn10aMaxtvcK6kBkHNCxfzocXZpUz9Dcy
 IWJ+iywdzys16kK91aM4ZpnMMiE9AKVFpLI+4QB6Cax/MVTnBYn+vb5UWyu4DVS6Rh/L
 cRpU1hmnB3pUSE8RzfHK1DxQhszbJt9nLsROaDrZnHwg0TSojiOebIOvgDrdhQjgU5/m
 8J4pG92sRVO7NC82GjsIeoBmyaj6MdsxAOIfTn3bpIaE67W2iO8KHgA14OpXrcBx1iSt
 gjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1ykM2PQF8UjrQNrIxTj9JuB0X1XIeh6YbXFFU1ntkCM=;
 b=s3pVtmNTOuuQP1X72EyJXpwwwlY6Tk31qE1WnGk6Be7EfpafVkUXbCciFNZM8EYvZa
 VWd62oEjD8TSKqBocBu+E0ZI/F5sLLC//em78KznSaLeyfr4p4GQt/K46l57X2A0MVEv
 et8gQSBjumDU02nzK70ne2NQrOxoZqqpwSTQeqf2YyDFbXsZBEh4KM+doeUgXDthusW1
 BIIm/dYftK6+dmvM/hGQDTGhhUb4/i+opKeECEp48iSDjln5B6ftFQb58RdCdu5cBiNZ
 1R+UM3f6PVcPZVawtmb1Y/Mvx55HTeVucWaQPfhWPi9kUmDRHlumsXr62JAzwY2qGtfx
 DPWw==
X-Gm-Message-State: AOAM533C9srn9jOY0lQs6t7sWw3uXsX8TSryUgNMf+Y8Pt2Q6pDbhOqg
 D6bG+L33UgGF6o4J4/Z0VVQ=
X-Google-Smtp-Source: ABdhPJx8GlPd1wNv46eUCTw1UhIOajMx1D+l6Y9uVJsmoqiC4qc5rEMeGJXgpeioam+KFMondDJWFQ==
X-Received: by 2002:a1c:6704:: with SMTP id b4mr12684331wmc.96.1605501060484; 
 Sun, 15 Nov 2020 20:31:00 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id f19sm17609525wml.21.2020.11.15.20.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 20:30:59 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: add G12/SM1 to module description
Date: Mon, 16 Nov 2020 04:30:55 +0000
Message-Id: <20201116043055.23655-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_233103_373636_34479EB3 
X-CRM114-Status: GOOD (  13.61  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The meson vdec driver also supports Amlogic G12/SM1 hardware.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5ccb3846c879..5d4db7a5b4b5 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1131,6 +1131,6 @@ static struct platform_driver meson_vdec_driver = {
 };
 module_platform_driver(meson_vdec_driver);
 
-MODULE_DESCRIPTION("Meson video decoder driver for GXBB/GXL/GXM");
+MODULE_DESCRIPTION("Meson video decoder driver for GXBB/GXL/GXM/G12/SM1");
 MODULE_AUTHOR("Maxime Jourdan <mjourdan@baylibre.com>");
 MODULE_LICENSE("GPL");
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
