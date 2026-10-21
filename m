Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24E60A2636
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2026 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TC4vfQOb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U/UoBGJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3k7j6Mry6JeL/XmjEItw7wtltvpg3+0Uf6BVlCdDdA=; b=TC4vfQObeCHL+t
	8o1vUBHdaE6V06u/EHlGo+iN6AyAfQlK56nmpiMklfOnWAXfkLxBjJBu7t/uwmbBx7QZ9usJ3gy1Q
	NWDLnu8E9tMQd7FboNPX2az20/1a7MF2VJcmZTd6FoDCfi5ecsudVozSfLCOogTUB9UgxNJxz8A7U
	F4Ht7WRszCZtF1uYpfnsVsqgNoK+I/W6JWQ8PHWJWvpBjypp1nN8mi5GZxpheNSXvaTCU/K8LnY1A
	jotEjGFKa0s4mmVBrMh2gDW+Gg9wrsqrPF8rZD7f1HgJ0UbBSCKwEEhAHf+H9JojOHMMmfS7wzbsG
	IdwlrUjwNP6lzc21ngMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXvY-0000000CCgF-0OME;
	Wed, 21 Oct 2026 15:08:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXvV-0000000CCe2-2Rzf
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Oct 2026 15:08:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso610269f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595303; x=1793200103; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=U/UoBGJtVYUqZPgZJH0F+DzJsPu29LvYhKxZbIV7POpl7qnda2Sh8WuNEhcPrD1KB3
         nu2DhtjLl5YPIV15m26NRvy5KHah+uV1jRQhQr6E0Pvzz58SSaWnl1l5E4qJ1uP6v3o0
         cM9PA1QqnKPzaM2fDIFV4XtgiIqSmlYpZtAPe85ZrhalRsxeWelDmtM1N3gtbVUSEbba
         eMUNk3AxeBYr9rjxMz9WS2JKhQnEECoZWs2tsGvH3LF6bNPY3BdGPMQcYyxOTkqZNl7a
         q8uxLdoU0+ztXrGbvnlpMFUeC1jAJUF8SuJCI8fI3szXZWPmVykuNOOUPKNsG3qNwTbY
         pLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595303; x=1793200103;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=i/HSrDsH5lGQ2vRMm/A77q3RHSZRQ0KGh5zs37pwA54OX4HB2GqFFycIRV0kJYsHwk
         ZaXx/vf0oIAzNDUR1rUEnVoC0CxUoM2tfsm/Hp3VYUPF62Ji6nhyK7d7euCPZ9BXBID+
         17xxjnbIQek86xiNvRjEJU4h0elvSOfVCt6yqiHhAg2mdq3qycG+UByUKd8dVw17PXHq
         aRFYWixZf+o9opEYk3HrZtDINf8ukxU2tb5BUsvRJbo7L5QXbLi38EnOU2PJluut67Fb
         bLFgd7xVgkfx5TE+h7aQq9PEPCWLZVDNFtcsQzayX24GuwqsGq0YDNh030DvqoN2XHl5
         6Mvg==
X-Forwarded-Encrypted: i=1; AKwUvBxJyISWiNA68nRH2+Cey9ko14v7yc5lA13L4pSZUcarigADk2C46FgawaQzof1OmKt8XNWZkijOApM0Bkw2@lists.infradead.org
X-Gm-Message-State: AFq9FYK3YAW8X0vqRZNH2hJO55LnwuhPhDRPBy9ndnD0X5h/4+UnI3pb
	gIHG5htRYDBCGNKLNPqIjWof1viu+YS3cXANg46BwPOY4ITASkYvbnigQqjxP0kpQgY=
X-Gm-Gg: AYBFou2htdcu2TjYj9Mcd50QgXyz93x5Vnd0p/Ivee93GRsXJkkJuaJOHxzBBooeLto
	RCnFzrTFCWFm/swaCGFi84e66siuNcF2QjEFZojomnZwCoQ6OSB1T621ztDlPnW36ePOIel9l50
	JDlFTrh4ckhvAXHavBzgsE+osuCiYMo2fouxJhUuwa+FF9Ht+v8CDyymnTfcO9MCXmM1UehRwp/
	ThXcnlK1Z7TTK0XiHBPIoulWLAuIa8JeKDCK80PKaSvb+hC2Vx5YDTBkDahCUxwp+ylmuEjZeU9
	aJve7HSha9zp/H+8HquCJRiimi5nqwO9LpZK4dVamsPANPPL4IDUGQmTbXW7HKFbXkftNU68lVM
	REP238FiFomwPU39ofFwO0qUYvX7rMqALgLEDZ3XRcxjSTPH7744ub31sPV1Br6J0Y5VP+kycIj
	wXp9dtVkNZtsYLIO+6e5r6DZo4EOLqqq32xQ91vd2yGEoCwzbQAm78lFkWurI2zaGjenP2aij5G
	EL8DFhG0FXluxBM3jxIrgbiQjFFeV+nl8oljDLQWXSf2PGhOytal+E71IHLzoz9FSyP4i6FD+M=
X-Received: by 2002:a05:6000:2301:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e264ab2a1mr4944600f8f.20.1792595299491;
        Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm6652761f8f.42.2026.10.21.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 4/5] clk: meson: axg_audio: add S4 support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.1199000664504589178.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=437; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YqvMrgag+SS1YYwbYaYO3LQNDj+WNIZgZH/cwchSYXY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsar1wWxnVjfVDGxa747u6jg0rYvk7MLdt3qiLDcW
 xS2IKGyo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJUGX4H71gnX/nHxExLkv7
 tJyUPv9053drfe9zHuE8eLKWy4RpN8P/osR9DJwFEsw8Ljx5/LkOB3vFmap3fj1ptnpub2r9YQM
 GAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_080825_655037_85DFD36C 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 15:08:31 +0800, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
> Add S4 support the axg audio clock controllers, Compared with the
> previous version, the selection of the audio's clock and data pad
> will be designed in the form of pinmux control. The purpose of doing
> this is to distinguish between clock control and pin control selection.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
