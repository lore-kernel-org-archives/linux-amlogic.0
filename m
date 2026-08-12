Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F990C5AD5A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 20:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7roH5/TMSYfUxBsB0bHvpE/EsCNcPRHHmc/0legggkI=; b=UOev+EH0KM30PB
	I6Y3PQy97X3q7O4knV2RP74pVErveUxqQxl+A7umm869uMSB4Zzyd4eRFY6xMgXINH0FQEHGOEq/Z
	UbD5SyY6yjCbmcjMJqUJmXUm3c5yR/9mjYGPlHFEXNlH0aHqal2s9A9wSSuaAwSlDBsZCTASix64H
	JWnYErt5rIrVMMJdpn/APdeosp00+XyjZyKl67z8hFk3CqkdGCxJX6xWWKHA0Yp3bmViKDb/rLZ4M
	ltCYeajUIDUSbXfW+NcHmmTVccJvyNBFZ0Bs8135s1+C6gVIjaRtjL+rkLGpS47CTXMXTvYATC8nM
	W9W9KMXdQo9jSeOlO8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFuR-0000000H1OK-1Br0;
	Wed, 12 Aug 2026 20:50:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFuN-0000000H1NM-34oT
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 20:50:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4798bea72f9so741624f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 13:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786567839; x=1787172639; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YtUGituyk2Ddp0UGCePWRfQ0rhz3dgx1B50fS+vGVpw=;
        b=iOuO5xVkFxTQ4Jz9CTCVYAHeJzo/3Jo8Yk5c4YZdiTKanNcM7urtY8vU0PrWjYkeLk
         2hm6Hp6UpkcQHdtc0aGGaRknBP4Xp1IzFZBbAZCzstyFFrVHDroAgGAE9XCxooN7GfSJ
         BtI2elZG08oZUxxaIAsIDiJRYogENOgpwdPoOiVyOxAQ1rebEK4Br6nvjtbc9IZKqkf2
         FCT8RS9ooWEMZavCTPg1g8497JLzRTI4sS7UTeHBQRLTFZdYw7S4HEHSdzLMpjRbzshw
         42vsBUPWzpZQJL3gjItalSWOfcoMBqeSa38JykI0Z/hyO6qJP41b+viSwfICqDK4QUyP
         EPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786567839; x=1787172639;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YtUGituyk2Ddp0UGCePWRfQ0rhz3dgx1B50fS+vGVpw=;
        b=SPOSGecPEftanYn+4FtNska353/TdW3eRRZNEwGtxcgyCqQ6UbjY+iaERMvvlQrV4S
         /1myzmTvGvQcKp53v8Vi0d6d3M1YdYhaiYVftp7640na6aJ7+0d8LTydYMtH5A+uUkI3
         A+aYeM6Z7R+1CQtUIEGI51msEU2khB/GHze0aIClkeoDyWMeLNaGrP90i4N4X6KzB3m4
         835TALnaK3Oh91Psn59VyZQH9ufYbL1a6hJBiwjIuckpIgLQDaJ90A+LYfr6h43zmbHW
         HXmM9e1CUm6zs+2vmrlDfkbIak04ZY9pG7W8yRtbyOEB6EGo9RLPW6nZqaABZIz5fIDh
         kWhg==
X-Forwarded-Encrypted: i=1; AHgh+RrVKN083i+DRJ8GvCTDfoED/n7RIJ+UgIptl63RVn3b96EuFeMItMd0zlMQQDGHNE7wAn0KE988sUY8YcBs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx08ZrKEWQdVNqlRMDE9cc0L5DjOtnHl/VwJr3ZUzmOernHfboF
	CnTrU0fifqIioVNrio3ganhzRnCf466hDC+KY3NqAOn1lDfbJ49DEEhkQDWJ42nuxXk=
X-Gm-Gg: AR+sD12mloFKbTyLquy4H+osmhAeLOEzdDSNbMpGO1KF/SF/ecxnxjAjj6TznnmT1MX
	4T63y5KgfQ8PmGVoJL8dPwGz64J+udsAsgxMgXddMFToytZcsybtf6QWz2hC2oUV0DibZ4xeE1N
	xP7y4ITNZUsWKYcFkuvLRUNZVNBnlpqGeghQinfusqgnJviagaOreuH+MDM2eot/EzEwNHhRSQK
	wPpaDAMIHhboI+diHGg4aQNaZ8X4ppmmST2OEfG1Gs0oKftpSgU3nfVcCp7xBeOkSYa0hXnIpzR
	5/ucege0Vilre+HyoN0CRkWNHCznPLyTlMHeu4sKGdWJV2iVR+NuauoiTzL+Ezbyj4/C/xyNYkv
	/FRPtGlvVQFVJ8Vkz6QTlX/wmnNkpghKYIanBi6fIRWcxYPyC2Vq4hgSadqA9RBRC0k6ZO3vUnW
	nnSn3LTzb5wtSTAeTw3SeAEzd/8u524XZKTF/UVQucgcRWjqWmlGf2+0R8/qE=
