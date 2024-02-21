Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048AC48BEB
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CNv2DgRxxPOMhw9PBcIOj29r9SE6sCi+hTy0CYeTtmM=; b=IUFnLFsG2dpjUr
	zEDCp607iQLvU2gtv1cCdBMvBMl4o/tsEhXNEoPApmG9FWy+BJaBzMtcEGolhsRezxdn2Rrz/iliA
	gGom34EH5DeOv/PZCOQhQi7N/ch14EkSDyPr6uhWZ0+gc1g3UnvYF4nXyfEeqyKO1ZX4aDOKB8tCR
	dPTFdIOG5Ivia39WDZ530VHxUfPHSebpvuRxm4jLOTywrEh7761guTUM+wyNqnQuNv5pHpVApuQRI
	cM71tikX5huxkaJGhU8Sh4JqNDRCNTj6FguLlTeVHbj5zUio7jBR0kQe0zxyDVVAhQQpGuoELNXKa
	zcTiMqa5T6HjU0Ab2FbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGc-00000001QRX-1j9z;
	Wed, 21 Feb 2024 15:12:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGX-00000001QPF-2a82
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 15:12:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4126f48411dso11878435e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708528328; x=1709133128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FBkTY4ktEOVpEo6YvXl49m3OViLG+BImsIBijiLHxg=;
        b=tdIf7xQVCJ1wPUfnkbbPVM0hJO/IjpVXC+zPqA7yc6HMpkcM8TYFuZFu/NZtwAX6dM
         EEkl8K5O7xMWx477mgTijitW5EWOGNom06icLAqW9t+qpZewKhc9zU2OaPKDOlmuwkN2
         sjHAtUAk5MlUaWI8bWvvPUohlLdFFRtgHQzzzHPcH26pEuW2f9DwjxIBsKv9Bh8uYiZX
         mlsbJN6BwIKA5SJqBmJQ5vmzcaibNEIqyvKvhWkMDh84TxWIp9rdsp9y4zgPlp0B2ouu
         V/+6F8cEI6SCORsaxfI6LczKnLosdXavAJ5lSaluGbAmCZdYS2x3itv4TN+oKe3YPAt2
         elTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708528328; x=1709133128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FBkTY4ktEOVpEo6YvXl49m3OViLG+BImsIBijiLHxg=;
        b=I2QEk5LJn5SssYfwnZpBwMEbX0OMGq396YP84iv74IvgMoelq3N4BPdhE4xJmTtoM4
         TNBg5JVIVgs2STXMb/Vs714pfw4Vre5A/NS+CgsZiDYbA2+GulHAFlvVhcp965PoaIKH
         D4puOqL005pA26mYeSidd3hFeq7ZwHnUCnyCtUrnWoqS9MdwNWlr0lyQmk8pWfGwv9M/
         euhdVwC6b2SyRjTPMnMfZSQV7Fb/yT0neYh/nlMlAfb8jgGh/puhlzv76dvtJoxx7pEx
         LhMs422A/OVqO2GzjDUZ6uhRXxrjnSr9lcRWUK0tdrNJOR7SAPuBKJVKSkBtKsC+nBEI
         vGmA==
X-Forwarded-Encrypted: i=1; AJvYcCWkICCvkKGn3wfkV0shQqAFLbyBxb1Prv3yc+/q2S8uNN05Ipn9GEXbiXWXEyaZW+pvJHP4vJyqYdf0r4SiJEM/ZDdpAMVcw85ZZTZpsxyuAQo=
X-Gm-Message-State: AOJu0YxpMkcYKnvF4GJHZqfQnV3JX1D6EX7g5B36iPZJK6sj1uNT9Cvf
	aHWlDduRPnOAfT9XwPNfIxrcX6fyEdF0MxJ75gUKIRtKmTMXZwROjMY9NeQEQjU=
X-Google-Smtp-Source: AGHT+IEbPlqDTjSdZwcRLe9JlRyRaH1Pf7F4HirGnDZSwaq8u4fW6YZ7whK5ATYjJZ9SOJhon0VagA==
X-Received: by 2002:a05:600c:458d:b0:412:60f9:3fe3 with SMTP id r13-20020a05600c458d00b0041260f93fe3mr10011548wmo.1.1708528327447;
        Wed, 21 Feb 2024 07:12:07 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1b1a:d907:d735:9f9e])
        by smtp.googlemail.com with ESMTPSA id bg22-20020a05600c3c9600b0040fc56712e8sm18725342wmb.17.2024.02.21.07.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:12:07 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH v5 0/5] pwm: meson: dt-bindings fixup
Date: Wed, 21 Feb 2024 16:11:46 +0100
Message-ID: <20240221151154.26452-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_071209_896803_7D5CDBFA 
X-CRM114-Status: GOOD (  10.34  )
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

Changes since v4 [4]:
 * Rebased on Uwe's pwm rework in pwm-next
 * Drop change to carry device data in drvdata
 * Make the length of parent name array fixed
 * Single allocation instead 3 for the internal clock elements
 * meson8-pwm-v2 and meson-pwm-s4 compatibles under an enum instead of
   2 const

Changes since v3 [3]:
 * Split first rework patch into 3 changes
 * Use dev_warn_once() to notify use of obsolete bindings
 * Rebased on Uwe dev_err_probe() change.

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
[3]: https://lore.kernel.org/linux-amlogic/20231129134004.3642121-1-jbrunet@baylibre.com
[4]: https://lore.kernel.org/linux-amlogic/20231222111658.832167-1-jbrunet@baylibre.com

Jerome Brunet (5):
  dt-bindings: pwm: amlogic: fix s4 bindings
  dt-bindings: pwm: amlogic: Add a new binding for meson8 pwm types
  pwm: meson: generalize 4 inputs clock on meson8 pwm type
  pwm: meson: don't carry internal clock elements around
  pwm: meson: add generic compatible for meson8 to sm1

 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 115 ++++++-
 drivers/pwm/pwm-meson.c                       | 289 ++++++++++--------
 2 files changed, 260 insertions(+), 144 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
