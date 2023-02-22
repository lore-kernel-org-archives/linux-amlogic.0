Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10865C636D6
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Feb 2023 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3hN/RqrBq6Ra68XGlzWeXabF7fYdea+mli1q+5k+DLs=; b=nD6tS+3CbRNeGt
	QXfrDh5c0kiphLVK3Cad0vsWaNqvyHb2zWOh6EuP/xJCJx4bpBUTmBbrDateaULCr4p8hChdImIJJ
	9zNBeXZDpKf3N/RatkWcDWhSwcHXZYmAI/RcEB7CsX+ykvq9UHgusHlrMqKxApVq34L6amaXlkzCx
	NiFf5RfympgquB1JlGlMdatfFl8Fg2WngoxPTHA3q2FZKPqRtbVM4g8xqq9PAnKuogvpsb95yfcSI
	74gbvqqByHT1f7V+zLzKaKSPROnKLuY5ubWAHA9UmkYhQKmpUpUggSVSNICgSrLo1VvQOsmpiA588
	igCUNDSeZz+wNTRQxSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwIK-00E6dV-IH; Wed, 22 Feb 2023 21:04:56 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwI8-00E6W8-Jk; Wed, 22 Feb 2023 21:04:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eg37so31963257edb.12;
        Wed, 22 Feb 2023 13:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jHzJivt9HpdLxfhNJzT2EOfp00j8BcuasYYwqjK38/E=;
        b=kZTwyGEiPrvsEohuvq8Lu5GaxX8jse1emt8D2g/FYBDH1UIDsSTs323t9g12L1xCjB
         PZ8uINek2hJc+PBs5jvn3GhmdNZEJ8FpkQCxwdTVA6ny16ddgi73/FYftBpvJSlg35xr
         xfJlNpj2ZhMhUDVDiF4wdMq83VupBzVujksL/ELDgq5pQ7CCzT5NqWC7ydCQT3TuCmEL
         Ou2tKRIKMiET2bbGDKfhkMN+jzsuqELy834V0nYHbuh/Z65UBDN/TTvaohmku/wWujdQ
         BHcbXcglk57Pgx6bY6e9TdKV05ilK0jpkY6JemEFdYUtubrYtAjx/w/WFr1/KiDFKtkW
         novg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHzJivt9HpdLxfhNJzT2EOfp00j8BcuasYYwqjK38/E=;
        b=DD+T/mEVgaeI25x+Zv1wqO5CEk6PNAfJ1srSEiM5VOpTkt705b58FbGWniwCY2Z3sc
         0CFzCc+vzVf/8Pqz8+gMxo2rAP4WM94XvUfqwSBsFTJzyj9lyyOlTZqDSkFjc0dZE0h9
         c0eop9edAbDICIBx5a6lalYHmcgATipPFrpjX2xtwgzqLUgSBIpFD85V1bC/Dr1Ag3iQ
         2wUdK0wtMgeVN9BZwNAGDPPa1iLF9xEiTO6quIcI5uaxW68SHRVGsESXhmhv590ioXjX
         0RsbcUI7oqFs2t1EvLnPT1bdL8NQdD0zOq07ioUsNxzrk1bKEnH7WOpjFc0gf9cdgqIE
         Efhg==
X-Gm-Message-State: AO0yUKU2f3nDv6SZC00mndpUPxuKDkDCiFTKwRhKUH01lGQIKx/UPctn
	+P/1gxqke4LrvtnWSIxZg94xbcGZl4y3Sg==
X-Google-Smtp-Source: AK7set8hkdfsi2LjDwLjtOhQuQIIFKuh9ziV22wwpO8xn5kqBWL0aL5POTZXLTeWhP0ZvK2q9sOm/A==
X-Received: by 2002:aa7:cf03:0:b0:4ab:4d3c:7e99 with SMTP id a3-20020aa7cf03000000b004ab4d3c7e99mr10214265edy.2.1677099879661;
        Wed, 22 Feb 2023 13:04:39 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-76c9-eb00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:76c9:eb00::e63])
        by smtp.googlemail.com with ESMTPSA id m17-20020a50c191000000b004af6a840f21sm209208edf.15.2023.02.22.13.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 13:04:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 RFC 0/3] meson-uart: Use "divide XTAL by 2" bit on G12A
Date: Wed, 22 Feb 2023 22:04:22 +0100
Message-Id: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_130444_711384_E436BF84 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series improves support for UART attached Bluetooth modules on
Amlogic Meson G12A and newer SoCs. These SoCs also support the "divide
XTAL by 2" bit which (greatly) reduces jitter when generating baud
rates such as 1500000 (which is used by the Bluetooth part of the
RTL8822CS SDIO WiFi and UART Bluetooth combo chip).

Without this the baud rate calculation is based on the XTAL clock
(running at 24MHz) divided by 3 (meaning: 8MHz). 8MHz cannot be divided
with integer division to a 1500000 baud rate. Using the "divide XTAL
by 2" bit however means that we can achieve 1500000 cleanly, without any
jitter.

In future we should allow dynamic switching of these UART controller
internal dividers to pick the best divider automatically for the
requested baud rate. This however still requires the new compatible
string - which is added by this series - to enable the "divide XTAL
by 2" logic on SoCs that support it (G12A and newer).

Why am I sending this as RFC? The last change in this series means
that the resulting .dtbs are not compatible with old kernels anymore.
My understanding is that this is fine and only the opposite case (using
old .dtbs on new kernels) has to be supported (which is still the case
with this series). I'd like to get some confirmation for this.


[0] https://lore.kernel.org/linux-bluetooth/3B9D4DB2-D2CD-44FE-817A-F6EA8A0AD734@gmail.com/


Martin Blumenstingl (3):
  dt-bindings: serial: amlogic,meson-uart: Add compatible string for
    G12A
  tty: serial: meson: Add a new compatible string for the G12A SoC
  arm64: dts: meson-g12-common: Use the G12A UART compatible string

 .../devicetree/bindings/serial/amlogic,meson-uart.yaml |  2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi      | 10 +++++-----
 drivers/tty/serial/meson_uart.c                        |  8 ++++++--
 3 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
