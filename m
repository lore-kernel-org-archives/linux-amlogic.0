Return-Path: <SRS0=5jQr=I7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253DEC433B4
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Apr 2021 06:46:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF19061103
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Apr 2021 06:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF19061103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltPvdtXd23wcRZ2Wx/NSnUZcwROqAsYv/V62nliHm6Q=; b=aZulEMFWO/4tcAI6DVedayvYwT
	xjKHHO93queiQKn4c6o0Hb1kR4W2VLsVdh2pBWlMlXb7uvZ4lNB+2mMOY2DBU2Ij2OENZjxQKWXND
	uiiH9UTRwlHlV7jSP2G4kPXDLi3Tq92z5/+2saCn8kPEE11UbGRyM32G15FwuV0y48PiHoPinqlqr
	JaDMMYkL4sqbu9aalYyOMxhURj3wMqvpNNYegZpyBFtaia96bHDu28MUf6CMvx44S0+VM1vDTRAmT
	bfENsy0COdK/TdbPlbQz2En7Ffs3xBw/O4koYtoe7HzXmvwZCbAjKzLYdHMRPrYBPg6Lx4YIh2CGN
	TdV3tiZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDZ7-00C8I4-Ui; Fri, 02 Apr 2021 06:45:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDYe-00C8D5-Ax; Fri, 02 Apr 2021 06:45:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so3864914wmy.5; 
 Thu, 01 Apr 2021 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N0OketV9lb8GEiKVSoEqWRXm1t5uGV+3SZ74BaVyuOE=;
 b=N63iAdEwZoQIdZmDHBbgVXlEl6PYhcURO8sOiQoljSSy37iwlEGlCRr38aQ3bulRrf
 wARegn4Uh7Rd7kvYUJbzbQKZwTqR9vIR3AfJMbMbIwOZpjSmgTamtmcGn228QQVlCYX6
 44Hy+Uh/SVXW0jh82Gy31H69niFyRdgeIZpxtPFzOw8ku8tJ5YIfMV2YyDsy+DwgiOS1
 atl6r5S2fGuS3jQ4Ye5gvPlVyrKC4cUh6GTkBIMk3MrFgrVDMHf5s3rjFx4FmxXwfGiE
 d+CBbzjFyOz81IMzp/+ihv+qJi+gRXPF1CLzCxz6Zb5xEMkxdf1mjup0KKQgAf0P2Gl5
 3mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N0OketV9lb8GEiKVSoEqWRXm1t5uGV+3SZ74BaVyuOE=;
 b=s3Y8GzyT7/NYFaCX6W423jPGJA78Dy7KHimVvM9AVHNiTPNJ8UOcE36QvI6frcfJI/
 EWLakHGrenwHHbLC5aQKRPfg6pf2aJvLDABfeX9u3Qki7YQWdlFgnHS684B8z6Fevl7g
 8RTA1eBMXQ+bkPXn+2fk0rDPpDadjEkNJt4tXNn37uh+k6JPNgTytN26xepjXRu7xcCP
 hIHm7rQ/1wYN7jNBGQ/gmCYp7sF5adCBnWEAJn5NqDTUU4BQJlh/uhFoyXdo2AjVGN++
 EVpH4JR8wXcufKt6OAR67OfTzy1yZiLZB1x30YAhTInIYGdbtnh+YA39yM1H2VLgZWPr
 pfnw==
X-Gm-Message-State: AOAM530Gs62uEBzVVQVCQf68uLBaKI59b+SK2Cxrw+6u3Mpuaf5AmDcq
 Dj6bcXlFXOIZ39RENt2YMUk=
X-Google-Smtp-Source: ABdhPJxNhe/ynQ6DvF5atWT5o4I/4nm1EDQkMGphRyJm0p0wLeQd4oscty3feI1aTtGJQrDbiDNb0A==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr11159207wmk.156.1617345927841; 
 Thu, 01 Apr 2021 23:45:27 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m17sm13627131wrx.92.2021.04.01.23.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 23:45:27 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: amlogic: add MeCool KII/KIII Pro
 bindings
Date: Fri,  2 Apr 2021 06:45:19 +0000
Message-Id: <20210402064521.30579-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402064521.30579-1-christianshewitt@gmail.com>
References: <20210402064521.30579-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_074529_469343_50284F53 
X-CRM114-Status: GOOD (  11.11  )
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

Add the board bindings for the MeCool (Videostrong Technology Co., Ltd)
KII-Pro (S905D) and KIII-Pro (S912) devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index d24334e1e166..97fb96266344 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -109,6 +109,7 @@ properties:
               - libretech,aml-s905d-pc
               - phicomm,n1
               - smartlabs,sml5442tw
+              - videostrong,gxl-kii-pro
           - const: amlogic,s905d
           - const: amlogic,meson-gxl
 
@@ -123,6 +124,7 @@ properties:
               - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
+              - videostrong,gxm-kiii-pro
               - wetek,core2
           - const: amlogic,s912
           - const: amlogic,meson-gxm
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
