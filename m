Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2857C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 08:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RBW74QaKKTQ9aiVeHRGnMzeDKjMZsrPRUwlfmuu2yT8=; b=xlm4jGNSoBxEgk
	MufXRPSGB8Y0vReKpm2N1ym/e17sHE5g0RDd3XQufM1aokJs8UwdzF5U1yudXxUSFnG5FQ6XLb7fF
	DzC6jQafoKBJrlJCKwg6ba9XoQXSH7vFsiLuloG0uKruPa2TGNtnvOk7Vq6T4ADwGb6tEYfrUr+JZ
	EblIeeZ5KXXi7fGu5jwGh8Kba0PsZVIo1JnCF6hi2D8JfmckrxbUQPJ87/94wlIv5JUgpr7S+n0Uc
	3lVSuaYMsLe7fn803bwbFWtZ9b2Wmm65LQoxC7k9T246eBWKgPA/7pUEgIBKBncgeWoZdev1L6qkJ
	q/do+2B/vvawvpWmGWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6GD-00BtBK-2P; Mon, 06 Mar 2023 08:31:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6G9-00Bt9w-KH
	for linux-amlogic@bombadil.infradead.org; Mon, 06 Mar 2023 08:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=sZ9dX1yqOkVplS53pDQk6TsdKFFTae1EpPWYpLAyuC0=; b=nf2KNKN+islt6A+z4aaVEqwMkK
	NCfH5tKKv5Ew0ruTB4zUOclmoecfxK6q8ZM6TxtLYtoF1vJT0mN+pvKMPby1mCEdjYbtmKxP8T4Wm
	4YN7VHJvnsirFEGNsmvU61s4oMo4+jE2BaR6/PhSkiMkOZJrK8RlJXwkHMULiGGCAcNSMC/cZjyxI
	KvLqzmYBisfoBN2ThwUKFkVle81hDmeLNJ0vhbg4P5qYbVTfjofcJUu3gwZ/HJ3fM0SywgOx0TddH
	2ghYL0ysGrIFy73H0ZDbXFojzQImVA7QzO8dAbmsh/LxdP0iC2WH0cSxsSMDqfEJtvDa8dJ/q/q71
	assG9xcg==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZ6G4-00GcG9-1Z
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Mar 2023 08:31:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p16so5061430wmq.5
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 00:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678091499;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ9dX1yqOkVplS53pDQk6TsdKFFTae1EpPWYpLAyuC0=;
        b=xP1KgTFueGNTV5O5U+ke5w6mZZsav01et//f23TjsbOHjALthUinL2P0srbq5n28eh
         JE1r6R8PeQYpWA28KwdSPtgdPp2804A3WPXFPMy/hleMlaUyhIn1S/Y3l98smI9hqdsq
         ri6fxLbx/HALxCr6tAVLqAsaDR9zJo48z0+Ur4tSudnTLEuRne9RDNMb+6EQYR4oeYGy
         z9o/n6vdzjxOwRli6PmOzNhSboEMod1mvvRctxwT9OYEiZ4yg4wlaAms/ByXGXu9nq9r
         JG/q213yZ/JHpdkczBMF1IHVxg57iGKgOBw/DIGSpO8biVuaPymdXefpqYnFVo6rM6dh
         G0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091499;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZ9dX1yqOkVplS53pDQk6TsdKFFTae1EpPWYpLAyuC0=;
        b=eUC1mNiWQCpqd85dk7sPHVSRTx8vYPGVEYzs3DxIu2G8pS7nVga1HCegvaT5dXiAD+
         I36y4rBsDMhvcRcd7UTtW1XrCDcq3d089Z3yxqoeQUI0mNBpcEOgH1TwzP7oIk+PL3lj
         mb3VQvogaQLYIWIH3/Sz5dFFduM67hbKAgySBzexkLGnEmCd6Qze9ubP7rL9v8Jgu+o4
         rMzZdDRRoA6ZaQdrbzb0jSHTZcZ+8CnnI8g7Cn3lCXbqF8Gnmd4bEfrq8ZouKUDLLW2T
         h76YURV0gx4fnWZBMk/qGH7lzjUeWiHhpAVhzpF/EmaW7FZLlVCSnrEKmIvz63bO+RsA
         u5dA==
X-Gm-Message-State: AO0yUKXsmp/bezuaMREoCiv9MLpysNf219ExtxyOAoc7vn3Jd38Zz+TO
	b7s0C9l0hxtH3GN3BaoEl8pHgg==
X-Google-Smtp-Source: AK7set8qd06ahF3AiQWFs3rx1lzdgIlBEjQNS4dmqXxiohg8IZu2OWkrAET24Ivd8FaKR/G6PTb2OA==
X-Received: by 2002:a05:600c:3505:b0:3ea:f883:53ea with SMTP id h5-20020a05600c350500b003eaf88353eamr7840614wmq.7.1678091499543;
        Mon, 06 Mar 2023 00:31:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id he11-20020a05600c540b00b003daf7721bb3sm13529724wmb.12.2023.03.06.00.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:31:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] arm64: amlogic: Add initial support for BPI-CM4
 module with BPI-CM4IO baseboard
Date: Mon, 06 Mar 2023 09:31:37 +0100
Message-Id: <20230303-topic-amlogic-upstream-bpi-cm4-v2-0-2ecfde76fc4d@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOmkBWQC/42OQQqDMBREryJZ95cYq9Sueo/i4id+9UNMQqLSI
 t69qScosxjeLGZmF4kiUxKPYheRNk7sXQZ1KYSZ0I0E3GcWSqpKZsHiAxvA2fox+xrSEgln0IH
 BzDdoFcm6UcO9raXIJRoTgY7ozJRr3GptDkOkgd/n6qvLPHFafPycJ7byl/69t5UgoUZVYYk9N
 bp/WnYY/dXHUXTHcXwBuVN0feIAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_083149_168001_AD55203B 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for both the BananaPi BPI-CM4 module and the BananaPi
baseboard which is comnpatible with the RaspberryPi CM4IO baseboard.
                                                                                            
The BananaPi BPI-CM4 module follows the CM4 specifications at [1],
but with a single HDMI port and a since DSI output.

The current CM4IO baseboard DT should work fine on the Raspberry CM4
baseboard and other derivatives baseboards, but proper DT should
be written for other baseboards.

The split is done so it's easy to describe a new CM4 baseboard, enabling
only the necessary HW used on the baseboard.

[1] https://datasheets.raspberrypi.com/cm4io/cm4io-datasheet.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- rebased on v6.3-rc1
- Added Tested-by, Acked-by tags
- Fixed audio routing
- Fixed position in makefile
- Fixed emmc 1v8 regulator node name
- Link to v1: https://lore.kernel.org/r/20230303-topic-amlogic-upstream-bpi-cm4-v1-0-5a23a1ade6bd@linaro.org

---
Neil Armstrong (2):
      dt-bindings: arm: amlogic: Document the boards with the BPI-CM4 connected
      arm64: dts: amlogic: Add initial support for BPI-CM4 module with BPI-CM4IO baseboard

 Documentation/devicetree/bindings/arm/amlogic.yaml |   8 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  | 165 +++++++++
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  | 388 +++++++++++++++++++++
 4 files changed, 562 insertions(+)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230303-topic-amlogic-upstream-bpi-cm4-92e0562f8950

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
