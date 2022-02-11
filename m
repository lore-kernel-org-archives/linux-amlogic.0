Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B3DC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Feb 2022 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWpJF3Ygh1dMzi6OG9WMDKBsMxL7eWdI/jPJKRADyvY=; b=erOqwL6faiwKQp
	ZcjiUUT9i9K4wSktsHA71RbkoAFC4/VNh6GsDnnfEzsV6F5zaTWv54ynAWKXnMc5/pILRfwu5mD/9
	VNoppI8BZvTRWWPCeTDbi68MeuWH7Kltx/jWRHhbL944JNcncwzcYlcTg2bVg0iD0bx3Nk6hCyoqt
	BSaFbdWaYjFu6aUi7tz1ke9JMbojc4//hJvOdQ6FO4lsnxscbTCJiv86AELRa6LS8o7eu8UhQWSXI
	opCHjewlvtBuJdI29s/7Lhm2OhGaO+WyTlZAaTHmC9rTLubGsNzkG4U0lj5gnEAIPnUgrhCtViF3Y
	z2TfLVYSeIy8SrGBjKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nITh2-006mat-Re; Fri, 11 Feb 2022 11:02:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nITYJ-006iEV-0z; Fri, 11 Feb 2022 10:53:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id n8so341982wms.3;
 Fri, 11 Feb 2022 02:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CINhVeMEJRnxt2N7nzrBj1BDzXGGBYQDuFCYQXZDz9Q=;
 b=AbUpsLT6Q8vFhkID6EtjOaQvpWaHkS8QEeygk/0buxwJJSzps7TIiknHO5u7Bt8vgZ
 MRlKnhRrPyjgThb1imLklvmKr74OLC0S9nEsID7cF6ZXKvSNlcqOiYZnGWCGVB8Nu5zd
 IG7rh3FUOZV+PsT/roqqch8DMo1V5wEYeHcjY26ib4ePjxu9uP6+JCnCP01tCgORonp/
 XMfKzAqcVQwqe0C3U+AOjyJsd4mdETt/5PV5zUuLBuGpXBLEQw/qVCPUeC2nhHz+n3B4
 1WAmJb6e4aUlO33T6FYcxwVLLQ2eMQaKAB25LOYsyk8rbO7Q2zQp52fZBzJ0mWNqDFY7
 28yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CINhVeMEJRnxt2N7nzrBj1BDzXGGBYQDuFCYQXZDz9Q=;
 b=tX0QAO73H2NwzIRsom4vJTbJPtzKpyYX8MnZ7vNYtqmBuK8sTuUJdGS1ZkGdppAASZ
 wLwtkgkYOmUOZzVCx4Szo3WWGpl78rBlP85lNc9P5W6zHeXlFTBbc11cxyEzGEno8ZPo
 Olgp0CMPi8IM/MewSbzujdo6Qz4bOo0ZCL17/pu/y7vRMurFfi76yh8RFPhUn+egTHnk
 nLifigHwUOu+Ay0nblarKvbVRgebFkFbShJsKbdIy/4KQNb5CBjZhH1c0ngssnAOaGRh
 +rNfPZdhCou9OiUQWhA49NnrSHT9KjH7BmC42JTbDGYtjBEs3SoRNezHnc0pP2/ei20s
 O01Q==
X-Gm-Message-State: AOAM531Fr08n2eWz6KfGAFfzTebi2w/Qh7kR2KwXE8QC4oI1ASgT6xVY
 fL6VxVha3r4PnAciCFk0zyU=
X-Google-Smtp-Source: ABdhPJxZoV3f2mPoFwf+yjHEB+HwKykDyDVn9gQPt43swzkwS5t8kbcqYbm7hJozMCJ+l5xx1K1weg==
X-Received: by 2002:a05:600c:4e4f:: with SMTP id
 e15mr1680626wmq.53.1644576801279; 
 Fri, 11 Feb 2022 02:53:21 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b4sm13382374wrw.100.2022.02.11.02.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 02:53:20 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: amlogic: add Vero 4K+ bindings
Date: Fri, 11 Feb 2022 10:53:10 +0000
Message-Id: <20220211105311.30320-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211105311.30320-1-christianshewitt@gmail.com>
References: <20220211105311.30320-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_025323_136873_E0344680 
X-CRM114-Status: UNSURE (   9.82  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board binding for the OSMC Vero 4K+ STB device

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a073a959232c..61a6cabb375b 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -108,6 +108,7 @@ properties:
               - amlogic,p230
               - amlogic,p231
               - libretech,aml-s905d-pc
+              - osmc,vero4k-plus
               - phicomm,n1
               - smartlabs,sml5442tw
               - videostrong,gxl-kii-pro
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
