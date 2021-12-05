Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD88C433FE
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 21:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9oJO6NHBrlWs3CQIFkybc8ptz9o4gv/J/ipJ+NxwtgI=; b=hKGKmwyjcKZ8M0
	NE6LvbGd0eZnKxonU78iaoGMGrFoRTgnGaFH9pRDHcFkoECBKAiDt84LjbFNwiuZKhZ/gqK8zg3XZ
	+5SpaNsOscdfr3jToKlAXrr5VG0FEJE9p4P5YmFz6X6IeGtqijoRitkxJciaDTM6u6vhw+wLQHWir
	Uv4r1RLb4iN6MmpL8D56H/0xphwUp+OLgyUJj6Vd20d1ijzkowKAaK/0cIw82ZvzNkqBRcbqzCr53
	9vsWILdN7mI8kxg6uKOp8dTISBIKuLyaF1tuNRTlatTQpxrkb2OvRyVAogyg99WmRphHeCi9lj9GW
	TbY0zNovLJbgdCwGT3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtzXC-0021Sh-8A; Sun, 05 Dec 2021 21:59:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtzX9-0021RP-6h
 for linux-amlogic@lists.infradead.org; Sun, 05 Dec 2021 21:59:01 +0000
Received: by mail-ed1-x52d.google.com with SMTP id w1so35083401edc.6
 for <linux-amlogic@lists.infradead.org>; Sun, 05 Dec 2021 13:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BxkF5ybR0sSk2Qc7tg8NydRESBO95j6lxDt9gByhy1g=;
 b=w/G4sML9qUsb7KLbUWLibhRlfiQ80RPjmTxdQ3gAzGDCWFkY393BkGlykTq9AHPlk9
 pvE7QEZ/DkNJ0UiB02hi9PX7jHkeusq6HShRuJhdg2APdxaehEU9ial5VdD2UUvAKL6o
 HamHUMqhHG0k13SElimqCk0AY1ERiXlxfNGW1s0nIcf2MUwShPAb30pzzcx//i07Nznv
 dr0l+mofibJTUpmoM061AXi1E5v8TjQEPV4tvnFzyyUxiW6kYxuaFsDGpY+ZWjEByCc5
 itjRhNzgluXdhKyTbgJvdWAZHsALFhtOnE304y9Nx0StLWh20tY6cixNzJNlKg7yD+xa
 FuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BxkF5ybR0sSk2Qc7tg8NydRESBO95j6lxDt9gByhy1g=;
 b=nLc4Mfl7JkEEUcO+8F3dv16AloJaKaS/Riuf+zBR+xRzN34cib6YueYlL3cGiiSLQj
 meFzN7p+nwXFNjHFyeHP38eTZBf9+h5/B9o1DhCedami8UTAoTECAkMmki82XszQAxmV
 9a7P23sgc1iOfGqPnqKwYJfKI7ST0Tk+kd7HieYLsjvB9+Nq33oMtiG+VK1hMPlwV0Hf
 b2IJsnd9tSQM65Ng8FIgdur5597qEOUIdfplQEphLeNf6cLGLQ+EvM4lMXRTxTXrZVfo
 5I4TUdwtv6/q8do/iYEMPJ8paiHck1M/qvDAukjnc/kZXdb0sHsD7Uz4cFteJuDY3XD9
 6y/w==
X-Gm-Message-State: AOAM5320uTr8NAu2VA+5TUfqhy1Cxvu0bzenMTFdQ5n47fU41gQiEmqS
 5PphM72oedWOmptDf3seIwW/pUh+OBEsSg==
X-Google-Smtp-Source: ABdhPJzLotjrC5Ff3Uclo/otA6yvJQAalYclQgEKqqe/Z2wTloRzKQO0F2RjuK9Ctb39xg6oa/xEqQ==
X-Received: by 2002:a17:907:94c7:: with SMTP id
 dn7mr40207945ejc.470.1638741537718; 
 Sun, 05 Dec 2021 13:58:57 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id nc29sm5724291ejc.3.2021.12.05.13.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 13:58:57 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 0/3] usb: meson: fix shared reset control use
Date: Sun,  5 Dec 2021 22:58:43 +0100
Message-Id: <20211205215846.153703-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_135859_265546_A6C8D714 
X-CRM114-Status: UNSURE (   9.40  )
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

This patchset fixes a usb suspend warning seen on the libretech-cc by
using reset_control_rearm() call of the reset framework API. 
This call allows a reset consummer to release the reset line even when 
just triggered so that it may be triggered again by other reset
consummers.

reset_control_(de)assert() calls are called, in some meson usb drivers, 
on a shared reset line when reset_control_reset has been used. This is not
allowed by the reset framework.

Finally the meson usb drivers are updated to use this new call, which
solves the suspend issue addressed by the previous reverted 
commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
use").

changes since v3:
- Remove unnecessary reset_control_rearm() after reset_control_reset() 
failure.
- Use dev_err_probe().

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  phy: amlogic: meson8b-usb2: Use dev_err_probe()
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 1 +
 drivers/phy/amlogic/phy-meson8b-usb2.c   | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
