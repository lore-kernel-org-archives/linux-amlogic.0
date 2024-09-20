Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FD1CF58E9
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QRjEc4iGnLOlMuqauDoP/7FvJSRps9NxdmfLs+quu20=; b=sVZz1UhdMhR+vt
	hTWtaPn3F6HMDZdBRjobNA1lgjWL4YNe6KGhgadgZELHdb35/UYMXHW7QMB5g3W4KTacuH+KgrmJu
	6N+TDJvDz+HdOujThQWvJFoU2dcfl2iltsy74wJxTRMiFWVPE49BXllP/Qy/MF5BUvrzz9F3pq1xs
	D7kBWoSTxjK4n9ob2X8OA9CK1pTCuJDR1HkrdoBPQL4uTLqOS/ThFFdFjafawy2vjJheJob+q8ULD
	rw1P/yw9ir49Y+n4FX6hJajcmI+pMhjTE0u4gkW3ddZakWuQoA3cnEdEX5Zee6SD4U69XkLYIHedb
	23MPjRYrdXwX5hUoJU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYqh-0000000BjAV-1i8u;
	Fri, 20 Sep 2024 08:18:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoL-0000000BiQR-1WSu;
	Fri, 20 Sep 2024 08:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20EA95C5CD3;
	Fri, 20 Sep 2024 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AFE9C4CEC3;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820175;
	bh=RY6C6fgg/u2FQqsycCMOcuCyZ6IO+mQm4xQLZhTAfLU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rznLJj3/j4Y33sCWx4vMGgJbObJootBWRDxFOVas4+uMuqz+pMCu6KqTPMbQFo2JE
	 u1xTbuwdZUZEaq/TUxV5vU4kLP+OMqVdoWxBsP23g4A6ychrD0O8Mu80xFx/EV6uxn
	 gSe1g5tc0/a5lmmRHdv8HyHCwzLJBwGEjGBGw4WPrGzQ3yK/Jv7PnCxBXDJD1gaP55
	 q1kk4QJSQcxJ1sLjuOYc+E65UwIPyLQzrdWH3esYxxd8igJP/DjOug4HmetJ9786ZP
	 9xMBrq2iP+jOb77FgOPW8jZo63QkVDQp9GBvwI2Oj4o0GaZEbW+RwIUAD7WRTjDQZ3
	 brCiVJeuMz1GQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F15FCF58E5;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 0/6] clk: meson: Delete a meaningless spinlock from the
 MPLL
Date: Fri, 20 Sep 2024 16:16:10 +0800
Message-Id: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEov7WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0ML3dyCnJz44oLMvJz85GxdkyTLJFPTZBOTtBRTJaCegqLUtMwKsHn
 RsbW1ACypo2ZfAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726820173; l=1441;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=RY6C6fgg/u2FQqsycCMOcuCyZ6IO+mQm4xQLZhTAfLU=;
 b=Bel3Jh1Lzlk031mBbSqUOf1Dk86SKnJakYDwJxNS3ho8IG5uNcg8mx+X7/EfDSiy6iKQyUMhu
 3KqlnI81BLTAVgJmOjGOvofYkUdDus+QNqhGaVI3qnas/eAXOOemQf7
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011617_574163_8B131939 
X-CRM114-Status: UNSURE (   6.09  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The existing locking mechanism of CCF can effectively avoid concurrent
register access. struct meson_clk_mpll_data has no meaning in defining
a spinlock repeatedly.

In addition, the register corresponding to MPLL does not share the same
register with other module drivers, so there is no concurrent access to
the register with other modules drivers.

Every driver file with mpll defines a spinlock with the same name (even
if defined as "static"), giving the illusion of repeated definitions?

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (6):
      clk: meson: mpll: Delete a meaningless spinlock from the MPLL
      clk: meson: axg: Delete the spinlock from the MPLL
      clk: meson: meson8b: Delete the spinlock from the MPLL
      clk: meson: gxbb: Delete the spinlock from the MPLL
      clk: meson: g12a: Delete the spinlock from the MPLL
      clk: meson: s4: Delete the spinlock from the MPLL

 drivers/clk/meson/axg.c      |  6 ------
 drivers/clk/meson/clk-mpll.c | 11 -----------
 drivers/clk/meson/clk-mpll.h |  1 -
 drivers/clk/meson/g12a.c     |  6 ------
 drivers/clk/meson/gxbb.c     |  6 ------
 drivers/clk/meson/meson8b.c  |  3 ---
 drivers/clk/meson/s4-pll.c   |  6 ------
 7 files changed, 39 deletions(-)
---
base-commit: 0ef513560b53d499c824b77220c537eafe1df90d
change-id: 20240918-mpll_spinlock-4b9b55c44fd5

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
