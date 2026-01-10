Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187F0D25020
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jan 2026 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qjDYdJ9j+sCpCaFeoMS6hXb2uy5c2GC1U00tfJt5T+M=; b=ryj4HooK1uHhHs
	XixKCDKxmGya6zP2TjpBqt3N/EiwyqmStewDOpI8cB+sxt1/kf+Gq5hhrwmM8dBjhCi02KvGlIXeE
	+QRnJz0/HTutQP60o/k6rgwrSrobsXF20ZCJpdW6WKCUKXpnubU0i7HTxIeap5UWR3z1gy4IV2k9W
	omevD3/gmhXKVskQ18q1fz9ppos5HSsaaVy0eCxHvSFC1BmrSCIcq4ArmLYTWrUz+ffuWkkAchv+j
	/+I4LZfN9NE96Z0z7qpf2bdNqrRcqDAbY7Rl7E/thMJh4OOfBkAQZ+ZbKFvWDDauCQatZTupdnWhz
	BEbWC1sRyRAx3NmWRKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCc-00000003ecD-13wm;
	Sat, 10 Jan 2026 20:04:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCY-00000003eai-2HFH
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jan 2026 20:04:49 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b804646c718so785962766b.2
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jan 2026 12:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768075484; x=1768680284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXLLlxs4qW1+ZesmiLUyjALqG1DyG/LyhBi2azmiHI8=;
        b=hDptILyUhAXjepyUZb5QuR5rGxfQ8N0UDwp6lmFL4AG8pTxXWvZ58OhXcrg/1gDBmb
         tpPBKV5lh67xqywSeXKEoAUY86krrE8wDnveXNOk/K+Hjlt9SZV5zDge88P+9b6k9Grd
         FsROyqcEFU4KM5NQfI86XlqTarlrTiWIeoAZH/9lrIfxBd3Mn0TML9Phy2VK6tJzx1f6
         lp3oj6nCfdelrccdI3PIFjgTQjj2KRBkoRYGW/Ke/8PmJAePZ6XXobVg+aIN65NrMTDz
         TraUrT+M79vt9Vl9HGMOGZv2w9ysqPv1YRqPiukXRnO1jyAFA5g5SkreORxLd/f5H/Oz
         OSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075484; x=1768680284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXLLlxs4qW1+ZesmiLUyjALqG1DyG/LyhBi2azmiHI8=;
        b=wrcBd2iWdA6QX2z/IT6Jo5wZ92T/sjTlXVRuC2g135CqF55z3lf9jUo3UTXkX26wno
         xHoR4lEN6d+ViuqIvsvvGQzNLsdYR5UacjGz4dH0QdUk8DUBpBn0lFKqdn9qAVYzENpV
         SOEfhrE813a5TGjFoXbiMdthZmAoJn1poe/NV9x9bBna1jJ2kkOULuirpMYq0tALX1MG
         0m/O/QXysp0HmS7ajeFOLW23TCeyao4irGqVN0IcJKG9i/AgkrfV3OjCHhTrchKllpOs
         y7Yg4xBrq+iFyhvW4QciawZiK37zX5PJVhezPJzpHR6v83968Vev0G6DydUR0T3azGow
         3g/g==
X-Gm-Message-State: AOJu0YxCDLU8KfZDX4h/8trTfm6x5n38SHo5iN5x7a+fOeUROx2Xo+4o
	BIPP3ghe9vk0qLWOWyIdccsAdBHfgdAlHG7z6+yuxtMO877nI76wZKpatn/iPw==
X-Gm-Gg: AY/fxX5OIeR+Sr6dmEFSv7N3VHnXyOTgdf/Kblt1UcVV4rXknb73RwWUwcyf9q6GOP6
	05tiGCbvmORAA400CuHvl+jbFHX1TMbUVblvojaYUp427sGeFxFYAsV8CanWRQs4/Wzyr2vGjHi
	v066yOZKcEMe891eLHlSNLbOmSmPK95B/HC0qkkq8Q/GRNxmW/tB6GlCeoXM+jbmGh7JO1mg7Vd
	/jbKmIF3GJ2qQljQ/nn3nCi+QxxHC0Z7qZzy1YuxpULw6WdGlUtpxwY00Fmso62x10RJ0d46edY
	QUzW16aIzxD2RtcYYn1fZLV7Lhc1QIR4WP4RmnaW6q5K6mPOFAPOBNTyILel0/mS0NMEP23nz/B
	/GZ/3rvmeYgEO6Z4EVvTJkje7oSX1BP4bZYycvuo3ERk7IkmhOB+VYDOE4LWfyd3sfPrSBpX0iJ
	8hZVbgWC2iWpDkUZrWgoG/qcjFSdbxpqcZi3BH038VyxxqBEPu2UY6wWv6OaDaU+WD90qpnx6LP
	0/bfdPWv0apxHHidlfCdzLapd3YVWjXidqc0BC9z7Q=
X-Google-Smtp-Source: AGHT+IFIiQoUtSeyn9mIBbOOpJhcZYBlr/ord7EW8wnXlRpW5UAw9sYZWgIe46tbc0kW+YaZ+jiBYA==
X-Received: by 2002:a17:906:fe0b:b0:b73:6d56:f3ff with SMTP id a640c23a62f3a-b84451d416cmr1398267566b.20.1768075483987;
        Sat, 10 Jan 2026 12:04:43 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-af95-6f00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:af95:6f00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a56c552sm1483591066b.68.2026.01.10.12.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:04:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	adrian.larumbe@collabora.com,
	steven.price@arm.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] Add Mali-G31 GPU to Amlogic Meson-S4
Date: Sat, 10 Jan 2026 21:04:23 +0100
Message-ID: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_120446_579278_E040C854 
X-CRM114-Status: GOOD (  11.60  )
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

This series add support for the Mali-G31 GPU on Amlogic Meson-S4 SoCs.
Overall it's similar to Mali-G31 on G12A:
- both are using two reset lines
- both share the same OPP table
- both require the same power override quirk

The main difference is that Meson-S4 gained a second (bus) clock.

This series updates the bifrost dt-bindings for the GPU on the Meson-S4
SoC, wires up the quirk in the panfrost driver and shows how to wire up
the GPU in meson-s4.dtsi.

The .dtsi patch needs to go through the linux-amlogic tree. Would the
dt-bindings patch go along with it (to prevent binding validation
errors)? If so then only the panfrost patch would go through the
panfrost (drm/misc) tree.


Best regards,
Martin


Martin Blumenstingl (3):
  dt-bindings: gpu: mali-bifrost: Add compatible for Amlogic Meson S4
  drm/panfrost: Add Amlogic Meson S4 integration quirk
  arm64: dts: amlogic: S4: Add the Mali-G31 GPU

 .../bindings/gpu/arm,mali-bifrost.yaml        | 20 ++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 49 +++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +
 3 files changed, 71 insertions(+)

-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
