Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F09AC48BC4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imOFz+iXdfAVxr3/633WiuTm21nIc/eldAbHeoL+ijw=; b=Ir104flwxtjy+V
	b5OU9LqYduIuMUYNKAfhmenpcLhl6qXom42Sv9zXRBcG3qCnyLD3oJDnFIqSWsEXfrJSyGXXlnb+b
	nxNmg96CF+jqGZmhLhxxMKK5pVjBENTo2swabFJDE4hxPIfH8bxk6d9WO8Qsr6YeXIeKtY+ccp/Lo
	uJErs3twgFqrBbV+eR3ICd9+y9p2XDpzk3NT6X4YgrJ2hg3IzUE+LsjId98q9EDsxFiLTEdBq8cTg
	gTdIs1lep5ZbDbWRmcTi9vhiud7HLK1DgGYR9h2jeSjAOOXmlsXQTrdEKScaRhKn84zBteZi9mFKK
	mh1Kwxb1rtiBUmhWDSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOn-0000000A6oI-0lH4;
	Tue, 13 Feb 2024 17:16:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOj-0000000A6ms-1XkB
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 17:16:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-411c93e6bfaso5099845e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 09:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707844604; x=1708449404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wrRudLzDGL7vdbtFsMh/EJY4eKFKxjp27rYByGmoSpE=;
        b=bdn85i72htnvATLdacl6Go8K+KEeja5DbziYscjnVhEK8E+6bFQN+QKE9ecdhAAIg3
         6vkQuRtb/dmIq+9DesSBIdQbIpobcnjOEUntTYpBWc4F2Aed+vhlxuws3d3kS5k3+xSs
         poLMPLR/RgU4K1q675tyKheaX3T8VknBmnypNmizFDAKWsNTItIAMTI4XDN16cds+1Wo
         V79gj1Ze/BKkE3df6pyXFReDfw1wn2l0RKh1HVnc3YOefFvWPvyyAmjspnul1Dxq3oTZ
         dm9+7bITcjUJdsFXu6ieZaj15PSDzaHFLlH/PvkEmcpvZLlJ7++h5T9nNwFk3BKO+454
         uoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707844604; x=1708449404;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrRudLzDGL7vdbtFsMh/EJY4eKFKxjp27rYByGmoSpE=;
        b=rpcp3dX1OA8nL0WRU6ZPL0QRVK/M57LNXz7HRteq0/o6Tj5fBHBEitEDqnzUgEdDV8
         JeABDii5CEbYbWerYhD2pCvWjVgxsFIZNiFq/XJNyP4dm9PUSFPAF77opbIq+ayoQys6
         UHniGtqNm8PpMZHnQKuTHTD7q9ZEZlQMrNvYwA1Dq3ptKWVmHqxfu99DRT2q6z8X8EF1
         I5e4/BhowCmWlX9AXyttEj4IncUkos1BqoCebqNoSMZ0KBCOMsy7jL8w53QSyTuTaRmV
         VhT2uqHCXKMExseSV004izZZf6vg+OI8RFPnzH1SmC/xevp46uZjlHL3MQJsBsGyBidn
         sOSA==
X-Gm-Message-State: AOJu0Yw2Tct0v5FzjxuOemKrSNWvNNz7ftsaRH5En9T8WmdLnn9nZifk
	dXGjhkwNx0Yq84I1ZlVGnj88hNVegGSMIF3aVLaHyEfrFpvAT1+ty+RmBI0Yine1WT1GoN9lMoc
	7INg=
X-Google-Smtp-Source: AGHT+IFhGnlYJQIODayatMiLDQGcA7n1DCbcC2iZ+l++RVhDHhGAeSZxazycC123pinudSw+nAAayw==
X-Received: by 2002:a05:600c:4f14:b0:410:c127:62fe with SMTP id l20-20020a05600c4f1400b00410c12762femr233098wmq.1.1707844603987;
        Tue, 13 Feb 2024 09:16:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZNpD8wYJmrXqQSl65viXRKYJqHWxhmDeMraIW2yY0l9GvX2yTv+4UhSVKSQCKcxsjf4yWiTDMh+QICqU8L0GoDr0Dmsy+2VzHaY/WZmhgFvmH3E0O6hM1HFp1xb7NWHYBxrzvtw/xrxJXwr6ULWgABwZWMe5exx2kErG/k1Sh5hYfR2yKM9CMcKpWyQK1yaw4nGwW2zvvtPf+n7RtjdnrvBet3609RWuLPjhagxnGnecsa9j+Rn7IZHIWgYLpZwP8Xey9Ui0Bc8udncm9PSTgIZltilV0wCQZXN+yz15eoe/Rq8fSoDqlcAJmb3YR0v+gFX/maqkYZSegbC6gbvPfkd1NwOCGGgc0z6vgpPfWEV8=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b00410c2f39833sm7805785wmq.30.2024.02.13.09.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 09:16:43 -0800 (PST)
Message-ID: <64e806b4-5366-4722-9aa8-c72667ce7962@freebox.fr>
Date: Tue, 13 Feb 2024 18:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: add freebox
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
In-Reply-To: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_091645_679609_DCDCD2F6 
X-CRM114-Status: UNSURE (   6.64  )
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

Freebox is a French ISP who makes gateways and STBs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db47..4f5a1f4e6689a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -500,6 +500,8 @@ patternProperties:
     description: FocalTech Systems Co.,Ltd
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
+  "^freebox,.*":
+    description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
   "^frida,.*":
-- 
2.34.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
