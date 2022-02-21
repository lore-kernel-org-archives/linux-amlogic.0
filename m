Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896F9C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDr9K7ZpX6wSFME2bv0LiaJtB0K2EHwgKInaZxj9bjY=; b=q04G/7PeJjMS3Rocc20RjeXH8/
	sOYOcSOJMyGa7ox2K8yIOsLFND5esEbd/yHL/22J5nLqBVxKKdGL5sWQ3Br5G+YuWbZPRJ4pFk/lt
	7U7IDFXASsOzz+50qWNu0wROTJI2eGgpExOvJOEidWu4qNVf5JSSXnDPSzjr36hW+Q2hi/j+Y5unf
	uvzoNYoDmjowILKsqrEjOxC1b9XRYK6narPjq4AztQbpHXMHrKGLWbEstyR0gCa3QjvZ1fyCv/YrW
	A1n48E8aqwJeAAGpsXx2ppzZyOfgOhvTQHBrLd/15jTbtyd8Kaikw8vVQHqHNxkzk/MNsqt4/A8/q
	bG7eQuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM71r-005P9A-Qh; Mon, 21 Feb 2022 11:38:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM71m-005P73-Ev
 for linux-amlogic@lists.infradead.org; Mon, 21 Feb 2022 11:38:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id p9so26504458wra.12
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Feb 2022 03:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :content-language:organization:content-transfer-encoding;
 bh=+3Cdr3UnkNe6hBDvjgKna9hDC0LxHXWc7I7ZTNIF3bc=;
 b=JtwqXnf+s8ap/WJHlzhKn2g2471HfSI+wX45QPGPvjGORdJcZI850z5jYx6z+cIMRJ
 zXPSFPTK/tJC57bNzuydlALyqHO1/MT259xP+1dfLX5LvKznJvCMhTWiW9+NOF9qFLGI
 fv5Q1Lyy0fKfM3W15BE0R/wfPEcFaw1NGDMQmIqO4SeDzkNC5VEcljomZGbBj0FVQd6n
 DSsBvXxGXBo6alTnUljT0jQjRhh5uGhELf6uIf+DVF1qAc0i76Wv0XkrM2X+e3knNCRs
 +kRF9i/hy61qDXpzFekZa2cIy4I270wit9DUMy/X0z94+3vffX1Mx3+G2RVLyncTUCSQ
 Gd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:content-language:organization
 :content-transfer-encoding;
 bh=+3Cdr3UnkNe6hBDvjgKna9hDC0LxHXWc7I7ZTNIF3bc=;
 b=gECi8mR0pZw4syUbNkFGT2a6G3DU4Eq08/evNKl/HCyB0Hx16Pni37gBF0Sn39hQ6I
 NBnaV6gJJxKILVgs5n+cadloj2vYURIb8GWSLMC09C/oCdXZIt8Y3OogqEU4O9/E70Bp
 72ZGaylXSEL3rOm9u9gi7ws/fXTkgmgZqASLAWw07YGYWI/WTkhFeRdEkB/F89YCJTIo
 zuwCPZjpti27qJuKUn1u/SK7cLyhKpmacuGnseizhIFk+2tGQNenlqQr3T+tjvkSEF2g
 g2xoBsRKlBBHJKg7SIBCZB3ufVE6Alo/d4OCeEBdeim2G+xqC76ZQeRuMSnhLI+Fromo
 PvMg==
X-Gm-Message-State: AOAM533ZZGw0yXkmnQnVa8G30yP3MZs7YO80HURpQsJh7H1FUzlISobL
 FRgBK2jPDcUsOglzN9/dJ6EkMQ==
X-Google-Smtp-Source: ABdhPJxKX1byj/LtVfl/YytFP4/8WtXpzyG3GoO/xZal4Tb9lygDy8NgygA864+QsEDQ1r3S64qCsA==
X-Received: by 2002:adf:e705:0:b0:1e3:14aa:db8d with SMTP id
 c5-20020adfe705000000b001e314aadb8dmr15025056wrm.398.1645443528416; 
 Mon, 21 Feb 2022 03:38:48 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:77b7:547a:df0c:28d8?
 ([2001:861:44c0:66c0:77b7:547a:df0c:28d8])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm793852wmb.48.2022.02.21.03.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 03:38:48 -0800 (PST)
Message-ID: <a7cd9937-d441-3e1f-9709-8e80cc8814f1@baylibre.com>
Date: Mon, 21 Feb 2022 12:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.18
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_033850_609043_2B74CF99 
X-CRM114-Status: UNSURE (   8.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a set of Amlogic ARM64 DT changes for v5.18.

Notably, this adds 5 new board and a new SoC family from Amlogic, and minor additions.

Neil

The following changes since commit 0a62b3cc0af9322e650fe89bea0bacdedf01960a:

   arm64: dts: meson: p241: add sound support (2021-12-01 10:27:13 +0100)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.18

for you to fetch changes up to d926a4fe25338e120ab49547de9707dc6e5e5824:

   arm64: dts: meson: add support for OSMC Vero 4K+ (2022-02-21 09:23:08 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.18:
- New Boards:
  - Amediatek X96-AIR (Amlogic S905X3)
  - CYX A95XF3-AIR (Amlogic S905X3)
  - Haochuangy H96-Max (Amlogic S905X3)
  - Amlogic AQ222 (Amlogic S4)
  - OSMC Vero 4K+ (Amlogic S905D)
- Initial support for Amlogic S4
- Support for uart_ao_b & pwm_f on G12 SoCs

----------------------------------------------------------------
Artem Lapkin (1):
       arm64: dts: meson-sm1: add spdifin and pdifout nodes

Christian Hewitt (12):
       arm64: dts: meson: add common SM1 ac2xx dtsi
       dt-bindings: arm: amlogic: add X96-AIR bindings
       arm64: dts: meson: add initial device-trees for X96-AIR
       dt-bindings: vendor-prefixes: add cyx prefix
       dt-bindings: arm: amlogic: add A95XF3-AIR bindings
       arm64: dts: meson: add initial device-trees for A95XF3-AIR
       dt-bindings: vendor-prefixes: add haochuangyi prefix
       dt-bindings: arm: amlogic: add H96-Max bindings
       arm64: dts: meson: add initial device-tree for H96-Max
       dt-bindings: vendor-prefixes: add osmc prefix
       dt-bindings: arm: amlogic: add Vero 4K+ bindings
       arm64: dts: meson: add support for OSMC Vero 4K+

Gary Bisson (2):
       arm64: dts: meson-g12-common: add more pwm_f options
       arm64: dts: meson-g12-common: add uart_ao_b pins muxing

Xianwei Zhao (2):
       dt-bindings: arm: amlogic: add S4 based AQ222 bindings
       arm64: dts: add support for S4 based Amlogic AQ222

  Documentation/devicetree/bindings/arm/amlogic.yaml |  12 +
  .../devicetree/bindings/vendor-prefixes.yaml       |   6 +
  arch/arm64/boot/dts/amlogic/Makefile               |   7 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  43 +++
  .../dts/amlogic/meson-gxl-s905d-vero4k-plus.dts    | 117 ++++++++
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |  30 +++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  99 +++++++
  .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts | 129 +++++++++
  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      | 108 ++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   | 300 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  | 145 ++++++++++
  .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    | 133 +++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  | 112 ++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  27 ++
  14 files changed, 1268 insertions(+)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
