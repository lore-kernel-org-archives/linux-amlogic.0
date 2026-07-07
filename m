Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AD3C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 01:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n9oo9j+ovIH/Aj6b7/7PQG2OOuUOEgQU12PqzQ7lkWQ=; b=4BevjjB4eq9MX2
	xtbbhrU5zFxrVJN+gVrsYq31M3pQBtJam42rpSoEwW4bjrKaI4n7Sy7q2tJRPdFuCWXjp7KDDMcK3
	wgRHp38JmM+pziBE3CFGTHFywRNTjG6Wa648FBNxiq9d8vl2W06zbipIeRXClqQQQuaZdBbSez09J
	6l6oWWx+LpXtwYkyzrVRaBUvTNkKMvEv6mHlLBz6CmgErXF93uGfxLAO1DXW9u7O5IXgi1bUWjoAj
	pALr//CT9M0D+EKmbizDf46VVKPefqjv8wUkWC9F0FckwfT/cHqUZamOCW7GDvIna97d+mPPbiaM1
	0yzuDm4XMQV0DFQkFuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguYL-0000000Ds9E-2enO;
	Tue, 07 Jul 2026 01:24:49 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguYJ-0000000Ds8Q-1AOh
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 01:24:48 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-806449d108aso53520697b3.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 18:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783387485; x=1783992285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6D6cg1mRn5TZxz1CwmBlwOFw0TYzLoa18zGJaen0Qw=;
        b=nAPiM7Jf2Hb1EVS52oG4vcJR5UFEzdf4Dxe4HTzIXfN04LW2ZtkrUhOtIlTO6KcXsL
         HGz0gbA88NVwazchdzdRYJuZaZ9WJmrM/0lVs6Qje9ODUA/pxQ2iZ0oX0tmKYMVnkRpY
         oLdqHMABx71rG54PuX9778PsPAJmj7klpt2RFVaPc9UGoiRZKUbWRPZMQyBikmpFg7PN
         RmUVyKaVvEJ1PTrTapykddIQ6r7qpLeSDq3B155O0fvDOx8us/lgqYAUH2oBkuaRt+KT
         ecsHB1BwCaGtNBSANZpqPAhx5xfLTNENT5P3VrnIjhsVgQ/ZAtAuAu4huhQHZzBXw1Ao
         WDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783387485; x=1783992285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6D6cg1mRn5TZxz1CwmBlwOFw0TYzLoa18zGJaen0Qw=;
        b=b6vg2Y4pj/0VuBS6Ab1HeprwhksVIFa5EIDtOIQ2WvzRGs4n762iROU8aHg/ih/cqS
         3UkCTasjMljj35Gnk/z0E72nMHx13qyFSVxZPHmUMRXVMsnmt4dF20WdDwDHp86K66JJ
         1bwVpK/ba/fxDzo/Baw6kA6fwloXyqXScY9mHndR+FSY7nr416Rf78kqbW8RJ5Oo+/+w
         +jWNH7e6occ0kJeBKeYBAzL5sYAp30ODGPn2kS2HJwzY+Q39W0Bm2ZxH8wa5Mf/y9MjJ
         QbMZU2FZXjufmtlNwdiwOsO0T8OimckNgbNWSWDJzHnRd3tId4+eKEAH5ngRuVyTS1EY
         JVcg==
X-Forwarded-Encrypted: i=1; AHgh+Rpbw4czef2oVW3/3qDo5RzvgV1CGlwr5SlP8CLkmQRbsvKlySH0Wbnh1JsKPJe/Tuzf4x+aT5T6ReZkVabI@lists.infradead.org
X-Gm-Message-State: AOJu0YwpEvKlBRznZOLZig2/ZMejk/MWVbAYiuIAKTWLr8s9dslXMtRM
	8eKbz3h3zitb9tp+CSCBr0FNrNmS1V1lLq8ImhZpbKd888hwPflRDbcD
X-Gm-Gg: AfdE7cmr+0CcZDMkT/D9MEapESZ8uyHdAOKt987jOoKNs7h9fiFzbTlb0zwtRbwfCpW
	p/ZdeYEzIzVX4C3hA6gThfyFE0l5ppvU/Ov6tiV3ldfLu8gZYpodWD22teNGMgTDC6yKGO3yQLl
	jNKsdPgBAwTER5KBsgI6RbjOGWodj+tMreC5QsP4iNfbZXq67D7ueDhqcxpcWthyR1jcTy5trXY
	JJgmMWtlN61DscLtzVHpg2WNrhc8ce0QaIcc5u95+UGBQioi4G6JpyMUCy144NND1vVlRWBn9HQ
	2l3AfYZdb7JhD+odBG4BVD3S9i4im9REMN2vcOm7X15+c39RRiE0pfmiGKUCSEBS+WttD9m3aNQ
	7nKfwIkIctUSV9Bala59dVUjsDBX7+6z3yftdsAoYgPUOdpjDTwBSxfrSmS8X6D/D5xjCTsXqwu
	avOnvhOXNjVF9+ujGpkjIWXtjcNNP2egx2mancSfF388N+NwCS2Yaot5XLWOBHrL1kucUbqyo/A
	alJTcAYHdk8nafzmZWKBoEck2cqGpNB
X-Received: by 2002:a05:690c:720a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81be06433d5mr25020817b3.12.1783387485530;
        Mon, 06 Jul 2026 18:24:45 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360:d412:6d5d:4bc3:48b2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81447f2755csm64120787b3.11.2026.07.06.18.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:24:45 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Valerio Setti <vsetti@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] ASoC: meson: aiu: Fix resource leak
Date: Mon,  6 Jul 2026 20:24:24 -0500
Message-ID: <20260707012424.1661733-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_182447_355654_0D0FDECC 
X-CRM114-Status: GOOD (  12.14  )
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

In snd_soc_register_component() error path, the aiu-formatter is not
being freed. Instead of returning now goto the err tag so the
aiu-formatter can properly be freed.

Fixes: 83b83024cdbfd ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 sound/soc/meson/aiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 64ace4d25d92..d6b644a53f7e 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(aiu_cpu_dai_drv));
 	if (ret) {
 		dev_err(dev, "Failed to register cpu component\n");
-		return ret;
+		goto err;
 	}
 
 	/* Register the hdmi codec control component */
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
