Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52409C48260
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Feb 2024 07:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvHYy/i+ojs3o4rzqogWeyyG/MXAvwkXP+eCJlcaHcA=; b=UnYchJZ5o+4LdM
	UORaso6e8/be0vsPVHzGFti5FBlWa52SIEFXjuSLqhjwU2bUUSh0NTta1X8qns5vyqKaHfzrtcpHY
	GjgMhNyRj+Zatd4TtyAJWfJwjbqYSLCiDn0LWtNiFm9SzZi3vwbCZYu3cpR9W/txt2O3xg/RU+CO4
	vxQzs7r3wx7n4bfiVZU0BCcxtwutIIJdz5v6erETfjksHfebzGJn4fD0XQi++RxsQQh7HvIjQhDd1
	PpQHBtRpuJjcYOVrHKuBCH+r3u/8S+S+fRL8hL0h+K0XAxo/72HuHKVqXXfvl3zc0NGbW3TRWxd4o
	0jqWYV6o9LqThUnEEqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raswX-00000001PgT-3HiD;
	Fri, 16 Feb 2024 07:47:33 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raswT-00000001Pfi-1G5p;
	Fri, 16 Feb 2024 07:47:32 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A89C412000C;
	Fri, 16 Feb 2024 10:47:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A89C412000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1708069642;
	bh=JBIQUmjhGqPH9CX2watwkGz5Gl4QEsmX9X4DCeR6veI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=KWSqTlGmCZbZaVN413ix6tubW0zlKnEts0ric9KI0eH7kJJePjFTvu7bcJnL+ahty
	 +2uDTqajV2lOb3OSckxNBL/KHb4uDUDBsmMsMExUM5K7+glolNWcGmBd5+oKO8kbJ1
	 K/awcGxdJG+Y8H86k5T6iZ9TqTog5qUwM53cAUgpioSYhnmRRfGavHtflpdnuUHDUr
	 3jw3LSKEuKRLvP/sqwHXCaw7u86+ejG3RCp5NWsYGMNzA7PfJRct0Nj0cnBGtiVg0R
	 lMLXD/ty9kYKzokg/lOHLqXqq0/p5BEgXOa1pckZ6Cnqpeus4ieUFcC1NAOaGDNqsB
	 kePv4zKdeuhCA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 16 Feb 2024 10:47:22 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 10:47:22 +0300
Date: Fri, 16 Feb 2024 10:47:16 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Viacheslav Bocharov <adeep@lexina.in>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [DMARC error][DKIM error] [PATCH 0/5] soc: amlogic: add new
 meson-gx-socinfo-sm driver
