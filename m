Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DD2C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Jun 2022 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hVuobRmWxKKGbJwprVsIOfKR/iVEu3WTqriwT9ptzjI=; b=sSGsKjlvw2pBWh
	Vves3g8gNRnMyEvuxmexgdw20Pj5pbRiLIfH1qJ/lGyGB9ykF3Oa3n1/p5+XqZDxWl3O/HX1LKi7q
	O/5jNrdrg/lV78t43SMsbu3WflGdE2rxehE+2i63eAcdxOnvnqaQ73PxCnPa0TvlFia7PuZFVTGvT
	iRHW5dH5dai65CnKKav1iRajom+tHShOxh8xp2nGzQORODrDgYFl9Tni4sL/aybDPqSngtxXJEFjw
	5fKp9ud7hfk9M3TxLEMQ1EwSsxoPe8ljS7yNG1bWy0FdOL+6x0HwKhe8ZU3GNydSP8ISS8CEzZep3
	rFiF6hqiFEY2onsSQ5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5FRD-008Tl9-1H; Sat, 25 Jun 2022 23:43:39 +0000
Received: from mail-os0jpn01olkn2013.outbound.protection.outlook.com ([40.92.98.13] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5FR9-008Tj9-VW
	for linux-amlogic@lists.infradead.org; Sat, 25 Jun 2022 23:43:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD5J8X/QGsNpYrKe2nfuoUn/t18lYqegJaea3ilFrOJ/jP12ToCZaaoUuaguIhJPgwg1XfURjd2voutLLFBceZtKDGaBXb2F9eL1uCIYT2lMUwcDwDMAjaeZCOiwvREMxER1gHM13nLNUVjiAdkDG/z9448yrqudlQMtUGrkX0jYCKMlAzzFts834zdKb5GpGRfaqpMlNz4JW+8Gmt6bx3g326XQ2qvZHW9OPr4gTZl9+LAXBVAErUlxx7fRrl4HQIXcGKmQyAZJ1Crh3hQMBV5EtQ4+wXoUIzKG/hORA2n4rAj4FOSMiL4J+uq4w/qzqvUrI72sOLVeDt3i7dDQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVcU2ryPF03p6Uyynxln6pC5GigRvdv449GIACRhdPg=;
 b=PqNReGB0YA3r4OTTjygGwx7z4dN2zoZ1nPoSXT7TIeMe3gZRdS6y4A2Cau/l2i2a+w2BSV5d7cKiN8rAbgn7kN5mfd8yYovCMGduxxI5NmJ1Yh6sKz7cHJFzxIiQe6ya5h3DhZhxHnGg0nQXU7u/3okQFpL2x2Xc9ZLR8MGVSW7Mnqhx6kMjIlvkVMiND3qxxbWy8PT1r2v2+9h2A2/HmLWX/jjU8oZyfEWPGerb8Nf9TEmQFSfc1f8hBWFjmRKwpiM9sZGzNoN4xVG5d+DN/JtfOrGz+UYdMmEylUW1LSl55jhpzkolRa3SDVqYrVFrMnQWJ6NQxlmedmyV0e4fZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVcU2ryPF03p6Uyynxln6pC5GigRvdv449GIACRhdPg=;
 b=ZAbOtahS7tV9gG+g/Za+OcD7KnVZiFN9oZAQPLrdmQ5wBjfbFsfWIPw44gnVUgx4xoRbJGp9dsColH9lzEjfRpzCDbMxkxAKGtlDmSywxU4LeF9fFMgP/VJhm7059+tIILQ2nygZw/9J/1VQqbbCLhrzjzApWE0uvsyZpl0F1Qq1wAg0Ohxuda2XJ6FnLwOtTS9vTNVuFsK5SC3H2rXZbf7RGPKSk+Za5wbX71m4SNcR84/tpzBScdNecW/aMvNKvT0R2udd3mZscWiwakabeykp9YPoDm0aESMrW45DH1FHdkLN/CxQGjCHBrBcfL39CCZeDQCC9nJyfiUagH4JBw==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by TYAP286MB0857.JPNP286.PROD.OUTLOOK.COM (2603:1096:402:3a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Sat, 25 Jun
 2022 23:43:25 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::816e:460a:dd94:b94c]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::816e:460a:dd94:b94c%9]) with mapi id 15.20.5373.018; Sat, 25 Jun 2022
 23:43:24 +0000
