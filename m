Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F6C4167B
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Dec 2022 04:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Etm9q6QLDmcmZDOmbXr0z9YWDHm7M1psuO/SeyRk5rs=; b=GECKI4t87sFeX/
	IkHabtG7ftuImdtGIm8nlmsQTv/Q3OZHlSaX9JqmOvs38ru0iZ9czmAZE2ZFLY03XvIGn8rtuFAhX
	3t43TD/R+UHqskI0KQ57Jxv/VCshIVahSPjUDCAErXS8YtTF0XPt3Jlqj6E7OSbbTMWNZoUNRxTsW
	e/pK2YXMyz6DLcyaYPKDR9g6qgLH/ja9n9qv7zxFY5umSAldfFy1IJJT5fZAJ3W4c9sivbsZ1RiK2
	9798IsoxhKltO3XPTsPnJB8Dw/7kWquyhEYjZ0/TJxuRuTdLxdo0+PRUyNaHZucPVoVmT0zJZPx44
	J5y39Y5JBx7q4X8vtAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA1TX-009vlw-Hm; Tue, 27 Dec 2022 04:22:03 +0000
Received: from mail-tycjpn01olkn2061.outbound.protection.outlook.com ([40.92.99.61] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA1TT-009vii-QV
	for linux-amlogic@lists.infradead.org; Tue, 27 Dec 2022 04:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdSd1QPR2gbE2GwLESsWZekgWDhpzc/RoUPL3d2pGWjIjACPLVlU5bd4urxP2rtaCO3ZGJY4Y3Wdp/mR9B6exKOnW8usZw5JeNXiHzmFxZeXuYda/0oT68gEC5WP6BK159Is1H81JKxkts5CE2c6j78K+7bwGxK6ZQLQT1cURooeGbHzBNelhC9uyukVMc8o7FLXmQ7KwYIKkszI0e8jtx/92E1pUm2zpF0NESiz8XoJ4Y9sfBCZIxdBeHsDr6NuY4bFBRVS49aAl0AjwyZP+ogEpXOh2tDsSKQ7R61B3SQ9ExvMEUmL2M7hTWQ3GVJLFeO1TWgJ/1/XezhDnZvZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zs0fAIzPaoZOCDe/mT08Otnm8BAaPxxXSHy8UouQ23s=;
 b=VUHisAt5wg2+mv8n7G7qLKSmJFLARBq7a6O5dBRXJx6zUbfu+vPx7j7Md8DvUqeRQW9Zb1L9/Yv08SMEnGcC6D7r4YyYX2tAVXtJhr7UXyH7brB3gEFX/KHpPGi+EW7l97RYSYUX1RszW6UXpm+8604lRgtSCDyyuQpj5d7WtccOcsfOZhIUcZYLdlnQYWbtemyc/oALhVt16AUfLYWxYWak7GXg9/P/Wq5lbcuTW0cuU9/eqG+natMxFSwgjl25lQiINZ4rs/YShNjIOs0VGlMGEU49tr4jiskEdVLzIP7tJcP0zQ60dChkraUayGbW1jdP6153aL81AdAVSFab6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs0fAIzPaoZOCDe/mT08Otnm8BAaPxxXSHy8UouQ23s=;
 b=MQySGyS21vBZyPGsXEJlMpQd/+R0+PyxhyxQPp12RvX4WBNOlVwAboUA1G16cuhQAbOokXK0tJHVFFDRNOOCpwll4IG5WGmM96nDvGHRdr4ixR3lncHvLm2szdLq5FfV6mOjDSEvqVw9FVx2WKiIsWXMMfB+YvsJ5AP2rONht/xg0YKTGnFPB8tooiR9QfIqeYJO7bv/VmiWmuiIp1TDNc+eoLJLDUvpYjtNsTLuN2f/ZBHbWZdMuOFRbc+VNHTfyWkrI1e/d+pHYY8qWcyX6jxv4mlNHUH1aA3vGqrTMj7uRprHEmom7PCZfoqWr52VaK7TT2VamgkZzdXvJihAwg==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by OSZP286MB1773.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17; Tue, 27 Dec
 2022 04:21:51 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5944.016; Tue, 27 Dec 2022
 04:21:51 +0000
Date: Tue, 27 Dec 2022 12:21:45 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: tomeu.vizoso@collabora.com, linux-amlogic@lists.infradead.org
Subject: failed to start gnome/gdm3 wayland session after apply NPU patches
Message-ID:  <OS0P286MB0641E5D5C1CF9D1E100EFFB6CDED9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Content-Disposition: inline
X-TMN: [I+UMYaWjawJ1/Qa8yiMpdUGO0wmL+/h22BYDfonHze8GNH8VNB9mZQcny63+bz6N]
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y6py2ZlfS4cq0FE9@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|OSZP286MB1773:EE_
X-MS-Office365-Filtering-Correlation-Id: b042b8ad-0c32-4717-c36c-08dae7c1e058
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	noFGNe9wuYNp7Y9+aYPU5iCvHDIw3mFttDYn86h4yLZnfCl2eL2Omu7Mod9ZQ4/aoIOmL94Vg1kVWBceyiMVo7XfJbfbU7pimezvHYNfjLhmPb0GAXngcOlhzzqIuasUHhtd7ZHF2bYDsHZo9/dEoRbDFwVUJkZwSfNMaWbhGFBm8XfUe6miYONnH/g6bT1YYQhhw4ViT0TfHLk7hjFmCacnGAcW1Ai66/LyaFnRL20yZDt9XuQWBGoxfyQDepwk/xXVPRqai83IwC19jtteMt1x94ex66vuchoE9ocvmowgkWugJ7dy0aVB5JTq6781pii0VHy/W/Fu88uPpp3LcfBqrtQdDsONnJcO+1aKpn9wHPrnIt0QViGJS9goG1j9BeC3AqzYkjwdU3YpGMlOZVqPxkiUcnTSa71GHc6eJXitvQcNg1quuX6Cstqvt1RSEjyL6Wy+KMZed/mxRwq9Q1Tj5HkpAxkwFiP5KWGQIFgryIPWiZtNCrUbeipN0M0Vk+YIILUh/5QPvg6ba2CyRzjKqi/cKSObu5grqKysdNo91KZWO8iqGX2YP4R4sus8S1YwYMXXoHgIa0KPDwU8Vg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NVhZWlVWL1h0d0JpYm1yYlNlWDFsajhBSUpPQ29ENUd5SCtiUURaM3VYYW82?=
 =?utf-8?B?OEtUVWtJbGdCc3hJKzRFQldZeCtUL3pvb0ZDeHF3Q29DTmtPaDJ5ZGZFSTkr?=
 =?utf-8?B?OUhTb3V4TFFxdHd1STN5RTJlUEVNbkEvenZHLzhoWmNaVWJnWERPYkZpcW9z?=
 =?utf-8?B?MlBIOWZ3c0lNN2w0NGpTV2RzYms0KzFsb1ZicDJZcTBpWHNaSUk4UFN6d2Js?=
 =?utf-8?B?bERLL2ZNcTdWNTNjUzBFS1JsY042ZnNVbHRNUFhKaE1pMWZnSTVnOWxnOTFl?=
 =?utf-8?B?S0tidENidFdZYk5wdmRqNkk4bkg0S1NWeUxjY01nVTJWQ3dTU0VzWjNzcWFy?=
 =?utf-8?B?MFNlY2FQNkVoZUNEY0o0blVmUE9OY2xNdmUwN3Vucy9KVDR4bmNjK3VWT3VF?=
 =?utf-8?B?Tnl2MDdsYUw3YXFVQUxxQnVmQzgzRzBrL3JhK2t3L3Z0VE8wRWhNcjJvejhm?=
 =?utf-8?B?Y1F1bVEzN2ZMc283WmVtU1dGa3dVaU96eVJCSWJ6cjdPZ3dQUjhqVW1SUEFI?=
 =?utf-8?B?S25sZFZadnlwQnp0a0ErTW1CUjBJRTNmZmh5ZHl0Rnh1Zm1BYVJQbDZ3aTdM?=
 =?utf-8?B?dXRvbHlTcjFIRmMxSnJIQys4KytVT2RPclJUMDYwOXhHV0FsSTFRS3dERFht?=
 =?utf-8?B?MUFyc0dVdUV2REhET0ljSFExL3MvaTROazIrWlZPMHFiUUtFTXFPT0Fkdk5q?=
 =?utf-8?B?SE5mYWhPckJINDJEcEtiekIxcXQ5ekRDdzJCUjIxa1ZLdzFQK0VQWEh0SkNo?=
 =?utf-8?B?blo0VGFiblhvcmMvV0hmSERjUXlrQmd3M2FrNEN2SXRyUGxOZC91TCs1ZHRl?=
 =?utf-8?B?VkRkYi9xWDd0S1djOGlEeXZYd0FHK1hOYms0MUNJbEtPbkZSSy9uazhsNWsr?=
 =?utf-8?B?U1c0cGF5ODF3bGVzS0MyVTNXekM1MnVPOEc3S0xUU3g3anlCd0RxcUg3U01s?=
 =?utf-8?B?RVNlUnAzbGF0WS9aT04vVGpBWFVQek9BSmtmL3FXWW14bk0xSHpVQjJaMmlv?=
 =?utf-8?B?VFRaMGp6M3V2cjJNYkc5aUNoK1BFUnpZRTVTOTBZY0ErVlF3MlRqa3lKOEpQ?=
 =?utf-8?B?enJad2gyUERvWTdqNmlpYnB1ckJsQXdZeUhMMkVpR2dscGl4WjVsRHVkQ3BM?=
 =?utf-8?B?UURCNW1vQ2FwdE01eWF1UTV4RElwbVdUcTZDTGhiaWhUVnhNOUZEbElnK2xV?=
 =?utf-8?B?R2JBTUlONklwMmkvb1lUSTFkV2dIeUsycXZNYTdPQVdmaURKZzFaZUkySlQ4?=
 =?utf-8?B?V1Q3TFRKenVhQzQySWJVb1hkbUlGYnlyeGJCRXppUzFZZWg0WVFUN1NyUUl2?=
 =?utf-8?B?YkxlbWFEWUE4dG0rUHR1dnlEZWR1K3EwNGtGR0kyS1RhQkNSc0g3c1A5Z2xy?=
 =?utf-8?B?TGlwaUx2TzlmQ0k1UmhQNzBETW8rclFzVEN4cUhQdjJvTi9DUmFDMkhuUnBq?=
 =?utf-8?B?YVEwQUNHS1ovQWY2V1lMSm8xQTg2d1FiQnJZL0VIOVlTNytGNCtrVzkxZHhE?=
 =?utf-8?B?VTFva0duRHpJZWlaZWVYMTAwbVM3ZGNvRXlaYllmNjFqN0tOcEpPVWUzSysy?=
 =?utf-8?B?emFWTzV4QXh1V3B1MzNxa0lRM091OW5FcXVzMEtnWTFaelhPUUh1a1Fyb2po?=
 =?utf-8?B?MHpqTzlubnVNUHIxTXliK0JNVXhzanEwdWd5U09CelU5T05jWjkyb1JZNDBT?=
 =?utf-8?B?eVZGeG5aY21YcW96RXRQVy8yNzMraWtCd1d4bW8vcjRDRGJMcXhudWV0cE5V?=
 =?utf-8?B?Y0FEemVEYTZvOXhVZDBCelM3cjQyaTQrZFdmZEozem8wcmVDMS9NOFJiM2o3?=
 =?utf-8?B?SmZXTmwwUjZXK1dOQzAyUT09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b042b8ad-0c32-4717-c36c-08dae7c1e058
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2022 04:21:50.9318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_202159_998514_28BEBE15 
X-CRM114-Status: UNSURE (   1.36  )
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

Hi, Tomeu

after apply your NPU patches:
http://lists.infradead.org/pipermail/linux-amlogic/2022-December/014428.html

VIM3 failed to start gnome/gdm3 wayland session.

before:

VIM3:~$ ls /dev/dri/by-path/ -l
total 0
lrwxrwxrwx 1 root root  8 Dec 27 04:06 platform-ff900000.vpu-card -> ../card0
lrwxrwxrwx 1 root root  8 Dec 27 04:06 platform-ffe40000.gpu-card -> ../card1
lrwxrwxrwx 1 root root 13 Dec 27 04:06 platform-ffe40000.gpu-render -> ../renderD128

after:

VIM3:~$ ls /dev/dri/by-path/ -l
total 0
lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-etnaviv-card -> ../card0
lrwxrwxrwx 1 root root 13 Dec 27 04:10 platform-etnaviv-render -> ../renderD128
lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-ff900000.vpu-card -> ../card1
lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-ffe40000.gpu-card -> ../card2
lrwxrwxrwx 1 root root 13 Dec 27 04:10 platform-ffe40000.gpu-render -> ../renderD129

the fail log:
Dec 27 04:10:42 VIM3 gnome-shell[673]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to open gpu '/dev/dri/card0': No suitable mode setting backend found
Dec 27 04:10:42 VIM3 gnome-shell[673]: Added device '/dev/dri/card1' (meson) using atomic mode setting.
Dec 27 04:10:42 VIM3 gnome-shell[673]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to open gpu '/dev/dri/card2': No suitable mode setting backend found
Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to initialize accelerated iGPU/dGPU framebuffer sharing: No matching EGL configs
Dec 27 04:10:42 VIM3 gnome-shell[673]: Created gbm renderer for '/dev/dri/card1'
Dec 27 04:10:42 VIM3 gnome-shell[673]: Integrated GPU /dev/dri/card1 selected as primary

how to configure system to boot to gui with npu enabled?

BR.
Ning.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
