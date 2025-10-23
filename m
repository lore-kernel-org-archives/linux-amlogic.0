Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBF2CCD1BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Oct 2025 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jFliYgqRYW3XNYHUFMHmNdirIlJ3nEH0H/ckMXOEcmA=; b=Mb4tgwPCobX6Zb
	KH7+1mY07zvsJiWZbP4tIh0xRm+RXLZLyYpKp3VclPJvNG1znBr3lOd4eS9x19oR617KBIJ3p/tvS
	uUuw7Zrg15+WJf+5RR887+PattBYPs6t0sQkJByHbmR8iHx8q18Hvds6mHf5I1KtseqZmYP2QosW4
	MBB2hI/uE1xJIWiZao+I4Mg9My/cku+Zp+IQP5urxJKwYHy3dK3GnQVX589owlqpO4lEWzNFxneS1
	k6bmFmsgEjuYyx/E4Iyijz8bgYbgU/zIyFCiwEM7kSVG1FZrNwZiAWi8MNuFwZ7d1O0tpU5d8BCcU
	mnaiDxIe9RSz7/yv2XBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtZB-000000065yw-1gqU;
	Thu, 23 Oct 2025 11:33:13 +0000
Received: from mail-westus2azolkn19010036.outbound.protection.outlook.com ([52.103.10.36] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtZ9-000000065yD-0Udz
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Oct 2025 11:33:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1gg4Vp1GSYp6YYf0Bqf5WcLPDWxKoATdSp+8we6qG5g296lthMyuRNPbF9TYtzRh/DZuMEpECWtpkgg4Mw4T20FP5dxvh2v+mfKAdZRZ2kMYnWGgux7CVbvsQ40yqxEAuU6aYVEL7FtcOuRQiyi12yOAh4J8RVniAA29Y7Trx8BWUZffZNJqC4UH455j2gtrvFnYk90BOq16rQ+/AqtjvBYcU5roDxzFxfDAXxbaK2fWHZ3yH9xIvcMoj/oBEPU5kZaBUeiVsGP5bJu6aaCN2GPeX+QSCzM52z9+hqv0xJF8keRCIaK/YAPl8SEk+C8tEGgfYFd2EFPt/N0QKzenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpc+v53Rw+Vt5BM6cThKeRosHGoESm3l5HT/hnOP7fI=;
 b=LkgpGe5CAcz21jrVrt5A7XmjtBnbLcoOFjCpg30kG9LMwaSDq4uMHTVwR6n2pk5oh7O7gR228TxWHuW+l2kGundmRBACFmQc0MxDqQ+6GcvrvI89hMBn8SmYiOyvx9LfpLTo2wXNXyWb0EbDV26l7U8M56LDD3EPhG9XvRPHWmCVKP77NEv2I4NFBqXKA2NXxXaojIPeQZvNasK4DeeCxGFtT09lZK7LUlv3lezx6nx8ZiX8Yh059nwtoZ7v/xtALYJxAG/QEVFhInszRDTHj14at6sZ9+Ij/GZx6LIBf2MhdpGGACQq73U0iZvADu+IcYgBFRu/0CEG1rd6s/KN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpc+v53Rw+Vt5BM6cThKeRosHGoESm3l5HT/hnOP7fI=;
 b=I7HkX1EIVgLeUvl+73O5XB39uzmhMUA5j5wybyFJOv+aRRvd/hKEyMV9EzEKmbjsIFniUZ8Mu6NFiH+eq4S5UirqRq2ttt4VYfWm9O0SfZo9wuKXyVz2xK0TqYTJgdk9qlOVJ5G0coYVB0gdA640TiKKtZ9utwl9vjWRRYJB3r04qgpm/I8chYKpb2jFgbc/WtUPrNRdVGY1+H/2S9AF3FTjFxqcbv/4xhcYvwzmxM7E6uYHsjl7CYY6kcttH5o8jkrLFetSI299f3XSI05DjKWlnp/fiFtR0HCvlL5pyB8RSmDF9WuudJ0nbxY14Ls9SWoZawx/cZggPyG0BiDHbA==
Received: from DM4PR05MB10270.namprd05.prod.outlook.com (2603:10b6:8:180::11)
 by SJ0PR05MB9325.namprd05.prod.outlook.com (2603:10b6:a03:477::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 11:33:07 +0000
Received: from DM4PR05MB10270.namprd05.prod.outlook.com
 ([fe80::76f2:11b4:e433:a65c]) by DM4PR05MB10270.namprd05.prod.outlook.com
 ([fe80::76f2:11b4:e433:a65c%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:33:07 +0000
From: Linnaea Lavia <linnaea-von-lavia@live.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: PCIe probe failure on AmLogic A311D after 6.18-rc1
Thread-Topic: PCIe probe failure on AmLogic A311D after 6.18-rc1
Thread-Index: AQHcRA5ztWef2WpixEel9IeWZFcmhA==
Date: Thu, 23 Oct 2025 11:33:07 +0000
Message-ID: <DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR05MB10270:EE_|SJ0PR05MB9325:EE_
x-ms-office365-filtering-correlation-id: b96b0d67-f082-4918-88b2-08de1227efe0
x-microsoft-antispam: BCL:0;ARA:14566002|31061999003|19110799012|461199028|15030799006|15080799012|8060799015|8062599012|440099028|3412199025|39105399003|51005399003|40105399003|102099032;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?UIEX6yG+pleSyoBKnjTYOgGAISa4+8EWvQ1UkGKeZWI1BPfpEh3FL7rYG1?=
 =?iso-8859-1?Q?6LP0h8WcT8bpKkK6bn2GS9wvZEGkUjgvBvOApcmuHHQAaZcKO3a/zlzhky?=
 =?iso-8859-1?Q?c19nQjGR+bP7gH8DP4c6KMYFpQOkCP2u+omcBcbWq+hr0GL9yBmG1bCqPf?=
 =?iso-8859-1?Q?M7HbVlUlqs4lseEB7GYRfSyW1puBOY+9Xb8a9IJkC44dkj/nWbbX5zJ4/I?=
 =?iso-8859-1?Q?YKu1Ygq5UsJCuOeJcYfYjBK1fuV8cqxmRVrhfDRtqJUBRgTdjy0uwOt2vZ?=
 =?iso-8859-1?Q?QRs3NKh4Vto/zsLx8/44qo2JMzIdE03jaGtgHIgnW2NFs+B1S1acXhR1XP?=
 =?iso-8859-1?Q?/3IyS+KwsxFWx3NbVmZPc82qh7nuuBmKEpl0/Sq497EZtTV+w1SpgqB4L/?=
 =?iso-8859-1?Q?N4ogfHRHNaGyVKIkvux18rsPIuQjLSSktzlVvq/OyEFV+8jsZz2RTPWbab?=
 =?iso-8859-1?Q?OicNOqkXfxgGMsJs1f9s4HPfg+l4iZ1Mizh0Uankf8QfiuDarFiLYYAM2J?=
 =?iso-8859-1?Q?TcL6uWyuIbWzXXVWP/4l+e3yVWp9q9aT3Jnt+QbVyVemooScer2mhJPpL2?=
 =?iso-8859-1?Q?XCwO90yhk+C/k5QiEXgH6l4CXTH5BTV0C7yDQYfaEzDVq1LeDhty9yUqZM?=
 =?iso-8859-1?Q?3MZB/kY8MWQJkBbI1WMyJekJHq9xlElUSY+lLUkKAvBde+ZFM6qJ+vv93B?=
 =?iso-8859-1?Q?x/zyiMjyBE5CPe9JuDZRtuxxJ37Bs2Q7CbgHpjaOCN+Auru/+Pb8bV+GHe?=
 =?iso-8859-1?Q?Cq8tztKpDp/7T1B7K8FkJzASqPvmpjQN0hcX9oimKDNk2LBsQ9GumcFRO6?=
 =?iso-8859-1?Q?EOOUwAlyMTnww8HBI2+3PDs8AZavoAD18nnHekVEpEiok6JEl4LlaomakW?=
 =?iso-8859-1?Q?YeaDdenIQTrqnBmTKpTBJ7petUBZ8EjVMHyQ38EmuzuXmvkfWynvgrgs/b?=
 =?iso-8859-1?Q?gLGjTgfJOr8XM/NgzOiCpS6wKEEcSWRsumb8P2USEzAqkX/iZ6ajHoTrFd?=
 =?iso-8859-1?Q?2aowrCTAzkeieCNdinjHE736G4GdwV6ujeaxZXDXOTeoqGcHdo8I+NVwAT?=
 =?iso-8859-1?Q?Y0inEtXWdIHwfpZeCbgVEz3SfAo2v6XuuDTG8rMJ1uRrX8/aSL1M18PNs5?=
 =?iso-8859-1?Q?rD/90lbpFb5xY9eslv8U6ek/GisBcIHVoaBC3Ntn1GadJ+V58L4cG6B40U?=
 =?iso-8859-1?Q?fKxXlsVLId7sqUAeh7k/ypn1qlwTBNGeFklg7RIlJR1KAFQ2tpl0c09RFg?=
 =?iso-8859-1?Q?HafcSXKX9M7NN2HlnvQbrpklqAZ0E6n/6CL2jTmTe1N4Xgqe1j8YORgTFT?=
 =?iso-8859-1?Q?cImb?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?h585HozjhPKi6CPs0I1TrQPZHc7X8nygK9Teg+TT193xpayTiIr9zN2pzM?=
 =?iso-8859-1?Q?5ICoxPE/qt7ZGVmF6ST9+Xeq9rTtgpiQFiwktRO4xkZiLW1FjK0Axv/71R?=
 =?iso-8859-1?Q?3od4snWw+J4GY5x77LZtdKQkVWPn6xSG5YuryEQvKNc31lZz33DF/Pj5PS?=
 =?iso-8859-1?Q?kajGDFp/V5lMqsYdIb4yCgU4NJwLSNum6Eu0+5znQSYDjIP1BKGbzJfyfi?=
 =?iso-8859-1?Q?remyBdAHS9J0qU8+RXOK/HVJDVWO9Kt8CYVPw4YxnZwDx8YAkwwjZEFJW4?=
 =?iso-8859-1?Q?PLI4oWngf4FmGxwghr83I0F+jFO1+3DHPYyxKcGeOHbFQ8kvn/r9E+rcd8?=
 =?iso-8859-1?Q?ECSxzgCrFZHeFCD9jJTUMy65xZGGYZw8NBXGgmy/Vds8Ym3gLUcRQLUELX?=
 =?iso-8859-1?Q?D8cQs0bCrmrlirOsEWI3AiPh5Z+U+3zX+xrZGuYnCieAPOIKSmnXee23Ag?=
 =?iso-8859-1?Q?fmQPJhNITULUEbpnQx7x2aBiDfqRR+f+ejWqObb8vZg7rO8J9K1atld+ZI?=
 =?iso-8859-1?Q?Lz0+UNYskADK9XLBmyAj5qKlcgAYG0anNycxLqHjYj1OIp2B3Rn3DTlSs2?=
 =?iso-8859-1?Q?CVVQgVOvw2JwbyqtGyyaCdACZdYZDw94TqMrWS/iiZhsgLKimwAQRxQcav?=
 =?iso-8859-1?Q?NoLs0yGA5mX/C7ncwWBO+XPh4QKIrS+MSFhCnuMwy/jZIzrsvqxsHI0VeV?=
 =?iso-8859-1?Q?6km/vxf6XLdHfXGpfXMX7xGA9VcDqGBM3P8mj2jZQUWv3i2EJg/OkqCMBw?=
 =?iso-8859-1?Q?db0ZuRRfjm7x+lin7JgAJK+Yqi/9j79qBFTUXv9BetElg80aPc+putD42y?=
 =?iso-8859-1?Q?ad01zCJg20M6xR6khIRKe5usI9koSCPWffCisKl+qTfJHmLMBPu2QeE40V?=
 =?iso-8859-1?Q?QRWQIEZYudap+asAiVySjRuz8yriz95XFImr0el7wc6farTrb2RyuByz58?=
 =?iso-8859-1?Q?Wi8tEijYm/WU4ZfgOyG2XeMHIdec0QS72grkk4J5TbHfxI8dem1yXU7RBu?=
 =?iso-8859-1?Q?I3/+86ZATJb/wJgvpf6XseTROqjlVDLfQVNBfPTsXfFMzVSV1asr7NeG1q?=
 =?iso-8859-1?Q?hxZstHjcUmiW7avvaUppAP6URP9nu/0uzXj/dxQDudlYTGj/hd5mYzHVI7?=
 =?iso-8859-1?Q?HA7tLDUHLBcMtmqTYdZWKhGwPE5uRyaR7rFIxiSh80Bx/Mat5NngJO0V+f?=
 =?iso-8859-1?Q?2owS5NbRCc9APad6XhMQIeiDbdnoPPZayv5uJUtVq6ix7v583wNKOLWtdd?=
 =?iso-8859-1?Q?UFg/7Qgea1mUz/3w3RMLpLt7a7jTVT1k0kv0Ig1WY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-9-msonline-outlook-d08a8.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB10270.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b96b0d67-f082-4918-88b2-08de1227efe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 11:33:07.0656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB9325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_043311_175097_60911C05 
X-CRM114-Status: UNSURE (   5.43  )
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

Hi all,

I'm getting the following in dmesg after installing 6.18-rc1 on a VIM3 board.

[    5.391324] [     T50] dw-pcie fc000000.pcie: error -ENXIO: IRQ index 1 not found
[    5.411265] [     T50] meson-pcie fc000000.pcie: host bridge /soc/pcie@fc000000 ranges:
[    5.415323] [     T50] meson-pcie fc000000.pcie:       IO 0x00fc600000..0x00fc6fffff -> 0x0000000000
[    5.422278] [     T50] meson-pcie fc000000.pcie:      MEM 0x00fc700000..0x00fdffffff -> 0x00fc700000
[    5.442280] [     T50] meson-pcie fc000000.pcie: error -EBUSY: can't request region for resource [mem 0xfc000000-0xfc3fffff]
[    5.449631] [     T50] meson-pcie fc000000.pcie: Add PCIe port failed, -16
[    5.458779] [     T50] meson-pcie fc000000.pcie: probe with driver meson-pcie failed with error -16

I think the problem is related to c96992a24bec("PCI: dwc: Add support for ELBI resource mapping")
and 2f2cea1ea70a("PCI: dwc/meson: Rework PCI config and DW port logic register accesses"), as they're
both trying to map ELBI/DBI registers.
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
