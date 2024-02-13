Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A5DC4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W3XTchFEqRXJZsiP0iikMh4lOdPnvLPE1QhkkeRRSRA=; b=rpsfbnrF2T0EfS
	7BgOcMG4amobJj90eXSTlOQ3ur6WPDdXMgnqHY32n8AZjfHSATdGHuuBdXOSp5h2ef/UjkZHX30o3
	xtkyMdH4JpSjCbQxmUhvtOjKTCeC0MBjZRMY55uIrOJtsyxgdmw7wf98cX2cv1TYhnG3+1sqLtf1d
	FNzWNJppzC4rbhiWUmswDF148VQC92Hr+X01nIogNk/TWE6XapqkHqH/rHU8f93TxPznhanXQwJ0W
	FEF7Cay4hchCAq9wmPIPW6g2fOppLF6KCmUwW4IUEacAn1TaZ6Oytenq6c15A0y7a2yKfsoxqivKy
	mt3Lbv+iZn4WSNOqkDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0nG-0000000AwZU-1gyj;
	Tue, 13 Feb 2024 21:58:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0nC-0000000AwXL-03b9
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 21:58:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33ce57b2283so144963f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 13:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861496; x=1708466296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTFkdUvqDHeua3DO9ZE8KGhtt+pXkN0o9OOhcSIs5kI=;
        b=IAr5xcBdRhfj9osvHS9y/6LT0GmZ9PDEGJkOH5Lk1eF3vjCJXtB78q10Luayc78gwK
         z5oCRPawguaWo9nQOAlZWkvR0bCJqVFumRAcSHY3e/gCl6LPJN90YluvQZK8bmOmIYTy
         3GE6mYq6IHoZuY/lBt3jA0pmAjeOqx0LIoKK30Qcqk0JqRT/njsUa3tBeav0eIJnLZy+
         mjWZmtf1KCcnXRyI8atSFhsPqcQKV8JVGOoLi8vzxObJ6N7+aQu8AfcODyAu4SWfNpr/
         2J+67D2EU0l6zZPPZV9eRHsqjIP6Rc/QuhUfvXuXaPc8D40uLfaC6fc8m+1jBOL6jT4r
         WeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861496; x=1708466296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTFkdUvqDHeua3DO9ZE8KGhtt+pXkN0o9OOhcSIs5kI=;
        b=bTMS5ujDyWKhsp7+89MWkQRz6XXYraC/RVrpr7xuy/Vf0ZAiZJ3sW4xMrWEpPNQm2B
         3eqkV3GC/OXYgnvDcXfZOTQc2hrX1FEHKF6m7VzSWaTtfwiFZVXQ5+gRAZaGqFCyVtLW
         O2lDuMeaypYxM1/mixjUk3F/usCS2A9Z1LHNrK9r/0Td2xG80es9XLxTYr6Wq/n5620u
         6V36WqegDbjQMMnpm/7/OPnZDZICxvT/QVo+n6FuEf0it9rQ3f7L8XkHpOSS4Sp5rxmZ
         PzI8RgpyCVfRtLFGpjnNugQgL9fdRahgW6+9nViivXLWUN65/XmdtqhxIyIJvkBsnv5L
         JHLg==
X-Forwarded-Encrypted: i=1; AJvYcCXXfOuYnnMBjcn6KxTYv/poZtRId2ZYHwuvUry0C9bEq843KJxqm2TaEvOhH3tXzM3gfDFpdPXPty32ry+fqbE6LM62qWGCWp9OZ+2EkLyz6Eg=
X-Gm-Message-State: AOJu0YyoZLjgKI6SdC8mXPbqGNqBhXD2VUmW/PoRc2Y7tBx9KGJckiuI
	7ZoFqZ9jUvDlNdXRKODyTV8l62Bem9E7xZhhsqM7yX0RXRbtuH9LDyERyKT3fbY=
X-Google-Smtp-Source: AGHT+IEvF9YysnB+h9yQmXedxh2DZ1klO9I/GaHAGPGFJ/xyzrf4xPser0a/xrJw7KqwTxEY1n/K1Q==
X-Received: by 2002:a05:6000:1e84:b0:33c:dec9:a269 with SMTP id dd4-20020a0560001e8400b0033cdec9a269mr403220wrb.57.1707861495863;
        Tue, 13 Feb 2024 13:58:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDhr6+e+5qjE0+9Mw4cEpFjAFXBxy7lvahl/dXNLc4oKDO+uMl+AqZFDqC/VhnfJ2IXWUNIqwOxedeeZ+wjrmUZc1Fe2gpVedxuJNN5OlaRbtIaAP4oPoW3QmhRzlxky9J/Ovv/Es2NvK6bzgsP/Tz2sps2oihr/qvKiqyZ5Puv+B1RAWJlXgOguK7mCZFVDtV7zwLXtxQCQjqUPKqv5+cGOqetxhWGEWgpxTM52qr2B+WyDUin1UvGQp45l7cJ4Ke8Q53c4b9lNfJQctutivgKWXGXWKQMnX/AVO73GxFgBsfY7iFPj8RbGDNOqID4sWqOubeVd93IM/Mh0BJ5J6oe9GTFDwiIjZcu1bQwWUY6Yfi9wBaSaiM8gs6eM3zYjxPRzeQ7AwLqQ3iu0FUPuXcfBHtuWVL0yqORytKv6KuGmrqsva+lnxTYKgm54WQtmUuURzwV3QouQiA4wtrTdk3uSf0AptwXWMXM3R/iCUWSJqBDAMf7Mu1BmnvnJdz6t/rDMkViAkdhWAQVIthhnjPAMyFqW4BFbsWCWbJgM9TfxNzdN9tCCAyTJYO8zqP6+2ZX1fda/Wmf1xc0uoCeB4M5wYHHTNAKcEdLnk1cT38hgOq7mc=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:15 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/2] ASoC: meson: aiu: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:02 +0100
Message-ID: <20240213215807.3326688-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_135818_289616_7BB77A1F 
X-CRM114-Status: UNSURE (   7.35  )
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

This patchset fixes 2 -Wcast-function-type-strict warning in amlogic
audio drivers with clang 16.

Changes since v1: [0]
* use devm_clk_get_enabled() instead of adding a dedicated helper in each
  driver.
* Split the patch, 1 per fixed commit to make it easier for stable.

[0]: https://lore.kernel.org/lkml/20240213101220.459641-1-arnd@kernel.org/

Jerome Brunet (2):
  ASoC: meson: aiu: fix function pointer type mismatch
  ASoC: meson: t9015: fix function pointer type mismatch

 sound/soc/meson/aiu.c   | 19 ++++---------------
 sound/soc/meson/aiu.h   |  1 -
 sound/soc/meson/t9015.c | 20 ++++----------------
 3 files changed, 8 insertions(+), 32 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
