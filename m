Return-Path: <SRS0=7NJC=PF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C180BC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Oct 2021 16:00:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77EFF61054
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Oct 2021 16:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77EFF61054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bYqk1i2ZXQuwA4FVm5BgnV07/Mj6kFO2JEi1dWeTV9c=; b=XvaBUcEF1FT3Dg
	gsP4LOW9fvhdVO/QW6H2VYeDw+dKGxQxj4DQujQan2lT2crtcS6vg6nhUPSVeHROzcqP2UcyI7jUz
	rhDqCL0ZKWNbTj3Lwf53lFgYhC59lWF9U4y5XQcuN914NiFB/UwNr9k1Brb6up06F+IM4trKXoSzW
	V5MOcPNyQiXgfz8zzvjQNVtP1a/DXYIdMgPy+R+OcxIbmKDrVuTESzPLKsitQ+lV9sluhqfo6Xsmh
	mj60r07XAAjNzHBcOmIFhdlhbCCnHwUsBGm9X6Xcbaa6Otm8pNhEMelfq1RjL1CxhX01t5N6ae1Ti
	/HXwalVby12lIw0w7E+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mc8ae-00CwdT-9y; Sun, 17 Oct 2021 16:00:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mc8aS-00CwcI-Qv; Sun, 17 Oct 2021 16:00:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id d9so60266290edh.5;
 Sun, 17 Oct 2021 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=8kT8uxQmVp/XocDx24aLnGXhZi2Xo78WndzfJoxUXf4=;
 b=qrLR02zphJEnatJargVO7TxpS34lT74UJQ7lr8oE5lRkxlgLQ8ArQlSrMq0GflGD4D
 7dsC4ii8/jjoRXXFbXupZOzWH72mJb3LlTLH51cGjaN1yZtLeYc/5IbApZp/Vef1FWLv
 O/AxFsGAUDTwmk8J170VCDyJIOH8E6WyzOhazTkVUwtTpQvU++ESv905EVNkdr2mXK2S
 1DDGvigBCQr5Rvcn8nh1zzwlQEdsXI/GzB8f6/MOmg4Kw9q9PTawl64ev7SjmyS1jQoc
 YTIdRXAompcx+ZsrJvdyZdBUbv6WIDveBO4RmE7looBbHelfcJlV7jz1ubenysiOzKEZ
 cvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8kT8uxQmVp/XocDx24aLnGXhZi2Xo78WndzfJoxUXf4=;
 b=SXiR5x612h5VXf63AubKpMUX3eCoa/qCn2e6TI20DG3mf1ykEtQYldkcofp1Kg9/dM
 mcgxKF0exkg0jc4+6sEdhQOQrelLgiSdiUkvjD7/jZUt+bg8ClB8wSh5/bkyu++8wuEv
 Ho2E125Z8jpQcJAyxDZnHpWiCgVqCiPTMq1KQZDU2ICec41M2T3jhGOK0tdUYmjIlZQK
 Sq0jc2cfG0wimB/0iFf/m4fj+3v7ipiSGYNKFwI6O9lTXuWjKwPMHCKg5mvBh9jBWtSb
 tmxdbIQ5L1nGQ1qrBs6fSYzlRfZ96AsNjX77C4xKiwFH8oZZadbd5Y4sDjgOgwkQdkI7
 poqw==
X-Gm-Message-State: AOAM533u8SasdT3M3s0fCZol9cr1QRNG/i2g5qiYZnPVo3Lx8o76orhH
 0KQZVfVf40kX9KIQgQXujnI=
X-Google-Smtp-Source: ABdhPJwTB0vfk1m5xsCYFd2NXY/+qkTRYqLJ8qato/ZDGtv+VE5V+xBNUFGnEFhH9R8hZ1fiItRyuA==
X-Received: by 2002:a05:6402:3547:: with SMTP id
 f7mr36201251edd.395.1634486434122; 
 Sun, 17 Oct 2021 09:00:34 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id yz9sm7693135ejb.51.2021.10.17.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 09:00:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Matthias Reichl <hias@horus.com>
Subject: [PATCH] ASoC: meson: implement driver_name for snd_soc_card in
 meson-card-utils
Date: Sun, 17 Oct 2021 16:00:28 +0000
Message-Id: <20211017160028.23318-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_090036_913464_506CBFEC 
X-CRM114-Status: GOOD (  10.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Implement driver_name to provide an alternative to card_name for userspace
configuration of Amlogic audio cards.

Suggested-by: Matthias Reichl <hias@horus.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The meson AIU/AXG drivers currently require alsa confs based on the board
model name which is unique to each board. This is very flexible for audio
use-cases, but not very maintainable for distros with a single use-case
that need to support a large number of different Amlogic boards. Using a
driver name to match the card conf instead of card/model name reduces the
number of confs needed in the LibreELEC (Kodi) distro from 41 to 2.

 sound/soc/meson/meson-card-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 415cc0046e4b..29b0174f4b5c 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -302,6 +302,7 @@ int meson_card_probe(struct platform_device *pdev)
 
 	priv->card.owner = THIS_MODULE;
 	priv->card.dev = dev;
+	priv->card.driver_name = dev->driver->name;
 	priv->match_data = data;
 
 	ret = snd_soc_of_parse_card_name(&priv->card, "model");
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
