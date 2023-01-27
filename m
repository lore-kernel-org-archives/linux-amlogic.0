Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136D5C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kwpdPtebVuF6erlQyoxhGxWFJHaRLwjeDE8FRd+uJ/U=; b=kU7a8masy7j4xZ
	35QjkBZl99bt7kTVUBhx6znIEh6W+olIS7JYq5rq8UlsU0CV9nma4iHYrvF57K//obChMEb6aQtZn
	djE09m+AoXBaAgOWECwAUSUrB59EQuL0rbpqnqL24ZCG2S3DqzJUZscHkIEXX35eKV1goGz25PKU0
	V9vKe6qycVMj2xLY96r68SqQh0gyzZD8FP1aWTX5QZ41VhJf+IBCxP6hiJLM1oNoZkhouz3uG/uCV
	S5zHqILY+1Al38zY4aiNXFz4i7MBPd8osIVHQM6CrklmsVOi7mqBksKbKj/X77FOFAWQM5C9ZqYh7
	fdQ1KqGD+jLyyckkWPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLM8s-00DyBu-ST; Fri, 27 Jan 2023 10:39:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLM8e-00Dy8p-DI; Fri, 27 Jan 2023 10:39:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so3128706wms.2;
        Fri, 27 Jan 2023 02:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cdeNu2rBUonzxoRF7BM3W3tfmDx0o1jZ8hpPYfrDac=;
        b=DAc5fdvudmdCacf9+7vec558W+yzremTGjoG3Ptit4ATrUwdmQPHKnS0Jq969HMQAh
         aZQ+puLj0KKKZ88tsd9PPzXPeqgMTd+OJLHh2t7abbXBj1AzH1xzfhJv4BX5XsShqGoa
         ql4GDehOUm603Qx8w6ZhsbOneUVUm7UEmzlgppiODmDcjSOQAw6I/O4Efo3JIzo4U97w
         iFRxj9iGP098x/YXH7avsdu+xwOER1m2CfyGAlD3oAQOcRMP452aAAdjHmxf2TKbHn8z
         KAXnXVdEZ6vLyI5GASrSclvclBbyd4dNkePSpB7ql85fVt2VM4fkbeNW5NujarJey+qa
         c2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cdeNu2rBUonzxoRF7BM3W3tfmDx0o1jZ8hpPYfrDac=;
        b=mOZ6Y0a6ntxgvQMtHzbdCN/fsCmK3zVDAkMllPbYVCx5oUl8CVAsu1/I/9KV0T88Mk
         YMciT4/VRDb0OpprBVBd1dBXHFxW34iQ2UDtEJdoFFpVng3cLI+zWglPdvwEvB8PNCvZ
         ydNaXgyJwuaEGxKYLZYYRxl0WHgOFFcVfSEgqo1hYPn+UDaFteEnwtsXhiBzUz9iC20Z
         cCMGJWVXocC90y6yUDtQhHfteMM1lHY5NIRyRHVINDfZOcEjQnYQLLYIJj2aW4g3BNjs
         /qqUMnAd965Xc3dRJ5piwAiFh953SPZzYj3vNKkSmj+3aAcQLOl5UhpG3aes2/7gsRM5
         pJog==
X-Gm-Message-State: AFqh2koIcuvKnKibY+cq7FeGbOT8YUoMrb+mcvDsofjcGmvZd+sggxTr
	UppHQ+0KoDfUMGt+LIvbERA=
X-Google-Smtp-Source: AMrXdXvWPeCgMkd5bkB8/625YuYyvbABWLybVbF249vAUw4sIA1kElnWmwvbpBrWh7Il/OVvdZCPhw==
X-Received: by 2002:a05:600c:3d98:b0:3d6:ecc4:6279 with SMTP id bi24-20020a05600c3d9800b003d6ecc46279mr36100281wmb.27.1674815958374;
        Fri, 27 Jan 2023 02:39:18 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id j2-20020a5d4482000000b002be063f6820sm4348243wrq.81.2023.01.27.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:39:17 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: radxa-zero: allow usb otg mode
Date: Fri, 27 Jan 2023 10:39:13 +0000
Message-Id: <20230127103913.3386435-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_023921_479398_E3EACD99 
X-CRM114-Status: UNSURE (   8.85  )
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

Setting dr_mode to "host" prevents otg which can be useful on a board
with limited connectivity options. So don't force host mode.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index e3bb6df42ff3..cf0a9be83fc4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -401,5 +401,4 @@ &uart_AO {
 
 &usb {
 	status = "okay";
-	dr_mode = "host";
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
