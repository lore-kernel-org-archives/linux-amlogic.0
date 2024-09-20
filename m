Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5746BCF58E5
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mKrR04OvMig9FlXXcf/xP5bZq9EdeDqScw/vFqKIOk=; b=DB+SaF9zqR7V7g
	bxuF9xy6Fl4b0x7bCONmEPYlYADrx7sfDI/iFw+gq9A5zDbei+uUcwXhh4DDnHGerlXP7+73SKZNt
	m1LrVJtZFyGYV4Q5CyprOP62E87NLqVJFrFuWPp72zB355AKtR87mlkQYc0xqbjRVCAqh+goX9LAU
	PIWk/XHjflpHvuGg7JwXHl+uxSXExAiLoP9L/4qa90GahXcWQt09+4HnoG0JHyrMy+7b1o9ZzLrwn
	BTZ5v8+7U6kvFdmZyFbSKaTV0vXXQkAjDoJyQjOFYswf6Kb6+I06KzrsDLFQ0zvBW1Y44cnN7VsX/
	QYZ9/PVP2fOom1xSC8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoO-0000000BiTH-1a8G;
	Fri, 20 Sep 2024 08:16:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoL-0000000BiQQ-0NeA;
	Fri, 20 Sep 2024 08:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72C395C5D21;
	Fri, 20 Sep 2024 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1D2AC4CED0;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820175;
	bh=KGg+9yxlFddJLvy59fqrK62adIYW2fdEx4QtkoNDsrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PetVLVQ+3aRmiyk7jD37i7VBES0LRNaEcx1+/3DbN288tLnLBJirx6WWfzlJEA/af
	 fMe66vfaM9Y2arpx2JcaLTgk2b6fGDhaX6WjzvhKvPGngb304Jw1shjJmdYMCMYtRW
	 b0BhtwSLXzNRc71Z7RvrjyfhETBf/QFTxUfJ/I5yxfka4px6v06GKb2BgySTuhE08I
	 rycCXPqCabVPfs9tpI452Mh/20wnZpJHsalMGHngMSYteeQFB8mZ7kLY9hlqwBxqiF
	 rZelzOs93zVCxygRwuVQ4tmiLeDwRVsu3mivCF64Tev/5XcY9am2jvGYhr4NKdMA9o
	 vpSqoUGS57zwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74ECCF58EA;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 16:16:13 +0800
Subject: [PATCH 3/6] clk: meson: meson8b: Delete the spinlock from the MPLL
MIME-Version: 1.0
Message-Id: <20240920-mpll_spinlock-v1-3-5249a9a7e2b7@amlogic.com>
References: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
In-Reply-To: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726820173; l=1042;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=N+7gK8ye2ZH8Sz8SGwh9nN4Tn81n4jpbYcpMlhBsfdw=;
 b=dphtUdfobSoHJkXJrIcLyyGoAhtVltiI2V0nUCiZXjLIwlYlcis4LsTvsd/4d/Gg5DfGZ6PUO
 OqjLr1Eei1QAyuIutGAG1gmYy2uTt1vpwQylU9mZVhHDYpYCp/cMf3Y
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011617_259787_B6673894 
X-CRM114-Status: UNSURE (   8.02  )
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

From: Chuan Liu <chuan.liu@amlogic.com>

It is meaningless to define a spinlock in the struct meson_clk_mpll_data.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/meson8b.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index b7417ac262d3..5011768c0f4e 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -492,7 +492,6 @@ static struct clk_regmap meson8b_mpll0_div = {
 			.shift   = 25,
 			.width   = 1,
 		},
-		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0_div",
@@ -537,7 +536,6 @@ static struct clk_regmap meson8b_mpll1_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1_div",
@@ -582,7 +580,6 @@ static struct clk_regmap meson8b_mpll2_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2_div",

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