From: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
CC: "zhang1985@outlook.com" <zhang1985@outlook.com>
Subject: VIM/S905x: Unable to handle kernel NULL pointer dereference at
 virtual address 0000000000000038
Thread-Topic: VIM/S905x: Unable to handle kernel NULL pointer dereference at
 virtual address 0000000000000038
Thread-Index: AQHYiOzesXPHD0+mM02UccNk3IAAHg==
Date: Sat, 25 Jun 2022 23:43:24 +0000
Message-ID:  <OS0P286MB064100964669BC707C8DDE67CDB79@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [lXJivd+WPDuAEqm47VI26OfIX/Cq+5VY]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05d0ca79-53c6-4f73-1ddc-08da57047f09
x-ms-exchange-slblob-mailprops:  EpEO96k6WolXEdeJUBgHNVeLQa7nl3rG/GcobZGyTjl3scedK3ToSgOs36WceXThjT/6Q8BiGOlQ/TPzoVS2i1SKQTY8FiRJXDxmjH9RDAAZBv7EpGlCMHuhsclKS6rQkgUDWXy0QNbznvYMZaHeTQjhUVI0Q1oZXCDrOZrJzxkSJKzWfPzBkPWX+ltXnOz7ChWXCSmjB0UJwBtbLgyXaVvkDnU4S3uGORamZ09nHar3Efuz/M1mnnpDtHJZBHOAc+orR0bKVfWM9PhmnxVMLufAh6sJWK77XjD9EaEnCpCEZd8hJ7ObHLUQhS8kQDiE2HK8UewkfZS+4bHgPAjLlDCYkaMJGlLi7dAb/gShoCkmvA9eDXj50T8RmyMblxs4kY8Zzg8romSgwo5YVJweIsoqMKWBKFFtNBB/2ghOWZ2nSV5knxsb1WTFEfRRGvLGZlkOELuxqn2ycdaCKpEcldSyWUQIElBjIey3C47xSn5itUhCj4RRIcIeYETWZHq930cG6I+wYVtwrSv55luPZguvghCZVWlTsnCF1Dqjo5VmIWJ2Fyqb0EkS9smq5ZFkpwfhhf+jdxgi83UP8usgVe035ZcpEGHaAJUe7nrOSuOyXHlEmldBr17NpRGo/gNUeOx4NlhCVWf8qWaOG1UD468PwPirmo9gSONLEPUKZT7cyMz8R1yCg4v4VkMQz3xhAKL6Rk+H6T8T4G6gmTCAhbIn12ydvunGkt8NMDc6hYUnSWzoV0pwTc/Yv9ptocI5aNwmPJ6fRWU=
x-ms-traffictypediagnostic: TYAP286MB0857:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fnke6b0+mxiLUoCp28f6xBlFHp0hEFTOekM8Eu1EVxltN6wZGr0Go4/eUyVDnNyKrXBY2VVO0GDXnyod+FE45OG17CPYUW+ueb/x6purfYlPHJvHXUOQMvPpAnsBDy2Z3fNVVue7vVdsPecds7eVUjblEsdq12Yq24jcxg6Ve5NLrFDmIhWG89BhoITYCdr4N58A0JXQ6K0sOusuaBqQhsx1tzziv2jyUE8XkiNJb4+d5iL8ZrffEthCs88LrD90O1fmIZrGGtC6kb7POaWVTGQWQQ4Ww0ndyStlCXFJXuMSaGdNJlLioD9Gj2OnB/tdYln77Dpin/u2fFvTb5sAO85t3wR0fAwKhLoUmoPuGilpk29U7kiOG/9YnQskVaj7GTGKvqbEea5EzhdEbZ9IIzO5JhHcRSOTPEb+sQrf6Kg+m9b9r1N3VnpqsWIfmbffwsrsqxhzImbUDek/QO2bOiHdHhneELSyFCAZcM3MpHocHsXdxpoqzeWYirlQQZ56p9RVVXhRKykLfki/neyDCELxlyTTypoEoNGxTlq90URtetMZCy51TPu2bxqBV9vHhUE7bGeTfY2ybQ3EX1wLvC6aHEmWk0E+iTEVGyeC7y4qWrlhhn517PNjFxHH9hyP
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?gb2312?B?RjFSNFhmUlFmZkMyM3doYXZpQWtJT2dqYUFvWDhJbXU3SkFKeHYxYzVYYUE4?=
 =?gb2312?B?STJBcENleUd0ejRET2lxZWhXdHNsVjRkTFExMnI0Mnc0MVl1QitpcnZWdVF4?=
 =?gb2312?B?QnNoZEdEUFp5MjhGNFFnTXJ4dzFBblRmNERnQWU2bzJEbXhKa1FKQlZ6R1lv?=
 =?gb2312?B?RUdCdzFqbElQdldWdXdhRmZmRXZPMzRqSVVpZ1VtbEx4U2NZY2ZSbG5xYVdj?=
 =?gb2312?B?RTlGdHlXbllTZjhrTlpLRkFISHZ2MHF2bld0c3VxZnVnVWEvRWFUWHVjd2Ix?=
 =?gb2312?B?Y3hSaUhNek9XUjdPK1JPM1V5dnNFWTFlbENlbG9qaWovcVNRRGlTTm9UUWF4?=
 =?gb2312?B?eVdoYThlM3F2MDY1S1lOZC9zWmxaSmRCd1U0cWpYemkyNkduckNlZ0FBbUNH?=
 =?gb2312?B?TjJJVlh6K0NkRDZNNnNtZWE3QTZpVFRDWVdETE5lUjRDeUZjaDVCN3M4ald3?=
 =?gb2312?B?SkxRcWMvR3lRcTl6Vzc5YVkvTkpIa29lQUJmb3l1L29ZU2dyZHU3NWl3eVJ4?=
 =?gb2312?B?NFptYVNqRWk4b3d6ajY1SnBKZmFwSHFKTUFVU1hJcHNFZytIaTh1cHRycXJF?=
 =?gb2312?B?TmgvYkY0bi85NldPZFBaNGNIY2dlTmxsR1hPVEdPQVJHbVZNVUk2K1FXOFdx?=
 =?gb2312?B?U1JiTThPSVg1dHhOTE1BN0UwRG5iblIzVFp5UUNKQm5OVndxOERPM0FkYXBY?=
 =?gb2312?B?cWx2OHN4ckZuOFMvZG5pd3hXSlRMQ2F3SGRuQ3dlVXo0K1Y4QjVidWFhdnR4?=
 =?gb2312?B?dXp0c2ZFMkVVZ2ZkdC9MbnMyWkU4NU03S1U0RHFDV0kzeWVrcmdiYzZ0enF2?=
 =?gb2312?B?Tm0rVDVvYlpWNk1LMDNWcXV5NW5mQUlhdjZMc3JiNlVFL09zQnBVbFFSSWdz?=
 =?gb2312?B?OXFvSzhJeGxPa1ZSeWhkemN5d2RrMEJETjV3TFF4MXFLa1FLKzQxVGhOODNi?=
 =?gb2312?B?RjBVSGVpS2ZDNlZhRUNzT0x1MVdvSFdQZkZZbGlLYzVZdmFnbk11ZTZSQ3M3?=
 =?gb2312?B?OXcreW9ocHc5VVZ1TGNpTThGYit5VzFSaERCUkF1cDdzTkJaa2UrcUtLdVg2?=
 =?gb2312?B?UXk4ZlF3WW5MSGJsb21KWHZZMEdsRnBXazdzNlBRdEFvSGE4RzMzaDYycEhS?=
 =?gb2312?B?M3hmL3I4TXNoQWZnMEMwV1U5WnhaMlZINzAwL25JdFZTTjRZZW4xM0RSZ0tx?=
 =?gb2312?B?d3lOd1IwZm8yTnBRUjl6MTV0RUJ6SmMwdnNjNmE1QVJGTGQ0YUlaRFFzSzky?=
 =?gb2312?B?SzFNSlFlb3JOVHJIZmwrQUVPV2dtbGZwcjEveEJ1UExiR2JWczhSRERBVVQw?=
 =?gb2312?B?UTFoT3k5Qk9LR0RXUkpDRGoxNU0xSXMrSHIrY3kvZHhOM012T0pxQVBRd1ZE?=
 =?gb2312?B?VUFVc0FPZG5uZ2swNjVYL0lkTzU0RTNXRmhJVDI0YVNTdENSTHNHUURkRzBs?=
 =?gb2312?B?UnlLTk1wYjdpb3pSdm9mdzBTVmk2blN1TGdNbmxlWkNPYU1OSkZuejk2TFRH?=
 =?gb2312?B?ckdaRjlmSWdjOVRSMmw4cERVNTZEckUrU1czaVB3eHJqdk9QeXFqNUFuT0xT?=
 =?gb2312?B?Y1IzVHlST0ZPbjRzckhDNytaUk9KMitmdUVFNkdkMVFRMlZZMllBZDY5aXF6?=
 =?gb2312?B?d21CNHZnTmRYcm15YWhmTWJZeHBXOW1IVG9PaFJXNklYK0VGMGhYeS9tMGxR?=
 =?gb2312?B?MVRET2RSdUUzRXphOTNaVHVHb3Jtb1dnVGVBQm5IUFFLY2tELzdEd2l3PT0=?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d0ca79-53c6-4f73-1ddc-08da57047f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2022 23:43:24.8979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAP286MB0857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_164336_073337_76DED37B 
