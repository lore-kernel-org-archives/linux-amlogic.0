Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF1DC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Apr 2022 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lxgi9GPdvslNEIhwpbgMSlvLSyc+JiXacpHu5pL8PoM=; b=or5aMsAaGWC4r8
	TcZteUpoRqTLxdi84N/79aMV9/zlSKGkCQRL9BkyTwazR4Pw8P/Alf/xgvem0TX9fsoX57NBJFD18
	zcpL+xSGAtY2eVB8GQYc7MhMQdi7V9tB1LdeE66epvRWeEbdgQZguEy+q2+zdVz+Wnh1tfQTV1xET
	y5isNJlfFfdi4bdT/YfFmxx1AqAimlULHjJkUlExmFw9qCAwlt2maIYMr5o+97Ap0MKlM30vzjysj
	YrZO2jPyp9ncPXqoEvM/RvWxxGbghubZ5RiDRgZFQ8jiu8rgbU0HyPHGjK1ELYUfTefl0kiXszWM7
	BFqtA5054rEJKzcvVNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndEBs-003VZQ-Iv; Sat, 09 Apr 2022 16:44:00 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndEBY-003VU2-LL; Sat, 09 Apr 2022 16:43:42 +0000
Received: by mail-ej1-f42.google.com with SMTP id bq8so22899279ejb.10;
 Sat, 09 Apr 2022 09:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pVmzukBjy0oK5OWKVTDNtxD4bzljFSiqXQowPFnBMAs=;
 b=LGD8Xt8694dvoqkYkDhEGHl//3dXnPzLVO0VZRNZd0ntzzZWL+VUaJnR9PD8QJ+F6E
 AZtbk3OHSvzmAYUMiQU2wLgnDVMec/UESdWhIZTKp3A3rVoGO+NozE5DaFj3zEbvkeUS
 xE8IBfPXSbL1sWiGci3lrfh91CuczqxnQM0VHsYjUuWk/SqUHcFvOUAS/ElyLg3ID/tt
 EFtDOIXhmozZx3Cixdx9XMvzVrnmUL6Yi7j+5WS6uoNs7HjAyN/huSRWSuO9iQp1nsqU
 +YMTy4Wby8PsrTa7fIBMUhBccXpCav7WPGzgQYpY5/n749JjQ9D3pYXu6IzXXqBkvS4d
 cp5g==
X-Gm-Message-State: AOAM533rfjI6V9EnT6VUQKd8vHatRRI5YChoZSWi1g2nCuMwhzdJ1Lh4
 NbLWn57CDRxa99caA7Tao74=
X-Google-Smtp-Source: ABdhPJzqla9fbXMWhSk7USFQi80ez1A3cQaB67I3GHpphQCdfi0MUOiNvSFfSUUj+Z8egjN7MomlTw==
X-Received: by 2002:a17:906:9c84:b0:6e0:7c75:6f01 with SMTP id
 fj4-20020a1709069c8400b006e07c756f01mr22916698ejc.103.1649522616408; 
 Sat, 09 Apr 2022 09:43:36 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net.
 [82.11.51.62]) by smtp.googlemail.com with ESMTPSA id
 hu8-20020a170907a08800b006dfd2056ab2sm9893735ejc.97.2022.04.09.09.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 09:43:35 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanure@linux.com>
Subject: [PATCH v2 0/2] Ensure High and Low periods of SCL are correct
Date: Sat,  9 Apr 2022 17:43:32 +0100
Message-Id: <20220409164334.157664-1-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_094340_738009_837956F9 
X-CRM114-Status: UNSURE (   7.80  )
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

The default duty cycle of 33% is less than the required
by the I2C specs for the LOW period of the SCL clock at
100KHz bus speed.

So, for 100Khz or less, use 50%H/50%L duty cycle, and
for the clock above 100Khz, use 40%H/60%L duty cycle.
That ensures the low period of SCL is always more than
the minimum required by the specs at any given frequency.

I did a few measures on the Khadas Vim3 board:

i2c_AO (i2c@5000):

Before the patchset, I got:
- 100KHz: 3.338us HIGH, 6.746us LOW, 33%/67%, Freq 99KHz (Not Valid tHIGH < 4.0us)
- 400KHz: 860ns HIGH, 1.734us LOW, 33.15%/62.85%, Freq 385.505KHz (Valid)
- 1000KHz: 362ns HIGH, 732ns LOW, 33.09%/66.91%, Freq 914.077KHz (Valid)

With the patchset
- 100KHz: 4.952us HIGH, 5.134us LOW, 49%/51%, Freq 99KHz (Valid)
- 400KHz: 966ns HIGH, 1.628us LOW, 37.24%/62.76%, Freq 385.505KHz (Valid)
- 1000KHz: 372ns HIGH, 720ns LOW, 34.07%/65.93%, Freq 915.741KHz (Valid)

i2c3 (i2c@1c000):

Before the patchset, I got:
- 100KHz: 3.348us HIGH, 6.704us LOW, 33%/67%, Freq 99.5KHz (Not Valid tHIGH < 4.0us)
- 400KHz: 864ns HIGH, 1.69us LOW, 33.83%/62.17%, Freq 391.543KHz (Valid)
- 1000KHz: 360ns HIGH, 690ns LOW, 34.29%/65.71%, Freq 952.381KHz (Valid)

With the patchset
- 100KHz: 4.958us HIGH, 5.092us LOW, 49%/51%, Freq 99KHz (Valid)
- 400KHz: 970ns HIGH, 1.582us LOW, 38%/62%, Freq 391.85KHz (Valid)
- 1000KHz: 370ns HIGH, 680ns LOW, 35.24%/64.76%, Freq 952.57KHz (Valid)

v2 changelog:
 - Keep the previous calculation for Meson6
 - Use I2C_MAX_STANDARD_MODE_FREQ
 - move the comment before the if()
 - use FIELD_PREP for setting div_l
 - Drop removal of meson_i2c_data

Previous versions:
 V1: https://lkml.org/lkml/2022/3/26/109

Lucas Tanure (2):
  i2c: meson: Use _SHIFT and _MASK for register definitions
  i2c: meson: Use 50% duty cycle for I2C clock

 drivers/i2c/busses/i2c-meson.c | 111 ++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 29 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
