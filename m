Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC33EC10DAA
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5VuW1lRFLaCm4O9EHj0SoxatG4YaUXThaAtS7AR3ZKs=; b=WK3eDTvU9WPc+n
	TL7s9dI1A9I8d/498kdJAVcL2aTGESinmP81JTi2w8TEzeNy4Px8N7ha/vdk+l//4YKzYE1ZiZlnI
	ZVqqyH3SNiStPfLIUA4Tq/gIPIA5V9VgbhMtNlnVuxz8ByMjSJcCPui08gOW4Bg25eVt6lmg/rUqu
	kpAq0uhyh3+QDEYV3h2LSeywWdtfYSIkhjCY2NtEjjjhPj2kFnnmRTmKzofCfJLGydQvQtQrkEjm3
	kN35Aht3vtiXmlKDrKQwsGDFsoZyVzh/m41ib8oNlDfp/DrtVoEntsc7eZsAReNUtVa0wGtbgdTwx
	Zkvt+5kDqCFgqZ/+RSGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Knw-008Ubz-0I;
	Wed, 29 Nov 2023 13:40:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Kns-008UaF-34
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Nov 2023 13:40:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b474c925bso22180415e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 05:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701265230; x=1701870030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+Pbp6mZjXY9AOVHyk09IUOp31RXPk8rQUCNdGc1tCY=;
        b=OshAxytU9tP5/iiMV4B+oIXst3i2B+Lm35LERCg9atCQUIqnJSjos566mWIuT4p9ND
         rygycK6s10MEV8LYW0RQuPW/rX8cev/Gw6SY3U2Q6q2e/uiSmOAa2QWU6nlfMeSHTXN6
         z9hsiR7WOfY8Z3DonMqt47ZosinnqloF4Yi54wi+f9DLppotl2WPckZ8KAdqY6zI1EHX
         4gNHnCatO8qaJj472XCDfujkGdEmS9ZS30sxJswxtaHxiZUMe7lBXUzJf4YQ4N2wJT1w
         O1f3PYSCI+w8JWLxSvhufQw/j6P9mv7qm04JpL+xPptOBjfuT/2Vdu5ou2HAj+6Y/nYP
         kEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265230; x=1701870030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+Pbp6mZjXY9AOVHyk09IUOp31RXPk8rQUCNdGc1tCY=;
        b=uqZoldfG76gii28+4bCsQb1zKRAMnB29gES/ImEuBk3ABAvwzdlM+Nk2HykeDzIN4r
         3eNQg3H9HKc1eVbzyWROwvxMV6SYA3gL3Vm3PlQosAinVxrNlty0Z+FEVw/VL+b4lW9g
         D7v3r9J9A0RC/VAWMdVch2+6qb3E47m3QO45NcNBsHOeufQOO3hDYJD8Hnw0zQNkIeNg
         fm8L2f6qViLOa9PQUL6mAJhlctKrSlpV1DXc38nbeimS0+5t2xPBxSfm7w58jZ6pTdBU
         R0cwaRFMhU3pTugkA5tKICFL6Xqd1glN9cUxwuvED8+xNn7FNr1zgo0vyW79SJ0a8LCo
         PM7g==
X-Gm-Message-State: AOJu0YzTwdTRUAyW48KCDlSdI5gDZZRo9TAGcxnBkQOQAaOubQJDG8lp
	EXGIwHzTm+XiBD8BvSESt2O17w==
X-Google-Smtp-Source: AGHT+IFimkB/NvQ9JKpZdb8dhZJPKiL5MbqRL7v7mEG3FmxZZdYg2Q3Ku0T1nbZi2786+HnKOlRtrQ==
X-Received: by 2002:a05:600c:19ce:b0:40a:3750:46ff with SMTP id u14-20020a05600c19ce00b0040a375046ffmr13442144wmq.11.1701265230308;
        Wed, 29 Nov 2023 05:40:30 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:6101:5529:fe2d:d7eb])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05600c475100b004080f0376a0sm2285860wmo.42.2023.11.29.05.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:40:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	JunYi Zhao <junyi.zhao@amlogic.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v3 0/4] pwm: meson: dt-bindings fixup
Date: Wed, 29 Nov 2023 14:39:56 +0100
Message-ID: <20231129134004.3642121-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_054036_988718_02D1DE9E 
X-CRM114-Status: GOOD (  10.87  )
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

This patchset aims to:
* Fix the incorrect bindings for the s4 type of pwm that was introduced
  while converting the documentation from txt to yaml format.
* Introduce a new compatible for the existing PWMs to better describe the
  HW in DT, instead of describing driver settings.
* Make the introduction of a new pwm variant (s4) slightly easier.

Uwe,
Patches #3 and #4 conflict with patches #18 and #68 of your pwm rework [3]
I understand such wide rework are difficult to handle. I don't mind
handling the rebase of the amlogic patches you have proposed if this gets
in first. Just let me know :)

Changes since v2 [2]:
* Drop DTS changes. These will be re-submitted later on. Possibly after
  u-boot gets support for the new compatible to minimise conversion
  problems.
* Position deprecated property correctly in dt-bindings for the old
  meson8 type pwm bindings
* Reword commit description of patch #2 to make more obvious it does not
  introduce a new HW support but fixes a bad bindings.
* Dropped Rob's Reviewed-by on patch #2. It seemed appropriate considering
  the discussion on this change.

Changes since v1 [1]:
* Fix typo in the new binding compatible documentation
* Disallow clock-names for the new compatibles in the schema documenation

[1]: https://lore.kernel.org/linux-amlogic/20231106103259.703417-1-jbrunet@baylibre.com
[2]: https://lore.kernel.org/linux-amlogic/20231117125919.1696980-1-jbrunet@baylibre.com
[3]: https://lore.kernel.org/linux-amlogic/20231121134901.208535-1-u.kleine-koenig@pengutronix.de

Jerome Brunet (4):
  dt-bindings: pwm: amlogic: fix s4 bindings
  dt-bindings: pwm: amlogic: add new compatible for meson8 pwm type
  pwm: meson: prepare addition of new compatible types
  pwm: meson: add generic compatible for meson8 to sm1

 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 113 ++++++-
 drivers/pwm/pwm-meson.c                       | 312 +++++++++++-------
 2 files changed, 291 insertions(+), 134 deletions(-)

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
