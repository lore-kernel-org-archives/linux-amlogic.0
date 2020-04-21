Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB1EC55183
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:17:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6028820B1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QKL2m2SK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1+nB5uB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6028820B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M6rGnB65zziNPKcPv4Em6GFEWV9+P+TvkRjdue/IaZM=; b=QKL2m2SKZ4E+jlj2GZIH3XuN9C
	5uIsjyywmGwcSg3ojY5Qt6WO1nd4+kVzfjRQBxwdZ0aCjIeGzt5Ycz5beLpXBB7pHqDcfB1o8OyiP
	jM4QLzMGz1oPxJGL4PQxZiyyJsl3hINg7ViqtqUWueIXKWvXWwgJUSbJEvN4Rt9h8oZ5QcofkMEvA
	RQzMMByVsjpYSO1Xi++X9795iT8q9nQxizwElmTonF0mctaAW6MqFO1JWWcDJcemL8778sLWn9MzN
	KYjdm/DsbJ40fzehsHoztmHoriMm6Fro6DzRYRy+9AWBzLf0R9C/VVubyz5+0FR+ydJYkyxJQ+e5F
	tEyep/zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQo5j-0007Bg-QP; Tue, 21 Apr 2020 08:17:15 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQo5a-00076s-TA
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 08:17:11 +0000
Received: by mail-lj1-x241.google.com with SMTP id m8so13034371lji.1
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I5j2meaXqfCQg6EDK5Yc89bHLLGnzZUOQwGDeJZNWgA=;
 b=E1+nB5uBJ2Lvjqr0F2R2j0bbl3P9N2oY6AHBJZnv+/GOutnQoJb15Y0NW2HiQ6cxRI
 my4chhnr8EQXJIog2d5xI1Dpg2A0bLatoQ85g/NAKsmGjnJ/aEe6aEVLQHyn1abwkRE1
 svd91vjSfOWroeAPilW3Kj8YD2iCU8vRJ53F4PhItDzhHrA70emZX8el+lHqiqHltbzH
 iua38U2ghEIQJ7L3vNh58/1gsgf+Z8Rxn+RxpLJUPX9eEn9aObgfETlEez4llz6gMve6
 V/+Mwa+LXgbbK0WQRMDzxG7JkGMtxlyYRLjlLA8rFhdvI9ajqsSb0py/GPnfYCsK/HlM
 QaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I5j2meaXqfCQg6EDK5Yc89bHLLGnzZUOQwGDeJZNWgA=;
 b=kIeXFqyTnN+cdTCsyCHKSSv/6QsyeJv1zxZgA/dpKBdwAKQTpT5lbzxKfPJbe2Rn6K
 dWnnUdcCLicuAggb/eF5WRsK0u4Yl6akUnNF3j6xpXdWPrGIsDoA2OagLmXNVIdj9Syx
 Ypq6qwjo12s/sflZlSedBy4/7G2sMxay3t+3j2deH3oCbS5RvFnGwscV/QYrXsGzSdrg
 epbo8fcd15apOZzerbICjGwKy1/XrJu8qTw91uTXJp9mS7xAouXOr7mKmonmnPTpW4ER
 LCPK5QVXIv13BmYfaPvcdsDuO/Df8OAt2jWcAvXBl9Qd5CKEt6486EbFgrQEej6HwjQz
 vtmg==
X-Gm-Message-State: AGi0PuZxNa5yQ5/RMOcN2pX/pxhej1hDrGECoAJ5mVcbRF1qLX3PxfXM
 5nwM4a/BQ4c1KMUEN+zmC0w=
X-Google-Smtp-Source: APiQypKUA5C705+SoOWtEmSGF73au/UD7TbUtttQo3xwBmnBpYc2nLQjSuRpGgkARK/BASUxJDxPwQ==
X-Received: by 2002:a05:651c:20f:: with SMTP id
 y15mr8030841ljn.230.1587457025160; 
 Tue, 21 Apr 2020 01:17:05 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j13sm1472756lfb.19.2020.04.21.01.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:17:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: net: bluetooth: Add device tree bindings for
 QCA9377
Date: Tue, 21 Apr 2020 08:16:54 +0000
Message-Id: <20200421081656.9067-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421081656.9067-1-christianshewitt@gmail.com>
References: <20200421081656.9067-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_011710_023517_C1D9A599 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QCA9377 is a QCA ROME device frequently found in Android TV boxes.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
index d2202791c1d4..2fec6912e160 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
@@ -10,6 +10,7 @@ device the slave device is attached to.
 Required properties:
  - compatible: should contain one of the following:
    * "qcom,qca6174-bt"
+   * "qcom,qca9377-bt"
    * "qcom,wcn3990-bt"
    * "qcom,wcn3991-bt"
    * "qcom,wcn3998-bt"
@@ -20,6 +21,10 @@ Optional properties for compatible string qcom,qca6174-bt:
  - clocks: clock provided to the controller (SUSCLK_32KHZ)
  - firmware-name: specify the name of nvm firmware to load
 
+Optional properties for compatible string qcom,qca9377-bt:
+
+ - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
+
 Required properties for compatible string qcom,wcn399x-bt:
 
  - vddio-supply: VDD_IO supply regulator handle.
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
