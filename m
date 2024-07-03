Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C0AC30653
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QW9we+ii8tljEK1lvp3r1y2MRosYG4GIVW3DfAE+XPQ=; b=sLtRzWSZx6JYiK
	50iF3RC31sd2/ygdLGbB0kUjKg0psMQG+JmEFFY5lV5v2TW/OOVFWFt/657ac2z+1XloyJw2ma0tM
	8L0PRGgGRUg3FHJ2kqaEgbJZiDyivo9hsuWXOaY3a1oS4coaGaAqasVIGdwdJldQ2gS3ebhHnVvcT
	IfAUxuDpw8sRWYuOWUEStyafcQLdCjjBsjGvL3D510MQODkqir8hR88u8XUnH10uFvu4Z9Cq3QQ5Y
	SFEDAvXevpwL6bJg5S0kAMDgbcl0S7bYNnWfokQ94Ky2sLx1Sjb2AK9MUPiHBIf+rf47H/ju7bSX8
	9hohmvKy27LwphgSkh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdE-00000009btS-2Zdv;
	Wed, 03 Jul 2024 09:50:32 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdB-00000009bqo-1Jcj;
	Wed, 03 Jul 2024 09:50:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-58bac81f40bso2226512a12.1;
        Wed, 03 Jul 2024 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000227; x=1720605027; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9e5yaw2si1pKuwfLiF0RZK+Xace2dOoBphwXdFQGGKY=;
        b=PhtGcrHn5LDyqK/u3rKq4UOBE289r4LJV27Z0NLmbCBFKen+Ylos0s81fymjToB3VP
         iv0vZKlqpJ8r+JZ52wFYprQYjM45WeG5aXd3hR62R6PaomFxopRojg7bsEYTzQyOyX8P
         s6QrIDnp/suKEJQCk/l225ZWW7QHu7iBFnex/hdJOQBDP8Lutoa3pp/RqNVYKwLfuQ80
         33RG5A4XREe/n3kybSLg3q8/pE0KLR7rliv/05D8oLY+z3sg/gHSMmU634zTPhMKnmMi
         Lbd6Or82AHbFLlrS7+6fhFjugePy1aiUbM+drKFuvaHK5U1DPiFFxMJxz67Js6xIwPyO
         ItdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000227; x=1720605027;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9e5yaw2si1pKuwfLiF0RZK+Xace2dOoBphwXdFQGGKY=;
        b=OhzeQ0Ge3FDyWbnkmsu+Lpq+64eWmDRZFoARhJod1jQPhJwDFyCJBQ2/CFIYt0weUX
         6HpRmmAyLLzpVnQ6YEx3efNPiFAULF52KmSQuwkIc9lxv1mMzOxJuaJgmeS+XDHcbS0n
         TOmX+DQcJ69CEG5PAweKJVachU9fFxQLqZfAauiFSB0xAycP2jb22+zCHDYb7C8Voow/
         Jeav2Iwv80dupRoyXj0j0P+QtFxsel66x3D7JTAAmtAXEkGQu/N8yDKTCfsY2jGjDGmL
         PKj13c4V8R/0SdpEh4T7CrgFRZ5Vhlsas5Adwi7EVnAjMXhDUzBFb4O1PEaTHlK8vq12
         mqKA==
X-Forwarded-Encrypted: i=1; AJvYcCU03DmNOt+Rcr50nNkRC2/9Wgvu5igJ7XAfkFnDmB/rRhEbZvu2aZBlsJtYjQV4Mmxu7F4VbpkIF3tvxn6iIRlxV3ncJwUSwe0L7WvmWhu7ml64O60=
X-Gm-Message-State: AOJu0YwMBvCWEbwxlgnt+FExvzly+mS42mY7CPg9w5aFyDkpbl+HUW8x
	f3KBTQ0L/Ae+//3E4f+IkldHvHyJgqUSHbJU4mTJaQch6z9vwbXX
X-Google-Smtp-Source: AGHT+IHy1ULwYKwABrtHwf7Z5gPXwJpCOZ7NAgyKtr9AsqNSUxedemwdLxYxMQEJeJr5NIPIwr+Zqw==
X-Received: by 2002:a05:6402:1cc1:b0:57a:33a5:9b78 with SMTP id 4fb4d7f45d1cf-587a0a0e64bmr6978095a12.34.1720000226723;
        Wed, 03 Jul 2024 02:50:26 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:26 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 00/10] clk: constify struct regmap_config
Date: Wed, 03 Jul 2024 11:50:13 +0200
Message-Id: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANUehWYC/x3MSwqAMAwA0atI1gbir6JXERfSxhrUKq2IIL27x
 eVbzLwQ2AsH6LMXPN8S5HAJRZ6BXiZnGcUkQ0llTS1VqLcV9eHChZ7tPp2oO9MootoYUpCy0/M
 sz78cxhg/ciwmdmIAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=1600;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=VN0dICtf8OggMFqtTebUKdDngD8onf6DYfmLlc+0d7I=;
 b=XjNDV3CyIMCkA6IMmQ3V+5Cn8hZiM6rJfa6KC5/HpmmPt7RVotWReIEvLZvcnBMUvuSlYQMYF
 9WN+/KkdNdhBJRjIsldFaqvySnS2npK1iWx7F4m12O6i+gta+F3kx/S
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025029_408860_3D2DDBAA 
X-CRM114-Status: UNSURE (   7.54  )
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

This series adds the const modifier to the remaining regmap_config
structs within the clk subsystem that are effectively used as const
(i.e., only read after their declaration), but kept ad writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (10):
      clk: meson: a1: peripherals: Constify struct regmap_config
      clk: meson: a1: pll: Constify struct regmap_config
      clk: meson: c3: peripherals: Constify struct regmap_config
      clk: meson: c3: pll: Constify struct regmap_config
      clk: meson: s4: peripherals: Constify struct regmap_config
      clk: meson: s4: pll: Constify struct regmap_config
      clk: lpc32xx: Constify struct regmap_config
      clk: qcom: lpasscc-sc8280xp: Constify struct regmap_config
      clk: sunxi-ng r40: Constify struct regmap_config
      clk: xilinx: Constify struct regmap_config

 drivers/clk/meson/a1-peripherals.c   | 2 +-
 drivers/clk/meson/a1-pll.c           | 2 +-
 drivers/clk/meson/c3-peripherals.c   | 2 +-
 drivers/clk/meson/c3-pll.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c   | 2 +-
 drivers/clk/meson/s4-pll.c           | 2 +-
 drivers/clk/nxp/clk-lpc32xx.c        | 2 +-
 drivers/clk/qcom/lpasscc-sc8280xp.c  | 4 ++--
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
 drivers/clk/xilinx/xlnx_vcu.c        | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-clk-const-regmap-c9d56004dd06

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
