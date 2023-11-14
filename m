Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E20C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0bMuiTqjJ+4L+badHa2wbOSftMWhS1Ic+rVZ5NnRJGs=; b=TQIiT7dlAgd3RX
	eootgzX230Z/RkAXvc2QhloLZe+UaGyS2MlOWbh2KHsldVVFA53x4ECoQwmaPCa6jB/pn91CJ1a7R
	PqsJW7kP82gET2ruKp8xWhd9PUAgtitc44wjiozPU0pg5yCaDj/gLdZlqZJgVkbKos7RNGiZEQqQD
	PqiT1643ojpq2W7s8RFw1u52yKxV5gtsqWwNrL19GnXfuoJjmP9Sz/uLVCu5vPbfuL9XqjVicpRTM
	safIr0feZvKT0JY8exaSCDFKEKq/YHN7SjnBgjoort6PRaj1E7Riy6f0zzhsbmbJjb+7HivxI946Q
	GwdsGJaqGQ259eT72xAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qRb-00FYiI-17;
	Tue, 14 Nov 2023 10:14:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qRY-00FYgD-01
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 10:14:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32da7ac5c4fso3423708f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699956889; x=1700561689; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lP4pwuRhYTWCh+6fGIMGYIpMuMAg/mVMsSJit6b5kb8=;
        b=zUYzpTtECsvIybmiXh9bOERaAC7vvFUnKQBPkGwsUx5Rf+QeBu7QUleOrCX6/F+eDw
         MRm+irBKmaqQs8MVaYJE6h1OvkUXFHs+hftCJqpJJOjtPz2G8MJDu3x227Uru4gOcS/O
         t99yDDGZ1PRo3VD08x5tE84K/dbDgdhzCVgDg42ko/yGoTp5YzG95M4ZsokAcA3ExDwa
         HaZbQwQwgbMoAQODV2jZs+J68u41bZwvHDRGPEyXKZfXLKJrwCCuPboS9koWSRQsWX46
         HmK/Km9RGEiioyguMur1IeExRIoXivVLIkBu7mG8O2zx/14Etkn6ttW+Fi5/ZJfHsxpH
         L2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956889; x=1700561689;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lP4pwuRhYTWCh+6fGIMGYIpMuMAg/mVMsSJit6b5kb8=;
        b=Gkyi02R7TgCzwsAgWBHAGT1jno2B0/gyb5+TwYYaPTp9jOLi7sAVm9fyYzu3EhziFV
         97mwxkklTbLp4bnrKgQYe3XOfu22ZAJNuugh3BdAP0lnrkET+6sYp09zX3vagEvvcz+w
         /hHJ96ASDJy63XuiUPIlL6P2X13/oCyYztpS0TbFNcNbvorHKoJEn+luYr1r/IKO4v/i
         6IW44Zztf/DQHnR+/YlpOoGE6Ez1gOfVhYAUDXALq5q7o/iEq3uScyE7IBQnvyHoh9od
         /VRR3V8xboQaWQVFDS3e9kzGBYzTfE1+RRA87euetGY1AcpHSM5wcCZSsxAib1SD+sKy
         o9/A==
X-Gm-Message-State: AOJu0YzwyLd4Y5eOldGTdBb/vojI8ijC52YBHkQrGgBXMPvcRqvONLyI
	AO8D5JAwQWwKu2FTRrJhh2KAYA==
X-Google-Smtp-Source: AGHT+IGjhN6RX4rBNlnSxxeTha7OzGItl9ZV7rvJ03XS0hXAK5QeQ/02Q4ADuftfGRyfvnxSbKrlPw==
X-Received: by 2002:a5d:4dcd:0:b0:32d:aabf:1db3 with SMTP id f13-20020a5d4dcd000000b0032daabf1db3mr6480680wru.24.1699956889056;
        Tue, 14 Nov 2023 02:14:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4202000000b0032d886039easm7335585wrq.14.2023.11.14.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:14:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] clk: meson: add MIPI ISP & CSI PHY clocks
Date: Tue, 14 Nov 2023 11:14:42 +0100
Message-Id: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJJIU2UC/x2NQQqDMBAAvyJ7dsEkbal+RTws6WqXqgnZKIL4d
 0NPw1xmTlBOwgpddULiXVTCWsTUFfgvrROjfIqDbawzxjwwhygeaZnDVLhFzYlpQdGIfg7+p0h
 k38+WXs6NDZROTDzK8X/0w3XdoJthzHMAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=904;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PwjQ/DLZqY7Bxq2AfQoR8M0lM8zWRFZSzmKQH+USBu0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlU0iWvHW+Rz3HPpK51JzL56QxmMmGAg9A3MUNWjOQ
 APjxiOCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVNIlgAKCRB33NvayMhJ0bXRD/
 4l5mSNoYLtkeq1lLfw7E9Ryvnyt5Tg3UaBv10vi18Bi7AZYtmC2+stFD0tdIY4km6Yy8lQlte0W30z
 Z0EoD2SavQ7+Z39dhPXQYeufPMBhDiAvXAIokLI7AZ78Y31GRSK1J26AOkRHrYualoa+MCJo6zpKTU
 AcBHwUpT+QYIHue2dC/XnNMB5xKeHfMF245eGfcAE+CaCKG46BmdNwcgRn+36esq7l398kxAug+U8f
 /m2gRnXEtpktrflsqrnjm0c3ZCInq+nAVA2bMydBBslDs3NjTnzoxFIbL4n4ZJyqn9lK8KDz7uflql
 l1qA4uC6rbi1FSXF4aUGp5JO7U9fM9IVAPQ8epuIus+DT+OkuDhq+qkF9vSGNplKBvm6RM8qb2/r26
 PwNKxDJMrV8foZE8utygOT8hclPcJMbblh3sF6aLklWIvXSxjYVN4+fr5Cj43A26dSICZJG2gomlN7
 Z0z70S72g6lSjcBwr5vmVOe4US+MJitfAGaw+rlA9NZawz1+PzNLoq2sFxhWe/IwCWp+21Rk+H5S/4
 G4wQAtE1H19tA49SyQ/YgFXPEfhkt7XEdP+F1kgyEEK4mww2VlTFYMvx+xcYfWzYi+1D3xOmu37EAC
 XqzReZ3CuG/YJhJl+l3SJq80dVDcgvIub+ItE2KqS8Ml44txcX63tNuv4RNw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_021452_192965_47503E94 
X-CRM114-Status: UNSURE (   5.97  )
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

Add MIPI ISP & CSI PHY clock bindings and entries for
the Amlogic G12B SoC.

Based on the CTS_ENCL clock bindings patch at [1]

[1] https://lore.kernel.org/all/20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-1-81e4aeeda193@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: clock: g12a-clkc: add MIPI ISP & CSI PHY clock ids
      clk: meson: g12a: add MIPI ISP clocks
      clk: meson: g12a: add CSI & ISP gates clocks

 drivers/clk/meson/g12a.c              | 75 +++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  1 +
 include/dt-bindings/clock/g12a-clkc.h |  6 +++
 3 files changed, 82 insertions(+)
---
base-commit: 71ea46af56818a97cb5ea5d6554a0f10ea624d6d
change-id: 20231114-topic-amlogic-upstream-isp-clocks-aa2859a633f0

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
