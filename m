Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952CDC282EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Mar 2025 07:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmwPFfbFITUSaCrbl9X1uCxvkZ4N7WQ8A1h7ky07720=; b=zStT/c1ajkU0Cb
	hFIX6WxnBSdJaJ651lhK+ql4xnobaury0ezYE8oPmU0uPCiILQFEm8WMq6HwRKIiZdvBcfiT7UPoH
	kWzFSeuVrrAshXhtdSc7mDDOsnSZkGF6iDJz09DFyYXXHn1zd+0VZzxuq8FnViP1vik5oaqL1OWjJ
	nviWGe/i+HSTVnVCAkFbzOyqce65lwQETzqkA3HNchkiwO/OX22oajtlnspkViHtgE4L+T1e7id23
	2MSSLcKiJjVVaXX2GMcp8/edJlzKeuacAmuJO3ZJWGRYU9GeRChmaLsnhHYGU3I+NvZLGiXXghjP5
	Xhbm+PVRVNJY0dYOisng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4kE-00000001XHC-1vgp;
	Mon, 17 Mar 2025 07:18:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4iW-00000001WmT-1Ia8;
	Mon, 17 Mar 2025 07:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F5E05C53B7;
	Mon, 17 Mar 2025 07:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 837BEC4CEF1;
	Mon, 17 Mar 2025 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742195814;
	bh=u4jkOfC/hxCuvSMEnh4rOp8tDLt8ar9dDX8YgUSaz5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b2vF/o1RqS8kgpUGUlEpWyQ7OiN3pW+tlL0hUmJoh0+zpFm1UETVXrfySKfs3dA/t
	 fGsxmah7eOm2KU/+a0ekPxgO0UGKBkCVk1V46+Zp5q6gE/s4UFN4qBY/BiosS7UgAN
	 hytJ0EqlBMphSDaYDYr7CSfbGANax0hKnGAeNEnVagH4L/3VeaH0Oz57BC0WKFlbdv
	 G7dLP47L5Ph4O7OCFj4eCXclQHoGhicDOorr8zld5/JkfZHlBg5MJRFpqFynYqMmQ/
	 FH6kW6vnwjsthU3koKJnoINt8/1dTYQT9s6UqzPWTaTrsVWElpaaDU4xsta5vuqiF8
	 nohb5x8+SmkYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C26BC35FF9;
	Mon, 17 Mar 2025 07:16:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 17 Mar 2025 15:16:54 +0800
Subject: [PATCH 3/7] dt-bindings: arm: amlogic: add S7D support
MIME-Version: 1.0
Message-Id: <20250317-s6-s7-basic-v1-3-d653384e41f3@amlogic.com>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
In-Reply-To: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742195812; l=1003;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=pjx9R4pQY/G2qimVqYxYvsz5cP8LfLzhAKQdoOstkBg=;
 b=pSlkqVmPSwOyI8NpIjVdzmM0dF7bSEPgnLscuEFlUkDSM3oqLF996v5JXdwA2Dzp7BCGd74C5
 FwUzPNVY4OlCN/I/JnTZue47di5tx9sjO7N8/SId5Hu1POtgPNJrtQm
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_001656_422677_7785C287 
X-CRM114-Status: UNSURE (   7.51  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the new S7D SoC/board device tree bindings.

Amlogic S7D is an advanced application processor designed for
hybrid OTT/IP Set Top Box and high-end media box applications.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9a6e98b55685..0c84c56855ba 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -249,6 +249,12 @@ properties:
               - amlogic,bp201
           - const: amlogic,s7
 
+      - description: Boards with the Amlogic S7D S905X5M SoC
+        items:
+          - enum:
+              - amlogic,bm202
+          - const: amlogic,s7d
+
       - description: Boards with the Amlogic T7 A311D2 SoC
         items:
           - enum:

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
