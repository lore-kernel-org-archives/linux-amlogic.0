Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24741C83F1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jul 2025 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyO6wZOJ88iVrHlEBZ0PfTUkNmcm141mHJW16cCMgp4=; b=FGWFavO3ZKE3PY
	c6/QmoTQ7km8oJ6N1NT/njSvNolAZy29PlgAIoZeqB1ksfYkp9ldsxntxOo3EBTgbeQRn0jo8DWwx
	ZLLHRQ/+US0hmBwLPH61jfVxCZf1GZFF2uc5jVF20zZx4aNBVYlZa20Ok4+cNOU3YmkIuMzCXVAb/
	QOS1DoNgyTKeSWzHD8iRMVQlPqceIk1imJLNXRB5JiUXIISnqAweGEgzUnj+M2y7a/KKl70uS/27u
	TMYjjBoZn4FoYPX7juxVhglzWtrm/2yszgGJwlIN82LHrn36xcv8EFolwAmgGDSjnJRvG5GFrKZdX
	MCrCLj75mDtP+SjxR1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPe-00000007dk2-1O5e;
	Thu, 24 Jul 2025 13:55:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewL5-00000007Xmb-1ME2
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Jul 2025 13:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFE0D5C679D;
	Thu, 24 Jul 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E8FC4CEEF;
	Thu, 24 Jul 2025 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365026;
	bh=fXRkp9tkBw6fJ60VIZeOBOecvw7Vr9jECqm8Xl4Zdsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k/IhEq/PiqLK01qExpI5aOvQ+DpYYmUDVDbEw0mLq1miQ3Y8Cj+nVVtGRIb0PM4Bt
	 vO3vORB3POrs+uQ6xPWHDHsF0Pfcn82583m4LhZG4r07/WG7q8DtYE8GSGWokZ9Ofx
	 ZA0kyefW9eYF4iXGPKruH5n3d4hZbixh56aN/WD4sdx6CkXDp1pfSEUAL6T3GCjMCX
	 V6qputJonc5eloBanaE2rjsa8/1dRSimA5xUMwtJu8sfZalh7PbMEuO5Xj71ZDZi5R
	 r5jj88mYeGf55eTP2/rUDKDpwYAY9b6bc6tZlJisg7aKJKMUHuM3Ayp1SIyMj4WI4H
	 K7pNfKrCOkThw==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v5 06/10] pinctrl: meson: Fix typo in device table macro
Date: Thu, 24 Jul 2025 15:49:43 +0200
Message-ID: <c47f5e1ab68248cbc4d51dcd822829da8857ea00.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065027_395156_E9A6FD53 
X-CRM114-Status: GOOD (  11.60  )
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

The typo when using the MODULE_DEVICE_TABLE macro was not noticeable
because the macro was defined only if the module was built as a separate
module.

Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@intel.com/
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 385cc619df13..95525e66e5c0 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -1023,7 +1023,7 @@ static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-a4", },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
+MODULE_DEVICE_TABLE(of, aml_pctl_of_match);
 
 static struct platform_driver aml_pctl_driver = {
 	.driver = {
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
