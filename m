Return-Path: <SRS0=/lP5=QU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D29C282C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 09:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867BA222BB
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 09:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XtdQKFeD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VDa332ju"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867BA222BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/9xcpItSjR4b/39AIICbzqlOEvrPSH7Y9eZVhwaKJyc=; b=XtdQKFeDnnKYg+
	tA6aUoZ2DI9tTr7oONCCg0uHE/v2qlmILzcbv0XR602cGTDN37/O4zNvTETZ1Zuy6VZ4b5nc1pDdU
	4KH1lPzAam93jC1Amv0dWvCHEHQIxj8nT/rr6PHjweNPaY0TJyq5JYOxvRMLdtveNvb6kwhr16E0K
	Rcc7HH0cwzo+GAYQxQQ2+RG3Z7FutjH7dh3CQU2TKGI1op1+6p9+tatCPjynpDcIvSHbimR73T7hs
	3u/zuyFQiLAMTvNGaB5ppE+rxzLgwnYzR8OnbW3E0qhnelHkOwxt12+sHU6IzNnBwC6nB+e7g5dcs
	hVu4I+Va93ryPp4zm/eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtqa4-0007qG-9u; Wed, 13 Feb 2019 09:11:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtqa0-0007pq-OJ
 for linux-amlogic@lists.infradead.org; Wed, 13 Feb 2019 09:11:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id t18so1606301wrx.2
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Feb 2019 01:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:openpgp:autocrypt:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=L+P3gxUpaewcw9n39ZadRS8MkXSKzNofqtUDsGlWBZw=;
 b=VDa332juxzdKw81P3+o7xp2dMUWKvuBaPKT52bcbh5imdL71tWjPYBeHAQzxjxXtFG
 6E86JYKy9iDhxDiUFajk5p7zvlefvz66oUzR2g4FHFT6iBa9+vH5dsFfF5KCEK6qDND9
 LqZ8X9EMA4AXrro08dE+Eb2SF+dCQ75Qc4r7/xQsuFJNEVhI7J7WmXvUApqjgMOnwdce
 XuG94pV/dHq369Gi/YZzL8IXDtb0WQnl3G62j9rMRvkSMDgzxgDl0O2wYM194Q1MLon9
 I3HowtXOskwkCgSpH/AFu+ladFa2LjYP4ywGjXOz3+hp0u+EVmw9jjoDfqNpB9OScB3G
 j1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=L+P3gxUpaewcw9n39ZadRS8MkXSKzNofqtUDsGlWBZw=;
 b=XZc+bLf5vJnSStLICT0jZaiF3BTztN1tH2TJ/33gVYnrF5wDWRWevHHvXK7GbU7yDD
 Zv0hmDUeVVmK69aMIgBwop99VKeynAxWaKdQXeXk6JiHZ3vD6O6BE7XNBQV2xtHileLJ
 TFx7GSfnEj1bCgV42LVDYbEu3QbOrwm3RFg1Kjd2LJzL8IipQ1pLMyHApCOZ7+cL6OUU
 dItMSVhptZP5VPm7VlWdJbIkFE5r/KVCiP6H6HqdcA833owE2MqLQysTTa8iQf7RNMvm
 ShX3oCxvS13S+eilvnnMm1Gqb6+QFEzIZjLWjylBiTx1vxhTOI2/+JrTGtaCwiioPIj7
 oJaw==
X-Gm-Message-State: AHQUAubb5m6GpW5SvnKbK5Nm4WcRrwr/nUpeI9I8JLvlEyimR5njrKNX
 cDFZYZlS83MsUhEEGJKPC9uR+tbWWKpueg==
X-Google-Smtp-Source: AHgI3IaN0aStakC2EiIEqdsB3eTGuNn7SIjtD6ivsLleZDo/kOGgh4GHksL3sNexZRSDpJvXsIBnbQ==
X-Received: by 2002:adf:b741:: with SMTP id n1mr6043489wre.287.1550049099000; 
 Wed, 13 Feb 2019 01:11:39 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q9sm4464256wmc.10.2019.02.13.01.11.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 01:11:38 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v5.1 round2
To: sboyd@kernel.org, mturquette@baylibre.com
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e115449e-085c-8f82-b345-f610b5e735db@baylibre.com>
Date: Wed, 13 Feb 2019 10:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_011144_815785_6E54F4CF 
X-CRM114-Status: GOOD (  13.38  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dear clock maintainers,

Below is a request to pull updates for Amlogic clocks for 5.1, round 2.

It adds the G12A Always-On clock controller and a simple typo fix
for a clock name on Meson8.

Thanks,
Neil

The following changes since commit 6682bd4d443fad802e11a0a39332025cdfbf5108:

  clk: meson: factorise meson64 peripheral clock controller drivers (2019-02-04 09:52:11 +0100)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-5.1-2

for you to fetch changes up to c5f09e6bd8a7537beef8ee53cd161a06b04de271:

  clk: meson: meson8b: fix the naming of the APB clocks (2019-02-13 09:51:09 +0100)

----------------------------------------------------------------
- Add G12A Always-On Clock Controller
- Fix Meson8 APB clock ID name

----------------------------------------------------------------
Martin Blumenstingl (2):
      dt-bindings: clock: meson8b: add APB clock definition
      clk: meson: meson8b: fix the naming of the APB clocks

Neil Armstrong (2):
      dt-bindings: clk: add G12A AO Clock and Reset Bindings
      clk: meson: Add G12A AO Clock + Reset Controller

 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |   1 +
 drivers/clk/meson/Kconfig                          |   2 +
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/g12a-aoclk.c                     | 454 +++++++++++++++++++++
 drivers/clk/meson/g12a-aoclk.h                     |  34 ++
 drivers/clk/meson/meson8b.c                        |  26 +-
 drivers/clk/meson/meson8b.h                        |   2 +-
 include/dt-bindings/clock/g12a-aoclkc.h            |  34 ++
 include/dt-bindings/clock/meson8b-clkc.h           |   1 +
 include/dt-bindings/reset/g12a-aoclkc.h            |  18 +
 10 files changed, 559 insertions(+), 15 deletions(-)
 create mode 100644 drivers/clk/meson/g12a-aoclk.c
 create mode 100644 drivers/clk/meson/g12a-aoclk.h
 create mode 100644 include/dt-bindings/clock/g12a-aoclkc.h
 create mode 100644 include/dt-bindings/reset/g12a-aoclkc.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
