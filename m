Return-Path: <SRS0=LO2h=U3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BC1C4321A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 08:17:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE052064A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 08:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c/skM/7t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pqUrZZrH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFE052064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M7aei2Yn4/+UwKTfOHEWZexvlTgbPDLry/+qqbiHcK4=; b=c/skM/7t1KdoJA
	gG9gU17QwCKZmEhZomrktVyX9o1UirUksfSmY7Bk3S9ts9JVxqlhaTM7G2SzXC2EqulJZuopIZK6/
	u4/9jwVr9Ai9wqKu4gBBOYc4SS+w0L2LnarlndaCzqWJwfudSbGbfveD07FJhkxwfK4Sz7cAKMHY0
	zns1AqePTWcuR8Qem++izNYFRJfZ+wz2iZ+rPlAi5bNECS8+vNYvShxCkfaJiynXsJTyBPeWTuYIB
	SDYi1vpGI4jShHXl0w+39e8JKzg4WD2/RkGmLqfrgraFZl3zb1KU2Aw1slftvbe49g03btrqh5GAK
	ctw5EgyLWDkzqKsFT1nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgm4L-0001y5-52; Fri, 28 Jun 2019 08:17:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgm4I-0001xZ-CB
 for linux-amlogic@lists.infradead.org; Fri, 28 Jun 2019 08:17:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id p13so5261653wru.10
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2019 01:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0iX4GoXUMjYo0yWAqnak7nWNu9SahWjJ+qIlyX2DjnA=;
 b=pqUrZZrHnpMwYQiyu/1jCW1Vn1dbIBUApoVZMhyhBwvnhvhfumKMpGn/HD06hkyLKV
 mAr70tgH1UWNF40M5i4Iu7TZyBCOF9E4DVrgXNhfgFoe68UERxt7W4BtnpD/aXQbHgrr
 KSKRFDsze0oQlGIrrEesEJEXxvjGoX7ByoMNidbjknRj4Bylt+bqRjjgIIVO6eX4pKnN
 1AmfDbD/NeC/4Z9WHyrLlNhDEE1EW62NsHUnaW1L+cOpLHwoL1tVmmD214BJEgmzEGJp
 UBCPbzQkK8BSlSG9gz7fGNCBlajjvLjh/2C21gkCh6AjXCuIST7i+hrq6mn684QyGZ60
 KhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0iX4GoXUMjYo0yWAqnak7nWNu9SahWjJ+qIlyX2DjnA=;
 b=OaG0XrN5Z7QUl7rV3WsiY2IEclKJVjM8fWUF1sAkSCYSdmK4YKFu8a8mH8/uGjYi67
 Kfvg71kegnq2TATRwZDqFQ8z+64njL6EpJvXPPS60fQgipJATreA5zW4S9DCWLwq+MyQ
 M2N9+/F+dKy2wbLg2thoxJgWLHwpxmeO4ZOYS1mtKru4zxy1U6ELh9gPm+DtaK1883RL
 G9h5c3wns3ySNHQ4LPy9KftWuw5Xe6kwdbHEpMej/OOyTTsQ8CBSY/ycv5g4rNhIOds2
 hf1DLhPmk7h+KHW5gX0gqchhN+oO0+UbIGWGkAvynPpKBBBHOoSwAkZROdTkCa2+anDg
 cdaA==
X-Gm-Message-State: APjAAAXGIFCQutT6YJS3Ef9Fe5WxjlzzmcNJVdIbMBtBzBN47Aip2Vtc
 Mp5fFz+us8yGrgHOvr2SjXESc9gzQHdJEQ==
X-Google-Smtp-Source: APXvYqw+rkcyh3PTU9URJjuIKiu4kZ97NgtKOX3PAukWMiU12hf7kxkJIrnT5wyWxV6LyDzzRWcw8A==
X-Received: by 2002:a05:6000:124a:: with SMTP id
 j10mr6749454wrx.191.1561709832291; 
 Fri, 28 Jun 2019 01:17:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id r5sm2819216wrg.10.2019.06.28.01.17.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 01:17:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] ASoC: meson: axg-card: remove useless check on codec
Date: Fri, 28 Jun 2019 10:17:08 +0200
Message-Id: <20190628081708.22039-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_011714_478632_1167C2A2 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While checking cpus before dereferencing the pointer is required, it is
not necessary for codecs. 'codec' can't possibly be NULL in the loop

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 70bb0cbad233..14a8321744da 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -118,8 +118,7 @@ static void axg_card_clean_references(struct axg_card *priv)
 			if (link->cpus)
 				of_node_put(link->cpus->of_node);
 			for_each_link_codecs(link, j, codec)
-				if (codec)
-					of_node_put(codec->of_node);
+				of_node_put(codec->of_node);
 		}
 	}
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
