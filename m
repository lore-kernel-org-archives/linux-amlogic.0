Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47711C25B50
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWX9RHU5Hb++yT8n/PJFS8CypXTjsdCF7BNBmdsbhPo=; b=vBzDAMM1o85Cq8
	TwM8Zr3eW6eT94EEMmlH/TQ7AyWnX1ngNRkSOBdsL8JxVdx4EQcyOPXqsAHXO2HP3ryndQlQR+0h+
	+rIGh+BtAMtkM1I1H+YzouSizAyKoDfmlb5C657BO2mDcnugSvTynFRRbUXGoYV0qCIQIkv5FnrWI
	Yt/C9gkVeFc8k5BQ5SVn9Lo4Hia0292ITCoGgFMGNcuqKSZm6UC+aAagbCTjDgE5qsvCDcsQniMO4
	G8zM6vF3H4Yt5Xp7YEeqOMRzBa4IecMSpelfw6GDcF93PsiJ/VmTUYY2EhAsqZnWtOB2xxPFXpA/x
	p2CJedrQirMdz/jsXwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7P-00EE8u-Ec; Sat, 21 Jan 2023 17:57:31 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7L-00EE0P-DW
	for linux-amlogic@lists.infradead.org; Sat, 21 Jan 2023 17:57:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so7755086pjb.4
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 09:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8xerOhLO8JTLqzPKced78KygnBvXGTTylBpFDCkDJg=;
        b=cUDItZmBvVh5WDYr7E2FPoJX+xvQ3P5UMmOmgnyJ6TFVn2TXMGtNx7M1LcUKwM0fXD
         AFrAcl4Xaund8P53K9cNUAqhScIAmJAQD+tGBomQO7cHHnOT6OP6eXfvvcz7uHSIII/r
         qaPGgs/bXgrv/zbL+KelfVhdkCL1Mmqf0ZL2Jaai7TXOJBmnxXJjdb6BV14zQwMRtBWs
         FCeaXi9WYA8z/K31PrxsaMJwdiRjD50jBm3XCn9Cb4O8A7OXQ0WuOsVCmAxQYRQj6W36
         0eHAX21cZTvFSoJJR1io0t69icFdxTzyUUakQXGmftBqq+L/0vZOvlDF1k1LjPRHvfSI
         RvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8xerOhLO8JTLqzPKced78KygnBvXGTTylBpFDCkDJg=;
        b=iAREiWW9uKUQ9lNw9+u8ZVAN23FsfNWAsK/JIUq9JR9YHjTxxdAu2D7AEG87NRr6Ef
         Pu6BTnawufPTnEwnQRnXkaaSBNZ3xJQjzyVXbG2ILu9CQP/Z/aSbTlNgT/oYG4wDFPdY
         Ttz2Y5pwJ7N7qQ93UufZc6XNh+ut+HhVKCpqVDP7o3UD3DmHiXihG1blQpN3JUf0l/3Y
         SdYB86b7F66h1tljf+jlNeKAY5YNs2ZmrpsX616pLR8wVsp6Evi8Sn8MIPZkCfw+diGI
         1++TTtA07FbnXFcYu+Ayp1lVnqcRACOTHAfNbtQ9gIEye6jpkeBQX10fqQOi3HdkKX/h
         jnVQ==
X-Gm-Message-State: AFqh2kpDeXh6KkwXvt4eTXGS19bEPzMb0Mpe9VC37VVqll+kj1gOg6c2
	1JKHZb0pibeFbhOp4u9PeOM=
X-Google-Smtp-Source: AMrXdXsIU8tIRkm+vufigl+w38qOxbT1W4mxmURgtnWiSMXQvnsZPPB9L3Pw8OZa8rDBd+2S8LEzHA==
X-Received: by 2002:a05:6a20:6a91:b0:b9:92c2:7ed5 with SMTP id bi17-20020a056a206a9100b000b992c27ed5mr4487904pzb.22.1674323847084;
        Sat, 21 Jan 2023 09:57:27 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:26 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] vendor-prefixes: Add VIA Labs, Inc.
Date: Sat, 21 Jan 2023 17:56:33 +0000
Message-Id: <20230121175639.12818-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095727_478024_F4292A96 
X-CRM114-Status: UNSURE (   9.53  )
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

Add the vendor prefix for VIA Labs, Inc. (VLI) is a supplier
of USB and USB Power Delivery controllers for multi-functional devices
and platforms.

Website: https://www.via-labs.com/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: - None
V2: - drop Drop marketing, so without "leading".
    - add Ack of Krzysztof
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 70ffb3780621..d19b7f9cef4c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1398,6 +1398,8 @@ patternProperties:
     description: Vertexcom Technologies, Inc.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^vialab,.*":
+    description: VIA Labs, Inc.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
