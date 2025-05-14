Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D41EC3ABDD
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 May 2025 07:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYHv+lzamaQINpySyT0mxoG8GeXM0DWAQ82to2kcMjc=; b=mckWU0X3rboA9h
	kopVaxs6KKQ35H3Jp4nyfkYL5EW3kga04swkaozE8/OkZNwSmeHrY/nu+LPbkCdt+85qpvUtKGFSi
	tPimN4vn4D5VHJnHFRK1Lbwb6WhOdcY4PXArgYCuWvZwtUOLoCcZ0ju1Qy9wl0E6lDAdQapJYQwHx
	s7EFdKCEINBRXRyDzxbuKaLaTkP2Tl0LALK0KJ145De8AJaV+1nxxMyaFhGfaT+Yd+/iH1+IoTivE
	8pvFoxen7FkLq08dxQ1/j6GeKLWXG03tXtQ4WfsdaebFsmgRgrVTNABUXe1MgtNJLD4x/puKDo6Sw
	GAUeIyP79cz9SZu6zb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6Fb-0000000EG0O-0AYV;
	Wed, 14 May 2025 07:09:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF67b-0000000EEb6-1mtu;
	Wed, 14 May 2025 07:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEB7A43A2B;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C6A1C4CEEB;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206102;
	bh=RhXaG6D10XuprrM2uwXZ+yryGaiW6qQjUHpNKKnNco4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eHwvoObsxQY3MpoRSkhPWgLKhUksDEdk1jl8Wa8VmcNU26EGdaEst84a7hA8auT8/
	 SYLGSnnKnCZhzRpf24kMjECzayANSmpWVojht96wWY1xJe8maAq9edikem9yB8vpVn
	 tgR9NxofW8wTLTeT64O4qACZNZZhg1r78MtvrCoWVQ3Q7PM3ELH+qvd/owQUIT7fo8
	 55OXG/SV6zpaIl+YnHCJyOm9L6Nsw1sTU3CiKkIlcXGK2Oiiy2napiGFGvrnH530UK
	 yqy9TrePmCrkTKCQPBfqmkko9YRzDnr4ZX1yPb3NIlAcv79HZm1lUMuoiAybuf/rQq
	 k37yTgs4Qhx5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C497C3ABDE;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:30 +0800
Subject: [PATCH 3/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S6
MIME-Version: 1.0
Message-Id: <20250514-s6-s7-pinctrl-v1-3-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=777;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SGs48wURMjraERop2ENTKoLj76g7oJ3ublU0QekYvzE=;
 b=rEqYoaagVtWnwccz+GPoTSGpAh94WJcq+4gnR1fgKV7VHyJeoiV4IoNKYrTVI+RfssOUFjmUS
 xZt7xPptmWPBGTOn3Rauo5rXQh3GVD6b7ou5ya83Rk7YLBhUHLgUG2I
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_000143_493212_3DF491C5 
X-CRM114-Status: UNSURE (   7.34  )
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

Update dt-binding document for pinctrl of Amlogic S6 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 96a7c5646c13..61a4685f9748 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - enum:
           - amlogic,pinctrl-a4
+          - amlogic,pinctrl-s6
           - amlogic,pinctrl-s7
       - items:
           - enum:

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