X-CRM114-Status: UNSURE (   3.46  )
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

hi, maintainers

domain-0 init dvfs: [    8.795381] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
[    8.798761] Mem abort info:
[    8.801473]   ESR = 0x96000004
[    8.804466]   EC = 0x25: DABT (current EL), IL = 32 bits
[    8.809760]   SET = 0, FnV = 0
[    8.812772]   EA = 0, S1PTW = 0
[    8.815831]   FSC = 0x04: level 0 translation fault
[    8.820700] Data abort info:
[    8.823508]   ISV = 0, ISS = 0x00000004
[    8.827332]   CM = 0, WnR = 0
[    8.830269] user pgtable: 4k pages, 48-bit VAs, pgdp=000000007d355000
[    8.836651] [0000000000000038] pgd=0000000000000000, p4d=0000000000000000
[    8.843378] Internal error: Oops: 96000004 [#1] SMP
[    8.848179] Modules linked in: scpi_hwmon(+) clk_scpi(+) evdev sha512_generic sha512_arm64 ghash_ce gf128mul drbg sha2_ce governor_simpleondemand sha256_arm64 ansi_cprng meson_drm sha1_ce ir_nec_decoder lima gpu_sched aes_neon_bs snd_soc_meson_gx_sound_card snd_soc_meson_aiu snd_soc_meson_card_utils drm_shmem_helper drm_cma_helper snd_soc_meson_codec_glue snd_soc_core ecdh_generic(+) rfkill ecc rc_khadas aes_neon_blk platform_mhu snd_pcm_dmaengine meson_dw_hdmi meson_canvas meson_ir sunrpc meson_rng snd_pcm rng_core dw_hdmi cec snd_timer aes_ce_blk rc_core aes_ce_cipher snd amlogic_gxl_crypto meson_saradc soundcore pwm_meson meson_gxbb_wdt crypto_engine nvmem_meson_efuse display_connector leds_pwm drm_kms_helper binfmt_misc drm fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic meson_gxl xhci_plat_hcd dwmac_generic xhci_hcd dwmac_meson8b stmmac_platform stmmac dwc2 dwc3 pcs_xpcs phylink udc_core mdio_mux_mmioreg mdio_mux usbcore ulpi of_mdio fixed_phy
[    8.848453]  fwnode_mdio ptp libphy pps_core meson_gx_mmc dwc3_meson_g12a crct10dif_ce crct10dif_common clk_pwm roles usb_common rtc_meson_vrtc i2c_meson arm_scpi fixed adc_keys industrialio
[    8.951167] CPU: 3 PID: 260 Comm: systemd-udevd Not tainted 5.18.0-2-arm64 #1  Debian 5.18.5-1
[    8.959698] Hardware name: Khadas VIM (DT)
[    8.963750] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    8.970649] pc : scpi_dvfs_recalc_rate+0x4c/0x6c [clk_scpi]
[    8.976169] lr : __clk_register+0x4b0/0x844
[    8.980308] sp : ffff800008533790
[    8.983585] x29: ffff800008533790 x28: ffffac72df32b060 x27: 0000000000000000
[    8.990659] x26: ffff6e024c1cea88 x25: 0000000000000000 x24: ffff6e02bfbe96b0
[    8.997732] x23: ffff6e024c1cea88 x22: ffff6e024354ae80 x21: 0000000000000000
[    9.004804] x20: ffff6e024354a180 x19: ffff6e024c131200 x18: ffffffffffffffff
[    9.011876] x17: 000000000f9f5ab2 x16: ffffac734fa06300 x15: 000000000003fe00
[    9.018949] x14: 000000000003b000 x13: 0000000000000000 x12: ffffac734fc96440
[    9.026022] x11: ffffac735082eba0 x10: ffffc18ef3815278 x9 : ffffac72ded28890
[    9.033094] x8 : 0101010101010101 x7 : ffffc18f6f7b7000 x6 : 000000001a327914
[    9.040166] x5 : 00ffffffffffffff x4 : 0000000000000000 x3 : 0000000000000000
[    9.047239] x2 : 0000000000000000 x1 : 0000000000000010 x0 : 0000000000000028
[    9.054313] Call trace:
[    9.056725]  scpi_dvfs_recalc_rate+0x4c/0x6c [clk_scpi]
[    9.061902]  devm_clk_hw_register+0x68/0xe4
[    9.066041]  scpi_clocks_probe+0x1d8/0x3f4 [clk_scpi]
[    9.071044]  platform_probe+0x74/0xf0
[    9.074665]  really_probe+0x184/0x3d0
[    9.078288]  __driver_probe_device+0x11c/0x190
[    9.082687]  driver_probe_device+0x44/0xf4
[    9.086741]  __driver_attach+0xd8/0x1f0
[    9.090536]  bus_for_each_dev+0x7c/0xe0
[    9.094330]  driver_attach+0x30/0x40
[    9.097866]  bus_add_driver+0x154/0x240
[    9.101662]  driver_register+0x84/0x140
[    9.105457]  __platform_driver_register+0x34/0x40
[    9.110114]  scpi_clocks_driver_init+0x2c/0x1000 [clk_scpi]
[    9.115635]  do_one_initcall+0x50/0x240
[    9.119429]  do_init_module+0x50/0x260
[    9.123138]  load_module+0x23a8/0x2800
[    9.126847]  __do_sys_finit_module+0xac/0x130
[    9.131160]  __arm64_sys_finit_module+0x2c/0x40
[    9.135645]  invoke_syscall+0x50/0x120
[    9.139353]  el0_svc_common.constprop.0+0xdc/0x100
[    9.144097]  do_el0_svc+0x34/0xa0
[    9.147374]  el0_svc+0x3c/0x100
[    9.150479]  el0t_64_sync_handler+0xa4/0x130
[    9.154706]  el0t_64_sync+0x18c/0x190
[    9.158333] Code: f9400bf3 f9400421 a8c27bfd d50323bf (b8606820) 
[    9.164370] ---[ end trace 0000000000000000 ]---

kernel:
uname -a
Linux VIM 5.18.0-2-arm64 #1 SMP Debian 5.18.5-1 (2022-06-16) aarch64 GNU/Linux

dtbo:

/dts-v1/;
/plugin/;
/ {
    fragment@0 {
        target-path = "/reserved-memory/linux,cma";
        __overlay__ {
            size = <0x0 0x38000000>;
        };
    };
    fragment@1 {
        target-path = "/soc/bus@c8100000";
        __overlay__ {
            #address-cells = <2>;
            #size-cells = <2>;
            rtc@a8 {
                compatible = "amlogic,meson-vrtc";
                reg = <0x0 0x000a8 0x0 0x4>;
            };
        };
    };
};

it's not 100% crash. about 1/3 or less.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