X-Received: by 2002:a5d:45c8:0:b0:481:4dcd:aefa with SMTP id ffacd0b85a97d-48159ca6290mr823395f8f.6.1786567838585;
        Wed, 12 Aug 2026 13:50:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5af45fsm376508f8f.18.2026.08.12.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:50:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 12 Aug 2026 22:50:34 +0200
Subject: [PATCH] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
MIME-Version: 1.0
Message-Id: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJncfGoC/yXMQQqDQAxA0atI1gZ0LKX0KsVFZoxtClVJMiKId
 +/ULt/i/x2MVdjgXu2gvIrJPBW0dQXpRdOTUYZiCE24Nrc2IEnGcdYPubOiObkkDB0RXVIXhxi
 hpIvyKNu5ffR/W45vTv57wXF8ATuSZ+R4AAAA
X-Change-ID: 20260812-aiu-formatter-static-23aaa4c3bdbb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZwCKvBVeKCOwHFezxhEHs3g/mJs9UKkhhIxC1BaFhkU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfNybkgNRRQANZqrgMfq5ox95yeE5stSqqgOYM
 tnyCOUWsYuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzcmwAKCRDm/A8cN/La
 hXfiD/9wjY1KHufHKO8MBicjjnToaV+KSrITmuuCi2jyWAI5BqRoa6xPOgAb3b6yv2IiHQigpXu
 RiC6MGC8V7cdLH9Q+HP0lrrxysgBEidXkIPdFOGdDfgt8jI9j4fZOQnHBTJg4OQgF5814giLD/Y
 GIYE4uykk9jwjNXtW1UJiZ6DVzN1WCrjFoVcr5TwC5UvqMn4tGrW2YlgSLcZCCFJcDSNyCdr6of
 WkQWAwDDo0rv9BDHDWmcmtaFk5kkyCmLfu5tJLEtfbh89pDOGwPXESrZP2/CP+eMGizHLiUpydp
 N0WnBN/xsFKn3pSOFADKxnH6qoQMqoCi+nTMtJIkxmTmW8Stsaae+sqva2ivT72hl5Tpt3oiRS1
 Fnq8GVoO125m2M/T1GJ3GBCJmOb+L6HDJVdCtqy6Dx3HKT7aFHh4Bqu5+ZnXNdzu4YD84ORq/tR
 RllY6zDRUHGDx+gH/+9vQPI51dYtWhilSQ2VyuZXRC+qGtU+/URFhVVhqdDsiFRTZZejx7kro3w
 AK+hkfu4Bg9Mm0JIL9cycjTC16dc3b1wtFJYNWMiBKRzFPXjMvzol2JcODG2K+nRccYJ8XMdWyS
 JBoZjnom6I4KEs3tde+B/Z1rymBRL8o25gd8YRGgwfgqTdwtLL5rvpbpaTugYAobONYTbDEQYPr
 WTI9o3lib8LpqDQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_135043_833618_969A7012 
X-CRM114-Status: GOOD (  11.70  )
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

aiu_formatter_i2s_drv is indeed used only in the aiu and it is not meant
to be exported. It should be static.

Cc: Valerio Setti <vsetti@baylibre.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608080634.hf6aJGPB-lkp@intel.com/
Fixes: 83b83024cdbf ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 2668646e3597..535fbf7c1639 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -182,7 +182,7 @@ static const struct regmap_config aiu_regmap_cfg = {
 	.max_register	= 0x2ac,
 };
 
-const struct gx_formatter_driver aiu_formatter_i2s_drv = {
+static const struct gx_formatter_driver aiu_formatter_i2s_drv = {
 	.regmap_cfg	= &aiu_regmap_cfg,
 	.ops		= &aiu_formatter_i2s_ops,
 };

---
base-commit: 83bf17424a97ab277ead2d98e3500bc632df0c40
change-id: 20260812-aiu-formatter-static-23aaa4c3bdbb

Best regards,
--  
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
