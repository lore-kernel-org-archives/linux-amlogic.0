Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA834C27C52
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HRz77i6WnEdRx4Yfm754h1E51SZe3uBRw0PKwzI9N+0=; b=Y4K
	AjjkOnnaV2O341sjs0cR6g73MT8vEsQUJBRmz4l8DaNpsRg1SHeoUFe8/3yTaBEPAv6VZiVNwBVOl
	o6ZZHabQewKVZXDi0fbHWE69lSc7fYYJ0LwleJbjKqVQMogjyiZyFoT47bZ+6x6B444xqS9tgiJ89
	QAOJdpADJX3VT+O41NARZOmxz7PVjpIHSjwmR4xRdC8Z1/Cgig/0zkdssoxJF07fpe1hh490c5CeK
	oF6eG2bDDcrtysVZAeoX7xM+s7evmWyk0tECGsaDAKa+Nx+KEdrCKSKYnmPNsnxQ5NwAnLh194+Ht
	U/L2i1Aiig7ASwqxaC/RVdRnmV05Vjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvp-000000073EL-0GBz;
	Wed, 05 Jun 2024 18:00:17 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvi-0000000737T-16Ut
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:15 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-df7721f2e70so1661093276.0
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610401; x=1718215201; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w5RPl7PD7LMs1k1njsQ/RXiUssQb7CTl+XBmOvI3R5A=;
        b=yECAyktsMmMfokeRy/1WsqJE0UcU4iJEt0wytqZ/QBs2s8BwUQpzFoSP600W7EO6T2
         7GGUuPYXkbqIqRkzPiqFTbjb33040JkRPfghjJn6NL4kqmUXu03y3b4iiIak8yFcHv+2
         NkE/f+IV5xuYmj/1OP8tk19GPKWIXnfAUlwqBcaPVHqSvDtn0tSYF+gfi6P9gZGCfBn/
         58+LVqY+RQbZGvO6RuiPHxd621aidYGlMIcXURRplH/ov+ebt0K1Izt5u6qf8SkZuhdP
         yi0ItZN1S4ccRBGcr9J8+rFuKvcwr3OoaoctG6oYAwfETsNK3KL8xavkNo0W6QiGRwgm
         B56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610401; x=1718215201;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5RPl7PD7LMs1k1njsQ/RXiUssQb7CTl+XBmOvI3R5A=;
        b=TM/nDBllcMBvZAwwfuBe6hCo+mjo7NkYTz7HAMvGVDxFlLdzIxfkQqH7jFveQhQc7A
         Sl25CcMJJUqmrc925yzbaLR1sOrCzPH29qK5pbcxK1kyU+tUmveIxqBdEP5JFKlhVQYX
         ScR+bbPbtPfOIR97S9WwFRQhrSjHVoSQeyDNkSiO+SQ4HtGK5aVg/eqihwFdHf0EqHpm
         0k8ydbAuo0C+mA/He1q1oGo20t+eyRfujNbA9tjRflW35KUjSiGuVhTGPnWXxIBzj7PN
         e1b2/TXCsCdBX2NXsMG5811T+5ctFZV/LCrJxmTAr8Xzpk/zsVtIRpuC08/VC3aPLYh9
         yddA==
X-Forwarded-Encrypted: i=1; AJvYcCU4AMlNKcXxZvDPKTq3ohXQPdCQI8vt3d0Naa3PZ6YeZMDanIIXsJ+zjEfINr64sfJ5NjQfqsdRkLj3DlnqFgOjqsnMZp/yl47aHpxR/U0Jvq8=
X-Gm-Message-State: AOJu0Yz9fXHaTzKWN63wFb4x9CXFU6ury3Ct2hMWNFJRFZZ0aEu16vs6
	4WhSYEcEgZOuh/wRplxBOmaEW8m5RobvoKqLPRFklIi2wFAv+ytRhWEmjUTdfMwH6i32yT9Tuj9
	fCOjq/WYMNw==
X-Google-Smtp-Source: AGHT+IE3beT3+LJiyuyeey70O4vTmt9cNoEU8h7bwGC3fodiNqs+98CXh8Kyq/MReppn/4vWIwzPR7Cf0wAFHw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:987:b0:dfa:7552:e09e with SMTP
 id 3f1490d57ef6-dfade7e34cbmr71646276.0.1717610400689; Wed, 05 Jun 2024
 11:00:00 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-1-joychakr@google.com>
Subject: [PATCH v1 00/17] nvmem: Handle change of return type in
 reg_read/write() definition
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110010_372816_919F556D 
X-CRM114-Status: UNSURE (   9.59  )
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

This patch series facilitates compilation post the change in definition
of nvmem_reg_read_t and nvmem_reg_write_t callback in
https://lore.kernel.org/all/171751721565.70889.16944298203785853489.b4-ty@linaro.org/

