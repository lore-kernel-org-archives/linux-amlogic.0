Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C5D38FF2
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tMEjJCJX3Ec2MWHZobHPmau/UAHTiYgTSESuTNuxRw8=; b=mn+oY0k2+BhtIW
	aML9J2naPHRghXL49xglO0Qhd4/HDg0B6UgilUqjN6VIOZ0R3rmdpnJTZUAh7ELub33x599oZoSsv
	rnIS03q73iOMSlcVFClaEe4xYXlxLa5Dq1WVU8PW4AWHq6DXzuIX0VRSyq7L5YApkmL8C5goThWDA
	y6rNsF4D2n1UySCgD+r1/8fQ9iexHEXH4kLkA9zaXj3FJGLrhRYX//fEoEkjVa1NMCGEHJcX/jfUL
	sbLiAzZhCXcSG7lfztHqrjWHkeSPhcKsxKr3QmLW3MIXzJ+alg1wFYhqdBUKw9nueSgMPkcmI2rIg
	2T/+9iYfwIB/OFVcE0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N2-0000000A3Ou-3BT9;
	Wed, 14 Jan 2026 17:09:24 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Mx-0000000A3JF-3eJe
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:22 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-4327555464cso37309f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 09:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410558; x=1769015358; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=reYbQywtfs6l3YId6TEn7g/nU2+zvlCK5bs8kkfE33Q=;
        b=lGjBr0yUkhCGRPorgTPWyeDs/Vs0cHar69Ami9M6XzbrARFqqXoBuQ3XxfZsnozeLC
         f/A6ZZKlHTyG7V9NNQ/CBs6XKw5po5j59MntCiFrAlg/hFgdlogr6KPmUrDlGZYzn0+V
         G/6V41a7KpFElcQ3iXWsrpnU9e3iYhS3YeeUWqrQ7WZP0Yy5X8or6hHByH/XOkiWjSL/
         H744/k1aRq/qlNeBDGBPn1jvKOw0T58u/d1+vkmVUH4DtApZLK7iF7+0RkD1vIiV6y7t
         VfopGcAfEzXBeMkIc6zh3zIgjseym39dQclw90sLhWwCoBd4+LZl+xg3xyX0cr+zIXhB
         vnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410558; x=1769015358;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reYbQywtfs6l3YId6TEn7g/nU2+zvlCK5bs8kkfE33Q=;
        b=k+53+QYU5+Qq51RxU5lXup+4PQkCjin1/ipGMpY7WvRL7klSc4HThyHDIExCZlNpmI
         2b0va+hg+briWtAzmmfubxO0iCkj6/cdQDKp7T80jN6MAY8Q9mFwYtAOPBwRCM8evNZ7
         5NMj7pvrNVZ1zGHcVHr1viZimHwpCP8y/80br0hYOgLNcCo4Le4XFpUC/wtI0ng1QcR5
         FwAs/p3+YcrFBTNcGdGQ21d70nWCQ8D3u9tXBYBZxrN8JoZpDiXQwh4sCayNgm+HQPaA
         yMKs5Pu2rm+ExSdhZgROMX1WCga5xuOd79EEAI+O8x02ETzGYuNJaFC5tJSXavrNjHpX
         vBXA==
X-Forwarded-Encrypted: i=1; AJvYcCV+fJlW1IoWCdLb8Dh/bwnOIcGAI6M73RiTQQm2zuVXRpSF1G0EYgjDS7YCp6wIasqEVeeWqXgpbJzBlsi3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2xxoFw6sbQJQ7wH5ozQzOCBiYYyhTgNuwnzjUFzu161pkt25O
	eyXR97y8gMVF3hwWiywQPgQhzpwu/SiwTmPt6PnL3e+FeOQ6PrdMvSutgizZqNKB2PI=
