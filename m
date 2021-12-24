Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC65DC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4pV3wHQM6UsDKoAKi1TNXpAd/BoI0PspkXmJFWJtVk=; b=qGMia5Ld94fbU2
	sIUxqapu1pkt446JbvCND6Tam7S9RfGUjpubbYqgHEQZnWL3bNlC6oJlXi3yCLW9DNMXdi7El9hYV
	+32DTOPASU91t/Aad/kCw0Vz/yiLwdJRV79IevrrhZ1bTc6mgX5jhMqVfKuLncN8Fa3ZtifJ/2nJs
	MAP+gCodJ7V7RA9EeDab4kglAOSHkobVGuCmbOR0x6X5Fc4SUujTOgbvtXEoHgyyVeEXuZcQNsThm
	vAvnavCdRw2GFM8/dasYOhDb2g38Q3UyibTmSGC8MpaO1uR5L2CSxuqGD9JCBExhS514JOkmVFaOz
	5fR+UbQ7ZddzQw9Qnmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0lcG-00EElA-TQ; Fri, 24 Dec 2021 14:32:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0lcD-00EEjv-9Y
 for linux-amlogic@lists.infradead.org; Fri, 24 Dec 2021 14:32:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 n10-20020a7bc5ca000000b00345c520d38eso4629608wmk.1
 for <linux-amlogic@lists.infradead.org>; Fri, 24 Dec 2021 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=user-agent:from:to:cc:cc:subject:date:message-id:mime-version;
 bh=J/sv0TNCM9qhpmuWLLjcw321btDF9NYLzz+0+v/rVkY=;
 b=Ikaxk4kRWp4PpqKW5C3ydChMKXHguNjcmX6LJJP9b5DNCRq0Tfatz3s9ZNuDs/4gKm
 45Qb6bYc8SKqgsP6lA8RisrDX2ymvdfl0lrFwWHc859ANlTu/suJhEH1nlF72sM7wyDv
 cgTOmytcKqpteLv35kXO0ReqPxVLohucthJ2waT5JrAnwsWLClzVpveD/etX9IDfXbnB
 r4qMeAYEzbBqAPp5sor8UZEHKvYi65tosjZtdHRKEi7b1KA1niY18q0N9YNzZ8/ZVSGG
 KtzdQNR8wqmbkFAfUz4fAODzvEPfQfin46m6/wCYkZpQogu6RNW3fn06ds6x7Uzm1Qzd
 sjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:cc:cc:subject:date:message-id
 :mime-version;
 bh=J/sv0TNCM9qhpmuWLLjcw321btDF9NYLzz+0+v/rVkY=;
 b=JZGoEFg7BlMW/JYytjnCag8tyFvCh7a3JL342J9LWsWlDbWHiaExfqBU9ZQ0gfQhDF
 p9IwVLck1Dz2BImV/meDkgHBTJD6GYaOGu4RzQZ3jU1X1b1K5EutOU9vM75f6fPELUH6
 F5PXOXbzZEiBpEoKRj+iVerPFRh/yQ+GVKqH8IDSeeWDnMOLw2p0xinzCWC+PqhS1N6D
 zmvXeJ06sWCOwoop6y7wcwDAOUYH7b/aSrYwQ6MkPEVEEkN9GD8fnEDqgsUhWjrrDxp9
 RvkBe0HCbigTwdbf0kq5qswz6LVx7OOWwUw0RZQJA+Hif4R6AsCu6XJ7oRAL021lx3bv
 MoIw==
X-Gm-Message-State: AOAM532SxXm0taBg++XZPQlCo9yPVGvw3xnK4bTmHT6LlKu5jFDnxFAG
 MBgmlYfA9PA8cEO9qE6V6UtL+w==
X-Google-Smtp-Source: ABdhPJzGVqOsXGzYJm90HcX971AuK9CKo0663Sce/buXN8Zo0HNnK3lLg3vPNUena2m2PfJVI/wEfQ==
X-Received: by 2002:a1c:1d17:: with SMTP id d23mr5094399wmd.105.1640356331093; 
 Fri, 24 Dec 2021 06:32:11 -0800 (PST)
Received: from localhost ([2a01:e0a:1a5:7ee0:ef0c:e38f:5a0f:262f])
 by smtp.gmail.com with ESMTPSA id c7sm8992009wri.21.2021.12.24.06.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 06:32:10 -0800 (PST)
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: sboyd@kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic update for v5.17
Date: Fri, 24 Dec 2021 15:27:48 +0100
Message-ID: <1ja6gqhy52.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_063213_443186_5F2C7CBB 
X-CRM114-Status: UNSURE (   5.51  )
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


Hi Stephen,

Here is the amlogic clock update for v5.17. Just a single fix this time
Please pull

Happy Holidays
Cheers

Jerome

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.17-1

for you to fetch changes up to ff54938dd190d85f740b9bf9dde59b550936b621:

  clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB (2021-11-30 10:28:52 +0100)

----------------------------------------------------------------
Amlogic clock updates for v5.17

* Fix MPLL0 gxbb SDM enable

----------------------------------------------------------------
Martin Blumenstingl (1):
      clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB

 drivers/clk/meson/gxbb.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