Currently the nvmem core change is picked on
https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next

---
V1 Changes : Change read/write return type to ssize_t and handle
relevant logic changes
---

Joy Chakraborty (17):
  hwmon: pmbus: adm1266: Change nvmem reg_read/write return type
  media: i2c: ov2740: Change nvmem reg_read/write return type
  media: i2c: video-i2c: Change nvmem reg_read/write return type
  iio: pressure: bmp280: Change nvmem reg_read/write return type
  misc: ds1682: Change nvmem reg_read/write return type
  misc: eeprom: at24: Change nvmem reg_read/write return type
  misc: eeprom: at25: Change nvmem reg_read/write return type
  misc: eeprom: 93xx46: Change nvmem reg_read/write return type
  misc: mchp_pci1xxxx: Change nvmem reg_read/write return type
  mtd: core: Change nvmem reg_read/write return type
  mtd: ubi: nvmem: Change nvmem reg_read/write return type
  soc: atmel: sfr: Change nvmem reg_read/write return type
  w1: slaves: w1_ds250x: Change nvmem reg_read/write return type
  thunderbolt: switch: Change nvmem reg_read/write return type
  thunderbolt: retimer: Change nvmem reg_read/write return type
  soc: tegra: fuse: Change nvmem reg_read/write return type
  rtc: Change nvmem reg_read/write return type

 drivers/hwmon/pmbus/adm1266.c                 |  4 +-
 drivers/iio/pressure/bmp280-core.c            | 14 ++++---
 drivers/media/i2c/ov2740.c                    |  6 +--
 drivers/media/i2c/video-i2c.c                 |  9 +++--
 drivers/misc/ds1682.c                         | 16 +++-----
 drivers/misc/eeprom/at24.c                    | 10 +++--
 drivers/misc/eeprom/at25.c                    | 11 +++---
 drivers/misc/eeprom/eeprom_93xx46.c           | 12 +++---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 16 ++++----
 drivers/mtd/mtdcore.c                         | 18 ++++-----
 drivers/mtd/ubi/nvmem.c                       |  6 +--
 drivers/rtc/rtc-abx80x.c                      | 15 +++----
 drivers/rtc/rtc-cmos.c                        |  8 ++--
 drivers/rtc/rtc-ds1305.c                      | 18 ++++++---
 drivers/rtc/rtc-ds1307.c                      | 22 +++++++----
 drivers/rtc/rtc-ds1343.c                      | 18 ++++++---
 drivers/rtc/rtc-ds1511.c                      | 12 +++---
 drivers/rtc/rtc-ds1553.c                      | 14 ++++---
 drivers/rtc/rtc-ds1685.c                      | 14 ++++---
 drivers/rtc/rtc-ds1742.c                      | 14 ++++---
 drivers/rtc/rtc-ds3232.c                      | 22 +++++++----
 drivers/rtc/rtc-isl12026.c                    | 12 +++---
 drivers/rtc/rtc-isl1208.c                     |  8 ++--
 drivers/rtc/rtc-m48t59.c                      | 12 +++---
 drivers/rtc/rtc-m48t86.c                      | 12 +++---
 drivers/rtc/rtc-max31335.c                    | 18 ++++++---
 drivers/rtc/rtc-meson.c                       | 18 ++++++---
 drivers/rtc/rtc-omap.c                        | 12 +++---
 drivers/rtc/rtc-pcf2127.c                     | 20 ++++++----
 drivers/rtc/rtc-pcf85063.c                    | 20 +++++++---
 drivers/rtc/rtc-pcf85363.c                    | 39 ++++++++++++-------
 drivers/rtc/rtc-rp5c01.c                      | 14 ++++---
 drivers/rtc/rtc-rv3028.c                      | 32 +++++++++------
 drivers/rtc/rtc-rv3029c2.c                    | 20 +++++++---
 drivers/rtc/rtc-rv3032.c                      | 24 ++++++++----
 drivers/rtc/rtc-rv8803.c                      | 16 +++++---
 drivers/rtc/rtc-rx8581.c                      | 39 ++++++++++++-------
 drivers/rtc/rtc-stk17ta8.c                    | 14 ++++---
 drivers/rtc/rtc-sun6i.c                       |  8 ++--
 drivers/rtc/rtc-ti-k3.c                       | 16 +++++---
 drivers/rtc/rtc-twl.c                         | 20 +++++++---
 drivers/soc/atmel/sfr.c                       | 11 ++++--
 drivers/soc/tegra/fuse/fuse-tegra.c           |  6 +--
 drivers/thunderbolt/retimer.c                 |  8 ++--
 drivers/thunderbolt/switch.c                  |  8 ++--
 drivers/w1/slaves/w1_ds250x.c                 |  4 +-
 46 files changed, 408 insertions(+), 282 deletions(-)

-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