Message-ID: <20240216074716.a33hrvl5xnpm7aep@CAB-WSD-L081021>
References: <20231122125643.1717160-1-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122125643.1717160-1-adeep@lexina.in>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183487 [Feb 16 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, github.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;elixir.bootlin.com:7.1.1;salutedevices.com:7.1.1;lists.infradead.org:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/16 06:18:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/16 07:22:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/16 06:42:00 #23632408
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_234730_066363_0EB69BDC 
X-CRM114-Status: GOOD (  27.72  )
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

Hello Neil,

May I put in my two cents on this patch series?

There appears to be a misunderstanding regarding the terminology used.
Allow me to clarify my perspective.

The original Amlogic chipid has the following format:

    4 bytes      12 bytes
    +-------+-------------------+
    |       |                   |
    | CPUID | SOC SERIAL NUMBER |
    |       |                   |
    +-------+-------------------+
    0                          15


In the current uboot [1] and kernel [2] upstream, only the SOC SERIAL
NUMBER bytes are read from efuse OTP storage (and it isn't swapped, as
Amlogic reference code does [3]). We refer to these bytes as "serial".

The original chipid value is utilized in several algorithms (for
example, in the Amlogic boot protocols), making it crucial to have the
ability to read the original chipid value as intended by the vendor.

In my opinion, we should align our naming terminology as follows:
    - "chipid" - Represents the complete Amlogic SoC ID, includes
                 "cpuid" and "serial"
    - "serial" - 12 byte unique SoC number, identifying particular die

We strongly believe that this patch series is essential and are highly interested in seeing it applied to the upstream linux-amlogic, for the following reasons:
    - We use chipid for device identification in our boards
    - The Amlogic boot protocols utilize the full version of chipid
      (ADNL, Optimus). As I mentioned in the IRC, we are preparing a
      patch series for uboot incorporating them.
    - in OPTEE: for generation of SSK (Secure Storage Key) [4]
    - RPMB: for generation of RPMB key, further provisioned into RPMB
      controller (thus particular SoC is bound to particular eMMC

Therefore, I propose that we rename "soc_id" in the Viacheslav patch
series to "chipid" and subsequently port this patch series to uboot.

What are your thoughts on this matter?

Links:
[1] - https://elixir.bootlin.com/u-boot/v2024.01/source/arch/arm/mach-meson/sm.c#L84
[2] - https://elixir.bootlin.com/linux/v6.7.4/source/drivers/firmware/meson/meson_sm.c#L268
[3] - https://github.com/CoreELEC/u-boot/blob/3efc85a8370796bcec3bcadcdecec9aed973f4a9/arch/arm/mach-meson/g12a/bl31_apis.c#L398-L417
[4] - https://github.com/OP-TEE/optee_os/blob/5df2a985b2ffd0b6f1107f12ca2a88203bf31328/core/tee/tee_fs_key_manager.c#L152

On Wed, Nov 22, 2023 at 03:56:38PM +0300, Viacheslav Bocharov wrote:
> The Amlogic Meson SoC Secure Monitor implements a call to retrieve an
> unique SoC ID starting from the GX Family and all new families.
> But GX-family chips (e.g. GXB, GXL and newer) supports also 128-bit
> chip ID. 128-bit chip ID consists 32-bit SoC version and 96-bit OTP data.
> 
> This is the second attempt to publish data from the Amlogic secure monitor
> chipid call. After discussions with Neil Armstrong, it was decided to
> publish the chipid call results through the soc driver. Since
> soc_device_match cannot wait for the soc driver to load, and the secure
> monitor calls in turn depend on the sm driver, it was necessary to create
> a new driver rather than expand an existing one.
> 
> In the patches, in addition to writing the driver:
> - convert commonly used structures and functions of the meson-gx-socinfo
> driver to a header file.
> - transfer the chipid sm call constants to a header file (perhaps they
> need renaming?).
> - add secure-monitor references for amlogic,meson-gx-ao-secure sections
> in dts files of the a1, axg, g12, gx families.
> 
> Viacheslav Bocharov (5):
>   soc: amlogic: meson-gx-socinfo: move common code to header file
>   soc: amlogic: meson-gx-socinfo: move common code to exported function
>   firmware: meson_sm: move common definitions to header file
>   soc: amlogic: Add Amlogic secure-monitor SoC Information driver
>   arm64: dts: meson: add dts links to secure-monitor for soc driver in
>     a1, axg, gx, g12
> 
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   1 +
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   1 +
>  .../boot/dts/amlogic/meson-g12-common.dtsi    |   1 +
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   1 +
>  drivers/firmware/meson/meson_sm.c             |   4 -
>  drivers/soc/amlogic/Kconfig                   |  10 +
>  drivers/soc/amlogic/Makefile                  |   1 +
>  .../soc/amlogic/meson-gx-socinfo-internal.h   | 102 ++++++++++
>  drivers/soc/amlogic/meson-gx-socinfo-sm.c     | 178 ++++++++++++++++++
>  drivers/soc/amlogic/meson-gx-socinfo.c        | 106 ++---------
>  include/linux/firmware/meson/meson_sm.h       |   4 +
>  11 files changed, 317 insertions(+), 92 deletions(-)
>  create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-internal.h
>  create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-sm.c
> 
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
