Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E38C77B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HVb6Cay0upeUw/UEwfpmkMbjEIgT++fsQPn7vORVmxw=; b=DpiOyV3uTSi2K3
	jIDD+QarVeAA0fk/1jYP0mpkeWHINsyuBURstPuMOyaToppScvGxgrktniMhPNSAfe2WlJUfcUAjw
	vcjOno3wlsy+17D/HyF59DM+PQvQMs5rWyA37UNz0vLRdwcRO+y3MbmDqjdXqcpLTJxHM11Nrhalr
	GkNL+nNTbx71v41mbtPv1iYx2QK33ZU9Wse4OgapbLAvoDy9+tNXl5wfwu+27JM4X+gPXiPG+s/GD
	niLZT+MOLsMYr7IBXvsIUTqNV1pPrOqohZqVKI3948tV8nK8dNQwwWSJ/f1EBcjP2Q3E7vnzPYti5
	saXS3Q8k3Fx/TCcJifwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojBc-001szR-25;
	Tue, 18 Apr 2023 11:07:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojBa-001syr-09;
	Tue, 18 Apr 2023 11:07:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FF2762691;
	Tue, 18 Apr 2023 11:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CB9C433EF;
	Tue, 18 Apr 2023 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681816064;
	bh=3sMgbHnYFmyo7o83otuBC8dc0GltIp1+zccjMGc95TQ=;
	h=From:Date:Subject:To:Cc:From;
	b=BYabJNlsgK6TddYgNWyKF8BZQcv9Uz7Oc3ij7SyvJJIf8DEMFVP/48d1Lg+ag1Lk2
	 ny5UzarcmIHNPbH7srtzwI1uN2EU22fx8Rhdep+1O9WkZSkWMv0UrJqJFUwEfSq12p
	 n3KANzk41FZb9zrUe1oCwu8RqSkJywujWhN0fXOKoBF7Kfy+wq2Hr/5ziGXbATAFvb
	 6YFLf4NyW7c/a11XOdNzHSPIa7ikLVTsePC9AYHX/1BeEXNjJ56FQn5Ksgld0Bkac2
	 gs/NThnM8TrVylSofi9CP8o6Yvb8hWmkywtMi7+Iqz0hOXnlRBvLXntHrOfatvq/gU
	 XVijnh2ARv3Yw==
From: Simon Horman <horms@kernel.org>
Date: Tue, 18 Apr 2023 13:07:33 +0200
Subject: [PATCH net-next] net: stmmac: dwmac-meson8b: Avoid cast to
 incompatible function type
MIME-Version: 1.0
Message-Id: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPR5PmQC/x2N2wrCMBBEf6XsswtNY2n1V8SHXLY2mG4lG7VQ+
 u8uPg1n4MzsIFQSCVybHQp9kqSVFcypgTA7fhCmqAxd29n2bEaM38UFXEhWHj2G/MSg4aTiZH0
 fbXcZTD+A+t4JoS+Ow6wL/M5Zy1ehKW3/wxswVWTaKtyP4weJcx0qigAAAA==
To: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 llvm@lists.linux.dev
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_040746_143429_78664BAB 
X-CRM114-Status: GOOD (  10.70  )
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

Rather than casting clk_disable_unprepare to an incompatible function
type provide a trivial wrapper with the correct signature for the
use-case.

Reported by clang-16 with W=1:

 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:276:6: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
                                        (void(*)(void *))clk_disable_unprepare,
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e8b507f88fbc..f6754e3643f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -263,6 +263,11 @@ static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
 	return 0;
 }
 
+static void meson8b_clk_disable_unprepare(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
 static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 					   struct clk *clk)
 {
@@ -273,8 +278,7 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 		return ret;
 
 	return devm_add_action_or_reset(dwmac->dev,
-					(void(*)(void *))clk_disable_unprepare,
-					clk);
+					meson8b_clk_disable_unprepare, clk);
 }
 
 static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
