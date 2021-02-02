Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D12C433E6
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419A164EDD
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419A164EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCq7MmvGkWlgP80T2+1DhCrzALvUEiuvhQR+Q2Hr2mU=; b=l1ScUZzeRatqvvEOP3Y13b4MYA
	nYM/Qgzm4UQT2K5nepYe4BZvj0rK04hNYydcBBTS1N78dNRXgPZfdrd0m29D2lFoqUYzp3vQQdf0d
	IqLW7W2yImG+noG7LX5oD/Kbd70+IZIhYyBeT6DgwOOi9g/6vPpvJan/jdAgieFgrY8ArAPyL7gIt
	FUK8A8ZMA3QzjvG1SPaRMDvxK4Xv2oBX2HE0TO1Owqt6SvDZT9R7UFZtSBq4WzP2hKPFSYp3dyBY9
	nn2WTv22Wx5CyhEaSDZmmPqFu2DCsIDOp7qMijQu2L/TxQcGMR87TGgMnCM5TJoFBJ7pd4YITvXR6
	SEHdIohw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6l9F-0004Kr-Qm; Tue, 02 Feb 2021 02:10:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6l9B-0004JW-91; Tue, 02 Feb 2021 02:10:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id c4so16028004wru.9;
 Mon, 01 Feb 2021 18:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9xOUKO2XKFLeSm4wVIMXSdkTxiy8OHddK5mDTptdxKU=;
 b=nTrwA/bfhrMSTUtiwyKvX84Zn86AcrWRQF0mXnJQ01zf4FHwi8wgGFr1cQscLzjyEa
 zvWVxICc17mU5fq18gcaQX2wpgIAfQskkKAs36tuvpnVeZhZMByx1jXByIBqZLjT5gzu
 6WaUhH4Z6aC+TkpMMGw0pNNaoZqkZm4jziWgTA4Ow2H7uW5lpIjqgd0jaGxzEkeGi7P8
 dfD9A7Eth0U8V2kG7AckQpz/3xsjfG40aTbZJcRGCeX+Sj0UpppH9Y28blcldbsFBgdc
 42WfJ2WXzR77w59Rsyl0R+Z6C36gjHm8aP6ckPG0CgjIq97VF2ZKbCL27rFf6HtoQ7C+
 cL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9xOUKO2XKFLeSm4wVIMXSdkTxiy8OHddK5mDTptdxKU=;
 b=avNbPMDDnV67HFan3gFoLYc5tcYGj8gRIiGmg2Mb7CbVdurIq/1wZADJXXuf70IO5X
 rNlfU6udtB7g9w1YD2hMoffZXkmAkpfE0BqUB3QPzlYnydIxju1eI39AdkgxuYLbyn9e
 CEzo0jNn0dvj9OfC4y/+NyvATgeCrG+nGBuM6lhQr0vJJEkgQIS53ZLUSNK5pflXwyS4
 d0plkkESNwcEA4Ltt2EXUmITqQV1e/IMk77Wzp51E/UGDSUTDqRFcCGQbEL7oo43AMUm
 MEENY3n26GEewhoMBtYgCnvVBqrQ01s8qugPqQsVntCG2/6A5FMYfCJP/VlLvrCwdvVE
 eZBg==
X-Gm-Message-State: AOAM5339J6T0nmFmT/Y35rs49Ey/wSmAVMphGh0gFE6xtVW+HVsIPlEa
 14+ary5oXLNPQpuLpKGx6/4Xj1MlxtorRg==
X-Google-Smtp-Source: ABdhPJx6ZWXpoOZVm6QgJHNsRJkiU0/hVUk2t1g4sekaaXJRU3bsQXMe2U/mxHab1BsEKP703HQpsw==
X-Received: by 2002:a5d:4dcd:: with SMTP id f13mr21028655wru.10.1612231828014; 
 Mon, 01 Feb 2021 18:10:28 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u14sm990570wmq.45.2021.02.01.18.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 18:10:27 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: arm: amlogic: sort SM1 bindings
Date: Tue,  2 Feb 2021 02:10:17 +0000
Message-Id: <20210202021021.11068-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202021021.11068-1-christianshewitt@gmail.com>
References: <20210202021021.11068-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_211029_346988_103BD718 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Sort the bindings before adding new SM1 devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6bef60ddda64..b21ba8ba23dd 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,9 +164,9 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
-              - seirobotics,sei610
-              - khadas,vim3l
               - hardkernel,odroid-c4
+              - khadas,vim3l
+              - seirobotics,sei610
           - const: amlogic,sm1
 
       - description: Boards with the Amlogic Meson A1 A113L SoC
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
