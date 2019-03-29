Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6708C4360F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 09:14:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760B32183F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 09:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CwsOz8il";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W1+A61LL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760B32183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OliYN1TVhNOB8hk319TAElWBISlAzyV0hiuENRPYLdo=; b=CwsOz8ilKfG2k6
	hTR9MxJWYCFdA/bm8t//vbGZD7vhfWU2sr+lo4tCZuRlQtGvMLLMyq12+Tbvp6RHauG5FDM4U7+UC
	w0bZtTO78KDuU33QEmf91JPw6aU/RzAqFIbrBLcVzBVeUZYnI26T3fGUPpkxNa6+oixKcUkq2gp8X
	Se4KZJrSY5x1CSKfE8MCuAPnh0nn+gyC0czuyoP/QB6268bRnabUWX2ekzg1TEnN0Xy+2WnstGHL+
	X1PBpYsDzBJfpp9Duz3iscyotxqASdr+r2d+46kb+Ucg+66rfsffwQoXW9znmUeIOEO6RjTHJynE0
	hxXeloK5NRNzc0+D1ZTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9naY-0003AY-Tk; Fri, 29 Mar 2019 09:14:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9naU-00036h-TJ
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 09:14:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id y7so1603368wrn.11
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:openpgp:autocrypt:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=uLcGLqf/xFlmdMtE3GWdGSw1CqrGVpHOo/dtVDTLwCo=;
 b=W1+A61LLmG+iIkBTPTkW6zvbtJsMU7Wq9kfDhCZ2K20SVBCIN16/Ig1sWQ8mtrqLe5
 OZ/X8/6yiJpR5uOikYTKyQy3REuq5kvUTXcXvKg1aC+XpbdM1oHTxGTaUmp4ihmSmNtg
 h11o3PR7BkQDP11a5F5bfKKw/OZ62XPiFMrbbzc9/R2Z8AqzirC1hnNW+vp/GfeGvVVN
 ZdZwknU+EHevruaS3N2o0uP/BcruvDd2ad5Qh+enI9eiE+iCg3VkQE+pjqUh6WNiwGwg
 xnaqfXE5mKEN5uZwVXnWhw8+BsAX5+1k2D7zhVpfDCibsvPKIDaEuTkpwatlKR2Uk8De
 fokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=uLcGLqf/xFlmdMtE3GWdGSw1CqrGVpHOo/dtVDTLwCo=;
 b=sVqbP78V6vCePJKMNT7UMta+ZHNWeBw2TQ/PXeC9pmwBY1jKg2kqR4SRr0N2gs9E1D
 VH97nOOWMDqei3Y0lK+JxrKDf22WJnbIyO2wGTDRK5xRErpubbZ513mohNEgZ/309UaV
 n4b52RjGHwd9XyY+C0vOCVvlYKeYMbqHvn1W8ZjLzLhX8azPPf2pK9Jvi0kNdehv9ER7
 Wr0SRXBU3loBoePAaqjr7SBJDoTyyivPqyKj33G+GAfHImk19Jblukhhl2l/U+mcnkDP
 uWCRMH4uhoeGlrEigLKhafc0jg/8A5BtJzQz7+vA5D5ED0gMXFmviv0LEepSh2lAOSDv
 iOvA==
X-Gm-Message-State: APjAAAW+9MiG8OauSY+pIvb3gAOTT5flKCFT3WlZPb8yKnRPe89der4a
 Xu7Wx5IucKpa25ia/v2e1nU09Q==
X-Google-Smtp-Source: APXvYqwOcW1d/4Nhtvrp3pT3AAKv5Dg3mwCZGBv4F8jF2LrdQVazHEyLVVxgx0JtpLUhhPlPjlmF+g==
X-Received: by 2002:adf:dd49:: with SMTP id u9mr28622658wrm.316.1553850848978; 
 Fri, 29 Mar 2019 02:14:08 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b8sm1502406wrr.64.2019.03.29.02.14.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Mar 2019 02:14:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: fixes for v5.1, second round
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d47276b2-73fe-3046-84d1-84d7a08b248b@baylibre.com>
Date: Fri, 29 Mar 2019 10:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_021410_976934_0FE78C61 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dear clock maintainers,

Below is a second request to pull amlogic clock fixes for v5.1
These changes fixes meson8b booting where a wrong PLL frequency is selected
when updated by cpufreq, and removes an annoying warning and invalid return on
an unconfigured vid-pll-div recalc_rate.

Cheers
Neil

The following changes since commit 9e05e49c29fde3f5e0d82542cb89e26c0bc828d0:

  clk: meson-g12a: fix VPU clock parents (2019-03-19 17:38:41 +0100)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-fixes-for-5.1-v2

for you to fetch changes up to 6620f45ff8519549a6877663f965c10002918dc2:

  clk: meson: vid-pll-div: remove warning and return 0 on invalid config (2019-03-29 09:41:30 +0100)

----------------------------------------------------------------
Second round of fixes for meson clocks targeted for v5.1:
- clk-pll: fix rate rounding fixing meson8b boot failure
- vid-pll-div: fix recal_rate warning and return when invalid setting

----------------------------------------------------------------
Martin Blumenstingl (1):
      clk: meson: pll: fix rounding and setting a rate that matches precisely

Neil Armstrong (1):
      clk: meson: vid-pll-div: remove warning and return 0 on invalid config

 drivers/clk/meson/clk-pll.c     | 2 +-
 drivers/clk/meson/vid-pll-div.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
