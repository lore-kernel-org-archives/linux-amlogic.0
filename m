Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E86C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2024 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LK1bS9dzWPYOVc0+6LaFosFg+E/XnSStvI76W5KENBI=; b=W2gs+WYEe3lE+7
	CO9myHtT22wwkL9E+6bCZC/RPRS7H4Hv0RlLiSjJPrZdG093ONJkhUi1IdNYnOl+zxWaQDK19+Zu8
	6TRNojtXlIcZPlIGujZvHo0xi2F1vUfMi+XhDBfbSmA6zVW5gpMsCLSJ83gAsyynTFnaJKmlArBES
	LoTa+/FDLKa3EONW2Zs7vsyZT7mjc7dow34/lF8zS0hCSeUa5x1f83MieDLpL04ToY5CUR5Tz2FdD
	ED4brW90I7wBymOpAhX6GXcWHeLNM6FPhcBkMA8cDuInsy/HqOWIwQfc2F9/mVOc/wPveEozc/teN
	GKwwbdWeNxqK8kAj9zjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roPd6-0000000CqDG-2a5A;
	Sun, 24 Mar 2024 15:19:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roPd3-0000000CqAp-1GOZ
	for linux-amlogic@lists.infradead.org;
	Sun, 24 Mar 2024 15:19:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-56be32b9775so2716883a12.1
        for <linux-amlogic@lists.infradead.org>; Sun, 24 Mar 2024 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711293553; x=1711898353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orAznLnWy0CEitEVvnSeuGQAseklMB0s/6SFzX1+Rno=;
        b=jvCAklo4HmxZDR2JHJlQ7wJEHaAWlSca0OmbYoN73rrL8d4tU+I2NewWSyzoyiK6A7
         ZOptr/EQZ9IgLQdI7a7egTulPIOpRHOj4ypqe6rTXRB0xuCh+UROgguw/q1y3NwWACTm
         Dpv7SMSx+1nUnr7uv1Gc8vcJhv+Gx9sRrylPsvaJvBHRugNyo/7uQSEkFHACkJq/ZUz1
         YHxddX5YzWXCJLONMYWa/yN005OLynfkKVWqMVZh+58Y9ZFESaCJrKt+2GugNLo8e4R9
         rZYOsKTm/Lz0mlmr7Fh5JhvoMTJ3VHhZC2L9ugkx5VSDCx3Z4U4+2CGXH57KUbbTiy/c
         HRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711293553; x=1711898353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orAznLnWy0CEitEVvnSeuGQAseklMB0s/6SFzX1+Rno=;
        b=trEOAbWuLgsGc7A1m3/WJu4BPduuPg2+1sDy8kjQeZ7nAKbdCrq0UMqr3yq1vnRcpP
         tDLlOV0mu50hdqDJohn8F+04rNUujWJ1Hi3R1iVtdNjUtRlTyQ9Ezw5N9CfIUnxE4CwP
         WAzTGZPM1c2q2kLGAYy7IqWJEAfjHDAPKtwdV4TwrtNtyanFcXP+g5fu1qGG2RRuNZ8c
         Pfo79Xdgm0kWdOAwAJWi5sZg7CWfajLKigcahzYwqRHAivLW52K5M1bcfsJwPLtK2lVV
         uaEsO0vffdbn9cHYz2iaJiMzbHyzvu/ZstuXFNx4xO73TkNcv2CjCRq2yyIP6xd4OAIL
         ac8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjXju3f4Rpw6GGE4proxkM/ABBoXyqYb4W12huE15c4+myU8Kj7bDIqVvD+V+9YqvhGDDzlP7r5KwC3Cb5dZMu25qF0qo5O3DnWoB/dvkRiGk=
X-Gm-Message-State: AOJu0YwqQbZzIDHEjHvn5Iz3zpLdTH7Ik50lMgaOMitNjDdsTShDsaDK
	aSFI8GwItj7+WeUccnxx3ZcAb22GQA2UJ6CY9MhivWRbL9K4sbQK
X-Google-Smtp-Source: AGHT+IFhRJgpiqLGFCc44rQRz5LPiyxEJY5CVYn69exzGloG9UHUmJzBBQMw9KF+UW7QUds+qK+B2A==
X-Received: by 2002:a50:bae7:0:b0:56b:d15b:6dc1 with SMTP id x94-20020a50bae7000000b0056bd15b6dc1mr540362ede.23.1711293552801;
        Sun, 24 Mar 2024 08:19:12 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id o26-20020aa7c7da000000b0056bf34d656dsm1996114eds.29.2024.03.24.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 08:19:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/2] board: amlogic: add meson_generate_serial_ethaddr fallback to p200
Date: Sun, 24 Mar 2024 15:19:05 +0000
Message-Id: <20240324151905.3817732-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240324151905.3817732-1-christianshewitt@gmail.com>
References: <20240324151905.3817732-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_081921_373374_F244CF5C 
X-CRM114-Status: UNSURE (   8.92  )
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

Add a fall-back method to generate ethaddr from CPU serial on p200 boards
if the MAC cannot be read from efuse. This prevents random MAC addresses
on the WeTek Hub/Play2 boards.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/p200/p200.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/amlogic/p200/p200.c b/board/amlogic/p200/p200.c
index 7c432f9d281..3061f7a6b3c 100644
--- a/board/amlogic/p200/p200.c
+++ b/board/amlogic/p200/p200.c
@@ -30,6 +30,8 @@ int misc_init_r(void)
 					  mac_addr, EFUSE_MAC_SIZE);
 		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
 			eth_env_set_enetaddr("ethaddr", mac_addr);
+		else
+			meson_generate_serial_ethaddr();
 	}
 
 	if (!env_get("serial#")) {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
