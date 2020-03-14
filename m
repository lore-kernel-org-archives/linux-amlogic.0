Return-Path: <SRS0=3H8E=47=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED0DC1975A
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Mar 2020 11:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44702076B
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Mar 2020 11:35:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mB37c+Jv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHo9UHfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A44702076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yXe1S/Hbvcrd1Cha2SVSXP2UlIMOuj3JRf76g7Q5p4k=; b=mB3
	7c+JvFv83LBtyf0eW3F6VUVvc5cep/OlIeDEsO0v+NA+C4w24XhUyIezRwDQjnjEflwUAVEdmA3Nz
	QPmDYt9yv1+Ddpd+ZEXMhPsnRf67WttBKPUqK6HArGTDUs53GP30GUArC7dWFueDxEhspIdw17x+n
	F0tXvih/qd2wHha6AMLPFiaVgug2tuZ6+yxLERHwBYRXAst0UrXSSnkJgDh/Qwv0osZ+a4fRHPOb5
	HVn1/4/KVMkCugCp5oIsxaHW9tIcQIe+wBw3CwaQqPMPDVVODS9cxXILQIqidM05CTXDPfyjdLX4F
	cuopGERKKUzSSLwWpee9BdvUA1RxfMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jD54p-0004G8-4P; Sat, 14 Mar 2020 11:35:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jD54l-0004Fb-T4; Sat, 14 Mar 2020 11:35:33 +0000
Received: from localhost.localdomain (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65AA920770;
 Sat, 14 Mar 2020 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584185730;
 bh=coba9sPlVQlvtDyTnDgcgDbX0FGnfY7UH9T3w2NckRk=;
 h=From:To:Cc:Subject:Date:From;
 b=IHo9UHfgRAZndP5626xncCmMrGNzq2y+l8gtNe7gPnI02TVheNnld8vdjBcxriTDI
 M2SJzpOZCB19uEP/8ffnfke2PZfQgUEchLaOCdRGgX7O9NuV4iofCXktWefIcoL9zy
 sn1T7+L/ilxpKdQW8xsv0quXzPgeE9eqiVtDo1ZI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] pwm: meson: Fix confusing indentation
Date: Sat, 14 Mar 2020 12:35:24 +0100
Message-Id: <20200314113524.23031-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200314_043531_961227_28D38741 
X-CRM114-Status: GOOD (  10.41  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix indentation of return block.  Smatch warning:
    drivers/pwm/pwm-meson.c:139 meson_pwm_request() warn: inconsistent indenting

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pwm/pwm-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 6245bbdb6e6c..8cf9129caa39 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -136,7 +136,7 @@ static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 			dev_err(dev, "failed to set parent %s for %s: %d\n",
 				__clk_get_name(channel->clk_parent),
 				__clk_get_name(channel->clk), err);
-				return err;
+			return err;
 		}
 	}
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