X-Gm-Gg: AY/fxX4h7rvNOnfTv22ovOlEnD3Ur4bAIVMTcZRWgV09/R705I8C6n6Xf1Fjx0aDQ71
	ZiO5zHwhBalNsRU4jeVlR4aXDHe7sltY8IAJwvdJUMoiZlFtLb+8maxbJkJoAzPaeEEQB/Iglsg
	z+p5KkVoz//HjLddQPpkd7hWQCBhmpeQs2anMPWVMH6BJuP2BKTouBjawNI91umyHlJc10EnCaX
	RAV/Kct/pKJvheGyWFTI8uU08a3RMt5+FaekTKMuQ38EHtMD6IZgpSVOXSp3jRzE3f+9QYQIHs9
	LajIrIUC+0TcuuPL+rDYFmCA2KhkbvlixdC7bEBs7zK6Ti50EqxXKKKtYzCWtDnP/IHW0MrujHp
	5VJ9gVfMsDL85xb51+6575QxoXGHhcerLTPFHbiAc281WqAMGjyZTy6CDHXCBnQmqsJYsiXEkVA
	Fc6VvkSJ8SJw==
X-Received: by 2002:a05:6000:1847:b0:430:ff81:2947 with SMTP id ffacd0b85a97d-4342c535b91mr4556126f8f.40.1768410557880;
        Wed, 14 Jan 2026 09:09:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-434af653632sm428077f8f.11.2026.01.14.09.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/6] arm64: dts: amlogic: assign the MMC signal clocks
Date: Wed, 14 Jan 2026 18:08:47 +0100
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ/NZ2kC/x3MSwrCMBAA0KuUWTuQTz/qVYqLME7bwaRTEtRC6
 d0NLt/mHVA4Cxe4Nwdk/kgRXSvspQFawjozyrManHG9sbbFkKLOQpgSIUWlV8FJY9Tve8NgBu+
 Jupu7eqjDlnmS/b+Pj/P8AWHOBLZtAAAA
X-Change-ID: 20260114-amlogic-mmc-clocks-followup-a0733cc59283
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=osL3XON6lRfI69E18cOlW4Vk5fOS+vLWguNhE5gZqKM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ82qSDQH6O9jmtXAKWRTCoF+LxEBOk9KYznRS
 Zd6puz8K6OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNqgAKCRDm/A8cN/La
 heaED/9btb9Oa74WI86rTRohOlO3HHZXXSA93nDaSoSWSFXdvpZcHmSQG9jFM67Cs7/lCekRJnT
 1QKo9KcmQmLDJWuvi31AjnTRy2LcmfauU1tweirotmb3i5MmlUR90jma1qBBo6w3dqEmLBzLCDx
 FavwLmK8mFn1Oq4gC7q8WbIWn1N0J1Oqrw9Q0EcekLoEQEFgpRvvYuxnNr6CIE4m2vkRkVSgLxl
 XlZ93u0gadznFmppwbYckjrP4sNg42qQ4zPDvUySI/3o72DO/3mI4b4AAxVgAe76+t+jJ+kB+n+
 FK6uXbkPsNwcM/y3zo6fESeg1YQNaLp9BXotqQeE3ZfLOFU2sNCaAmBaIPoKOOsizhy9l8wxvgh
 9nHqASssLqwUiDLG94JwjlNSgL2AArURMcgmyWjUYplZdcBu6zpLXkn5H48v0XwyGYrjDV93w1H
 pC1qoV+wj9mOjtWWy2H5j+gz5wHZXwz6x28H+h1o9y+afu1PHXwcpzjp/8oEVH7OHtJQJn9CnmZ
 4bbHWgaBbDZJiENt6SdYd52Iu4f21OCzIi4W51ZWsnwMyMjbCWaLYQv9krAwx7JI5786PdqdC1a
 l9ud+ACyxYzvRHWQd4+CijXikNgk1xgzIHQz9u0GK5HF2W8S0bHnwcNSBb2dY41NteiJzSNePgy
 PCHKqKf+gbUoQpw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090920_262126_A7585B53 
X-CRM114-Status: UNSURE (   7.16  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clocks to make sure they are properly configured

This fix has been split into multiple changes to get the Fixes tag
right and help stable pick up the change.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (6):
      arm64: dts: amlogic: c3: assign the MMC signal clocks
      arm64: dts: amlogic: a1: align the mmc clock setup
      arm64: dts: amlogic: axg: assign the MMC signal clocks
      arm64: dts: amlogic: gx: assign the MMC signal clocks
      arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
      arm64: dts: amlogic: g12: assign the MMC A signal clock

 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi       | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 5 +++--
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 9 +++++++++
 6 files changed, 43 insertions(+), 2 deletions(-)
---
base-commit: cd3b654a413c14648d0074ca160da62e4e29ac88
change-id: 20260114-amlogic-mmc-clocks-followup-a0733cc59283

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
