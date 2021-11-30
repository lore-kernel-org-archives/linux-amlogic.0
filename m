Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED307C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=882AmeWvWNryr76hnyJrcQM9C7q2dNCI8hIkAqqs6rs=; b=MrCPtCRP5QwsXp
	0xh/e6s+EZgQlBYF5jJ/ZA0CulBDw10Rl7Oio60tMbXvLD8XiWqedaTGqQOiW1sUyCIEDMX05eCZg
	j7Ry0Rqk3hCAD0lcjl2wcwtCYvwcvfiynYWCLacoiWCqKei14JAicuLwKxwnvaA+CD161+I0fyidm
	Ba34niDfERRSIGhtOY04CAvDc69DC1RCPgWcydDZW94aJOoXwaFzSy/UfwD8vdlrdRYsTDXmrA5Gx
	JrxZh1rVCSry9eXVWkSfHYzWWpknmqSmxMagPpZXgcA2gfEJYWwBXnOmHb/Vshfdxhbzi8UrNt3BF
	vs4QE/bQ4G7hGnpGc1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwIA-003iYy-3T; Tue, 30 Nov 2021 06:07:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwGn-003hxv-3n; Tue, 30 Nov 2021 06:05:38 +0000
Received: by mail-ed1-x52d.google.com with SMTP id o20so81648276eds.10;
 Mon, 29 Nov 2021 22:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eEwebxlJ0ADP5GA0lC7mVYWXiv0EHw+yI/77FMgWc6o=;
 b=DQtVRqc/ciupvjrdrtwv2VkmMt4gpL1o49wuYj6x3kDoY85VKnr1rC/wkutQRC8ztB
 bNaO5G+a5/WfUcD18pxU5W7KFU17u5+XcRdCpJFhVgO80mMaOkAjp5CrrpnEckqSHsY7
 H62ZlpSv1XHltib6xcD3ec1eiHETJOrXqerUHuH4/w2skdJO6PbSK0Dty/RUni92StSI
 dq10OaHsLzeRwuvrl8nsB6mQVaVEAJm/Fqz74x/HOX6N12HUOgdjnAE5u4FUQi6y9Su2
 5WwHox8AS+Jm20egbYtBN+TcWs3HEVEonKzNVDqY/kY6qbWE0mLQ+xzTHjhN63YHGmNH
 iJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eEwebxlJ0ADP5GA0lC7mVYWXiv0EHw+yI/77FMgWc6o=;
 b=g/VnB8CYlwAflbFPnai1SzY7o7PiTlSZ2nX0LsG5HQa4KzMX4aQyFT++PfXlSU/UKV
 ST0CNdUFE3z1RqAC7TVO/2quWPrw9L5rghsoopFojt2dyUKOvsOfqJnEcP1WD4YmoD+s
 6lqEKeY63aqJ8gsmdL+U01wRAvyT2qG5arl2Y2P+HtJI23/HPKQxcEqCn4qHxWTjBkFD
 IdLL+533IZR635zyIz8noVEbM1z3GJyf3w5QQySGx6bTxJf3BK7dx+PJN5V6GR/TFdo4
 4oFGLd5r76aT9ZyLbc5WK4ujbfqI1uvHEqaF4Z1c0AZQ2aLy7J8oyQzUMyMSk5DOKLrS
 0rbA==
X-Gm-Message-State: AOAM531JrVJaWsDjUBrEbRTejlfYbgeqvWQLT0WP+rb5r/ohPgeA+GK6
 eAqseIB4bFvvarfZm7Dl998=
X-Google-Smtp-Source: ABdhPJz88fFv3/83546ZibuOpgkJDwZvx5tig36vWP5368FIDqjwQEexZW7ExPmvt89+ve3xpK9xyg==
X-Received: by 2002:a50:ff10:: with SMTP id a16mr79076109edu.275.1638252335940; 
 Mon, 29 Nov 2021 22:05:35 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e1sm10542153edc.27.2021.11.29.22.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 22:05:35 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [RFC PATCH 4/9] dt-bindings: vendor-prefixes: add cyx prefix
Date: Tue, 30 Nov 2021 06:05:18 +0000
Message-Id: <20211130060523.19161-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130060523.19161-1-christianshewitt@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_220537_184666_4DA8C644 
X-CRM114-Status: GOOD (  10.10  )
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

Shenzhen CYX Industrial Co., Ltd are a manufacturer of Android
Set-Top Box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 66d6432fd781..f1b4afb2876a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -279,6 +279,8 @@ patternProperties:
     description: CUI Devices
   "^cypress,.*":
     description: Cypress Semiconductor Corporation
+  "^cyx,.*":
+    description: Shenzhen CYX Industrial Co., Ltd
   "^cznic,.*":
     description: CZ.NIC, z.s.p.o.
   "^dallas,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
