Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A8CA0EDC
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Aug 2025 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUBGPbTcSR4bB9/olp6unHsqT5HU+mSjnHnvWv2GqYQ=; b=RUcvtAWRD+M78o
	Vx70XBx+QPs7W6r9AScDT2vPLPHGIU92Hv7uyiWU4z/QPCtQXjdFhzNReSwFXCjWKyVbTlv9Ta8F2
	14XfP81gSIuDQP3lxyxMaA0d1mV++JN0JK3ZF4TVH0JBD7HBSvtvtbu3YjcgLaNKFbMHlwBhIBn5q
	ockMZxQNxiwtUUY9eHNt1rJo4vwVX6p0Q1pX9kSKH4RH62DBsXDSdHd3keWvDI4jNEu7ghSyTBL2P
	/C+ZuSA7OouREhCsg5+OHnjIwef5uLZdgr1bBO7CJoElucQhKuYmFuXvXdxehqplexJJxZBhkeXA7
	4RbPiHDy6lWwMPWdNdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYP6-0000000H7ZJ-2qM2;
	Thu, 14 Aug 2025 13:54:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXgi-0000000Gvla-3T3K
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Aug 2025 13:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3722A6020A;
	Thu, 14 Aug 2025 13:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E515C4CEED;
	Thu, 14 Aug 2025 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755176891;
	bh=eeXOQDuIkC91qNmZOOxwnqrLxIkQOGin6epB2IqmH7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sl3ylAQt6xcnwmBDX19BgFv3nCt8rKnq8FYXErHESwYo1LnnbgeZqNFzisMX2qABE
	 P7NIrS/eRk7a5aeVZQIVI0106gu3AQY9Y90BWN/N/ZXB7D0C8bq+PFgz/LBME+EXl+
	 XbYT5Q5YhxwB0eUnibeDmJNEIXpSdZVDG/Vi/usKedPVF96Cja8G6K7BZIIoyYVuEx
	 tDoA8M/2BOIM8YYQfRylnrFeN2JdwdwT6iLwbUaEwfXWRY+KyFX0W7z5YKQkZVJvNa
	 XrUSSwRkVZD0cwkFDSQBwObuzMxHA2w9g6/Oe9izkchy/VtHJ1cXqjcD1XbAbpTVyO
	 c22LP6ZldN4Dw==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
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
Subject: [PATCH v6 5/9] pinctrl: meson: Fix typo in device table macro
Date: Thu, 14 Aug 2025 15:07:13 +0200
Message-ID: <e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755170493.git.legion@kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
MIME-Version: 1.0
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index e34e984c2b38..6132710aff68 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -1093,7 +1093,7 @@ static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-s6", .data = &s6_priv_data, },
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
