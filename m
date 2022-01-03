Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103B9C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWelpFORinmQWjGXP8Py8YrbRIhhJISdUE8R356Crj0=; b=3IHf3Nj/MONhUm
	pYz6X7NZ2iH11+wS1s594BooV4xqdX+1tHYCHXaXIEAMvvkCbaNR3ZHQWaf49kCrTu+Hi5lwSRRZd
	TWcgfbNFxZoQH9PGlqPMTHArR1J57YN7gWhmMn+VhRNJ+jZAkrsVpHRdgc0kmJe4a6nH7HjLcLp8a
	28bmjN8hsh6ja/lusWdvGTj1UsPMl0klDUo/rtmRF6WirXCe4gjVG1rwp9+93bFJvZq/Ixx/kLlBi
	eUBP5KwFtiNiSbjam0qK4qAGgB1rNgj4oe3iamViafilOfnhdz5DWWDL8iAQ4Up8YSpgpncdLfMOh
	ivwxcC/mLt7mmzQpxkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QQf-009VhX-JU; Mon, 03 Jan 2022 16:43:25 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QNf-009Tus-R9; Mon, 03 Jan 2022 16:40:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id j21so137902733edt.9;
 Mon, 03 Jan 2022 08:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lwtwmf96/gMAlqBztuZshLJxZNPu7f/tp/LMHnINIs8=;
 b=XbtcbTk+0d63MTgRvVyftAW36gvzcgjXx8885TYnDKLlok8FoWRzRMEOthwRgZJYP3
 qtiBdxbGzc/VAS54GMCABUfv4mkgK83VOnA/pO3tJb4C6Zb3prz66UYrihUA0m5RwiHO
 azfnxhZSu0ozVmrn6WKl/RIehFJof/xk7M1KR9j/JZYOUiljpjcKSf2qE9VIv8S24Z6c
 gY9RNVWOofahQ+UcQbI1jkZ/VxIK0mEBgPzgHKH6ExVft4d5EYrSVgTNYqddJM3K1J/i
 G+haxZ/N7Y9TDhiRLkFNbNEh22wxLDG6toEz58XPh2C6SgRDTQgNr9TKIv7OaNSehwV8
 7/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lwtwmf96/gMAlqBztuZshLJxZNPu7f/tp/LMHnINIs8=;
 b=IxeAtCJilKwy2YAaCNzarSb++Fniu7q30dFCU+K++SPF2VL4kjYg/MiWBX6kHsP1eQ
 BD1bnVDLq3edfBR7oWDhFmNbVKAh36+jRHCRSiqaMikMWZY1ir2sTOAn60pgf8IuzPce
 q+joBi67pSlSFOLGVSb8NNBeQS+YIUc2sybrT/JN/4ddJeoUhbj9e24DQ+19bmzVP2Mi
 DUmzrUaiibJGsrNltx2SLOIwB0TNLk/S6VKyAtPjRLQBhQh5hw6NoetOqyPLObxK+CAZ
 8cJvpTe53wnskKYnfC7gM3RTefNvG0tYOScmqKQ5OeVUjJfdiZlM+4cAk0ANMgxGYX40
 dyrg==
X-Gm-Message-State: AOAM532AY3Fn5Pr8ILPeFyc8+l4SLvrrETts0H2to8LwiPNBnBsVlajL
 5D2TBHsUqDa1+k0cdLuclwI=
X-Google-Smtp-Source: ABdhPJzb/Uq+kRSb6JYITiI0nFa6uoJLnm2TtaLrnM2Z1tMdcL8KyLIwHS4BmP5sx3vWQBAZ1c1lTw==
X-Received: by 2002:aa7:d5c5:: with SMTP id d5mr45597097eds.251.1641228018404; 
 Mon, 03 Jan 2022 08:40:18 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id oz20sm10724068ejc.60.2022.01.03.08.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 08:40:18 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v2 8/9] dt-bindings: arm: amlogic: add H96-Max bindings
Date: Mon,  3 Jan 2022 16:39:55 +0000
Message-Id: <20220103163956.6581-9-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220103163956.6581-1-christianshewitt@gmail.com>
References: <20220103163956.6581-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_084019_913050_2E12F4F5 
X-CRM114-Status: UNSURE (   9.48  )
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

Add the board binding for the Haochuangyi H96-Max STB device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 2027ce81a834..a073a959232c 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -177,6 +177,7 @@ properties:
               - cyx,a95xf3-air-gbit
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
+              - haochuangyi,h96-max
               - khadas,vim3l
               - seirobotics,sei610
           - const: amlogic,sm1
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
