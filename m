Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F14BC7619A
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgzSlkTUGqCkgCEGtBHiVy0mazY0GV8Wyol9+WSIuZw=; b=bAxq3YyyJWcE6a
	vEw/lnezGkNh8UNLRt6RxcBMeC7uVcwrfsqX/L5cR93ZbNjd60eBZfESzp/U+T2XFzTzJwpp4PKYu
	ZjZr5TNwu0vR4AjqzWFiBkwPOErAEZKudzrfFLqY0TNHxYVJjxc0WRwQcolZHlSVoYlGqt235aHQH
	eGk3XhK5mUBwmEb2H8j6IO3zV7TX9K4cjf2pnaqX02UtNgoLE4xIA8hmZqnTQy6dot88ty5ZK0JRK
	CP69ztTuldiMzBf0WqpCB821XmRm2p4yH23cGr7GpL+iutWn5tm2OHRr5jaI3aWr97/SZPxgfBpBj
	yyLfpR8l8kfszMd3OX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqv-0012dn-04;
	Thu, 23 Mar 2023 06:55:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqs-0012be-1w
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso1455313wmo.0
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rN6aHfIsm9J0O0IQ057yFCHJ2uZZpYnxmMmMU+EKtRM=;
        b=Gy+8Lu6v/bZlW+vbnMVC+IKKgO1JvfVKi0m/+A8kaCCB3fsXOenBF41+sD+VteMRty
         n5pTU/r4+EIyLzcIpzKMiqJHzp/h2w1tB8iEKYJGlrmr8hp9r0wXRrrpQQ8rFhfQjRby
         SaBgmkEnerfM+i6JERh/FgsRgVsHVLypCisfNXDNa29lOXRGTzXPqxY9AORMpmD+Hj6Q
         1dzpHU9FoGodTxhDYGbIjKO6T9XWtFFqKtP1o4s24qi7p887aMhaFeEpb2h/HsMlHZ3g
         Cuz5a2+l1HGTDI4oZ26/84rpUU2mFVE4FbiLhhqVUqBQ024KhSHrAMBvzrarLzTDE3bm
         2QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN6aHfIsm9J0O0IQ057yFCHJ2uZZpYnxmMmMU+EKtRM=;
        b=WY4SEeQzAWvb3a69CJMuaSOVTqgI3y7f2OSILvlaEZef0Iq8aszJydeDiQcVzM8McW
         uQqQhH1QQNvaRQpQKxVlBuLUWfVKozwZL7jwFBvNnWTuNqpvQD1QlLcJ3UYIomNE+zRA
         XzcXNJtyRbWRvpGMw3dqLyq1mzgI+33vCy1AQXpiFlBIp6dzjW5L0O+GqUKViSRGsawJ
         6y/5nzQ/QycJPRD4jKBz1lgO36wWYzakEkGU+GuYNhe/ew9oNMtF53ZclFCGbeZ+skev
         2mzvnihMX4CsPeiZKH1QtKtElQuoNzHfkogkCilPqxw54E9aiEG/30Pc1evd1BNxK4sD
         I3Yw==
X-Gm-Message-State: AO0yUKVhCkMOL3jnaCpF1uBSwqdIYaxw4OaozU6GZ1lzDeLnZX9YVnFn
	/eFzcOuRymiuMUoiFgcuGmo=
X-Google-Smtp-Source: AK7set/WPhOZXdtixiljuSaJMWVOjy1ens8aHBUnHUwpxebaDwf/7ClFlGAbyitgyoaN/dicmELKBQ==
X-Received: by 2002:a05:600c:211:b0:3ed:de58:1559 with SMTP id 17-20020a05600c021100b003edde581559mr1507089wmi.2.1679554503715;
        Wed, 22 Mar 2023 23:55:03 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:03 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 01/13] docs: boards: amlogic: add bananapi-m5 to u200 maintainer file
Date: Thu, 23 Mar 2023 06:54:46 +0000
Message-Id: <20230323065458.776029-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235510_638885_E3E0CCC9 
X-CRM114-Status: UNSURE (   7.84  )
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

The bananapi-m5 docs are missing from the file, so add them.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/u200/MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/amlogic/u200/MAINTAINERS b/board/amlogic/u200/MAINTAINERS
index 47cec234a1..919e349922 100644
--- a/board/amlogic/u200/MAINTAINERS
+++ b/board/amlogic/u200/MAINTAINERS
@@ -7,4 +7,5 @@ F:	configs/u200_defconfig
 F:	configs/bananapi-m5_defconfig
 F:	configs/radxa-zero_defconfig
 F:	doc/board/amlogic/u200.rst
+F:	doc/board/amlogic/bananapi-m5.rst
 F:	doc/board/amlogic/radxa-zero.rst
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
