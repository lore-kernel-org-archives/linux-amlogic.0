Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBF8D31A12
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 06:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vE6XSgQwyPY2km0evX8v1FF6qtnJdY9DOhTPDAHaOtk=; b=Q2N
	DETUahKxGAvdbkTBzxlQ6oN3sKTsCdPZBX3sTn5XBLxFDmDU5wLt2hQZ+4kZg2b03Npe2L1RoeYeH
	nO64f9fmSXAGpQi1WwdgP0Run8xvPSJRjeH9xwlApdDlno+pwhms49H60oMQKMxS4sjUgLuD5tgCF
	aSDv/EEUPuRtBSg/s1eCmXT1405RpxtWXwqAJINx7fY/RIy7o3gjcK0VfSBEcVqpfXdJ3KpQAu919
	bYk+/PgqEQwUD8bA+wRf0+EbdKc+xbud2cpSvep+tGe3Xe4X3BzPTcTATvkD4kjI0A5oh1CyFXGSu
	ykFYIdvlPesah3bbvSPslbdMuzgQ2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKa-000000087NK-3jxA;
	Wed, 14 Jan 2026 06:26:12 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKX-000000087Lt-1Xzf
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 06:26:11 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso4786971a91.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 22:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768371967; x=1768976767; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph6IxAnp6q3+uLiFT21GgPymCv9JqfeKX9RiduzDODk=;
        b=jEHAsgf6CVHvpX9Z8+GI4fk5P5hmYt87csSnknRdhs4fXglMCzz97ule4z4joywNYf
         +AeQr3n3z24b97amycGFnrpxhoYOqxGwKv3tVK7NnTYLfmGsXy7X/4U0AhRpvaf5zsQd
         VH3c07jns0U4maitIqpdgPHBxHC3lutFPS8ox0QG6gqCeJnlDhC1Y5klNy48qUksGwN1
         PY1fmSpBDiuwjRY4G9iLpxkb0PbLZCA71cN2JzBV6hEJzDrhzD+CpcMthfeQtxD4Bt8x
         HLwlSpE7hWFGKJJcb7xOnTRRolqRoH5kAMeXTLbbZsOBUfgSBZscLjjIgSb0cCnzm9I2
         jktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768371967; x=1768976767;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ph6IxAnp6q3+uLiFT21GgPymCv9JqfeKX9RiduzDODk=;
        b=GmsMAKWkUNmNT2cQDLDSz0Wsqq17ACgAZ4hsMLv4Q85UQfM+H0Ixi5qDGZbd59+NHK
         qbvb8jlxfmQruLHi4O8LdmZSQeS3e7TDbcacZFp7G/2VTZfY5nOw0u3Fl+dT/QJAebaR
         fMU4yaZsaifeTMGu2+5tCLqCwHaLFrdpFwQOEQ6yyU5XUN2TXKB6RjDFRvaGjRNzr3GN
         vJ8e8mx0zbVitmDWz3Vp01XANAEV0gUszY8ZosQhigo/M/B6n2koy/z9I0PIKAS76IgK
         qemtbOdUtOSWgx4cOG2lYwFIUJV7B0d6xPT+v5bAIQS+/EatqKHIdcUzxtx3YAYKxxPt
         0yMg==
X-Forwarded-Encrypted: i=1; AJvYcCWQyJIouJ4T3EVwWQ1s+yFWyeRl4WyiUA8fdYjYOr2nAu1zNd2jdiMIbmtpT+JsaMS7JE907ex4mvOA9+os@lists.infradead.org
X-Gm-Message-State: AOJu0YxS6XvJVbttPb9bU0bSnACQUFoYqXGxW5Ih/RhqyZPE1hLXT2M8
	BW/psfeSxK4z6fASsfo5KD+zjOYAq7+ebh449loVbUMqHTe9Gjn77j2V
X-Gm-Gg: AY/fxX5zHPwMIn9Lmtk2g9xX7j6VYQB6stPkMX2SnrWpMts+0F0Pt3gd7nS/7/BMbrf
	3EmqqliU5v9dojgekevQMi8fkref44NIHrZqxXzVJs9PvzkNjiO3CJUKvY7ac8ArDeND0glwQhU
	Gmn7UYYmUZjmoCV3OVnsCRrpr+m0E4tv10wCH9Ss1GUsaW/2zIqLSL3rgcwduVL/k+zMIfn1g5g
	0HxsfPjdX6wFwIEgI016ZNh5T7YvJwXiEYlNnj2fBfRQtUOylEUCwYYiK9eKhZN/UqkFBi0PKVz
	Bx3nGiTmzELrK2K0ZSWNtNkN82lFoKVJWs+Kq1sIKRVJycwt+GV5LpaLLQLDB+bIdaUdvSf9+uS
	tr4l4d2tbZpAicZXCjNz63++P5eoLJlSQrcWUA3kHGqBkVMePvU2aQT2WP+d/HWIzdbZSvAtA0B
	9jF6TMNeM=
X-Received: by 2002:a17:90b:3d8f:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-3510915bb29mr1745385a91.22.1768371967515;
        Tue, 13 Jan 2026 22:26:07 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109d88f0esm891791a91.5.2026.01.13.22.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:26:07 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: dts: meson-s4: add support for Khadas VIM1S
Date: Wed, 14 Jan 2026 14:25:47 +0800
Message-Id: <20260114062549.68954-1-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_222609_412124_D040658A 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, krzk+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds initial support for the Khadas VIM1S single board computer.

The Khadas VIM1S is based on the Amlogic S905Y4 (S4 family) SoC.
It features:
 - 2GB LPDDR4 RAM
 - 16GB eMMC 5.1 storage
 - 32MB SPI flash
 - 100 Base-T Ethernet
 - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
 - HDMI 2.1 video
 - 2x USB 2.0 ports
 - 1x USB-C (power) with USB 2.0 OTG
 - 2x LED's (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - IR receiver
 - 40pin GPIO Header
 - 1x micro SD card slot

The first patch adds the devicetree binding, and the second patch adds
the board device tree.

Changes in v2:
- dts: fixed dtbs_check warning: removed unsupported 'enable-active-low' property
  from regulator-sd-3v3 node
- Link to v1: https://lore.kernel.org/linux-amlogic/20260113090951.35928-1-nick@khadas.com/

Nick Xie (2):
  dt-bindings: arm: amlogic: add Khadas VIM1S binding
  arm64: dts: add initial device-tree for Khadas VIM1S

 .../devicetree/bindings/arm/amlogic.yaml      |   6 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 190 ++++++++++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
