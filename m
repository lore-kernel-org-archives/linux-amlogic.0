Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC54AC3DA6E
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jan 2024 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GOvgn3vKqNkaNrJ2Ew+WN+9A7zLhqoTVSaJa3lu0WKo=; b=qyrUvRMNiEHX/G
	sPupSJCCN1ZEol+sENSYCskSBeCOLiFGRAUGc1Z3ixem7xUKPJ4E9mfjcELnzRr6CFhvUs5V8ddg9
	+R3i7lqU2xK+E3c9STNMf3t4cpR54mbhUXKL1FCIgXT4CGE+kM5smsTGhwERjBTx1DJMIlmwWi4EU
	/7uI3fmf3b4xVJL9t973WeEBo2SOCJQ+r4rWqFhXIHLQlzoF+9vFJ5ur0nUZeAmnczNKgnWE8JSGy
	ylcVrz3ZZQ0c9Vg2cEucii7Gb2BsGjUqLanF1f39bS7Dos0c0pks1hGDFTdxpbeivMQSTDuoTzy2d
	u/aczRns4uTcc9Zsh1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL65c-00BmXP-38;
	Wed, 03 Jan 2024 18:35:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL64M-00Bkxl-0v;
	Wed, 03 Jan 2024 18:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8C916B8149C;
	Wed,  3 Jan 2024 18:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681D9C433C8;
	Wed,  3 Jan 2024 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306859;
	bh=19xiBjnOuBFzrb7XkNEoHVBbObJYxv6N5hhdXATD5LU=;
	h=From:Subject:Date:To:Cc:From;
	b=vQsLBdo8BtAsq1n5IX+yib8qFGJuLIFgTus6TNIWgj4tyZAbfvEIhpoqS4vdDGre1
	 dKuygPY8gUiJm4AQufwvDU1XJJGTJG9WtT/X985ykOPMy6bC+CgJjmvegKIhjx07j1
	 ANugczvuZShC3ng3SY9Aa/1Qnv6ewAZsG+TmnOoOK4oFzeIAPIM3qLhQcf3Z8xMVxD
	 XIDwYs4kuc232r4N03YyLk4VSuATLlWK0DTaX1SzBx+JqzxilQIE0vksLanvVP1sIm
	 7MRDUScdHREVi0Ly8DF9oD/I1NBMhPs1y0wDk9LAT/UuG9rHxt10kOwUBzOWr/dckO
	 MTb2IfxIyh/Tg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: meson: Fix issues with LibreTech Saphire
Date: Wed, 03 Jan 2024 18:34:00 +0000
Message-Id: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJiolWUC/x2MQQqAMAzAvjJ6tjCnoPgV8TC1asFVWVEE2d8dH
 kNIXlCKTAqdeSHSzcqHZCgLA9PmZSXkOTM462pb2goD6SFIcgW8/Y5TS/XolqyaBnJ0Rlr4+Yf
 9kNIHj/SYs2AAAAA=
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=742; i=broonie@kernel.org;
 h=from:subject:message-id; bh=19xiBjnOuBFzrb7XkNEoHVBbObJYxv6N5hhdXATD5LU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllailFWG6K0996ZkK+zsEgZm8WQikj/dXR+gw2
 ektleLtk7eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWopQAKCRAk1otyXVSH
 0GTPB/9hsdHS+SkXa8zW3gUdRI2CV4zmlUtRxP5/jDP12prISMr7i0w9Pjjvxphlj4Z3ogk80lC
 B8sujoQpPNgUNDDB4xutZQuVH7QSuGbVIUVAgc1plOJLW4vHh9HXsarzcKVPRBNWq3l/+/N7wlG
 Ml+E0Z1jKt/ZXyUbJu3lQ3kkDp2KtOFCOvAeNZtC+NoxCta264AkTr9DHRKjJg4hI84lOz6WdCL
 mER8E98+5OEBPcdcXEjUxdutKLbUzmFkW71NrlL3Cq56FiM4Ne/4HgII0NroukIkTJCvKt0ftLP
 vo1C+T5sfTHGOJwgNBSGYuj+EtX2hDsav0NjOAorYoh/DjrI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_103422_503270_872E23D9 
X-CRM114-Status: UNSURE (   6.85  )
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

This fixes a few issues I identified when integrating a LibreTech
Saphire (based on S905D3) into my CI.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (4):
      ASoC: meson: g12a-toacodec: Validate written enum values
      ASoC: meson: g12a-tohdmitx: Validate written enum values
      ASoC: meson: g12a-toacodec: Fix event generation
      ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux

 sound/soc/meson/g12a-toacodec.c | 5 ++++-
 sound/soc/meson/g12a-tohdmitx.c | 8 +++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
change-id: 20240103-meson-enum-val-c8e4b2f01077

Best regards,
-- 
Mark Brown <broonie@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
