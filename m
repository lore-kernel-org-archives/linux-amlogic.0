Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E568EC4829F
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7J7q3ei9hz46rAtsJBeK04FLOfdloC8vhFY9DC5loqU=; b=kzemxzXfhgkore
	ZQB8gF6AEcrGLr9JFnyx80Nx8XmGGEyEX3EMUhS0fi52n1q9gqnXShGT++or9Cg17mf21tPx+mrFH
	hKINdvNGQa/jPIDwa7eOx64wue9UgmT/SWM1GizkszhAM869RNh9ihJ0knqaq6Ggc95ako5Bk0zJ/
	y4z88ZlzVSuSAWqIP9KTVzUkipKfMVpalzRlCzBAibrOZDDNeRPe1u4MTateSiYhVESbC04BMRLZu
	QfA2T+n3wtqjtUf1xMBAn0YMgsWPUWBo9sH+Fz7YV/JVcqz+i/5tqdjjgmKFA0jCNBl2PU9FGEEub
	DkMPTYrR4GbJROM72Hmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOn-0000000A6oU-3q33;
	Tue, 13 Feb 2024 17:16:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOk-0000000A6mu-3B3S
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 17:16:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-411ca9dfffdso4863635e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707844605; x=1708449405; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhxPETmkFw3IENUE+zBAbE/05HwK6Twdv5P1eS9JV/w=;
        b=jdtPjkMsMBgp9jCvzdbD8APry675dHF3SjxmLwgaA0IjiiJ2UT8BKzTSro0DRdCGUJ
         bBsYDwyyW8Z3eBEaG61TS7hBySQdzPXU6cbYK8+kEx4SWw8le8fq0HIro138rBvdn4IN
         60sHJjwBXe1uz6Aq04yq7l+KBN3w6+aGD9TAG+Tm2Ysxj2ocwA9gIPwiPia4rDQdR+vo
         2XNK7lgYPdmT79DtvNfMc+yP19+2bj95DBi/SNL++K8yK5iShgGfObXqt6DEuw3lfP9k
         n+/oMaAsC/mcaCJysvZEkTp1oEGzCcgzORXmL8s0EFf5vkdKm7iUAiwqxoWfGJCwXx6j
         eCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707844605; x=1708449405;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhxPETmkFw3IENUE+zBAbE/05HwK6Twdv5P1eS9JV/w=;
        b=McY2xai+nHJSYWOwihNWZ4Z0eV8BHQleVqUvYo4jQIrqy62W2T2Xf5SAOBDkn13uLE
         NN2A4iek0bh7yJ1p4ZpZXrRWiNX3oO7bBH3ukurC9NxvehppGwgCFrftb3SluaKdV4ZE
         52kY8tuYFuBI9E79dz71qUutRMtv2Nbag8ARAn4UeedP4KQIDTrCSGNdkBVwR2Zee2Od
         hnW7yfqG/AwhnkPo/Z8ZhYpTJC34EKu0p7MakrB/9RqwE28jFZoDrGms9YxzZSwgGjJJ
         VNf3pry1k3tiOHlLnorPyh1DvWou1ncs8MHyhKtRBhV4NHcr90Qc7te6ftGEJBOFBWoQ
         hsXw==
X-Gm-Message-State: AOJu0Yz3a8J6ypOsnj9bxdqOWAbcua0pdFiwEtlWfBygg/OV19vJoL/O
	Kl8Lz3bRktgnnddhh2T6CWNyLrLmZ3AqdMU/ocaZoA8SLJ0MaFl+rLRHcWUn1BRRs5C/R6F+FGc
	lzZw=
X-Google-Smtp-Source: AGHT+IGYzHr6pIcbv72cMoPnjodIenLV0rR+cBiGnl6SPrPBer7lxPhLIGuuN0rjSogvl0gRkd/njw==
X-Received: by 2002:a05:600c:500b:b0:410:862:14c3 with SMTP id n11-20020a05600c500b00b00410086214c3mr255434wmr.5.1707844604999;
        Tue, 13 Feb 2024 09:16:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUMlj1du0zW4sqzvkqy1Kwa04fRexc8zyPF1gzXfqaXoTEOS7oa7jWJgtO6sit+HChttNYFsrV/UsvS+Ou89qXN4ws0kwE9rfkEKI9sMLTm/+Yor49XoFA/A+A1ZhWBEsmuPU6mVa3q8+SQ+mdq9YV6TZgDZS2H/ZukVbj1l6ahjeFenoRGD36JNg5c0TstngFgSNZH7wGQ0BChkBjmM1hf10qEwbe4dwLzgNt0Sy/eVUw/AQoM5FLmIFuSODGg0hqkzfmjfnll999IAlaGPOa3iF0jEm0WCavY8bLKvnaFzsRdi7xXcJMYEeRHnnYaBuZOjzib9Nng3gA4Z/LVlnzR6htmL71Sslc/ydJnF+5/wg=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b00410c2f39833sm7805785wmq.30.2024.02.13.09.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 09:16:44 -0800 (PST)
Message-ID: <5f238367-57f2-404e-b5ce-521c389bc728@freebox.fr>
Date: Tue, 13 Feb 2024 18:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/4] dt-bindings: arm: amlogic: add fbx8am binding
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
X-CRM114-CacheID: sfid-20240213_091646_829648_86B38C13 
X-CRM114-Status: UNSURE (   6.70  )
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

Add binding for the Amlogic Meson G12A-based Freebox Pop (fbx8am).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45a..ce0ea36de0c09 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -146,6 +146,7 @@ properties:
           - enum:
               - amediatech,x96-max
               - amlogic,u200
+              - freebox,fbx8am
               - radxa,zero
               - seirobotics,sei510
           - const: amlogic,g12a
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
