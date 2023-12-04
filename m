Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BC8C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Dec 2023 14:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=15Hz2e/wcgcEog1KlATobQUoWtaE9BiyOZncfZfBOY0=; b=M2CBkRGkUVn7Ki
	ygUz1Ouenn0SAjhRuFwy2csiYB5hJTV64JCXC6YJEV/D71xySie/Pf2DWNNlcPIH6IcT/khIyzu7q
	4A/7FWXtp4g/gZ5tWwzTnVPPGX7uvPPUr/yD9e33yLd9xiKxjIJjgPSTgN9oEXxzwDKl40flDevUG
	gwrFZAEIkIHMhT+2TnvpKpOKocjMq4/aZiSEezTMwYNwDHGjG7qQYf0alxLBubvCAwZgwI0J+9P9+
	KPhkLMP9Uj9fXk0sxsvsAdI2sdudlULv02v6mUrBXZWALXYSp6Cv7WSbBdL3tPOE+icSsYxvLjYQm
	m6KPyqRHii49Qv2CMdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAABi-004pRh-3C;
	Mon, 04 Dec 2023 14:44:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAABf-004pOw-32
	for linux-amlogic@lists.infradead.org;
	Mon, 04 Dec 2023 14:44:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d04d286bc0so15970385ad.3
        for <linux-amlogic@lists.infradead.org>; Mon, 04 Dec 2023 06:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701701082; x=1702305882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Tt8Gv7ATN+690WK7SFLJLeVidBUDbMMRTMF/v4T19E=;
        b=eaXdDeVpajF1KvTZDQTRKpXIjCvyhXwRAN3qfsJ8CyeocZTc6FCOhadtPv70hHeIQY
         YjaVIpV00uXLC69IkyQW7f3UPBYAImHCje+xW7SqcIEOZPve1jw76nTVf6Pl3r0gDA6H
         QaIqRUagC71xN/sxkOu0m1r1LlZgtosSYuxmAaH9grpO+nmdhitt3RaEgNRX1UkXmOx6
         R8156N7JIds80X/nC7wxqHmNTMNiCRbfZfGMuNSxZY06ZMmdCTvTDMY1ejVX0hreFCDR
         IZcNUX4btRdl3BVOztosm2OplI7m5qL7BUbEJBjMkmRM90t9ho5z0t+zX5/eMMiqrG1R
         ojaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701082; x=1702305882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Tt8Gv7ATN+690WK7SFLJLeVidBUDbMMRTMF/v4T19E=;
        b=sOZx/AbzYL2VJJR8kvZzgSqH96Cd1UlE4l354RDvpwSqMpfM1DMtEXweRmcZElK8Xi
         QRLz+eWmoeO9iYtRD/piJh7W96tagcqJ6u/Rt6K4kxuNnDq9immb5L+oypk4qpTcVjXu
         VfXVPR6I3O2TUjEgfh10hbqSLEQ70vSKugqIjJ2jrkrdvaFSb3ALUGDzHssv4ZAGPUUt
         lmdieF6UUp7yT0meORZG9XjuLiNAvWBr0GKCyUeqE0yrjK2RvApfxh8VwZcBPHbkawmd
         5LlKVyGQVtQvU8a9bzcC/6hmizJ4qPmr710qUrPlzme2YLiCdiixQyXBCXK+yVR3f3ol
         pDUg==
X-Gm-Message-State: AOJu0YwV6m4UytBg6FnkxlQHmqIdbDHNEhn3Op73q/dV226wf6e88/e1
	3WXaintH/EbNwInIi7ieJzFDRB3DOsyrXQ==
X-Google-Smtp-Source: AGHT+IHouAmaa1USR/l+6oUszGicGCOTkZq7ntxxQQvSA0djyq4RrN80jzU5vDJK3d2d+cS2U26pAA==
X-Received: by 2002:a17:902:7c8a:b0:1cf:fe32:632f with SMTP id y10-20020a1709027c8a00b001cffe32632fmr1688755pll.22.1701701081619;
        Mon, 04 Dec 2023 06:44:41 -0800 (PST)
Received: from localhost.localdomain ([49.205.242.26])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902d34600b001cfb99d8b82sm6446815plk.136.2023.12.04.06.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:44:41 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: 
Cc: Anand Moon <linux.amoon@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v6 0/2]  Use onboard usb hub reset on Odroid N2
Date: Mon,  4 Dec 2023 20:14:24 +0530
Message-ID: <20231204144429.45197-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_064443_977064_6B159DC4 
X-CRM114-Status: UNSURE (   7.49  )
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

Add new binding for Genesys GL3523
Fix the dt_binding_check error
Fix commit message and peer-hub description
Fix commit message and vdd-supply description

Hope not more issue with these changes, finger crossed.

Previous:
v1: https://lore.kernel.org/r/20231010032446.3194-1-linux.amoon@gmail.com
v2: https://lore.kernel.org/all/169700589265.2911018.855796610271678067.robh@kernel.org/
v3: https://lore.kernel.org/all/20231119023454.1591-2-linux.amoon@gmail.com/
v4: https://lore.kernel.org/all/20231122182351.63214-2-linux.amoon@gmail.com/
v5: https://patchwork.kernel.org/project/linux-amlogic/patch/20231130053130.21966-2-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (2):
  dt-bindings: usb: Add the binding example for the Genesys Logic GL3523
    hub
  arm64: dts: amlogic: Used onboard usb hub reset on odroid n2

 .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++----
 2 files changed, 85 insertions(+), 16 deletions(-)

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
