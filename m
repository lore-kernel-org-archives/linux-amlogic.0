Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850A2CD1294
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6t4whWX4jbd2XViRalK6TU/iDDX/6sjJZFg9Opn7neM=; b=SetP9PoirK5Mn/
	k189no4emv6tAjkWu2KIBT7clJe46vC9qNh5G9X/G6OZ30nQymSWsu66gpTyd1Aec7HJcmP2LYALM
	hyzB4gzWO3stJvb/xgZnQXqhwXAu+a6SwdPh2fFYa+59htpL8jZ/8NbaxWX46jzvMBpPbEAmS8Eju
	H2Pagy3L7s+9dZvfMgV4q29u4fBAkeZHDfQfDmTAh3k4bpZIr1iTMZwASQATbuYreAK2x21vTSvga
	UmMi3SZ3NXcQ6F8OK/Ao4m/bAiC8m/0vpwFbPBNdBnqmRK5fo4F9YLX3A5AWAumITaDb8CtfUjizQ
	A1JUwcF2pTxsiuYpRMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEd2-00000007QjP-0Mew;
	Mon, 01 Apr 2024 10:11:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEcy-00000007QhX-1uhA;
	Mon, 01 Apr 2024 10:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 935DB60BB9;
	Mon,  1 Apr 2024 10:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDFB0C433B1;
	Mon,  1 Apr 2024 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711966255;
	bh=BlBJpiUv7aUmAuFYUdvRYginZ8mbbvQ7MHOWOPOYjTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rWOh7MzSja3Tv/nIkmXomxahTuXKF0z28xJ1UjSSC6Myrd78ZwCptLzhg1yszT9W2
	 5TlWDTV5bfTLYSIhV2yE3cyH/6Liiann71hkRcmafVhianLGdk27nVsdIIjdAcl0HZ
	 yKvs/9AbM0k6JEGlKIgaWBT1EExijooUSbSPD/fnS0EIoXQk8gHhFRByYWgomVZi3u
	 DKqzl2GIrD3W0fVCf1aioxwIR7oeXMVopCHKIRsdbEbHHOBu0D3/WWIX28pOytIa1T
	 SxFqG8Iqqv/2/R5kEsNLTuyQxkVLOCpvhf9F0tDPqQGvHIiFnzxHfJJuXWYTyW80qi
	 XKi7d11CsAsjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCE8CD1294;
	Mon,  1 Apr 2024 10:10:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 01 Apr 2024 18:10:51 +0800
Subject: [PATCH v3 3/5] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A4
MIME-Version: 1.0
Message-Id: <20240401-basic_dt-v3-3-cb29ae1c16da@amlogic.com>
References: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
In-Reply-To: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-serial@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711966253; l=1045;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=BoOg9oQGXAIVipNRqINyIKrEQRpu4JFfXxioyfv5GFo=;
 b=mZ+9Ep9WWQoTg3a/P02KSgdMBd1++x66NLZBVFzDPu+9hcHs0xLkwundg7BoZB9L42CWB88kJ
 IJIMFTOpNA0AqAFgMZslQiz9dJNHfYcjr9+2kgNGridt4qlPuRqOT25
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_031056_601881_362C17D5 
X-CRM114-Status: UNSURE (   9.73  )
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

Amlogic A4 SoCs uses the same UART controller as S4 SoCs and G12A.
There is no need for an extra compatible line in the driver, but
add A4 compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 2e189e548327..0565fb7649c5 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -54,7 +54,9 @@ properties:
           - const: amlogic,meson-gx-uart
       - description: UART controller on S4 compatible SoCs
         items:
-          - const: amlogic,t7-uart
+          - enum:
+              - amlogic,a4-uart
+              - amlogic,t7-uart
           - const: amlogic,meson-s4-uart
 
   reg:

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
