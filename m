Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B47C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 12:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784562145D
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 12:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HvEEYvA2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MQzpUWRn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784562145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=96G1WhEgPfI/dqlGw9t6DBzZcows9jA5ep2Mb3YstTQ=; b=HvEEYvA2DlrDDI
	NJhOAJRq8jxNiLvTDKW6ggeKyA3HxRrFKodudbKrG7ClSoVCdY4hTMEzvfnlPXgU3WK7GvGSZy5GZ
	bIg09mT9iwKb9bQi04zQ4MEBurTyNvZqkIXVAgfH+5XJCnU6lwVzjXDTyBkAR/op3+KTWYjAwTU3S
	2Mo0m7fq9QqoptmZwYcqDGSegOQNTvpdansT3pF8Ag/DVYzlsVWKqaAlwc4UErWUqbCEY9igyw8V5
	mYvesQA9M3yL4shLfADzS4Lcs2IQp5ICZmAwnczSPSaabZHab8/q6HcQ2PJ1MmAR3HrOZgWj4Tbss
	e4j1+TnUJfpLlEgudKIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTnUg-0000VM-Rq; Mon, 03 Dec 2018 12:38:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTnUd-0000UZ-D6
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 12:38:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id j2so12015431wrw.1
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 04:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:openpgp:autocrypt:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=Tg13UzW0bY9E7s3PI3Vn887S+8FegH560BX27jH2OqA=;
 b=MQzpUWRn4JgyBrT5vrm84Z76vyRL9786YDkP4OCltVMLNz30WFZsk5GDo7SDAn+TEa
 LSWXOKOKean5tVMAgWZEcZ5uXxf478+31/E2vXV/+gpE1o+8Yg8O8RHkHn9ssHaZOJlm
 TDERaRWp/DtNx0uaP551i2uizPTzBSIaBBS5H+OuXv881ZyLs7Zwsa/jXlXKBAX9Yv07
 xZgp2GrxHKGFVE5R2eHKBA7/aUdgtcDUwyMwx0j5UjEYcsgnIe/HNkpRhaGOT4Nv1m23
 5a0qlY5fcY460+hR64XA4CTCADYXQw0jBAtrJRUnCY9328AXjqjqZkI+hErifc5pp00T
 my2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Tg13UzW0bY9E7s3PI3Vn887S+8FegH560BX27jH2OqA=;
 b=kRS4XqNYvuMvxmIZlEGrfW+9aBmsprOX4BRFbxXb+7/Jdsrfs1dULbkOtFu6h2bbgX
 DLFe/QINXt/v3m+t/rymQAue66H2uMHmD1lnyhVwmry6hnnngTBhOD+dNjJgoCs3z7xM
 oTGAyWDngRDmbjKEJPahNs41xCnv4QlsZInkj61qrDAoHb9pxP0+W+KGCMu5e4OeIPFZ
 /u/3thdUn31YFidt3yrwNoBfKocQqF90aupR2O8N4covYwFtgwj9XK6wtUlGOHK6WYCE
 YwxFMPoPYZxZBpXRhLhkQK9LPL9P5eAkWNMwiiTzORn2p+OEH3rfvPFBSbv5c3kQbjRm
 Gn6Q==
X-Gm-Message-State: AA+aEWabLnA6GJmriYTtVdIXLE/qgAw4of1mNKVLKbWU9eOos8GNatNn
 9ngS4xXDsIv8yEBA5gssjbmHOA==
X-Google-Smtp-Source: AFSGD/XiZXmMyrAxyyuFO+85/q0dvpLxrcA/UBUM12l4ojOGlNkLY9JFuYzCFDeCVrbm54QRXYZe6A==
X-Received: by 2002:adf:ef88:: with SMTP id d8mr13838874wro.163.1543840699418; 
 Mon, 03 Dec 2018 04:38:19 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s9sm12236378wrw.26.2018.12.03.04.38.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 04:38:18 -0800 (PST)
To: Tom Rini <trini@konsulko.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PULL u-boot] Please pull u-boot-amlogic-20181203
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <7769afc3-d778-7501-eb5a-dbf30934c93f@baylibre.com>
Date: Mon, 3 Dec 2018 13:38:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_043832_069702_F05F74F1 
X-CRM114-Status: GOOD (  12.99  )
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
 U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Tom,

I hope it's not too late, It's a single patch from Loic he reposted last week.

Thanks,
Neil

The following changes since commit 952061352acfd24034e6990b6b7d32cded020c0a:

  drivers: rtc: correctly convert seconds to time structure (2018-12-01 18:03:14 -0500)

are available in the Git repository at:

  git://git.denx.de/u-boot-amlogic.git tags/u-boot-amlogic-20181203

for you to fetch changes up to 8973d816588a8479eeb0e3a9f1e730922d3efc07:

  ARM: meson: Add regmap support for clock driver (2018-12-03 13:34:21 +0100)

----------------------------------------------------------------
ARM: meson: Add regmap support for clock driver and sync DT with 4.19

----------------------------------------------------------------
Loic Devulder (1):
      ARM: meson: Add regmap support for clock driver

 arch/arm/dts/meson-gx.dtsi                    | 31 +++++++++++---
 arch/arm/dts/meson-gxbb-nanopi-k2.dts         | 48 ++++++++++++++++++++++
 arch/arm/dts/meson-gxbb.dtsi                  | 14 ++++---
 arch/arm/dts/meson-gxl-mali.dtsi              |  2 +-
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts |  5 +--
 arch/arm/dts/meson-gxl-s905x-p212.dtsi        |  8 ++--
 arch/arm/dts/meson-gxl.dtsi                   | 26 +++++-------
 arch/arm/dts/meson-gxm-khadas-vim2.dts        | 24 +++++++++++
 drivers/clk/clk_meson.c                       | 59 ++++++++++++++-------------
 9 files changed, 151 insertions(+), 66 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
